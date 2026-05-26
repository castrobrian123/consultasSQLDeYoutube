--CREATE DATABASE algunYoutuber;
/*

CREATE TABLE cliente (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Ciudad VARCHAR(50),
    FechaRegistro DATE DEFAULT GETDATE()
);

CREATE TABLE producto (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    NombreProducto VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2),
    Stock INT DEFAULT 0,
    Categoria VARCHAR(50)
);

CREATE TABLE venta (
    VentaID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT,
    ProductoID INT,
    Cantidad INT,
    FechaVenta DATE DEFAULT GETDATE(),
    FOREIGN KEY (ClienteID) REFERENCES cliente(ClienteID),
    FOREIGN KEY (ProductoID) REFERENCES producto(ProductoID)
);

*/
/*
-- Insertar clientes 
INSERT INTO cliente (Nombre, Email, Ciudad)
VALUES 
    ('Juan Pérez', 'juan@email.com', 'Santo Domingo'),
    ('María García', 'maria@email.com', 'Santiago'),
    ('Carlos Rodríguez', 'carlos@email.com', 'La Vega'),
    ('Ana Martínez', 'ana@email.com', 'San Pedro'),
    ('Luis Fernández', 'luis@email.com', 'Santo Domingo');

-- Insertar productos 
INSERT INTO producto (NombreProducto, Precio, Stock, Categoria)
VALUES
    ('Laptop Dell', 45000.00, 10, 'Electrónica'),
    ('Mouse Inalámbrico', 800.00, 50, 'Accesorios'),
    ('Teclado Mecánico', 2500.00, 30, 'Accesorios'),
    ('Monitor 24 pulgadas', 8000.00, 15, 'Electrónica'),
    ('Auriculares Bluetooth', 1500.00, 25, 'Accesorios');

-- Insertar ventas 
INSERT INTO venta (ClienteID, ProductoID, Cantidad, FechaVenta)
VALUES
    (1, 1, 1, '2024-01-15'),
    (2, 3, 2, '2024-01-16'),
    (3, 2, 3, '2024-01-17'),
    (1, 5, 1, '2024-01-18'),
    (4, 4, 1, '2024-01-19');

*/
SELECT * FROM venta;