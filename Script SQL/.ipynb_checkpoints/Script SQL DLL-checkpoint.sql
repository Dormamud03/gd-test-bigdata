-- Creacion de la base de datos para la empresa MP3
CREATE DATABASE mp3_database;

-- Configurar la codificacion de caracteres para aceptar las tiltes comas u otro caracter especial
SET client_encoding = 'UTF8';

-- Tabla CLIENTES
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    direccion TEXT,
    identificacion VARCHAR(13)
);

-- Tabla CORRESPONSALES
CREATE TABLE corresponsales (
    id_corresponsal SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion TEXT
);

-- Tabla PRODUCTOS
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10,5), 
    stock INT
);

-- Tabla ORDENES
CREATE TABLE ordenes (
    id_orden SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    id_corresponsal INT REFERENCES corresponsales(id_corresponsal),
    fecha_transaccion DATE,
    estado VARCHAR(20),
    total_orden DECIMAL(10,5)
);

-- Tabla ORDEN_DETALLES
CREATE TABLE orden_detalles (
    id_orden INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,5) NOT NULL,
    PRIMARY KEY (id_orden, id_producto),
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-------Añadir datos a la base 
-- CLIENTES 
INSERT INTO clientes (nombre, correo, telefono, direccion, identificacion) VALUES
('José Pérez', 'jose_perez@example.com', '3001234567', 'Calle 10 #45-23, Medellín', '1234567890123'),
('Ana María Ñúñez', 'ana-nunez@example.com', '3116547890', 'Av. Siempre Viva - Bogotá', '9876543210987'),
('Luis_Andrés', 'luis_andres@example.com', '3100000000', 'Cll 50 _ Apto 4B', '1112233445567');
-- CORRESPONSALES
INSERT INTO corresponsales (nombre, ubicacion) VALUES
('Punto Éxito - Sur', 'Centro Comercial Éxito, Cali'),
('ServiPago Ñ', 'Carrera 15 #34-50, Manizales'),
('Rapi_Giro', 'Barrio Las Ñatas, Montería');

-- PRODUCTOS 
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Audífono Pro-X', 'Audífono con cancelación de ruido – versión 2.0', 123.45678, 50),
('MP3_Premium', 'Reproductor de música portátil edición limitada', 87.00001, 100),
('Cargador-Ñ', 'Cargador rápido tipo C – compatible con MP3', 45.12345, 200);

-- ORDENES
INSERT INTO ordenes (id_cliente, id_corresponsal, fecha_transaccion, estado, total_orden) VALUES
(1, 1, '2024-04-01', 'Pagado', 246.91356),
(2, 2, '2024-04-02', 'Pendiente', 132.12346),
(3, 3, '2024-04-03', 'Pagado', 174.00000);

-- ORDEN_DETALLES
INSERT INTO orden_detalles (id_orden, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 123.45678),
(2, 2, 1, 87.00001),
(3, 3, 4, 43.50000);
