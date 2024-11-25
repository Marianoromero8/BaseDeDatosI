-- Insertar datos en la tabla Productos
INSERT INTO Productos (nombre_producto, stock, precio) VALUES
('Producto A', 100, 20.50),
('Producto B', 150, 15.75),
('Producto C', 200, 25.00),
('Producto D', 50, 10.00),
('Producto E', 300, 18.40),
('Producto F', 120, 22.10),
('Producto G', 180, 30.00),
('Producto H', 75, 19.90),
('Producto I', 500, 12.00),
('Producto J', 250, 21.50);

INSERT INTO Clientes (nombre, apellido, telefono, direccion, email) VALUES
('Juan', 'Pérez', '555-1234', 'Calle Falsa 123', 'juan.perez@example.com'),
('Ana', 'Gómez', '555-5678', 'Avenida Siempre Viva 456', 'ana.gomez@example.com'),
('Carlos', 'López', '555-8765', 'Calle Luna 789', 'carlos.lopez@example.com'),
('María', 'Martínez', '555-4321', 'Calle del Sol 321', 'maria.martinez@example.com'),
('Luis', 'Sánchez', '555-9876', 'Avenida del Mar 654', 'luis.sanchez@example.com'),
('Laura', 'Rodríguez', '555-3456', 'Calle de la Paz 111', 'laura.rodriguez@example.com'),
('Pedro', 'Hernández', '555-6543', 'Calle Real 222', 'pedro.hernandez@example.com'),
('Julia', 'Fernández', '555-2345', 'Avenida Libertad 333', 'julia.fernandez@example.com'),
('José', 'González', '555-7654', 'Calle de la Estrella 444', 'jose.gonzalez@example.com'),
('Elena', 'Álvarez', '555-8765', 'Calle del Río 555', 'elena.alvarez@example.com');

INSERT INTO Ordenes (producto_id, cliente_id, cantidad, motivo, fecha) VALUES
-- Ordenes del cliente 1 (cliente_id = 1)
(1, 1, 3, 'Compra regular', '2024-11-22 10:00:00'),
(2, 1, 1, 'Regalo de cumpleaños', '2024-11-22 10:05:00'),
(3, 1, 5, 'Reabastecimiento', '2024-11-22 10:10:00'),
(4, 1, 2, 'Promoción especial', '2024-11-22 10:15:00'),
(5, 1, 1, 'Compra de emergencia', '2024-11-22 10:20:00'),
(6, 1, 4, 'Pedido para tienda', '2024-11-22 10:25:00'),
(7, 1, 2, 'Compra para promoción', '2024-11-22 10:30:00'),
(8, 1, 3, 'Pedido online', '2024-11-22 10:35:00'),
(9, 1, 1, 'Reemplazo de producto', '2024-11-22 10:40:00'),
(10, 1, 6, 'Exceso de demanda', '2024-11-22 10:45:00'),

-- Ordenes del cliente 2 (cliente_id = 2)
(1, 2, 2, 'Compra habitual', '2024-11-22 11:00:00'),
(3, 2, 4, 'Reabastecimiento', '2024-11-22 11:05:00'),
(4, 2, 1, 'Regalo de Navidad', '2024-11-22 11:10:00'),
(5, 2, 3, 'Promoción mensual', '2024-11-22 11:15:00'),
(6, 2, 2, 'Pedido urgente', '2024-11-22 11:20:00'),
(7, 2, 5, 'Compra para tienda', '2024-11-22 11:25:00'),
(8, 2, 3, 'Descuento especial', '2024-11-22 11:30:00'),
(9, 2, 1, 'Regalo para amigo', '2024-11-22 11:35:00'),
(10, 2, 4, 'Reposición de stock', '2024-11-22 11:40:00'),
(1, 2, 2, 'Pedido nuevo', '2024-11-22 11:45:00'),

