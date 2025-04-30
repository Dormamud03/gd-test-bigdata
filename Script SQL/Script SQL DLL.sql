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
('Luis_Andrés', 'luis_andres@example.com', '3100000000', 'Cll 50 _ Apto 4B', '1112233445567'),
('Carlos González', 'carlos.gonzalez@example.com', '3123456789', 'Carrera 8 #22-45, Bogotá', '6677889900112'),
('Marta Rodríguez', 'marta.rodriguez@example.com', '3151234567', 'Calle 6 #54-67, Medellín', '3344556677889'),
('Pedro Álvarez', 'pedro.alvarez@example.com', '3176543210', 'Avenida 3 #15-50, Cali', '2233445566778'),
('María García', 'maria.garcia@example.com', '3198765432', 'Calle 18 #90-12, Cartagena', '9988776655443'),
('Roberto López', 'roberto.lopez@example.com', '3181234567', 'Calle 12 #67-89, Barranquilla', '5544332211999'),
('Laura Pérez', 'laura.perez@example.com', '3109876543', 'Avenida 4 #32-56, Medellín', '4455667788990'),
('David Martínez', 'david.martinez@example.com', '3112345678', 'Carrera 9 #14-23, Bucaramanga', '9988776655222'),
('Claudia Díaz', 'claudia.diaz@example.com', '3107654321', 'Calle 7 #44-78, Quito', '6677889912345'),
('Antonio Sánchez', 'antonio.sanchez@example.com', '3131234567', 'Calle 3 #12-45, Lima', '5566778899887'),
('José López', 'jose.lopez@example.com', '3142345678', 'Av. San Martín #23-45, Bogotá', '2244667788991'),
('Carolina Torres', 'carolina.torres@example.com', '3166543210', 'Calle 4 #10-22, Medellín', '9988774433221'),
('Luis Ramírez', 'luis.ramirez@example.com', '3178765432', 'Calle 9 #55-11, Montería', '3355778899000'),
('Gabriela Jiménez', 'gabriela.jimenez@example.com', '3154321098', 'Avenida 8 #20-45, Guayaquil', '7766554433220'),
('Francisco Rodríguez', 'francisco.rodriguez@example.com', '3198765432', 'Calle 5 #15-23, Quito', '2233445566889'),
('Sofía Martínez', 'sofia.martinez@example.com', '3123456789', 'Calle 10 #80-50, Lima', '5566778899001'),
('Elena López', 'elena.lopez@example.com', '3106543210', 'Avenida 3 #14-23, Bogotá', '4433221100998'),
('Víctor Fernández', 'victor.fernandez@example.com', '3134321098', 'Calle 15 #36-45, Barranquilla', '1122334455667');

-- CORRESPONSALES
INSERT INTO corresponsales (nombre, ubicacion) VALUES
('Punto Éxito - Sur', 'Centro Comercial Éxito, Cali'),
('ServiPago Ñ', 'Carrera 15 #34-50, Manizales'),
('Rapi_Giro', 'Barrio Las Ñatas, Montería'),
('PagaFácil Norte', 'Av. Caracas #34-22, Bogotá'),
('GirosYA', 'Calle 8 #10-50, Bucaramanga'),
('Punto Rápido', 'Calle 12 #45-67, Medellín'),
('ServiGiro', 'Av. 6 de Diciembre #23-45, Quito'),
('RapiPago', 'Callejón 5 #12-34, Guayaquil'),
('PagaExpress', 'Av. Libertador #78-90, Cuenca'),
('GirosExpress', 'Calle 10 #34-56, Loja'),
('Punto Rápido 2', 'Calle 15 #45-67, Ambato'),
('ServiGiro 2', 'Av. 10 de Agosto #23-45, Riobamba'),
('RapiPago 2', 'Callejón 3 #12-34, Quito'),
('PagaExpress 2', 'Av. Amazonas #78-90, Guayaquil'),
('GirosExpress 2', 'Calle 20 #34-56, Cuenca'),
('Punto Rápido 3', 'Calle 25 #45-67, Loja'),
('ServiGiro 3', 'Av. 12 de Octubre #23-45, Ambato'),
('RapiPago 3', 'Callejón 8 #12-34, Riobamba'),
('PagaExpress 3', 'Av. Simón Bolívar #78-90, Quito'),
('GirosExpress 3', 'Calle 30 #34-56, Guayaquil');

