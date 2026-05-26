
--USE algunYoutuber;

--(Parte 1)

-- Ordenar de menor a mayor (ASC es el predeterminado)
/*
SELECT NombreProducto, Precio FROM producto
ORDER BY Precio;
*/

-- Ordenar de mayor a menor
/*
SELECT NombreProducto, Precio FROM producto
ORDER BY Precio DESC;
*/

-- Ordenar por múltiples columnas

/*
SELECT NombreProducto, Categoria, Precio FROM producto
ORDER BY Categoria ASC, Precio DESC;
*/

--(Parte 2 el TOP es exclusivo de microsoft sql server en mysql seria LIMIT)

-- Los 3 productos más caros
/*
SELECT TOP 3 NombreProducto, Precio
FROM producto
ORDER BY Precio DESC;
*/

-- Los 5 clientes registrados más recientemente
/*
SELECT TOP 5 Nombre, FechaRegistro
FROM cliente
ORDER BY FechaRegistro DESC;
*/

-- SIEMPRE usa ORDER BY con TOP para resultados predecibles

--(Parte 3)

--el COUNT(*) Cuenta la cantidad de filas.
/*
SELECT 
	COUNT(*) AS Total 
FROM producto;
*/

--el SUM(columna) Suma los valores.
/*
SELECT 
	SUM(Precio * Stock) AS ValorInventario 
FROM producto;
*/

--el AVG(columna) Calcula el promedio.
/*
SELECT 
	AVG(Precio) AS PrecioPromedio 
FROM producto;
*/

--el MAX(columna) Calcula el Valor máximo.
--el MIN(columna) Calcula el Valor mínimo. 
/*
SELECT 
	MAX(Precio) AS MasCaro,
	MIN(Precio) AS MasBarato 
FROM producto;
*/

--(Parte 4)

-- Funciones de TEXTO
/*
SELECT 
	UPPER(Nombre) AS EnMayusculas 
FROM cliente; -- Convertir a mayúsculas 

SELECT 
	LOWER(Email) AS EnMinusculas 
FROM cliente; -- Convertir a minusculas

SELECT 
	Nombre, 
	LEN(Nombre) AS LongitudNombre 
FROM cliente; -- Longitud del texto

SELECT 
	Nombre + ' - ' + Ciudad AS ClienteConCiudad 
FROM cliente; -- Concatenar texto
*/

/*
SELECT 
	CONCAT(Nombre + ' - ' + Ciudad) AS ClienteConCiudad 
FROM cliente; -- Concatenar texto
*/
-- Funciones de FECHA

--SELECT GETDATE() AS FechaActual; -- Fecha actual

/*
SELECT 
	YEAR(FechaVenta) AS Año, 
	MONTH(FechaVenta) AS Mes 
FROM venta; -- Partes de fecha

SELECT 
	YEAR(FechaVenta) AS Año, 
	MONTH(FechaVenta) AS Mes, 
	DAY(FechaVenta) AS Dia 
FROM venta; -- Partes de fecha

SELECT 
	DATEDIFF(DAY, FechaRegistro, GETDATE()) AS DiasRegistrado
FROM cliente; -- Diferencia entre fechas
*/

--(Parte 5)

--Redondear
/*
SELECT 
	NombreProducto,
	Precio,
	ROUND(Precio * 1.18, 2) AS PrecioConITBIS 
FROM producto;
  
-- Valor absoluto 

SELECT ABS(-15) AS ValorAbsoluto;

-- Raíz cuadrada SELECT SQRT(144) AS RaizCuadrada;

SELECT SQRT(144) AS RaizCuadrada;
*/

--(Parte 6)

/*

-- Ejercicio 1
--Muestra los 5 productos más baratos.

SELECT TOP 5 
	NombreProducto, 
	Precio 
FROM producto ORDER BY Precio;

-- Ejercicio 2
--Calcula el precio promedio de todos los productos.

SELECT 
	AVG(Precio) AS PrecioPromedio 
FROM producto;

-- Ejercicio 3
--Muestra el nombre de cada cliente en MAYÚSCULAS junto con su ciudad.

SELECT 
	UPPER(Nombre) AS NombreMayusculas, 
	Ciudad 
FROM cliente;

-- Ejercicio 4
--Calcula cuántos días han pasado desde cada venta hasta hoy.

SELECT 
	VentaID,
	FechaVenta,
	DATEDIFF(DAY, FechaVenta, GETDATE()) AS DiasTranscurridos 
FROM venta;

-- Ejercicio 5
--Encuentra el stock total de todos los productos combinados.

SELECT 
	SUM(Stock) AS StockTotal 
FROM producto;

*/