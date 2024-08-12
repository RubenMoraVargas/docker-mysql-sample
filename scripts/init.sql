-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS mydatabase;

-- Seleccionar la base de datos
USE mydatabase;

-- Crear las tablas si no existen
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Insertar datos si las tablas están vacías
INSERT INTO users (name, email)
SELECT 'John Doe', 'john@example.com'
WHERE NOT EXISTS (SELECT * FROM users);

INSERT INTO users (name, email)
SELECT 'Jane Smith', 'jane@example.com'
WHERE NOT EXISTS (SELECT * FROM users WHERE email = 'jane@example.com');

INSERT INTO products (name, price)
SELECT 'Laptop', 999.99
WHERE NOT EXISTS (SELECT * FROM products WHERE name = 'Laptop');

INSERT INTO products (name, price)
SELECT 'Phone', 499.99
WHERE NOT EXISTS (SELECT * FROM products WHERE name = 'Phone');