-- PRODUCTOS 
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Audífono Pro-X', 'Audífono con cancelación de ruido – versión 2.0', 123.45678, 50),
('MP3_Premium', 'Reproductor de música portátil edición limitada', 87.00001, 100),
('Cargador-Ñ', 'Cargador rápido tipo C – compatible con MP3', 45.12345, 200),
('Teclado Mecánico GX', 'Teclado mecánico con retroiluminación RGB', 150.87654, 75),
('Mochila UltraPro', 'Mochila deportiva con compartimentos para laptop y accesorios', 39.98765, 50),
('Mouse Gaming Xtreme', 'Mouse óptico de alta precisión para gamers', 29.87654, 120),
('Cámara Digital SmartCam', 'Cámara digital compacta con Wi-Fi y pantalla táctil', 200.56789, 30),
('Bocina Bluetooth BassMax', 'Bocina portátil con excelente calidad de sonido', 99.87654, 200),
('Auriculares Bluetooth JBL', 'Auriculares inalámbricos con cancelación de ruido', 115.45678, 40),
('Smartwatch FitTrack', 'Reloj inteligente con monitoreo de actividad física', 129.23456, 60),
('Cargador Solar PowerCharge', 'Cargador solar portátil para dispositivos móviles', 55.67890, 100),
('Pantalla LED 32" Full HD', 'Televisor LED 32" con resolución Full HD', 220.34567, 50),
('Parlante portátil Bose', 'Parlante Bluetooth portátil con sonido de alta calidad', 120.76543, 80),
('Disco Duro Externo 1TB', 'Disco duro portátil con 1TB de almacenamiento', 95.54321, 150),
('Cargador Rápido QC3.0', 'Cargador rápido con tecnología Qualcomm Quick Charge 3.0', 39.12345, 200),
('Ratón Óptico XTech', 'Ratón ergonómico de alta precisión', 17.65432, 300),
('Mochila para cámara', 'Mochila de cámara con espacio para lentes y accesorios', 82.56789, 45),
('Proyector Portátil Pico', 'Proyector portátil de alta resolución', 180.23456, 25),
('Bicicleta Eléctrica EcoBike', 'Bicicleta eléctrica para ciudad con batería de larga duración', 850.34567, 10),
('Cargador USB-C Dual', 'Cargador con dos puertos USB-C para dispositivos rápidos', 40.12345, 150);

-- ORDENES
INSERT INTO ordenes (id_cliente, id_corresponsal, fecha_transaccion, estado, total_orden) VALUES
(1, 1, '2024-04-01', 'Pagado', 246.91356),
(2, 2, '2024-05-02', 'Pendiente', 132.12346),
(3, 3, '2024-06-01', 'Pagado', 174.00000),
(4, 4, '2024-04-04', 'Pagado', 421.01000),
(5, 5, '2024-08-05', 'Pagado', 319.99000),
(6, 6, '2024-09-06', 'Pagado', 159.99500),
(7, 7, '2024-01-01', 'Pendiente', 249.99000),
(8, 8, '2024-10-08', 'Pagado', 199.99500),
(9, 9, '2024-11-09', 'Pagado', 179.99000),
(10, 10, '2024-03-10', 'Pendiente', 169.99500),
(11, 11, '2024-02-11', 'Pagado', 159.99000),
(12, 12, '2024-01-11', 'Pagado', 149.99500),
(13, 13, '2024-07-13', 'Pendiente', 139.99000),
(14, 14, '2024-06-14', 'Pagado', 129.99500),
(15, 15, '2024-06-15', 'Pagado', 119.99000),
(16, 16, '2024-09-16', 'Pendiente', 109.99500),
(17, 17, '2024-08-17', 'Pagado', 99.99000),
(18, 18, '2024-10-18', 'Pagado', 89.99500),
(19, 19, '2024-04-19', 'Pendiente', 79.99000),
(19, 19, '2024-04-20', 'Pendiente', 874.99000),
(20, 20, '2024-04-21', 'Pagado', 69.99500);

-- ORDEN_DETALLES
INSERT INTO orden_detalles (id_orden, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 123.45678),
(2, 2, 1, 87.00001),
(3, 3, 4, 43.50000),
(4, 4, 2, 210.50500),
(5, 5, 2, 159.99500),
(6, 6, 1, 159.99500),
(7, 7, 2, 249.99000),
(8, 8, 1, 199.99500),
(9, 9, 2, 179.99000),
(10, 10, 1, 169.99500),
(11, 11, 2, 159.99000),
(12, 12, 1, 149.99500),
(13, 13, 2, 139.99000),
(14, 14, 1, 129.99500),
(15, 15, 2, 119.99000),
(16, 16, 1, 109.99500),
(17, 17, 2, 99.99000),
(18, 18, 1, 89.99500),
(19, 19, 2, 79.99000),
(20, 20, 1, 69.99500),
(20, 1, 5, 69.99500),
(20, 2, 5, 69.99500);
