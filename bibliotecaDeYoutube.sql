

--CREATE DATABASE bibliotecaDeYoutube;

--USE bibliotecaDeYoutube;

/*
--Tabla de Libros

CREATE TABLE libro (
	LibroID INT PRIMARY KEY IDENTITY(1,1),
	Titulo VARCHAR(200) NOT NULL,
	ISBN VARCHAR(20) UNIQUE,
	Autor VARCHAR(150) NOT NULL,
	Editorial VARCHAR(100),
	AñoPublicacion INT,
	Categoria VARCHAR(50),
	CantidadDisponible INT DEFAULT 0,
	PrecioPrestamo DECIMAL(8,2)
);

--Tabla de Miembros

CREATE TABLE miembro (
	MiembroID INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(100) NOT NULL,
	Apellido VARCHAR(100) NOT NULL,
	Email VARCHAR(150) UNIQUE,
	Telefono VARCHAR(20),
	FechaRegistro DATE DEFAULT GETDATE(),
	Activo BIT DEFAULT 1
);

-- Tabla de Préstamos

CREATE TABLE prestamo (
	PrestamoID INT PRIMARY KEY IDENTITY(1,1),
	LibroID INT NOT NULL,
	MiembroID INT NOT NULL,
	FechaPrestamo DATE DEFAULT GETDATE(),
	FechaDevolucionEsperada DATE NOT NULL,
	FechaDevolucionReal DATE NULL,
	MultaPorRetraso DECIMAL(8,2) DEFAULT 0,
	FOREIGN KEY (LibroID) REFERENCES libro(LibroID),
	FOREIGN KEY (MiembroID) REFERENCES miembro(MiembroID)
);

*/

/*
-- Insertar libros

INSERT INTO libro (Titulo, ISBN, Autor, Editorial, AñoPublicacion, Categoria, CantidadDisponible, PrecioPrestamo)
VALUES
	('Cien Años de Soledad', '978-0060883287', 'Gabriel García Márquez', 'Harper', 1967, 'Ficción', 3, 50.00),
	('Don Quijote de la Mancha', '978-0060934347', 'Miguel de Cervantes', 'HarperCollins', 1605, 'Clásico', 2, 40.00),
	('El Principito', '978-0156012195', 'Antoine de Saint-Exupéry', 'Harcourt', 1943, 'Infantil', 5, 30.00),
	('1984', '978-0451524935', 'George Orwell', 'Signet', 1949, 'Ciencia Ficción', 4, 45.00),
	('Orgullo y Prejuicio', '978-0141439518', 'Jane Austen', 'Penguin', 1813, 'Romance', 3, 35.00);

-- Insertar miembros

INSERT INTO miembro (Nombre, Apellido, Email, Telefono)
VALUES
	('Ana', 'Martínez', 'ana.martinez@email.com', '809-555-0101'),
	('Carlos', 'Pérez', 'carlos.perez@email.com', '809-555-0102'),
	('Laura', 'González', 'laura.gonzalez@email.com', '809-555-0103'),
	('Miguel', 'Rodríguez', 'miguel.rodriguez@email.com', '809-555-0104');

-- Insertar préstamos

INSERT INTO prestamo (LibroID, MiembroID, FechaPrestamo, FechaDevolucionEsperada, FechaDevolucionReal)
VALUES
	(1, 1, '2024-01-15', '2024-01-29', '2024-01-28'),
	(3, 2, '2024-01-20', '2024-02-03', NULL),
	(2, 3, '2024-01-22', '2024-02-05', NULL),
	(4, 1, '2024-01-25', '2024-02-08', NULL);

*/

--SELECT * FROM prestamo;
--SELECT * FROM libro;
--SELECT * FROM miembro;

/*
--Ejercicio 1
--Muestra todos los libros disponibles (cantidad > 0) ordenados por título.

SELECT Titulo, Autor, Categoria, CantidadDisponible FROM libro 
WHERE CantidadDisponible > 0 
ORDER BY Titulo;

--Ejercicio 2
--Muestra todos los préstamos activos (no devueltos) con nombre del miembro y título del libro.

SELECT 
	P.PrestamoID,
	M.Nombre + ' ' + M.Apellido AS Miembro,
	L.Titulo,
	P.FechaPrestamo,
	P.FechaDevolucionEsperada,
	DATEDIFF(DAY, P.FechaDevolucionEsperada, GETDATE()) AS DiasRetraso
FROM prestamo P 
	INNER JOIN miembro M ON P.MiembroID = M.MiembroID 
	INNER JOIN libro L   ON P.LibroID   = L.LibroID 
	WHERE P.FechaDevolucionReal IS NULL;

--Ejercicio 3
--Calcula cuántos libros ha prestado cada miembro.

SELECT 
	M.Nombre + ' ' + M.Apellido AS Miembro,
	COUNT(P.PrestamoID) AS TotalPrestamos
FROM miembro M 
	LEFT JOIN prestamo P ON M.MiembroID = P.MiembroID 
	GROUP BY M.MiembroID, M.Nombre, M.Apellido 
	ORDER BY TotalPrestamos DESC;

--Ejercicio 4
--Encuentra los libros que NUNCA se han prestado.

SELECT L.Titulo, L.Autor, L.Categoria FROM libro L 
WHERE NOT EXISTS (
	SELECT 1 FROM prestamo P
	WHERE P.LibroID = L.LibroID
);

--Ejercicio 5
--Lista categorías con el total de ejemplares disponibles.

SELECT 
	Categoria,
	SUM(CantidadDisponible) AS TotalDisponible,
	COUNT(*) AS TotalLibros
FROM libro
GROUP BY Categoria 
ORDER BY TotalDisponible DESC;

--Ejercicio 6
--Actualiza la cantidad disponible de un libro cuando se devuelve.

--Cuando se devuelve un libro (PrestamoID = 1)

UPDATE prestamo 
SET FechaDevolucionReal = GETDATE() 
WHERE PrestamoID = 1;

UPDATE libro 
SET CantidadDisponible = CantidadDisponible + 1 
WHERE LibroID = (
	SELECT LibroID FROM prestamo 
	WHERE PrestamoID = 1
);

--Ejercicio 7
--Crea una consulta que calcule multas para préstamos atrasados (50 pesos por día de retraso).

SELECT
	P.PrestamoID,
	M.Nombre + ' ' + M.Apellido AS Miembro,
	L.Titulo,
	P.FechaDevolucionEsperada,
	CASE
WHEN DATEDIFF(DAY, P.FechaDevolucionEsperada, GETDATE()) > 0 THEN 
	DATEDIFF(DAY, P.FechaDevolucionEsperada, GETDATE()) * 50
ELSE 
	0
END AS MultaCalculada 

FROM prestamo P 
	INNER JOIN miembro M ON P.MiembroID = M.MiembroID 
	INNER JOIN libro L   ON P.LibroID   = L.LibroID 
	WHERE P.FechaDevolucionReal IS NULL AND DATEDIFF(DAY, P.FechaDevolucionEsperada, GETDATE()) > 0;

*/

