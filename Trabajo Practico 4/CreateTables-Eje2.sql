CREATE TABLE Inventario (
    ProductoId INT AUTO_INCREMENT PRIMARY KEY,
    NombreProducto VARCHAR(100) NOT NULL,
    Cantidad INT NOT NULL CHECK (Cantidad >= 0),
    Precio DECIMAL(10,2) NOT NULL
);
CREATE TABLE HistorialInventario (
    HistorialId INT AUTO_INCREMENT PRIMARY KEY,
    ProductoId INT,
    FechaCambio DATETIME NOT NULL,
    Cambio INT NOT NULL, -- Puede ser positivo o negativo
    Motivo VARCHAR(255) NOT NULL,
    FOREIGN KEY (ProductoId) REFERENCES Inventario(ProductoId) ON DELETE CASCADE
);
CREATE TABLE CambiosInventario(
	ProductoId INT AUTO_INCREMENT PRIMARY KEY,
    Cantidad INT NOT NULL,
    Motivo VARCHAR(255) NOT NULL
);