
-- =============================================
-- Script de creación de Base de Datos y Tabla
-- Base de Datos: ProductosDB
-- Motor: SQL Server (Express o superior)
-- =============================================

-- Paso 1: Crear la base de datos
CREATE DATABASE ProductosDB;
GO

-- Paso 2: Usar la base de datos
USE ProductosDB;
GO

-- Paso 3: Crear la tabla Productos
CREATE TABLE dbo.Productos (
    id INT NOT NULL PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category NVARCHAR(100) NOT NULL,
    description NVARCHAR(MAX) NOT NULL,
    fecha_insercion DATETIME NOT NULL DEFAULT GETDATE()
);
GO
