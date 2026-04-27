create database Desafio_Grupo4;
-- drop database desafio_grupo4;
use Desafio_Grupo4;

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(150),
    contraseña VARCHAR(50) NOT NULL,
    telefono VARCHAR(9) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);
CREATE TABLE Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_autor VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    fecha_fallecimiento DATE,
    estilo_literario ENUM('Realismo mágico','Ciencia ficción','Fantasía',
		'Romance','Terror','Policial','Histórico','Poesía','Ensayo') ,
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
    FOREIGN KEY (id_autor)
        REFERENCES Autor (id_autor)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
CREATE TABLE Prestamo (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    fecha_prestamo DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_devolucion DATETIME,
    id_usuario INT,
    id_libro INT,
    FOREIGN KEY (id_usuario)
        REFERENCES Usuario (id_usuario),
    FOREIGN KEY (id_libro)
        REFERENCES Libro (id_libro)
);
CREATE TABLE Empleado (
    id_usuario INT PRIMARY KEY,
    salario DECIMAL(6, 2) NOT NULL,
    tiempo_trabajado DATETIME NOT NULL,
    FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Cliente (
    id_usuario INT PRIMARY KEY auto_increment,
    numero_socio VARCHAR(20) UNIQUE,
    fecha_registro DATE,
    limite_prestamos INT DEFAULT 3,
    multas DECIMAL(6,2) DEFAULT 0,
    FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE libro_fisico (
    id_libro INT PRIMARY KEY,
    ubicacion VARCHAR(100),
    estado ENUM('Disponible','No Disponible'),
    FOREIGN KEY (id_libro)
        REFERENCES Libro(id_libro)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
CREATE TABLE libro_digital (
    id_libro INT PRIMARY KEY,
    formato VARCHAR(20),
    tamaño_archivo INT,
    enlace_descarga VARCHAR(255),
    FOREIGN KEY (id_libro)
        REFERENCES Libro(id_libro)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- INSERTS
-- =========================
-- USUARIOS
INSERT INTO Usuario (nombre_usuario, email, contraseña, telefono, direccion)
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

-- AUTORES
INSERT INTO Autor (nombre_autor, fecha_nacimiento, fecha_fallecimiento, estilo_literario)
VALUES
('Gabriel García Márquez','1927-03-06','2014-04-17','Realismo mágico'),
('J.K. Rowling','1965-07-31',NULL,'Fantasía'),
('Stephen King','1947-09-21',NULL,'Terror'),
('Agatha Christie','1890-09-15','1976-01-12','Policial'),
('George Orwell','1903-06-25','1950-01-21','Histórico'),
('Isaac Asimov','1920-01-02','1992-04-06','Ciencia ficción'),
('Jane Austen','1775-12-16','1817-07-18','Romance'),
('H.P. Lovecraft','1890-08-20','1937-03-15','Terror'),
('Arthur Conan Doyle','1859-05-22','1930-07-07','Policial'),
('Julio Verne','1828-02-08','1905-03-24','Ciencia ficción'),
('Pablo Neruda','1904-07-12','1973-09-23','Poesía'),
('Dan Brown','1964-06-22',NULL,'Ensayo');

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

-- CLIENTES
INSERT INTO Cliente (numero_socio, fecha_registro, limite_prestamos, multas)
VALUES
('SOC-1001','2026-01-10',3,0),
('SOC-1002','2026-01-12',4,1.5),
('SOC-1003','2026-02-01',2,0),
('SOC-1004','2026-02-15',3,5),
('SOC-1005','2026-03-01',3,0),
('SOC-1006','2026-03-10',5,0),
('SOC-1007','2026-03-15',3,2.75),
('SOC-1008','2026-03-20',3,0),
('SOC-1009','2026-03-25',4,1),
('SOC-1010','2026-04-01',2,0),
('SOC-1011','2026-04-05',3,0),
('SOC-1012','2026-04-10',5,3.5);

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