-- Ordenes del cliente 3 (cliente_id = 3)
(2, 3, 1, 'Reemplazo de producto', '2024-11-22 12:00:00'),
(3, 3, 3, 'Compra de temporada', '2024-11-22 12:05:00'),
(4, 3, 2, 'Descuento especial', '2024-11-22 12:10:00'),
(5, 3, 5, 'Compra en promoción', '2024-11-22 12:15:00'),
(6, 3, 1, 'Pedido urgente', '2024-11-22 12:20:00'),
(7, 3, 4, 'Reposición de productos', '2024-11-22 12:25:00'),
(8, 3, 2, 'Regalo de cumpleaños', '2024-11-22 12:30:00'),
(9, 3, 1, 'Reabastecimiento', '2024-11-22 12:35:00'),
(10, 3, 3, 'Compra de emergencia', '2024-11-22 12:40:00'),
(1, 3, 6, 'Pedido mayorista', '2024-11-22 12:45:00'),

-- Ordenes del cliente 4 (cliente_id = 4)
(2, 4, 4, 'Reemplazo de stock', '2024-11-22 13:00:00'),
(3, 4, 1, 'Compra para tienda', '2024-11-22 13:05:00'),
(4, 4, 2, 'Regalo de aniversario', '2024-11-22 13:10:00'),
(5, 4, 3, 'Compra para campaña', '2024-11-22 13:15:00'),
(6, 4, 5, 'Pedido urgente', '2024-11-22 13:20:00'),
(7, 4, 1, 'Compra habitual', '2024-11-22 13:25:00'),
(8, 4, 4, 'Pedido para cliente', '2024-11-22 13:30:00'),
(9, 4, 2, 'Descuento por volumen', '2024-11-22 13:35:00'),
(10, 4, 3, 'Promoción de temporada', '2024-11-22 13:40:00'),
(1, 4, 6, 'Reposición de productos', '2024-11-22 13:45:00'),

-- Ordenes del cliente 5 (cliente_id = 5)
(2, 5, 3, 'Compra en promoción', '2024-11-22 14:00:00'),
(3, 5, 2, 'Pedido para cliente', '2024-11-22 14:05:00'),
(4, 5, 1, 'Regalo de cumpleaños', '2024-11-22 14:10:00'),
(5, 5, 4, 'Reabastecimiento de stock', '2024-11-22 14:15:00'),
(6, 5, 5, 'Compra mayorista', '2024-11-22 14:20:00'),
(7, 5, 2, 'Pedido urgente', '2024-11-22 14:25:00'),
(8, 5, 3, 'Compra para tienda', '2024-11-22 14:30:00'),
(9, 5, 1, 'Descuento especial', '2024-11-22 14:35:00'),
(10, 5, 2, 'Reposición de productos', '2024-11-22 14:40:00'),
(1, 5, 4, 'Compra regular', '2024-11-22 14:45:00'),

-- Ordenes del cliente 6 (cliente_id = 6)
(1, 6, 2, 'Compra para tienda', '2024-11-22 15:00:00'),
(2, 6, 4, 'Pedido urgente', '2024-11-22 15:05:00'),
(3, 6, 3, 'Promoción mensual', '2024-11-22 15:10:00'),
(4, 6, 2, 'Reabastecimiento', '2024-11-22 15:15:00'),
(5, 6, 5, 'Compra online', '2024-11-22 15:20:00'),
(6, 6, 1, 'Descuento especial', '2024-11-22 15:25:00'),
(7, 6, 3, 'Pedido para tienda', '2024-11-22 15:30:00'),
(8, 6, 4, 'Compra habitual', '2024-11-22 15:35:00'),
(9, 6, 2, 'Reposición de stock', '2024-11-22 15:40:00'),
(10, 6, 1, 'Reemplazo de producto', '2024-11-22 15:45:00'),

