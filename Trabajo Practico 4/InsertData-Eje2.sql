INSERT INTO Inventario (NombreProducto, Cantidad, Precio) VALUES
('Producto A', 10, 15.50),
('Producto B', 20, 25.00),
('Producto C', 5, 7.75),
('Producto D', 30, 12.00),
('Producto E', 0, 5.00),
('Producto F', 15, 20.00),
('Producto G', 8, 30.00);

INSERT INTO HistorialInventario (ProductoId, FechaCambio, Cambio, Motivo) VALUES
(1, '2024-01-10', 5, 'Recepción de mercancía'),
(2, '2024-01-15', -3, 'Venta de productos'),
(3, '2024-01-20', 10, 'Recepción de mercancía'),
(4, '2024-01-25', -2, 'Devolución de productos'),
(5, '2024-01-30', 8, 'Recepción de mercancía'),
(6, '2024-02-05', -1, 'Venta de productos'),
(7, '2024-02-10', -5, 'Ajuste de inventario');

INSERT INTO CambiosInventario (ProductoId, Cantidad, Motivo) VALUES
(1, -10, 'Venta'),
(2, -4, 'Ajuste de inventario'),
(3, 10, 'Recepcion de mercadería'),
(4, -3, 'Ajuste de stock'),
(5, 6, 'Recepción de mercancía'),
(6, 1, 'Corrección de inventario'),
(7, -6, 'Ajuste por discrepancia');