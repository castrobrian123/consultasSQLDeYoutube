

--USE algunYoutuber;

--(Parte 1 NO FUNCIONA)

/*
-- Insertar UN registro
INSERT INTO cliente (Nombre, Email, Ciudad)
VALUES ('Pedro Gomez', 'pedro@email.com', 'La Romana');

-- Insertar MÚLTIPLES registros en una sola instrucción
INSERT INTO producto (NombreProducto, Precio, Stock, Categoria)
VALUES ('Webcam HD',      1800.00,  20, 'Accesorios'),
       ('Tablet 10 pul', 12000.00,   8, 'Electrónica'),
       ('Cable USB-C',     250.00, 100, 'Accesorios');

-- INSERT desde otra tabla (copiar datos)
INSERT INTO cliente_Backup (ClienteID, Nombre, Email, Ciudad)
SELECT ClienteID, Nombre, Email, Ciudad FROM cliente
WHERE Ciudad = 'Santo Domingo';

*/

--(Parte 2)

/*
-- ⚠️  SIN WHERE  →  cambia TODOS los registros
-- UPDATE Productos SET Precio = 0;  <-- ¡PELIGROSO!

SELECT * FROM producto;

-- ✅  CON WHERE  →  solo el registro específico

UPDATE producto
SET Precio = 2800.00
WHERE ProductoID = 3;

-- Actualizar MÚLTIPLES columnas

UPDATE producto

SET 
    Precio = 46000.00, 
    Stock = 12

WHERE NombreProducto = 'Laptop Dell';

-- Actualización porcentual para un grupo

UPDATE producto
SET Precio = Precio * 1.10
WHERE Categoria = 'Electrónica';

*/

--(Parte 3)

/*
-- ⚠️  SIN WHERE  →  elimina TODOS los registros
-- DELETE FROM producto;  <-- ¡PELIGROSO!

SELECT * FROM producto;

-- ✅  Eliminar un registro específico
DELETE FROM producto WHERE ProductoID = 10;

-- Eliminar con condición
DELETE FROM producto WHERE Stock = 0;

-- TRUNCATE: vacía la tabla completa (más rápido)
TRUNCATE TABLE Clientes_Backup;

-- Diferencia: DELETE puede usar WHERE, TRUNCATE no.
-- TRUNCATE reinicia los contadores IDENTITY.

*/

--(Parte 4)

/*
--Ejercicio 1
--Inserta un nuevo cliente en la tabla Clientes.

INSERT INTO cliente (Nombre, Email, Ciudad)
VALUES 
    ('Roberto Sánchez', 'roberto@email.com', 'Bávaro');

--Ejercicio 2
--Inserta tres nuevos productos en una sola instrucción INSERT.

INSERT INTO producto (NombreProducto, Precio, Stock, Categoria)
VALUES 
    ('Impresora Láser', 8500.00, 5, 'Electrónica'),
    ('Papel A4 Resma', 350.00, 50, 'Oficina'),
    ('Mochila Laptop', 1200.00, 15, 'Accesorios');
    
--Ejercicio 3
--Aumenta el precio de todos los productos de 'Accesorios' en un 5% (verifica antes con SELECT).
--Primero verificamos cuántos afectará

SELECT * FROM producto 
WHERE Categoria = 'Accesorios';

-- Luego actualizamos

UPDATE producto 
SET Precio = Precio * 1.05 
WHERE Categoria = 'Accesorios';

--Ejercicio 4
--Actualiza el email de un cliente específico.

--SELECT * FROM cliente;

UPDATE cliente 
SET Email = 'nuevo_email@email.com' 
WHERE ClienteID = 1;

--Ejercicio 5
--Elimina los productos que tienen stock 0 (primero verifica cuántos hay).
--Primero verificamos

SELECT * FROM producto 
WHERE Stock = 0;

-- Si hay productos con stock 0, eliminamos

DELETE FROM producto WHERE Stock = 0;

*/
