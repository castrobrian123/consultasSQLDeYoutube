

--USE algunYoutuber;

--(Parte 1)

/*
-- Productos más caros que el promedio general
SELECT NombreProducto, Precio FROM producto
WHERE Precio > (SELECT AVG(Precio) FROM producto);

-- Cómo funciona:
-- 1. Se ejecuta: SELECT AVG(Precio) FROM producto  →  11500
-- 2. Luego se ejecuta: WHERE Precio > 11500

-- Clientes que compraron productos de Electrónica
SELECT Nombre FROM cliente
WHERE ClienteID IN (
	SELECT DISTINCT V.ClienteID FROM venta V
	INNER JOIN producto P ON V.ProductoID = P.ProductoID
	WHERE P.Categoria = 'Electrónica'
);

*/

--(Parte 2)

/*
--Cada producto con la diferencia respecto al precio promedio 
SELECT
	NombreProducto,
	Precio,
	(SELECT AVG(Precio) FROM producto) AS PrecioPromedio,
	Precio - (SELECT AVG(Precio) FROM producto) AS DiferenciaPromedio
	
FROM producto;

*/

--(Parte 3)

/*
-- Categorías con su producto más caro

SELECT
	Categoria,
	MAX(Precio) AS ProductoMasCaro 
FROM producto GROUP BY Categoria;

-- Ahora usando eso como subconsulta:

SELECT P.Categoria,P.NombreProducto,P.Precio FROM producto P 
INNER JOIN (
	SELECT 
		Categoria,
		MAX(Precio) AS MaxPrecio 
	FROM 
		producto GROUP BY Categoria 
) AS MaxPrecios 
ON P.Categoria = MaxPrecios.Categoria AND P.Precio = MaxPrecios.MaxPrecio;

*/

--(Parte 4)

/*
-- EXISTS: verifica si hay al menos un registro
-- Clientes que SÍ han realizado compras

SELECT Nombre FROM cliente C
WHERE EXISTS (
   SELECT 1 FROM venta V 
   WHERE V.ClienteID = C.ClienteID
);

-- NOT EXISTS: lo opuesto
-- Clientes que NO han realizado ninguna compra

SELECT Nombre, Email FROM cliente C
WHERE NOT EXISTS (
   SELECT 1 FROM venta V 
   WHERE V.ClienteID = C.ClienteID
);

-- SELECT 1 es más eficiente (no necesita devolver datos)

*/

--(Parte 5)

/*
-- Comparar con Todos Producto más caro de todos

SELECT NombreProducto, Precio FROM producto 
WHERE Precio >= ALL (SELECT Precio FROM producto);

-- Comprara con cualquiera Productos más caros que CUALQUIER producto de Accesorios

SELECT NombreProducto, Precio, Categoria FROM producto 
WHERE Precio > ANY (SELECT Precio FROM producto);

*/

--(Parte 6)

/*
-- Productos con precio mayor al promedio de SU categoría
-- (cada producto se compara con su propio grupo)

SELECT P1.NombreProducto, P1.Categoria, P1.Precio FROM producto P1
WHERE P1.Precio > (
	SELECT AVG(P2.Precio) FROM producto P2
	WHERE P2.Categoria = P1.Categoria  -- aquí está la correlación
);

-- P1.Categoria viene de la consulta EXTERNA
-- La subconsulta se ejecuta una vez POR CADA FILA

*/

--(Parte 7 NO FUNCIONAN DA ERROR)

/*
-- Ejercicio 1
--Encuentra los productos con stock menor al promedio de stock.

SELECT NombreProducto, Stock     FROM producto
WHERE Stock < (SELECT AVG(Stock) FROM producto);

-- Ejercicio 2
--Muestra los clientes que han gastado más que el cliente promedio.

SELECT
	C.Nombre,
	SUM(V.Cantidad * P.Precio) AS TotalGastado 
FROM cliente C 
	INNER JOIN venta V ON C.ClienteID = V.ClienteID 
	INNER JOIN producto P ON V.ProductoID = P.ProductoID 
	GROUP BY C.ClienteID, C.Nombre 
HAVING 
	SUM(V.Cantidad * P.Precio) > (
		SELECT 
			AVG(TotalPorCliente) 
		FROM 
			(
				SELECT SUM(V2.Cantidad * P2.Precio) AS TotalPorCliente FROM venta V2 
					INNER JOIN producto P2 ON V2.ProductoID = P2.ProductoID 
				GROUP BY 
					V2.ClienteID
			) AS Promedios
	);
	
-- Ejercicio 3
--Encuentra las categorías que tienen más productos que la categoría 'Accesorios'.

SELECT 
	Categoria, 
	COUNT(*) AS CantidadProductos 
FROM 
	producto 
GROUP BY 
	Categoria 
HAVING 
	COUNT(*) > (
		SELECT COUNT(*) FROM producto 
		WHERE Categoria = 'Accesorios'
	);
	
-- Ejercicio 4
--Muestra los productos que nunca se han vendido.

SELECT NombreProducto, Categoria FROM producto P 
WHERE NOT EXISTS (
	SELECT 1 FROM venta V 
	WHERE V.ProductoID = P.ProductoID
);

-- Ejercicio 5
--Para cada cliente, muestra cuánto ha gastado y qué porcentaje representa del total.

SELECT 
	C.Nombre,
	SUM(V.Cantidad * P.Precio) AS TotalGastado,
	CAST(
			SUM(V.Cantidad * P.Precio) * 100.0 / (
				SELECT SUM(V2.Cantidad * P2.Precio) FROM venta V2 
					INNER JOIN producto P2 ON V2.ProductoID = P2.ProductoID 
			) AS DECIMAL(5,2)
		) AS PorcentajeDelTotal 
		FROM 
			cliente C 
				INNER JOIN venta V ON C.ClienteID = V.ClienteID 
				INNER JOIN producto P ON V.ProductoID = P.ProductoID 
				GROUP BY C.ClienteID, C.Nombre;

*/
