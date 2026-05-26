
-- se crean las tablas
/*

CREATE TABLE alumno(

    matricula INT PRIMARY KEY,

    apellido VARCHAR(100) NOT NULL,

    nombre VARCHAR(100) NOT NULL

);

CREATE TABLE asignatura(

    codigo INT PRIMARY KEY,

    nombreDeMateria VARCHAR(100) NOT NULL,
    
    legajo INT

);

CREATE TABLE cursada(

    nroId INT PRIMARY KEY,

    turno VARCHAR(100) NOT NULL,

    modalidad VARCHAR(100) NOT NULL,

    matricula_alumno INT,

    codigo_asignatura INT,
    
    FOREIGN KEY (matricula_alumno) REFERENCES alumno(matricula),

    FOREIGN KEY (codigo_asignatura) REFERENCES asignatura(codigo)

);

*/

-- se ingresan datos en las columnas de las tablas

/*

INSERT INTO alumno (matricula, apellido, nombre) 
VALUES 
    (1670, 'torres', 'matias'),
    (7320, 'gonzalez', 'marcos'),
    (3540, 'falcon', 'alan');

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

