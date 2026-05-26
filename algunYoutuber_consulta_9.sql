

--USE algunYoutuber;

/*
--(Parte 1)

CREATE TABLE empleado (
   EmpleadoID       INT PRIMARY KEY IDENTITY(1,1),
   Nombre           VARCHAR(100) NOT NULL,
   Apellido         VARCHAR(100) NOT NULL,
   Email            VARCHAR(150) UNIQUE,
   Salario          DECIMAL(10,2) CHECK (Salario > 0),
   FechaContratacion DATE DEFAULT GETDATE(),
   Activo           BIT DEFAULT 1
);

SELECT * FROM empleado;

*/

-- PRIMARY KEY: identifica únicamente cada fila
-- IDENTITY(1,1): auto-incremento desde 1
-- NOT NULL: campo obligatorio
-- UNIQUE: no permite valores duplicados
-- CHECK: valida que se cumpla una condición
-- DEFAULT: valor por defecto automático

--(Parte 2)

/*
SELECT * FROM producto;

-- Agregar una columna nueva
ALTER TABLE producto ADD Descripcion VARCHAR(500);

-- Modificar el tipo o tamaño de una columna
ALTER TABLE producto ALTER COLUMN Descripcion VARCHAR(1000);

-- Eliminar una columna
ALTER TABLE producto DROP COLUMN Descripcion;

-- Agregar una restricción CHECK
ALTER TABLE producto ADD CONSTRAINT CHK_Precio CHECK (Precio > 0);

-- Eliminar una tabla (con verificación de existencia)
IF OBJECT_ID('Clientes_Backup', 'U') IS NOT NULL 
DROP TABLE Clientes_Backup;

*/

