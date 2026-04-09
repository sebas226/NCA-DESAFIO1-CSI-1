create database Desafio_Grupo4;
use Desafio_Grupo4;

create table Usuario(
id_usuario int auto_increment primary key,
nombre_usuario varchar(50) not null,
email varchar(150),
contraseña varchar(50) not null
);

CREATE TABLE Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_autor VARCHAR(50) NOT NULL
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
    id_prestamo INT PRIMARY KEY,
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
    FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE libro_fisico (
    id_libro INT PRIMARY KEY,
    ubicacion VARCHAR(100),
    estado VARCHAR(50),
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
