drop database centromedico;
create database CentroMedico;
use CentroMedico;
SHOW tables;

CREATE TABLE CONSULTORIOS(conNumero INT AUTO_INCREMENT NOT NULL, conNombre VARCHAR(50) NOT NULL, 
PRIMARY KEY(conNumero));

CREATE TABLE MEDICOS(medIdentificacion INT(15) NOT NULL, medNombre VARCHAR(50) NOT NULL, medApellido VARCHAR(50), 
PRIMARY KEY(medIdentificacion));

CREATE TABLE PACIENTES(pacIdentificacion INT(15) NOT NULL, pacNombre VARCHAR(50) NOT NULL, pacApellido VARCHAR(50), pacFechaNacimiento DATE NOT NULL, pacSexo VARCHAR(10) ,
PRIMARY KEY(pacIdentificacion));

CREATE TABLE TRATAMIENTOS(traNumero INT AUTO_INCREMENT NOT NULL, traFechaAsignado DATE NOT NULL, traDescripcion VARCHAR(100), traFechaInicio DATE NOT NULL, traFechafin DATE NOT NULL, traObeservaciones VARCHAR(100), traPaciente INT(15) NOT NULL ,
PRIMARY KEY(traNumero), 
FOREIGN KEY(traPaciente) REFERENCES PACIENTES(pacIdentificacion) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE CITAS(citNumero INT AUTO_INCREMENT NOT NULL, citFecha DATE NOT NULL, citHora TIME NOT NULL, citPaciente INT(15) NOT NULL, citMedico INT(15) NOT NULL, citConsultorio INT NOT NULL, citEstado VARCHAR(20) default "Activo", citObservaciones VARCHAR(100) default "Ninguna", 
PRIMARY KEY(citNumero), 
FOREIGN KEY(citPaciente) REFERENCES PACIENTES(pacIdentificacion) ON UPDATE CASCADE ON DELETE CASCADE, 
FOREIGN KEY(citMedico) REFERENCES MEDICOS(medIdentificacion) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(citConsultorio) REFERENCES CONSULTORIOS(conNumero) ON UPDATE CASCADE ON DELETE CASCADE);

describe CONSULTORIOS;
select * from CONSULTORIOS;
insert into CONSULTORIOS() VALUES(null,"uno"),(null,"dos"),(null,"tres"),(null,"cuatro"),(null,"cinco"),(null,"seis"),(null,"siete"),(null,"ocho"),(null,"nueve"),(null,"diez");

describe MEDICOS;
select * from MEDICOS;
insert into MEDICOS() VALUES(1,"Edwin","Paez"),(2,"Laura","Susano"),(3,"Juan","Jaimes"),(4,"Sandra","Fernandez"),(5,"Karen","Porras"),(6,"Maria","Susano"),(7,"Anyi","Susano"),(8,"Wilson","Susano"),(9,"Daniel","Mendes"),(10,"Dylan","Sanchez");

describe PACIENTES;
select * from PACIENTES;
insert into PACIENTES() VALUES(1,"Sandy","Perez",'2000-05-21',"Femenino"),(2,"Maykol","Morales",'1999-05-21',"Masculino"),(3,"Sofia","Ramirez",'2001-05-21',"Femenino"),
(4,"Arturo","Galvis",'1995-05-21',"Masculino"),(5,"Alejandra","Toro",'1990-05-21',"Femenino"),(6,"Rigo","Uran",'2002-05-21',"Masculino"),
(7,"Armenia","Quintanilla",'2000-05-21',"Femenino"),(8,"Nairo","Quintana",'1998-05-21',"Masculino"),(9,"Cristina","Fonseca",'1997-05-21',"Femenino"),
(10,"Nestor","Rueda",'1975-05-21',"Masculino"),(11,"Thomas","Ballesteros",'1995-05-21',"Masculino"),(12,"Karol","Gomez",'2004-09-01',"Femenino"),(13,"Jorge","Roa",'2001-12-12',"Masculino");

insert into PACIENTES() VALUES(14,"Valentina","Sanchez",'2002-08-21',"Femenino"),(15,"Mario","Mendez",'1998-02-20',"Masculino"),(16,"Mafe","Sepulveda",'1999-08-12',"Femenino");

TRUNCATE table TRATAMIENTOS;
describe TRATAMIENTOS;
select * from TRATAMIENTOS;
insert into TRATAMIENTOS() VALUES
(null,'2022-05-15',"Tomar 2 tabletas",'2022-05-18','2022-07-18',"Tomar en ayunas",1),(null,'2022-05-15',"Tomar 3cm del medicamento",'2022-05-18','2022-07-18',"Tomar en ayunas",1),
(null,'2022-01-10',"Tomar 1 tabletas",'2022-01-18','2022-02-18',"Tomar cada 8 horas",2),(null,'2021-12-24',"Tomar 3 tabletas",'2022-01-01','2022-02-02',"Tomar con las comidas",5),
(null,'2021-12-24',"Tomar 1cm del medicamento",'2022-01-01','2022-02-02',"Tomar con las comidas",5),(null,'2022-04-15',"Tomar 4cm del medicamento",'2022-04-16','2022-08-18',"Tomar cada 8 horas",6),
(null,'2022-02-28',"Tomar 2 cm del medicamento",'2022-02-28','2022-04-28',"Tomar cada 4 horas",7),(null,'2022-08-15',"Tomar 2cm del medicamento",'2022-08-19','2022-09-18',"Tomar cada 4 horas",8),
(null,'2022-04-10',"Tomar 2 tabletas",'2022-04-18','2022-05-28',"Tomar en ayunas",9),(null,'2022-09-15',"Tomar 4 tabletas",'2022-09-15','2022-10-18',"Tomar en ayunas",10);

TRUNCATE table CITAS;
describe CITAS;
select * from CITAS;
insert into CITAS() VALUES
(null,'2022-05-15','14:00',1,1,3,"Activo","Ninguna"),(null,'2022-01-18','18:00',2,4,8,"Activo","Volver en 4 meses"),(null,'2022-11-10','14:00',3,7,4,"Activo","Ninguna"),
(null,'2022-10-17','16:00',4,2,10,"Activo","Ninguna"),(null,'2021-12-24','15:30',5,7,4,"Activo","Volver en 1 año"),(null,'2022-04-15','16:30',6,9,1,"Activo","Ninguna"),
(null,'2022-02-28','12:00',7,5,5,"Activo","Volver en 8 meses"),(null,'2022-08-15','13:00',8,3,3,"Activo","Ninguna"),(null,'2022-04-10','10:00',9,8,9,"Activo","Ninguna"),
(null,'2022-09-15','11:30',10,10,2,"Activo","Ninguna");

insert into CITAS() VALUES(null,'2022-11-22','09:00',11,3,8,"Activo","Ninguna"),(null,'2022-11-18','19:00',12,6,4,"Activo","Ninguna"),(null,'2022-10-25','10:30',13,6,2,"Activo","Ninguna");


#Ejercicio3
show tables;

#Ejercicio4
describe CITAS;
describe PACIENTES;
describe MEDICOS;
describe CONSULTORIOS;
describe TRATAMIENTOS;

#Ejercicio5
select * from PACIENTES where pacSexo="Femenino";

#Ejercicio6
UPDATE CITAS SET citHora = '12:00' WHERE citNumero = 1;
UPDATE CITAS SET citHora = '16:00' WHERE citNumero = 2;

UPDATE PACIENTES SET pacFechaNacimiento = '2000-05-28' WHERE pacIdentificacion = 1;
UPDATE PACIENTES SET pacFechaNacimiento = '1999-05-02' WHERE pacIdentificacion = 2;

UPDATE MEDICOS SET medNombre = "EdwinJ" WHERE medIdentificacion = 1;
UPDATE MEDICOS SET medNombre = "LauraX" WHERE medIdentificacion = 2;

UPDATE CONSULTORIOS SET conNombre = "Uno" WHERE conNumero = 1;
UPDATE CONSULTORIOS SET conNombre = "Dos" WHERE conNumero = 2;

UPDATE TRATAMIENTOS SET traFechaAsignado = '2000-05-28' WHERE traNumero = 1;
UPDATE TRATAMIENTOS SET traFechaAsignado = '1999-05-02' WHERE traNumero = 2;

#Ejercicio7
alter table TRATAMIENTOS CHANGE traObEservaciones traObservaciones BLOB not null;

#Ejercicio8
alter table MEDICOS add medEspecialidad VARCHAR(50) not null;
alter table MEDICOS add medTelefono VARCHAR(20) not null;
alter table MEDICOS add medGenero VARCHAR(20) not null;

#Ejercicio9
CREATE TABLE CIUDADES(ciuCodigo INT AUTO_INCREMENT NOT NULL, ciuNombre VARCHAR(50) NOT NULL ,
PRIMARY KEY(ciuCodigo));
insert into CIUDADES() VALUES(null,"San Gil"),(null,"Bucaramanga"),(null,"Bogota"),(null,"Medellin"),(null,"Pereira");

alter table MEDICOS add medCiudad INT not null;
#Hay que cambiar el primer codigo ciudad a 0
alter table MEDICOS add CONSTRAINT fk_ciudad FOREIGN KEY(medCiudad) REFERENCES CIUDADES(ciuCodigo) ON UPDATE CASCADE ON DELETE CASCADE;
UPDATE MEDICOS SET medCiudad = 1 WHERE medIdentificacion = 1;
UPDATE MEDICOS SET medCiudad = 2 WHERE medIdentificacion = 2;
UPDATE MEDICOS SET medCiudad = 5 WHERE medIdentificacion = 3;
UPDATE MEDICOS SET medCiudad = 4 WHERE medIdentificacion = 4;
UPDATE MEDICOS SET medCiudad = 3 WHERE medIdentificacion = 5;
UPDATE MEDICOS SET medCiudad = 2 WHERE medIdentificacion = 6;
UPDATE MEDICOS SET medCiudad = 1 WHERE medIdentificacion = 7;
UPDATE MEDICOS SET medCiudad = 5 WHERE medIdentificacion = 8;
UPDATE MEDICOS SET medCiudad = 4 WHERE medIdentificacion = 9;
UPDATE MEDICOS SET medCiudad = 3 WHERE medIdentificacion = 10;

alter table PACIENTES add pacCiudad INT not null;
alter table PACIENTES add CONSTRAINT fk_ciudadP FOREIGN KEY(pacCiudad) REFERENCES CIUDADES(ciuCodigo) ON UPDATE CASCADE ON DELETE CASCADE;
UPDATE PACIENTES SET pacCiudad = 1 WHERE pacIdentificacion = 1;
UPDATE PACIENTES SET pacCiudad = 3 WHERE pacIdentificacion = 2;
UPDATE PACIENTES SET pacCiudad = 2 WHERE pacIdentificacion = 3;
UPDATE PACIENTES SET pacCiudad = 5 WHERE pacIdentificacion = 4;
UPDATE PACIENTES SET pacCiudad = 2 WHERE pacIdentificacion = 5;
UPDATE PACIENTES SET pacCiudad = 5 WHERE pacIdentificacion = 6;
UPDATE PACIENTES SET pacCiudad = 3 WHERE pacIdentificacion = 7;
UPDATE PACIENTES SET pacCiudad = 1 WHERE pacIdentificacion = 8;
UPDATE PACIENTES SET pacCiudad = 1 WHERE pacIdentificacion = 9;
UPDATE PACIENTES SET pacCiudad = 4 WHERE pacIdentificacion = 10;
UPDATE PACIENTES SET pacCiudad = 5 WHERE pacIdentificacion = 11;
UPDATE PACIENTES SET pacCiudad = 4 WHERE pacIdentificacion = 12;
UPDATE PACIENTES SET pacCiudad = 2 WHERE pacIdentificacion = 13;

#Ejercicio10
delete from CITAS where citNumero=5;

#Ejercicio11
UPDATE CITAS SET citEstado = "Inactivo" WHERE citFecha < now();



#-------------------------------------------------------------------------------------------------------------------------------------------------------
#Ejercicio1: Contar registros de la tabla pacientes
select count(*) from pacientes;

#Ejercicio2: Concatenar los nombres y apellidos de la tabla pacientes
select CONCAT(pacNombre ," ",pacApellido) as nombreCompleto from PACIENTES;

#Ejercicio3: Calcular la edad de los pacientes
SELECT * ,TIMESTAMPDIFF(YEAR,pacFechaNacimiento,CURDATE()) AS edad FROM pacientes;

#Ejercicio4: Traer los mayores de 30 años con genero femenino
select * from PACIENTES where (TIMESTAMPDIFF(YEAR,pacFechaNacimiento,CURDATE())) >=30 and pacSexo="Femenino";

#Ejercicio5: consultar los pacientes que no tienen citas activas.

select P.* from PACIENTES AS P 
LEFT JOIN CITAS AS C 
ON P.pacIdentificacion = C.citPaciente
where citEstado = "Inactivo";

#Ejercicio6: consultar la cantidad de citas que tiene cada medico.
select medIdentificacion,medNombre,count(*) as numeroCitas from MEDICOS AS M 
INNER JOIN CITAS AS C 
ON M.medIdentificacion = C.citMedico
group by M.medNombre order by M.medIdentificacion ASC;

describe CITAS;

#Ejercicio7: consultar el calendario de cada medico y el consultorio que atiende.
select M.medIdentificacion, M.medNombre, C.citNumero, C.citfecha, C.citHora , C.citPaciente, C.citConsultorio from MEDICOS as M 
INNER JOIN CITAS AS C 
ON M.medIdentificacion = C.citMedico order by M.medIdentificacion;


#Ejercicio8: consultar los tratamientos de cada uno de los pacientes que viven en el San Gil.
select * from PACIENTES as P 
INNER JOIN TRATAMIENTOS AS T 
ON P.pacIdentificacion = T.traPaciente 
where pacCiudad = 1;