-- Ordenes del cliente 7 (cliente_id = 7)
(1, 7, 3, 'Pedido por volumen', '2024-11-22 16:00:00'),
(2, 7, 2, 'Compra para cliente', '2024-11-22 16:05:00'),
(3, 7, 4, 'Compra en promoción', '2024-11-22 16:10:00'),
(4, 7, 5, 'Regalo de Navidad', '2024-11-22 16:15:00'),
(5, 7, 3, 'Compra habitual', '2024-11-22 16:20:00'),
(6, 7, 2, 'Reabastecimiento urgente', '2024-11-22 16:25:00'),
(7, 7, 1, 'Pedido especial', '2024-11-22 16:30:00'),
(8, 7, 3, 'Compra mayorista', '2024-11-22 16:35:00'),
(9, 7, 1, 'Compra para tienda', '2024-11-22 16:40:00'),
(10, 7, 4, 'Descuento por volumen', '2024-11-22 16:45:00'),

-- Ordenes del cliente 8 (cliente_id = 8)
(1, 8, 2, 'Reposición urgente', '2024-11-22 17:00:00'),
(2, 8, 3, 'Reemplazo de stock', '2024-11-22 17:05:00'),
(3, 8, 4, 'Compra para cliente', '2024-11-22 17:10:00'),
(4, 8, 1, 'Compra en promoción', '2024-11-22 17:15:00'),
(5, 8, 2, 'Pedido urgente', '2024-11-22 17:20:00'),
(6, 8, 3, 'Descuento especial', '2024-11-22 17:25:00'),
(7, 8, 4, 'Compra mayorista', '2024-11-22 17:30:00'),
(8, 8, 1, 'Compra habitual', '2024-11-22 17:35:00'),
(9, 8, 2, 'Compra para tienda', '2024-11-22 17:40:00'),
(10, 8, 5, 'Regalo de cumpleaños', '2024-11-22 17:45:00'),

-- Ordenes del cliente 9 (cliente_id = 9)
(1, 9, 4, 'Compra para campaña', '2024-11-22 18:00:00'),
(2, 9, 1, 'Pedido especial', '2024-11-22 18:05:00'),
(3, 9, 3, 'Regalo de aniversario', '2024-11-22 18:10:00'),
(4, 9, 5, 'Compra regular', '2024-11-22 18:15:00'),
(5, 9, 1, 'Reabastecimiento', '2024-11-22 18:20:00'),
(6, 9, 4, 'Pedido urgente', '2024-11-22 18:25:00'),
(7, 9, 2, 'Descuento por volumen', '2024-11-22 18:30:00'),
(8, 9, 3, 'Compra mayorista', '2024-11-22 18:35:00'),
(9, 9, 1, 'Compra para cliente', '2024-11-22 18:40:00'),
(10, 9, 5, 'Compra para tienda', '2024-11-22 18:45:00'),

-- Ordenes del cliente 10 (cliente_id = 10)
(1, 10, 3, 'Compra para tienda', '2024-11-22 19:00:00'),
(2, 10, 2, 'Pedido urgente', '2024-11-22 19:05:00'),
(3, 10, 1, 'Compra habitual', '2024-11-22 19:10:00'),
(4, 10, 4, 'Reabastecimiento', '2024-11-22 19:15:00'),
(5, 10, 3, 'Compra mayorista', '2024-11-22 19:20:00'),
(6, 10, 2, 'Descuento especial', '2024-11-22 19:25:00'),
(7, 10, 1, 'Pedido para cliente', '2024-11-22 19:30:00'),
(8, 10, 4, 'Reemplazo de producto', '2024-11-22 19:35:00'),
(9, 10, 3, 'Compra de emergencia', '2024-11-22 19:40:00'),
(10, 10, 2, 'Compra para campaña', '2024-11-22 19:45:00');

-- Índice para la columna cliente_id en la tabla Ordenes (mejora las consultas basadas en cliente)
CREATE INDEX idx_cliente_id ON Ordenes(cliente_id);

-- Índice para la columna producto_id en la tabla Ordenes (mejora las consultas basadas en producto)
CREATE INDEX idx_producto_id ON Ordenes(producto_id);

-- Índice para la columna email en la tabla Clientes (mejora las búsquedas por email)
CREATE INDEX idx_email ON Clientes(email);

-- Índice para la columna nombre_producto en la tabla Productos (mejora las búsquedas por nombre de producto)
CREATE INDEX idx_nombre_producto ON Productos(nombre_producto);
