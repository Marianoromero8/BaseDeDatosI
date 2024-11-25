CREATE TABLE Productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    stock INT NOT NULL CHECK (stock >= 0),
    precio DECIMAL(10, 2) NOT NULL
);
CREATE TABLE Clientes(
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(15),
    direccion VARCHAR(50),
    email VARCHAR(100) UNIQUE
);
CREATE TABLE Ordenes(
    orden_id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    cliente_id INT NOT NULL,
    cantidad INT NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    fecha DATETIME NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);