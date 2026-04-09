create database Desafio_Grupo4;
use Desafio_Grupo4;

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
        ON DELETE CASCADE ON UPDATE CASCADE
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
create table Usuario(
id_usuario int auto_increment primary key,
nombre_usuario varchar(50) not null,
email varchar(150) 
	check (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') not null,
contraseña varchar(50) not null

);
CREATE TABLE empleado (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    salario DECIMAL(6 , 2 ) NOT NULL,
    tiempo_trabajado DATETIME NOT NULL,
    FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE cliente (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE
);