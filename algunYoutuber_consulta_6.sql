
--USE algunYoutuber;

--(Parte 1)

/*
-- Cuántos productos hay en cada categoría

SELECT 
	Categoria, 
	COUNT(*) AS CantidadProductos
FROM producto GROUP BY Categoria;

-- Stock total y precio promedio por categoría

SELECT 
	Categoria,
	SUM(Stock)    AS StockTotal,
	AVG(Precio)   AS PrecioPromedio
FROM producto GROUP BY Categoria;

-- Ventas por cliente (con JOIN)
SELECT 
	C.Nombre, 
	SUM(P.Precio * V.Cantidad) AS TotalGastado
FROM cliente C 
	INNER JOIN venta V    ON C.ClienteID  = V.ClienteID
	INNER JOIN producto P ON V.ProductoID = P.ProductoID
GROUP BY 
	C.ClienteID, 
	C.Nombre 
ORDER BY TotalGastado DESC;

*/

--(Parte 2)

/*

-- WHERE filtra FILAS (antes de agrupar)
-- HAVING filtra GRUPOS (después de agrupar)

-- Categorías con más de 2 productos
SELECT 
	Categoria, COUNT(*) AS Cantidad
FROM 
	producto 
GROUP BY 
	Categoria 
HAVING COUNT(*) > 2;

-- Clientes que han gastado más de 10,000
SELECT 
	C.Nombre,
	SUM(V.Cantidad * P.Precio) AS TotalGastado
FROM cliente C 
	INNER JOIN venta V    ON C.ClienteID  = V.ClienteID
	INNER JOIN producto P ON V.ProductoID = P.ProductoID
GROUP BY 
	C.ClienteID, 
	C.Nombre

*/

--(Parte 3)

/*
--Ejercicio 1
--Calcula el precio promedio de productos por categoría.

SELECT 
	Categoria,
	AVG(Precio) AS PrecioPromedio 
FROM producto GROUP BY Categoria;

--Ejercicio 2
--Encuentra cuántas ventas ha realizado cada cliente.

SELECT 
	C.Nombre,
	COUNT(V.VentaID) AS TotalVentas 
FROM cliente C 
	LEFT JOIN venta V ON C.ClienteID = V.ClienteID 
GROUP BY 
	C.ClienteID, 
	C.Nombre;
	
--Ejercicio 3
--Muestra solo las categorías que tienen un precio promedio mayor a 2,000.

SELECT 
	Categoria,
	AVG(Precio) AS PrecioPromedio 
FROM 
	producto 
GROUP BY 
	Categoria 
HAVING 
	AVG(Precio) > 2000;
	
--Ejercicio 4
--Calcula el total de ingresos por mes del año 2024.

SELECT
	MONTH(FechaVenta) AS Mes,
	SUM(V.Cantidad * P.Precio) AS IngresoTotal 
FROM venta V 
	INNER JOIN producto P ON V.ProductoID = P.ProductoID 
WHERE 
	YEAR(FechaVenta) = 2024 
GROUP BY 
	MONTH(FechaVenta) ORDER BY Mes;
	
--Ejercicio 5
--Encuentra el producto más vendido (por cantidad total).

SELECT TOP 1
	P.NombreProducto,
	SUM(V.Cantidad) AS TotalVendido 
FROM producto P 
	INNER JOIN venta V ON P.ProductoID = V.ProductoID 
GROUP BY 
	P.ProductoID,
	P.NombreProducto 
ORDER BY TotalVendido DESC;

*/

