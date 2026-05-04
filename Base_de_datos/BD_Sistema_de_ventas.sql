-- =========================================
-- CREACIÓN DE BASE DE DATOS
-- =========================================

CREATE DATABASE tienda_ropa;

-- Conectarse a la base de datos tienda_ropa
-- Luego ejecutar el resto del script


-- =========================================
-- TABLA: CLIENTES
-- =========================================

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    ci_nit VARCHAR(20) NOT NULL,
    nombre_completo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20)
);


-- =========================================
-- TABLA: CATEGORIAS
-- =========================================

CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);


-- =========================================
-- TABLA: MARCAS
-- =========================================

CREATE TABLE marcas (
    id_marca SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);


-- =========================================
-- TABLA: PRODUCTOS
-- =========================================

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    talla VARCHAR(10),
    precio_venta NUMERIC(10,2) NOT NULL,
    stock INTEGER NOT NULL,
    
    id_marca INTEGER,
    id_categoria INTEGER,

    CONSTRAINT fk_marca
        FOREIGN KEY(id_marca)
        REFERENCES marcas(id_marca),

    CONSTRAINT fk_categoria
        FOREIGN KEY(id_categoria)
        REFERENCES categorias(id_categoria)
);


-- =========================================
-- TABLA: VENTAS
-- =========================================

CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    fecha_hora TIMESTAMP NOT NULL,
    total NUMERIC(10,2) NOT NULL,

    id_cliente INTEGER,

    CONSTRAINT fk_cliente
        FOREIGN KEY(id_cliente)
        REFERENCES clientes(id_cliente)
);


-- =========================================
-- TABLA: DETALLE_VENTAS
-- =========================================

CREATE TABLE detalle_ventas (
    id_detalles SERIAL PRIMARY KEY,

    id_venta INTEGER,
    id_producto INTEGER,

    cantidad INTEGER NOT NULL,
    precio_unitario NUMERIC(10,2) NOT NULL,
    subtotal NUMERIC(10,2) NOT NULL,

    CONSTRAINT fk_venta
        FOREIGN KEY(id_venta)
        REFERENCES ventas(id_venta),

    CONSTRAINT fk_producto
        FOREIGN KEY(id_producto)
        REFERENCES productos(id_producto)
);


-- =========================================
-- INSERTAR DATOS EN CLIENTES
-- =========================================

INSERT INTO clientes (ci_nit, nombre_completo, telefono)
VALUES
('1234567', 'Juan Perez', '77711111'),
('2345678', 'Maria Lopez', '77722222'),
('3456789', 'Carlos Mendoza', '77733333'),
('4567890', 'Ana Torres', '77744444'),
('5678901', 'Luis Fernandez', '77755555');


-- =========================================
-- INSERTAR DATOS EN CATEGORIAS
-- =========================================

INSERT INTO categorias (nombre)
VALUES
('Poleras'),
('Pantalones'),
('Zapatillas'),
('Chaquetas'),
('Accesorios');


-- =========================================
-- INSERTAR DATOS EN MARCAS
-- =========================================

INSERT INTO marcas (nombre)
VALUES
('Nike'),
('Adidas'),
('Puma'),
('Reebok'),
('Under Armour');


-- =========================================
-- INSERTAR DATOS EN PRODUCTOS
-- =========================================

INSERT INTO productos
(nombre, descripcion, talla, precio_venta, stock, id_marca, id_categoria)
VALUES
('Polera Nike Sport', 'Polera deportiva color negro', 'M', 120.50, 15, 1, 1),

('Pantalon Adidas Urban', 'Pantalon casual azul', 'L', 180.00, 10, 2, 2),

('Zapatilla Puma Run', 'Zapatilla para correr', '42', 350.99, 8, 3, 3),

('Chaqueta Reebok Winter', 'Chaqueta impermeable', 'XL', 420.00, 5, 4, 4),

('Gorra Under Armour', 'Gorra deportiva ajustable', 'U', 90.00, 20, 5, 5);


-- =========================================
-- INSERTAR DATOS EN VENTAS
-- =========================================

INSERT INTO ventas (fecha_hora, total, id_cliente)
VALUES
('2026-05-01 10:30:00', 241.00, 1),
('2026-05-01 12:15:00', 350.99, 2),
('2026-05-02 09:45:00', 510.00, 3),
('2026-05-02 14:20:00', 90.00, 4),
('2026-05-03 18:10:00', 180.00, 5);


-- =========================================
-- INSERTAR DATOS EN DETALLE_VENTAS
-- =========================================

INSERT INTO detalle_ventas
(id_venta, id_producto, cantidad, precio_unitario, subtotal)
VALUES
(1, 1, 2, 120.50, 241.00),

(2, 3, 1, 350.99, 350.99),

(3, 4, 1, 420.00, 420.00),

(3, 5, 1, 90.00, 90.00),

(4, 5, 1, 90.00, 90.00),

(5, 2, 1, 180.00, 180.00);


-- =========================================
-- CONSULTAS DE PRUEBA
-- =========================================

-- Ver clientes
SELECT * FROM clientes;

-- Ver productos
SELECT * FROM productos;

-- Ver ventas con clientes
SELECT 
    v.id_venta,
    c.nombre_completo,
    v.fecha_hora,
    v.total
FROM ventas v
INNER JOIN clientes c
ON v.id_cliente = c.id_cliente;

-- Ver detalle de ventas
SELECT
    dv.id_detalles,
    p.nombre AS producto,
    dv.cantidad,
    dv.precio_unitario,
    dv.subtotal
FROM detalle_ventas dv
INNER JOIN productos p
ON dv.id_producto = p.id_producto;