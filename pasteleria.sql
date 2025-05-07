CREATE DABATABASE pasteleria;
USE pasteleria;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    contraseña_hash VARCHAR(255) NOT NULL,
    rol ENUM('administrador', 'operador') NOT NULL
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    fecha_entrega DATE NOT NULL,
    estado ENUM('pendiente', 'en_proceso', 'entregado', 'cancelado') NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE bitacora_backup (
    id_backup INT AUTO_INCREMENT PRIMARY KEY,
    fecha_backup DATETIME NOT NULL,
    ruta_archivo VARCHAR(255) NOT NULL,
);