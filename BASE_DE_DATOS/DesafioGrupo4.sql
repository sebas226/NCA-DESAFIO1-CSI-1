DROP DATABASE IF EXISTS Desafio_Grupo4;
CREATE DATABASE Desafio_Grupo4;
USE Desafio_Grupo4;

-- =============================================================
-- Creación de tablas
-- =============================================================
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(150),
    contrasena VARCHAR(50) NOT NULL, -- Mantenido sin eñe
    telefono VARCHAR(9) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

CREATE TABLE Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_autor VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    fecha_fallecimiento DATE,
    estilo_literario ENUM('Realismo mágico','Ciencia ficción','Fantasía',
		'Romance','Terror','Policial','Histórico','Poesía','Ensayo'),
    numero_libros INT DEFAULT 0,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE Libro (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    cantidad_total INT NOT NULL,
    cantidad_disponible INT NOT NULL,
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES Autor (id_autor) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Prestamo (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    fecha_prestamo DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_devolucion DATETIME,
    id_usuario INT,
    id_libro INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libro (id_libro)
);

CREATE TABLE Empleado (
    id_usuario INT PRIMARY KEY, -- Sin auto_increment, hereda de Usuario
    salario DECIMAL(6, 2) NOT NULL,
    tiempo_trabajado DATETIME NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Cliente (
    id_usuario INT PRIMARY KEY, -- Corregido: Se quitó el AUTO_INCREMENT
    numero_socio VARCHAR(20) UNIQUE,
    fecha_registro DATE,
    limite_prestamos INT DEFAULT 3,
    multas DECIMAL(6,2) DEFAULT 0,
    FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE libro_fisico (
    id_libro INT PRIMARY KEY,
    ubicacion VARCHAR(100),
    estado ENUM('Disponible','No Disponible'),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE libro_digital (
    id_libro INT PRIMARY KEY,
    formato VARCHAR(20),
    tamaño_archivo INT,
    enlace_descarga VARCHAR(255),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro) ON DELETE CASCADE ON UPDATE CASCADE
);

-- =============================================================
-- INSERTS (Datos Corregidos)
-- =============================================================

-- USUARIOS (IDs del 1 al 12 automáticamente)
INSERT INTO Usuario (nombre_usuario, email, contrasena, telefono, direccion) -- Corregido a contrasena
VALUES
('juan123','juan@email.com','1234','666111222','Calle A'),
('maria456','maria@email.com','abcd','333222111','Calle B'),
('pedro77','pedro@email.com','pass1','600111222','Calle C'),
('lucia88','lucia@email.com','pass2','611222333','Calle D'),
('ana99','ana@email.com','pass3','622333444','Calle E'),
('david10','david@email.com','pass4','633444555','Calle F'),
('sofia11','sofia@email.com','pass5','644555666','Calle G'),
('carlos22','carlos@email.com','pass6','655666777','Calle H'),
('elena33','elena@email.com','pass7','666777888','Calle I'),
('miguel44','miguel@email.com','pass8','677888999','Calle J'),
('laura55','laura@email.com','pass9','688999000','Calle K'),
('andres66','andres@email.com','pass10','699000111','Calle L');

-- AUTORES (Agregado número de libros estimado para que funcionen las consultas)
INSERT INTO Autor (nombre_autor, fecha_nacimiento, fecha_fallecimiento, estilo_literario, numero_libros)
VALUES
('Gabriel García Márquez','1927-03-06','2014-04-17','Realismo mágico', 2),
('J.K. Rowling','1965-07-31',NULL,'Fantasía', 1),
('Stephen King','1947-09-21',NULL,'Terror', 2),
('Agatha Christie','1890-09-15','1976-01-12','Policial', 1),
('George Orwell','1903-06-25','1950-01-21','Histórico', 1),
('Isaac Asimov','1920-01-02','1992-04-06','Ciencia ficción', 1),
('Jane Austen','1775-12-16','1817-07-18','Romance', 2),
('H.P. Lovecraft','1890-08-20','1937-03-15','Terror', 1),
('Arthur Conan Doyle','1859-05-22','1930-07-07','Policial', 1),
('Julio Verne','1828-02-08','1905-03-24','Ciencia ficción', 1),
('Pablo Neruda','1904-07-12','1973-09-23','Poesía', 1),
('Dan Brown','1964-06-22',NULL,'Ensayo', 1);

-- LIBROS
INSERT INTO Libro (titulo, genero, cantidad_total, cantidad_disponible, id_autor)
VALUES
('Cien años de soledad','Novela',10,10,1),
('Harry Potter 1','Fantasía',15,15,2),
('It','Terror',8,8,3),
('Orient Express','Policial',12,12,4),
('1984','Distopía',20,20,5),
('Fundación','Ciencia ficción',10,10,6),
('Orgullo y prejuicio','Romance',14,14,7),
('El coronel no tiene quien le escriba','Novela',10,10,1),
('Misery','Terror',9,9,3),
('Emma','Romance',11,11,7),
('La llamada de Cthulhu','Terror',7,7,8),
('Sherlock Holmes','Policial',10,10,9),
('Viaje al centro de la Tierra','Aventura',12,12,10),
('Veinte poemas de amor','Poesía',9,9,11),
('El código Da Vinci','Misterio',15,15,12);

-- CLIENTES (Se añadió la columna id_usuario mapeando los IDs del 1 al 12)
INSERT INTO Cliente (id_usuario, numero_socio, fecha_registro, limite_prestamos, multas)
VALUES
(1,'SOC-1001','2026-01-10',3,0),
(2,'SOC-1002','2026-01-12',4,1.5),
(3,'SOC-1003','2026-02-01',2,0),
(4,'SOC-1004','2026-02-15',3,5),
(5,'SOC-1005','2026-03-01',3,0),
(6,'SOC-1006','2026-03-10',5,0),
(7,'SOC-1007','2026-03-15',3,2.75),
(8,'SOC-1008','2026-03-20',3,0),
(9,'SOC-1009','2026-03-25',4,1),
(10,'SOC-1010','2026-04-01',2,0),
(11,'SOC-1011','2026-04-05',3,0),
(12,'SOC-1012','2026-04-10',5,3.5);

-- EMPLEADOS
INSERT INTO Empleado (id_usuario, salario, tiempo_trabajado)
VALUES
(1,1200.50,'2024-01-01 08:00:00'),
(2,1350.00,'2024-02-15 09:30:00'),
(3,1500.75,'2024-03-10 08:15:00'),
(4,1100.00,'2024-04-05 10:00:00'),
(5,1600.00,'2024-05-01 09:00:00'),
(6,1400.00,'2024-06-01 08:00:00'),
(7,1550.00,'2024-07-01 09:00:00'),
(8,1300.00,'2024-08-01 10:00:00');

-- LIBROS FÍSICOS
INSERT INTO libro_fisico (id_libro, ubicacion, estado)
VALUES
(1,'A1','Disponible'),
(2,'A2','Disponible'),
(3,'B1','No Disponible'),
(4,'B2','Disponible'),
(5,'C1','Disponible'),
(6,'C2','Disponible'),
(7,'D1','Disponible'),
(8,'D2','Disponible'),
(9,'E1','No Disponible'),
(10,'E2','Disponible'),
(11,'F1','Disponible'),
(12,'F2','Disponible'),
(13,'G1','No Disponible'),
(14,'G2','Disponible'),
(15,'H1','Disponible');

-- LIBROS DIGITALES
INSERT INTO libro_digital (id_libro, formato, tamaño_archivo, enlace_descarga)
VALUES
(1,'PDF',5000,'http://libros.com/1.pdf'),
(2,'EPUB',3000,'http://libros.com/2.epub'),
(3,'PDF',7000,'http://libros.com/3.pdf'),
(4,'EPUB',4500,'http://libros.com/4.epub'),
(5,'PDF',8000,'http://libros.com/5.pdf'),
(6,'PDF',6000,'http://libros.com/6.pdf'),
(7,'EPUB',3500,'http://libros.com/7.epub'),
(8,'PDF',5500,'http://libros.com/8.pdf'),
(9,'EPUB',3200,'http://libros.com/9.epub'),
(10,'PDF',7200,'http://libros.com/10.pdf'),
(11,'EPUB',4100,'http://libros.com/11.epub'),
(12,'PDF',8300,'http://libros.com/12.pdf');

-- PRÉSTAMOS
INSERT INTO Prestamo (fecha_prestamo, fecha_devolucion, id_usuario, id_libro)
VALUES
('2026-04-01 10:00:00','2026-04-10 12:00:00',1,1),
('2026-04-02 11:30:00','2026-04-12 18:00:00',2,2),
('2026-04-03 09:15:00','2026-04-13 10:00:00',3,3),
('2026-04-04 14:00:00','2026-04-14 16:30:00',4,4),
('2026-04-05 16:00:00',NULL,5,5),
('2026-04-06 12:00:00','2026-04-16 13:00:00',1,2),
('2026-04-07 18:00:00',NULL,2,3),
('2026-04-08 09:00:00','2026-04-18 10:00:00',6,6),
('2026-04-09 10:00:00','2026-04-19 12:00:00',7,7),
('2026-04-10 11:00:00',NULL,8,8),
('2026-04-11 12:00:00','2026-04-21 13:00:00',9,9),
('2026-04-12 13:00:00',NULL,10,10),
('2026-04-13 14:00:00','2026-04-23 15:00:00',11,11),
('2026-04-11 12:00:00','2026-04-21 13:00:00',9,9),
('2026-04-12 13:00:00',NULL,10,10),
('2026-04-13 14:00:00','2026-04-23 15:00:00',11,11);
-- =========================
-- CONSULTAS
-- =========================
use Desafio_Grupo4;
-- 1	
SELECT *
FROM Usuario;
-- 2
SELECT nombre_usuario, email, telefono 
FROM Usuario;
-- 3
SELECT titulo,genero, cantidad_disponible
FROM Libro
WHERE cantidad_disponible > 0;
-- 4
SELECT l.titulo, l.genero, a.nombre_autor
FROM Libro l
JOIN Autor a ON l.id_autor = a.id_autor;
-- 5
SELECT u.nombre_usuario, l.titulo, p.fecha_prestamo
FROM Prestamo p
JOIN Usuario u ON p.id_usuario = u.id_usuario
JOIN Libro l ON p.id_libro = l.id_libro;
-- Subconsultas
-- 1
SELECT titulo,genero
FROM Libro
WHERE id_autor = (
    SELECT id_autor
    FROM Autor
    WHERE nombre_autor = 'Stephen King'
);
-- 2
SELECT nombre_usuario, telefono, direccion
FROM Usuario
WHERE id_usuario IN (
    SELECT id_usuario
    FROM Prestamo
);
-- 3
SELECT nombre_usuario,telefono, direccion
FROM Usuario
WHERE id_usuario NOT IN (
    SELECT id_usuario
    FROM Prestamo
);
-- 4
SELECT titulo
FROM Libro
WHERE id_libro IN (
    SELECT id_libro
    FROM Prestamo
    WHERE fecha_devolucion IS NULL
);
-- 5
SELECT numero_socio,fecha_registro, multas
FROM Cliente
WHERE multas > (
    SELECT AVG(multas)
    FROM Cliente
);
-- 6
SELECT nombre_autor
FROM Autor
WHERE numero_libros = (
    SELECT MAX(numero_libros)
    FROM Autor
);
-- 7
SELECT titulo, genero, cantidad_disponible
FROM Libro
WHERE cantidad_disponible = (
    SELECT MAX(cantidad_disponible)
    FROM Libro
);

-- 8
SELECT id_usuario
FROM Prestamo
GROUP BY id_usuario
HAVING COUNT(*) > 1;

-- 9
SELECT titulo
FROM Libro
WHERE id_libro NOT IN (
    SELECT id_libro
    FROM Prestamo
);
-- 10
SELECT nombre_usuario, email, direccion
FROM Usuario
WHERE id_usuario IN (
    SELECT p.id_usuario
    FROM Prestamo p
    JOIN Libro l ON p.id_libro = l.id_libro
    WHERE l.genero = 'Terror'
);

-- ==================================================================
-- CREACION DE USUARIOS Y PERMISOS
-- ==================================================================

CREATE USER administrador@localhost identified BY "1234";
CREATE USER david@localhost IDENTIFIED BY "empleado1234";
CREATE USER paco@"%" IDENTIFIED BY "empleado1234";
CREATE USER pedro@192.168.1.10 IDENTIFIED BY "empleado1234";
CREATE USER carlos@"192.168.1.%" IDENTIFIED BY "empleado1234";

FLUSH PRIVILEGES;
-- Todos los permisos al Administrador
GRANT ALL PRIVILEGES ON *.* TO administrador@localhost WITH GRANT OPTION;
-- David y Paco pueden hacer select, insert, update y delete
GRANT SELECT, INSERT, UPDATE, DELETE ON Desafio_Grupo4.* TO david@localhost;
GRANT SELECT, INSERT, UPDATE, DELETE ON Desafio_Grupo4.* TO paco@"%";
-- Pedro y carlos solo pueden hacer select en las tablas puestas
GRANT SELECT ON Desafio_Grupo4.Libro TO pedro@192.168.1.10;
GRANT SELECT ON Desafio_Grupo4.Autor TO pedro@192.168.1.10;
GRANT SELECT ON Desafio_Grupo4.Prestamo TO pedro@192.168.1.10;
GRANT SELECT ON Desafio_Grupo4.libro_fisico TO pedro@192.168.1.10;
GRANT SELECT ON Desafio_Grupo4.libro_digital TO pedro@192.168.1.10;

GRANT SELECT ON Desafio_Grupo4.Libro TO carlos@"192.168.1.%";
GRANT SELECT ON Desafio_Grupo4.Autor TO carlos@"192.168.1.%";
GRANT SELECT ON Desafio_Grupo4.Prestamo TO carlos@"192.168.1.%";
GRANT SELECT ON Desafio_Grupo4.libro_fisico TO carlos@"192.168.1.%";
GRANT SELECT ON Desafio_Grupo4.libro_digital TO carlos@"192.168.1.%";
-- Aplicamos los nuevos privilegios en el sistema
FLUSH PRIVILEGES;

-- ==================================================================
-- CREACION DE VISTAS
-- ==================================================================
-- Crea una vista que enseñe el id del libro, su título y el nombre del autor
CREATE VIEW vista_LIBROS_AUTORES AS
	SELECT l.id_libro AS ID, l.titulo AS TITULO, a.nombre_autor AS AUTOR
    FROM Libro l
    JOIN Autor a ON l.id_autor = a.id_autor;

-- CONSULTA SOBRE LA PROPIA VISTA
SELECT * FROM vista_LIBROS_AUTORES
WHERE ID > 11;

-- Vista para RRHH: Muestra datos confidenciales (Salario) haciendo un JOIN con Empleado
CREATE VIEW vista_usuarios_rrhh AS
	SELECT u.id_usuario AS id, u.nombre_usuario AS nombre, u.direccion, e.salario, u.telefono AS tfno
	FROM Usuario u
	JOIN Empleado e ON u.id_usuario = e.id_usuario;
    
-- Vista Pública: Solo muestra datos básicos para la gestión general de la biblioteca
CREATE VIEW vista_usuarios_publica AS
	SELECT u.id_usuario AS id, u.nombre_usuario AS nombre, u.email
	FROM Usuario u;

-- En tu base de datos no hay "precio ni peso", calcularemos el total de multas acumuladas por cliente en los préstamos
CREATE VIEW VISTA_TOTAL_MULTAS_CLIENTE(ID_CLIENTE, NOMBRE_CLIENTE, TOTAL_MULTAS) AS
	SELECT u.id_usuario, u.nombre_usuario, SUM(c.multas)
	FROM Usuario u 
    JOIN Cliente c ON u.id_usuario = c.id_usuario
    GROUP BY u.id_usuario, u.nombre_usuario;
    
-- Segunda forma de definir la vista (con alias directamente en el SELECT)
CREATE VIEW VISTA_TOTAL_MULTAS_CLIENTE2 AS
	SELECT u.id_usuario AS ID_CLIENTE, u.nombre_usuario AS NOMBRE_CLIENTE, SUM(c.multas) AS TOTAL_MULTAS
	FROM Usuario u 
    JOIN Cliente c ON u.id_usuario = c.id_usuario
    GROUP BY u.id_usuario, u.nombre_usuario;
    
-- Consultas de prueba sobre las vistas agregadas
SELECT * FROM VISTA_TOTAL_MULTAS_CLIENTE;
SELECT * FROM VISTA_TOTAL_MULTAS_CLIENTE2;
SELECT TOTAL_MULTAS FROM VISTA_TOTAL_MULTAS_CLIENTE;

-- Vista base: Trae todos los datos esenciales de los préstamos
CREATE VIEW VISTA_PRESTAMOS_TODOS AS
	SELECT id_libro AS LIBRO, fecha_prestamo AS FECHA_PRESTADO, fecha_devolucion AS FECHA_DEVUELTO
    FROM Prestamo;
   
SELECT * FROM VISTA_PRESTAMOS_TODOS;
   
CREATE VIEW VISTA_PRESTAMOS_SINFECHADEVUELTO AS
	SELECT LIBRO, FECHA_PRESTADO
    FROM VISTA_PRESTAMOS_TODOS
    WHERE FECHA_DEVUELTO IS NULL;

SELECT * FROM VISTA_PRESTAMOS_SINFECHADEVUELTO;

-- ==================================================================
-- CREACION DE INDICES
-- ==================================================================

--  Indice UNIQUE fuera de la tabla para asegurar que no se repitan correos electrónicos
CREATE UNIQUE INDEX idx_usuario_email 
ON Usuario(email);

-- Indice UNIQUE usando ALTER TABLE sobre el teléfono de la tabla Usuario
ALTER TABLE Usuario
ADD UNIQUE idx_usuario_telefono(telefono);

-- Verificamos que se han añadido correctamente
SHOW INDEX FROM Usuario;

-- Modificamos la estructura de tu tabla 'Libro' para añadirle una columna 'descripcion' (TEXT) 
-- y así poder hacer búsquedas potentes, simulando tus ejemplos de magia e historia.
ALTER TABLE Libro ADD COLUMN descripcion TEXT AFTER genero;

-- Insertamos un par de descripciones para probar los filtros de búsqueda
UPDATE Libro SET descripcion = 'Novela histórica de realismo mágico que narra la historia de la familia Buendía en el pueblo de Macondo.' WHERE id_libro = 1;
UPDATE Libro SET descripcion = 'Historia de misterio policial y crímenes a bordo de un tren clásico.' WHERE id_libro = 4;
UPDATE Libro SET descripcion = 'Fantasía oscura y terror cósmico con monstruos marinos antiguos.' WHERE id_libro = 11;

-- CREACIÓN DEL ÍNDICE FULLTEXT sobre las columnas de texto (titulo y descripcion)
CREATE FULLTEXT INDEX idx_libro_titulo_descripcion
ON Libro(titulo, descripcion);

-- CONSULTA AVANZADA SOBRE EL ÍNDICE FULLTEXT
-- Busca registros que contengan las palabras "historia" o "mágico" ordenándolos por relevancia
SELECT id_libro, titulo, genero, descripcion
FROM Libro
WHERE MATCH(titulo, descripcion) AGAINST ('historia mágico');


-- =============================================================================================================
-- 4. ÍNDICES SECUNDARIOS / NO CLUSTERIZADOS (Para acelerar búsquedas WHERE de valores repetibles)
-- =============================================================================================================

-- Ejemplo 1: Crear un índice normal sobre el género del libro para acelerar las búsquedas por categoría
CREATE INDEX idx_libro_genero
ON Libro(genero);

-- Consulta optimizada gracias al índice
SELECT * FROM Libro WHERE genero LIKE 'Terror';

-- Ejemplo 2: Índice Compuesto (Sobre dos columnas a la vez: cantidad_total y cantidad_disponible)
-- Nota de buena práctica: Al crear este índice compuesto, el índice individual sobre estas columnas se vuelve redundante
CREATE INDEX idx_libro_cantidades
ON Libro(cantidad_total, cantidad_disponible);

-- Consulta que aprovecha el índice compuesto (filtros combinados)
SELECT * FROM Libro 
WHERE cantidad_total > 10 OR cantidad_disponible < 5;

-- Ejemplo 3: Añadir índice no clusterizado usando ALTER TABLE sobre el formato de los libros digitales
ALTER TABLE libro_digital
ADD INDEX idx_digital_formato(formato);

-- Para borrar indices se haria de esta forma
-- DROP INDEX idx_usuario_telefono ON Usuario;



