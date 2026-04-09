create database Desafio_Grupo4;
use Desafio_Grupo4;

create table Autor(
id_autor int auto_increment primary key,
nombre_autor varchar(50) not null

);
create table Libro(
id_libro int auto_increment primary key,
titulo varchar(100) not null,
genero varchar(50) not null,
cantidad_total int not null,
cantidad_disponible int not null

);
create table Prestamo(
id_prestamo int auto_increment primary key,
fecha_prestamo datetime default(current_date) not null,
fecha_devolucion datetime default(current_date) not null

);
create table Usuario(
id_usuario int auto_increment primary key,
nombre_usuario varchar(50) not null,
email varchar(150) 
	check (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') not null,
contraseña varchar(50) not null

);
create table empleado(
id_empleado int auto_increment primary key,
salario decimal(6,2) not null,
tiempo_trabajado datetime not null,
id_usuario int,
foreign key(id_usuario) references usuario(id_usuario)
on delete cascade
on update cascade

);
create table cliente(
id_cliente int auto_increment primary key,
fecha_prestamo datetime default(current_date) not null,
fecha_devolucion datetime default(current_date) not null,
id_usuario int,
foreign key(id_usuario) references usuario(id_usuario)
on delete cascade
on update cascade

);
