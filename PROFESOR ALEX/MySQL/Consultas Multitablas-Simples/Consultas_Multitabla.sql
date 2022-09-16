CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;

CREATE TABLE departamento (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE UNSIGNED NOT NULL,
  gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  codigo_departamento INT UNSIGNED,
  edad int,
  correo VARCHAR(80),
  telefono VARCHAR(15),
  salario integer,
  genero VARCHAR(1),
  ciudad_residencia VARCHAR(100),
  FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1, 36, "aaron@gmail.com", 31388540, 25000,"M", "San Gil");
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2, 36, "adela@gmail.com", 31188540, 13000, "F", "Ocamonte");
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3,80, "Adolfo@gmail.com", 31288540, 15000,"M", "Curiti");
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4, 12, "adrian@gmail.com", 3138889,31500,"M", "Barichara");
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5, 49, "marcos@gmail.com", 314775522, 22600,"M", "Charala");
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1, 36, "maria@gmail.com", 31588540, 18000, "F", "San Gil");
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2, 71, "pilar@gmail.com", 31688540, 33000, "F", "Curiti");
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3, 22, "pepe@gmail.com", 31788540, 17500,"M", "Villanueva");
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2, 28, "juan@gmail.com", 31888540, 27000,"M", "Ocamonte");
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5, 56, "diego@gmail.com", 31988540, 29000,"M", "Villanueva");
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1, 63, "marta@gmail.com", 3208740, 35200, "F", "Curiti");
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL, 31, "irene@gmail.com", 31010540, 30000, "F", "Pinchote");
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL, 40, "juan@gmail.com", 32199540, 31500,"M", "Charala");

#Ejercicio1
Select CONCAT(empleado.nombre, ' ', empleado.apellido1) as nombre_empleado,
departamento.nombre,
departamento.codigo,
departamento.presupuesto,
departamento.gastos
FROM empleado
left JOIN Departamento ON empleado.codigo_departamento = departamento.codigo;

#Ejercicio2
Select CONCAT(empleado.nombre, ' ', empleado.apellido1) as nombre_empleado,
departamento.nombre,
departamento.codigo,
departamento.presupuesto,
departamento.gastos
FROM empleado
left JOIN Departamento ON empleado.codigo_departamento = departamento.codigo
ORDER BY departamento.nombre ASC , nombre_empleado asc;

#Ejercicio3
select departamento.codigo, departamento.nombre
from empleado
inner JOIN Departamento ON empleado.codigo_departamento = departamento.codigo;

#Ejercicio4
select departamento.codigo, 
departamento.nombre, 
(presupuesto-gastos) as presupuesto_actual
from empleado
inner join Departamento ON empleado.codigo_departamento = departamento.codigo;

#Ejercicio5
select departamento.nombre
from empleado
inner join Departamento ON empleado.codigo_departamento = departamento.codigo
where empleado.nif="38382980M";

#Ejercicio6
select departamento.nombre
from empleado
inner join Departamento ON empleado.codigo_departamento = departamento.codigo
where empleado.nombre="Pepe" and empleado.apellido1="Ruiz" and empleado.apellido2="Santana";

#Ejercicio7
select *
from empleado
inner join Departamento ON empleado.codigo_departamento = departamento.codigo
where Departamento.nombre="I+D" order by empleado.nombre asc;

#Ejercicio8
select *
from empleado
inner join Departamento ON empleado.codigo_departamento = departamento.codigo
where Departamento.nombre in ("Sistemas", "Contabilidad", "I+D")
order by empleado.nombre asc;

#Ejercicio9
select empleado.nombre
from empleado
inner join Departamento ON empleado.codigo_departamento = departamento.codigo
where Departamento.presupuesto not between 100000 and 200000;

#Ejercicio10
select departamento.nombre
from empleado
inner join Departamento ON empleado.codigo_departamento = departamento.codigo
where empleado.apellido2 is null;

#Ejercicio11
select empleado.nombre, departamento.nombre
from empleado
left join Departamento ON empleado.codigo_departamento = departamento.codigo;

#Ejercicio12
select empleado.nombre, departamento.nombre
from empleado
left join Departamento ON empleado.codigo_departamento = departamento.codigo
where departamento.nombre is null;

#Ejercicio13
select departamento.nombre
from departamento
left join empleado ON empleado.codigo_departamento = departamento.codigo
where empleado.nombre is null;

#Ejercicio14
SELECT CONCAT(empleado.apellido1,' ' , if(empleado.apellido2<>'' , empleado.apellido2, ' '), ' ',empleado.nombre)nombre_completo, departamento.nombre as nombre_departamento
FROM departamento
     left JOIN empleado
ON  empleado.codigo_departamento = departamento.codigo
union
SELECT CONCAT(empleado.apellido1,' ' , if(empleado.apellido2<>'' , empleado.apellido2, ' '), ' ',empleado.nombre)nombre_completo, departamento.nombre as nombre_departamento
FROM empleado
     left JOIN departamento 
ON  empleado.codigo_departamento = departamento.codigo order by nombre_departamento;

#Ejercicio15
SELECT CONCAT(empleado.apellido1,' ' , if(empleado.apellido2<>'' , empleado.apellido2, ' '), ' ',empleado.nombre) as nombre_completo, departamento.nombre as nombre_departamento
FROM empleado
     left JOIN departamento 
ON  empleado.codigo_departamento = departamento.codigo
where departamento.nombre is null
union 
SELECT empleado.nombre, departamento.nombre as nombre_departamento
FROM departamento
     left JOIN empleado
ON  empleado.codigo_departamento = departamento.codigo
where empleado.nombre is null order by nombre_departamento;
