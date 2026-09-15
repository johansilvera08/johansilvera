-- ================================================
-- PROYECTO: PawCare
-- Base de datos, tabla, procedimientos y datos
-- ================================================

-- 1. Crear base de datos
CREATE DATABASE PawCareDB;
GO

USE PawCareDB;
GO

-- 2. Crear tabla Mascotas
CREATE TABLE Mascotas
(
    Id              INT IDENTITY(1,1) PRIMARY KEY,
    NombreMascota   VARCHAR(100)  NOT NULL,
    NombreDueno     VARCHAR(100)  NOT NULL,
    Tipo            VARCHAR(20)   NOT NULL,
    Edad            INT           NOT NULL,
    Telefono        VARCHAR(9)    NOT NULL,
    Observaciones   VARCHAR(255)  NULL
);
GO

-- 3. Procedimiento para listar todas las mascotas
CREATE PROCEDURE spListarMascotas
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, NombreMascota, NombreDueno, Tipo, Edad, Telefono, Observaciones
    FROM Mascotas
    ORDER BY Id DESC;
END
GO

-- 4. Procedimiento para insertar una nueva mascota
CREATE PROCEDURE spInsertarMascota
    @NombreMascota  VARCHAR(100),
    @NombreDueno    VARCHAR(100),
    @Tipo           VARCHAR(20),
    @Edad           INT,
    @Telefono       VARCHAR(9),
    @Observaciones  VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Mascotas (NombreMascota, NombreDueno, Tipo, Edad, Telefono, Observaciones)
    VALUES (@NombreMascota, @NombreDueno, @Tipo, @Edad, @Telefono, @Observaciones);
END
GO

-- 5. Insertar datos de ejemplo (adaptados del listado)
INSERT INTO Mascotas (NombreMascota, NombreDueno, Tipo, Edad, Telefono, Observaciones) VALUES
('Firulais',  'Quispe Mamani, Luis Alberto',        'Perro', 3, '984512376', 'Vacunado'),
('Michi',     'Lopez Salazar, María Fernanda',      'Gato',  2, '954728361', 'Esterilizada'),
('Rocky',     'Chávez Huamán, Carlos Eduardo',      'Perro', 5, '987456321', 'Alérgico'),
('Luna',      'Rojas Palomino, Rosa Elena',         'Gato',  1, '961234587', 'Cachorra'),
('Max',       'Gonzales Quispe, José Manuel',       'Perro', 4, '999321457', 'Vacunado'),
('Nina',      'Flores Rivas, Ana Lucía',            'Gato',  6, '912345678', 'Revisión anual'),
('Toby',      'Vargas Cárdenas, Diego Andrés',      'Perro', 7, '987654123', 'Cirugía previa'),
('Coco',      'Ortega Ramírez, Fiorella Beatriz',   'Otro',  2, '956321789', 'Loro'),
('Boby',      'Martínez Espinoza, Jorge Luis',      'Perro', 3, '974563218', 'Vacunado'),
('Pelusa',    'Reyes Tello, Camila Sofía',          'Gato',  4, '931245678', 'Esterilizada'),
('Simba',     'Medina Aguirre, Pedro Pablo',        'Gato',  3, '982345611', 'Juguetón'),
('Dulce',     'Salinas Arce, Luciana Andrea',       'Perro', 2, '987612345', 'Vacunada'),
('Thor',      'Paredes Ramos, Sergio Daniel',       'Perro', 6, '922345678', 'Fuerte'),
('Kitty',     'Mendoza Olivares, Valeria Antonella','Gato',  1, '986754321', 'Cachorra'),
('Rex',       'Vera Castillo, Alonso Javier',       'Perro', 8, '912345879', 'Mayor'),
('Luna',      'Zamora León, Natalia Estefanía',     'Gato',  3, '923456712', 'Tranquila'),
('Chispita',  'Campos Cueva, Héctor Germán',        'Perro', 4, '987341256', 'Juguetona'),
('Mishi',     'Delgado Cárdenas, Milagros Rocío',   'Gato',  5, '954312867', 'Vacunada'),
('Bruno',     'Galvez Torres, Rodrigo Esteban',     'Perro', 2, '976541237', 'Cachorro'),
('Nala',      'Paz Vargas, Diana Carolina',         'Gato',  4, '945672318', 'Esterilizada'),
('Zeus',      'Ruiz Mendoza, Oscar Iván',           'Perro', 9, '913457821', 'Mayor'),
('Milo',      'Ramírez Pérez, Katherine Milena',    'Gato',  2, '991234876', 'Juguetón'),
('Rocco',     'Torres Rojas, Mauricio Leonel',      'Perro', 5, '987123654', 'Alérgico'),
('Luna',      'Morales Díaz, Andrea Patricia',      'Gato',  3, '944556677', 'Tranquila'),
('Spike',     'Navarro Espinoza, Bruno Alejandro',  'Perro', 4, '965432178', 'Vacunado'),
('Cleo',      'Gómez Nieto, Emily Alessandra',      'Gato',  1, '952147896', 'Cachorra'),
('Duque',     'Salvador Peña, Ignacio Rafael',      'Perro', 6, '978645321', 'Fuerte'),
('Peluchín',  'Castro Bravo, Tatiana Lizeth',       'Otro',  2, '919283746', 'Conejo');
GO

-- 6. Verificar
SELECT * FROM Mascotas;
GO

EXEC spListarMascotas;
GO