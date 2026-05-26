

--USE algunYoutuber;

--(Parte 1)

--SELECT * FROM cliente;

--SELECT Nombre, Ciudad FROM cliente;

--(Parte 2)

--SELECT * FROM producto;
/*
SELECT 
	NombreProducto, 
	Precio, 
	Precio * 0.18 AS ITBIS, 
	Precio * 1.18 AS PrecioConITBIS 

FROM producto;
*/

--(Parte 3)

-- Ver ciudades (pueden repetirse)
--SELECT Ciudad FROM cliente;

-- Ver solo ciudades ÚNICAS (sin repetición)
--SELECT DISTINCT Ciudad FROM cliente;

-- Contar cuántos clientes hay en total
/*
SELECT 
	COUNT(*) AS TotalClientes 
FROM cliente;
*/

-- Contar ciudades diferentes
/*
SELECT 
	COUNT(DISTINCT Ciudad) AS CiudadesDiferentes
FROM cliente;
*/

--(Parte 4)

--Ejercicio 1
--Muestra todos los productos de la tabla Productos.

--SELECT * FROM producto;
  
-- Ejercicio 2
--Muestra solo el nombre y precio de los productos.

--SELECT NombreProducto, Precio FROM producto; 

-- Ejercicio 3
--Calcula el precio de cada producto con un descuento del 15%.

/*
SELECT 
	NombreProducto, 
	Precio, 
	Precio * 0.85 AS PrecioConDescuento

FROM producto;
*/
 
-- Ejercicio 4
--¿Cuántos productos hay en total en la tabla Productos?

/*
SELECT 
	COUNT(*) AS TotalProductos 
FROM producto;
*/

-- Ejercicio 5
--¿Cuántas categorías diferentes de productos existen?

/*
SELECT
	COUNT(DISTINCT Categoria) AS CategoriasDiferentes
FROM Productos;
*/



