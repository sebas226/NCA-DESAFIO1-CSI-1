create database Desafio_Grupo4;
-- drop database desafio_grupo4;
use Desafio_Grupo4;

create table Usuario(
id_usuario int auto_increment primary key,
nombre_usuario varchar(50) not null,
email varchar(150),
contraseña varchar(50) not null,
telefono varchar(9) not null,
direccion varchar(100) not null
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
    id_usuario INT PRIMARY KEY,
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


-- INSERT INTO ---------------------------------------------------------------


use Desafio_Grupo4;

-- USUARIOS
INSERT INTO Usuario (nombre_usuario, email, contraseña, telefono, direccion)
VALUES 
('juan123', 'juan@email.com', '1234','666111222', ' calle Giovanni' ),
('maria456', 'maria@email.com', 'abcd','333222111', 'calle Santo Angel');

-- AUTORES
INSERT INTO Autor (nombre_autor)
VALUES 
('Gabriel García Márquez'),
('J.K. Rowling');

-- LIBROS
INSERT INTO Libro (titulo, genero, cantidad_total, cantidad_disponible)
VALUES 
('Cien años de soledad', 'Novela', 10, 10),
('Harry Potter', 'Fantasía', 15, 15);

-- CLIENTES

 
-- EMPLEADO
INSERT INTO Empleado (id_usuario, salario, tiempo_trabajado)
VALUES 
(1,1200.50, '2024-01-01 08:00:00');

-- LIBRO FÍSICO
INSERT INTO libro_fisico (id_libro,ubicacion, estado)
VALUES 
(1, 'Estante A1', 'Disponible'),
(2, ' Estante B2', 'Disponible');

-- LIBRO DIGITAL
INSERT INTO libro_digital (id_libro, formato, tamaño_archivo, enlace_descarga)
VALUES 
(1, 'PDF', 5000, 'http://descargas.com/libro1.pdf'),
(2, 'EPUB', 3000, 'http://descargas.com/libro2.epub');

-- PRÉSTAMOS
INSERT INTO Prestamo (fecha_devolucion)
VALUES 
('2026-04-20 10:00:00'),
('2026-04-25 12:00:00');