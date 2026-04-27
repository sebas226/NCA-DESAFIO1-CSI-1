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