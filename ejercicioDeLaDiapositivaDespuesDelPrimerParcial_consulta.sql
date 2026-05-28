
-- se crean las tablas
/*

CREATE TABLE alumno(

    matricula INT PRIMARY KEY,

    apellido VARCHAR(100) NOT NULL,

    nombre VARCHAR(100) NOT NULL,

    direccion_calle VARCHAR(100) NOT NULL,

    direccion_nro INT NOT NULL,

    direccion_cp INT NOT NULL,

	email VARCHAR(150) UNIQUE,

    escuela_proveniente VARCHAR(100) NOT NULL,

    estado VARCHAR(100) NOT NULL 

);

CREATE TABLE asignatura(

    codigo INT PRIMARY KEY,

    nombreDeMateria VARCHAR(100) NOT NULL,
    
    legajo INT

);

CREATE TABLE cursada(

    codigo INT PRIMARY KEY,

    turno VARCHAR(100) NOT NULL,

    modalidad VARCHAR(100) NOT NULL,

    matricula_alumno INT NOT NULL,

    codigo_asignatura INT NOT NULL,
    
    FOREIGN KEY (matricula_alumno) REFERENCES alumno(matricula),

    FOREIGN KEY (codigo_asignatura) REFERENCES asignatura(codigo)

);

*/

-- se ingresan datos en las columnas de las tablas

/*

INSERT INTO alumno ( matricula, apellido, nombre, direccion_calle, direccion_nro, direccion_cp, email, escuela_proveniente, estado )
VALUES
    ( 1001, 'Gomez',      'Juan', 'Av. San Martin', 1234, 1406,      'juan.gomez@gmail.com', 'Escuela Tecnica N°5', 'Activo' ),
    ( 1670, 'torres',   'matias',   'Av. Belgrano', 2450, 1870,   'matias.torres@gmail.com',  'Escuela Media N°12', 'Activo' ),
    ( 3540, 'falcon',     'alan',  'Av. Rivadavia', 4567, 1002,     'alan.falcon@gmail.com',    'Colegio Nacional', 'Activo' ),
    ( 7320, 'gonzalez', 'marcos',    'Calle Mitre',  980, 5500, 'marcos.gonzalez@gmail.com',  'Instituto San Jose', 'Activo' );

INSERT INTO asignatura (codigo, nombreDeMateria, legajo) 
VALUES 
    (2540, 'matematica', 20),
    (7320, 'lengua', 70),
    (1420, 'fisica', 40);

INSERT INTO cursada (nroId, turno, modalidad, matricula_alumno, codigo_asignatura)
VALUES 
    (1, 'mañana', 'presencial', 1670, 2540),
    (2, 'tarde', 'virtual', 7320, 7320),
    (3, 'noche', 'presencial', 3540, 1420);

*/

--SELECT * FROM cursada;

