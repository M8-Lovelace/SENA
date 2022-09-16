describe empleado;
show tables;


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

#EJERCICIOS:

#ejercicio 1
select apellido1 from empleado;


#ejercicio 2
SELECT DISTINCT apellido1 FROM empleado;


#ejercicio 3
select * from empleado;


#ejercicio 4
select nombre,apellido1,apellido2 from empleado;


#ejercicio 5
select nombre,codigo from departamento;


#ejercicio 6
select nombre,codigo from empleado where codigo_departamento<>0;
SELECT nombre,codigo
FROM empleado
WHERE codigo_departamento IS NOT NULL;


#ejercicio 7
SELECT DISTINCT codigo_departamento FROM empleado;


#ejercicio 8
SELECT
    CONCAT(nombre, ' ', apellido1, ' ', if(apellido2<>'' , apellido2, ' '))
FROM
	empleado;
    
    
#ejercicio 9
SELECT
    CONCAT(nombre, ' ', apellido1, ' ', if(apellido2<>'' , apellido2, ' ')) AS nombre_completo
FROM
	empleado;


#ejercicio 10
select
UCASE(CONCAT(nombre, ' ', apellido1,'' , if(apellido2<>'' , apellido2, ' ')))nombre_completo FROM empleado ORDER BY nombre_completo;


#ejercicio 11
select
lower(CONCAT(nombre, ' ', apellido1,'' , if(apellido2<>'' , apellido2, ' ')))nombre_completo FROM 	empleado ORDER BY nombre_completo;


#ejercicio 12
SELECT codigo,left(nif,8), right(nif,1) from empleado;


#ejercicio 13
SELECT codigo,left(nif,8) as numero_nif, right(nif,1) as letra_nif from empleado;

#ejercicio 14
SELECT nombre, (presupuesto-gastos) as presupuesto_actual  from departamento;

#ejercicio 15
SELECT nombre,(presupuesto-gastos) as presupuesto_actual from departamento WHERE (presupuesto-gastos) IS NOT NULL and (presupuesto-gastos)>=0;

#ejercicio 16
SELECT nombre, (presupuesto-gastos) as presupuesto_actual  from departamento ORDER BY presupuesto_actual ASC;

#ejercicio 17
SELECT nombre, (presupuesto-gastos) as presupuesto_actual  from departamento ORDER BY presupuesto_actual desc;

#ejercicio 18
select nombre from departamento ORDER BY  nombre desc;

#ejercicio 19
select
CONCAT(apellido1,' ' , if(apellido2<>'' , apellido2, ' '), ' ',nombre)nombre_completo FROM 	empleado ORDER BY nombre_completo;
    
#ejercicio 20
SELECT nombre, presupuesto  from departamento ORDER BY presupuesto desc limit 3;

#ejercicio 21
SELECT nombre, presupuesto  from departamento ORDER BY presupuesto asc limit 3;

#ejercicio 22
SELECT nombre, gastos  from departamento ORDER BY gastos desc limit 2;

#ejercicio 23
SELECT nombre, gastos  from departamento ORDER BY gastos asc limit 2;

#ejercicio 24
SELECT * from departamento limit 2,5;

#ejercicio 25
SELECT nombre, presupuesto  from departamento where presupuesto>=150000;

#ejercicio 26
SELECT nombre, gastos from departamento where gastos<5000;

#ejercicio 27
SELECT nombre,  presupuesto from departamento where presupuesto<200000 and presupuesto>100000;

#ejercicio 28
SELECT nombre,  presupuesto from departamento where presupuesto<=100000 or presupuesto>=200000;

#ejercicio 29
SELECT nombre,  presupuesto from departamento where presupuesto between 100000 and 200000;

#ejercicio 30
SELECT nombre,  presupuesto from departamento where presupuesto not between 100000 and 200000;

#ejercicio 31
SELECT nombre, presupuesto, gastos from departamento where gastos>presupuesto;

#ejercicio 32
SELECT nombre, presupuesto, gastos from departamento where gastos<presupuesto;

#ejercicio 33
SELECT nombre, presupuesto, gastos from departamento where gastos=presupuesto;

#ejercicio 34
SELECT * from empleado where apellido2 is null;

#ejercicio 36
SELECT * from empleado where apellido2 is not null;

#ejercicio 37
SELECT * from empleado where apellido1 = "flores" or apellido2 = "flores";

#ejercicio 38
SELECT * FROM empleado WHERE apellido2 IN ("diaz", "moreno");

#ejercicio 39
select nombre, CONCAT(apellido1,' ' , if(apellido2<>'' , apellido2, ' '))apellidos,nif from empleado where codigo_departamento = 3;

#ejercicio 40
select nombre, CONCAT(apellido1,' ' , if(apellido2<>'' , apellido2, ' '))apellidos,nif from empleado where codigo_departamento = 3 or codigo_departamento = 4 or codigo_departamento = 5;

#ejercicio 41
select correo, count(correo), if(count(correo)>=14, 'Correo muy grande' , 'Correo normal') from empleado;

#ejercicio 42
select count(apellido2 is null) from empleado;

#ejercicio 43
select count(*) from empleado where genero = "F" AND ciudad_residencia = "Curiti" AND edad>40;

#ejercicio 44
select nombre from empleado where genero = "F" AND ciudad_residencia = "Curiti" AND edad>40;

#ejercicio 45
select max(salario) from empleado where genero = "F" ;

#ejercicio 46
select count(*) from empleado where apellido2 like "%z";
