
--USE algunYoutuber;

--(Parte 1)

-- AND: ambas condiciones deben cumplirse

--SELECT * FROM producto WHERE Categoria = 'Electronica' AND Precio < 10000;

-- OR: al menos UNA condición debe cumplirse

--SELECT * FROM cliente WHERE Ciudad = 'Santo Domingo' OR Ciudad = 'Santiago';

-- NOT: niega la condición

--SELECT * FROM producto WHERE NOT Categoria = 'Accesorios';

--(Parte 2)

-- BETWEEN: rango de valores (incluye los extremos)

--SELECT * FROM producto WHERE Precio BETWEEN 1000 AND 5000;

-- IN: lista de valores posibles

--SELECT * FROM cliente WHERE Ciudad IN ('Santo Domingo', 'Santiago', 'La Vega');

-- LIKE: busca patrones en texto

-- % = cualquier cantidad de caracteres

--busca los caracteres que tengan %palabra% dentro de la palabra

--SELECT * FROM producto WHERE NombreProducto LIKE '%Mouse%';

--busca los caracteres %letra% que esten al inicio de la palabra

--SELECT * FROM cliente WHERE Nombre LIKE 'M%';

--busca los caracteres %letra% que esten al  final de la palabra

--SELECT * FROM cliente WHERE Email LIKE '%email.com';

--(Parte 3)

-- IS NULL: busca campos vacíos (sin datos)

--SELECT * FROM cliente WHERE Email IS NULL;

-- IS NOT NULL: busca campos que SÍ tienen datos

--SELECT * FROM cliente WHERE Email IS NOT NULL;

-- IMPORTANTE: NULL no es lo mismo que cero o vacío
-- NULL significa 'desconocido' o 'sin información'

-- NUNCA uses: WHERE Email = NULL  (ESTO ESTA MAL Y INCORRECTO!)

-- SIEMPRE usa: WHERE Email IS NULL (LA FORMA CORRECTA)

--(Parte 4)

--Ejercicio 1 
--Encuentra todos los productos con precio mayor a 1,000.

--SELECT * FROM producto WHERE Precio > 1000;  

-- Ejercicio 2
--Encuentra productos de la categoría 'Electrónica' con stock mayor a 10.

--SELECT * FROM producto WHERE Categoria = 'Electrónica' AND Stock > 10;  

-- Ejercicio 3
--Encuentra clientes cuyo nombre empiece con 'C' o 'M'.

--SELECT * FROM cliente WHERE Nombre LIKE 'C%' OR Nombre LIKE 'M%';  

-- Ejercicio 4
--Encuentra productos con precio entre 500 y 3,000.

--SELECT * FROM producto WHERE Precio BETWEEN 500 AND 3000;  

-- Ejercicio 5
--Encuentra productos cuyo nombre contenga mouse o teclado.

--SELECT * FROM producto WHERE NombreProducto LIKE '%Mouse%' OR NombreProducto LIKE '%Teclado%';




