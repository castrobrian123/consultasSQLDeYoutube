
--USE algunYoutuber;

--(Parte 1)

-- Ventas con nombre de cliente y nombre de producto

/*
SELECT
   V.VentaID,
   C.Nombre AS NombreCliente,
   P.NombreProducto,
   V.Cantidad,
   V.FechaVenta
FROM venta V
   INNER JOIN cliente C  ON V.ClienteID  = C.ClienteID
   INNER JOIN producto P ON V.ProductoID = P.ProductoID;
*/

--(Parte 2)

-- Todos los clientes, hayan comprado o no
/*
SELECT
   C.Nombre,
   C.Ciudad,
   COUNT(V.VentaID)  AS TotalCompras
FROM cliente C
   LEFT JOIN venta V ON C.ClienteID = V.ClienteID
GROUP BY C.ClienteID, C.Nombre, C.Ciudad;

-- Clientes que NUNCA han comprado (NULL en VentaID)
SELECT C.Nombre FROM cliente C
   LEFT JOIN venta V ON C.ClienteID = V.ClienteID
WHERE V.VentaID IS NULL;
*/

--(Parte 3)

/*
--Ejercicio 1
--Muestra todas las ventas con el nombre del cliente y del producto.

SELECT 
	V.VentaID,
	C.Nombre AS Cliente,
	P.NombreProducto AS Producto,
	V.Cantidad,
	V.FechaVenta 
FROM venta V 
	INNER JOIN cliente C  ON V.ClienteID  = C.ClienteID 
	INNER JOIN producto P ON V.ProductoID = P.ProductoID;
	
--Ejercicio 2
--Calcula el total de ventas (precio × cantidad) para cada venta.

SELECT 
	V.VentaID,
	C.Nombre,
	P.NombreProducto,
	V.Cantidad,
	P.Precio,
	(V.Cantidad * P.Precio) AS TotalVenta 
FROM venta V 
	INNER JOIN cliente C  ON V.ClienteID  = C.ClienteID 
	INNER JOIN producto P ON V.ProductoID = P.ProductoID;
	
--Ejercicio 3
--Encuentra qué clientes han comprado productos de la categoría 'Electrónica'.

SELECT DISTINCT 
	C.Nombre,
	C.Ciudad 
FROM cliente C 
	INNER JOIN venta V ON C.ClienteID = V.ClienteID 
	INNER JOIN producto P ON V.ProductoID = P.ProductoID 
WHERE P.Categoria = 'Electrónica';

--Ejercicio 4
--Muestra todos los productos indicando cuántas veces se ha vendido cada uno (incluso si no se ha vendido nunca).

SELECT 
	P.NombreProducto,
	COUNT(V.VentaID) AS VecesVendido 
FROM producto P 
	LEFT JOIN venta V ON P.ProductoID = V.ProductoID 
GROUP BY 
	P.ProductoID,
	P.NombreProducto 
ORDER BY VecesVendido DESC;

*/