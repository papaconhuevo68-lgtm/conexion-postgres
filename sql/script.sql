-- =====================================================
-- Script de creación de base de datos: tienda_db
-- Ejecutar con un usuario con permisos (ej. postgres)
-- =====================================================

-- 1) Crear la base de datos (ejecutar conectado a la BD "postgres")
-- Si ya existe, omite esta línea.
CREATE DATABASE tienda_db;

-- 2) Conectarse a la nueva base (en psql). En pgAdmin: abrir Query Tool sobre tienda_db
\c tienda_db

-- 3) Crear/borrar la tabla
DROP TABLE IF EXISTS productos;

CREATE TABLE productos (
    id          SERIAL PRIMARY KEY,
    nombre      VARCHAR(100)  NOT NULL,
    descripcion VARCHAR(255),
    precio      NUMERIC(10,2) NOT NULL CHECK (precio >= 0),
    imagen      VARCHAR(500)
);

-- 4) Insertar productos de prueba
INSERT INTO productos (nombre, descripcion, precio, imagen) VALUES
('Polo básico blanco',  'Polo de algodón manga corta, corte regular',  35.90, 'https://example.com/img/polo-blanco.jpg'),
('Jean slim azul',      'Jean elástico de corte slim, tono azul medio', 99.90, 'https://example.com/img/jean-slim.jpg'),
('Casaca de cuero',     'Casaca de cuero sintético con forro interior', 189.00,'https://example.com/img/casaca-cuero.jpg'),
('Vestido floral',      'Vestido midi con estampado floral, ligero',    79.50, 'https://example.com/img/vestido-floral.jpg'),
('Polera con capucha',  'Polera de friza con capucha y bolsillo canguro',89.90,'https://example.com/img/polera-capucha.jpg'),
('Short deportivo',     'Short liviano para running, secado rápido',    45.00, 'https://example.com/img/short-deportivo.jpg');

-- 5) Verificar
SELECT * FROM productos;
