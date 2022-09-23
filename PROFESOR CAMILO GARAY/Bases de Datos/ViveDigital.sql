DROP DATABASE viveDigital;

create database viveDigital;
show databases;

use viveDigital;

show tables;

CREATE TABLE AREA(idArea INT AUTO_INCREMENT NOT NULL, descripcion VARCHAR(50) NOT NULL, PRIMARY KEY(idArea));
CREATE TABLE AUTOR(idAutor INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(50) NOT NULL, apellido VARCHAR(50), ciudad VARCHAR(20), PRIMARY KEY(idAutor));
CREATE TABLE EDITORIAL(idEditorial INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(50) NOT NULL, PRIMARY KEY(idEditorial));

CREATE TABLE TIPO_MATERIAL(idTipoMaterial INT AUTO_INCREMENT NOT NULL, descripcion VARCHAR(100), PRIMARY KEY(idTipoMaterial));
CREATE TABLE MATERIAL_BIBLIOGRAFICO(
	idMaterial INT(10) AUTO_INCREMENT NOT NULL, 
	nombre VARCHAR(200), 
    area INT NOT NULL, 
	editorial INT NOT NULL, 
    tipoMaterial INT NOT NULL, 
    fechaPublicacion DATE NOT NULL, 
    descripcion VARCHAR(100), 
	PRIMARY KEY(idMaterial), 
    FOREIGN KEY(area) REFERENCES AREA(idArea) ON UPDATE CASCADE ON DELETE CASCADE, 
	FOREIGN KEY(editorial) REFERENCES EDITORIAL(idEditorial) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(tipoMaterial) REFERENCES TIPO_MATERIAL(idTipoMaterial) ON UPDATE CASCADE ON DELETE CASCADE);
    
CREATE TABLE AUTOR_MATERIAL(id INT AUTO_INCREMENT NOT NULL, autor INT NOT NULL, material INT NOT NULL, 
PRIMARY KEY(id), FOREIGN KEY(autor) REFERENCES AUTOR(idAutor),
FOREIGN KEY(material) REFERENCES MATERIAL_BIBLIOGRAFICO(idMaterial)ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE USUARIO(tipoDcto VARCHAR(2) NOT NULL, documento VARCHAR(20) NOT NULL, nombre VARCHAR(50) NOT NULL,
 apellido VARCHAR(50), fechaNacimiento DATE NOT NULL, escolaridad VARCHAR(11), telefono VARCHAR(20),
 direccion VARCHAR(20),ciudad VARCHAR(20), ocupacion VARCHAR(20), email VARCHAR(50), contrasena VARCHAR(10),
 PRIMARY KEY(tipoDcto,documento));
 

CREATE TABLE PRESTAMO(
	idPrestamo INT AUTO_INCREMENT NOT NULL,
	UsuarioTipoDcto VARCHAR(2) NOT NULL, 
	UsuarioDocumento VARCHAR(20) NOT NULL, 
	idMaterialBibliografico INT(10) NOT NULL, 
	fechaPrestamo DATE, 
	estado VARCHAR(20) default "Activo", 
	PRIMARY KEY(idPrestamo),
	FOREIGN KEY(UsuarioTipoDcto,UsuarioDocumento) REFERENCES USUARIO(tipoDcto,documento) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(idMaterialBibliografico) REFERENCES MATERIAL_BIBLIOGRAFICO(idMaterial) ON UPDATE CASCADE ON DELETE CASCADE);
    
#----------------------------------------------------------------------------------------------------------------------------------------------------------
# INSERCION DE DATOS 
describe TIPO_MATERIAL;
select * from  TIPO_MATERIAL;
insert into TIPO_MATERIAL() values(null,"Tesis"),(null,"Libro"),(null,"Revista"),(null,"Audio libro"),(null,"Libro electronico"),(null,"Resumen"),(null,"Imagenes"),(null,"Imagenes electronicas"),(null,"Articulo"),(null,"Recetarios"),
(null,"PDF"),(null,"Bases de datos"),(null,"CD"),(null,"Catalogos"),(null,"Peliculas"),(null,"Diccionarios"),(null,"Enciclopedias"),(null,"Reportes"),(null,"Autobibliografias"),(null,"Entrevistas");

describe EDITORIAL;
select * from  EDITORIAL;
insert into EDITORIAL() values(null,"Acantilado"),(null,"Aguilar"),(null,"Crítica"),(null,"Herder"),(null,"Joaquín Mortiz"),(null,"Paidós"),(null,"Lumen"),(null,"Impedimenta"),(null,"Olañeta"),(null,"La esfera de los libros"),
(null,"Penguin Books"),(null,"Nevsky"),(null,"Planeta"),(null,"RM"),(null,"Sajalín"),(null,"Siruela"),(null,"Taurus"),(null,"Urano"),(null,"Valdemar"),(null,"Trotta");

describe AREA;
select * from  AREA;
insert into AREA() values(null,"Ciencia"),(null,"Matematicas"),(null,"Fisica"),(null,"Tecnologia"),(null,"Programacion"),(null,"Ingles"),(null,"Literatura"),(null,"Historia"),(null,"Astrologia"),(null,"Psicologia"),
(null,"Infantil"),(null,"Cuentos"),(null,"Novelas"),(null,"Juegos"),(null,"Ficcion"),(null,"Anime"),(null,"Chistes"),(null,"Religioso"),(null,"Manualidades"),(null,"Medicina");

describe MATERIAL_BIBLIOGRAFICO;
select * from  MATERIAL_BIBLIOGRAFICO;
insert into MATERIAL_BIBLIOGRAFICO() values(null,"El Principito",1,20,1,'1987-11-30',"Jovenes"),(null,"Lobos",2,19,6,'2001-08-12',"Jovenes"),(null,"Juego de tronos",3,18,8,'1954-12-04',"Jovenes"),(null,"365 dias",10,17,3,'1999-02-12',"Jovenes"),(null,"Harry Potter",4,17,10,'1990-05-12',"Jovenes"),(null,"Los juegos del hambres",5,15,3,'1999-12-05',"Jovenes"),(null,"Caperucita",11,8,17,'1986-12-14',"Niños"),(null,"Pasion de Gavilanes",7,7,19,'1990-10-12',"Adultos"),(null,"50 sombras de grey",7,2,20,'2004-10-12',"Adultos"),(null,"Elif",9,1,18,'2005-05-12',"Adultos"),
(null,"Ingles basico",6,18,3,'2001-12-05',"Todo publico"),(null,"La vaca lola",11,6,3,'2000-06-18',"Niños"),(null,"Dumbo",11,7,8,'1998-11-17',"Niños"),(null,"La sirenita",12,2,9,'2001-05-12',"Niños"),(null,"Pablo Escobar",13,15,12,'1988-12-01',"Adultos"),(null,"Enciclopedia",14,12,17,'2010-07-06',"Todo publico"),(null,"Records Guinness",15,3,14,'2000-03-12',"Jovenes"),(null,"Cenicienta",16,4,17,'1987-04-19',"Niños"),(null,"Historia de Colombia",17,13,8,'1885-05-16',"Todo publico"),(null,"Python",20,11,9,'2005-12-04',"Jovenes");

describe AUTOR;
select * from  AUTOR;
insert into AUTOR() values(null,"MIGUEL","DE CERVANTES","Bucaramanga"),(null,"Juan","Jaimes","San Gil"),(null,"Antonio","Casas","Barranca"),(null,"Armando","Lotes","Pinchote"),(null,"Benito","Camelas","Socorro"),(null,"Bartolomea","Nuñez","Charala"),(null,"Arnulfia","De la paz","San Gil"),(null,"Patricia","Ruiz","Rusia"),(null,"MARQUÉS","DE SADE","Italia"),(null,"GOETHE","","España"),
(null,"JANE","AUSTEN","España"),(null,"MARY","SHELLEY","Granada"),(null,"VICTOR","HUGO","Italia"),(null,"CHARLES","DICKENS","España"),(null,"HERMAN","MELVILLE","Australia"),(null,"FIÓDOR","DOSTOYEVSKI","Roma"),(null,"JULIO","VERNE","Roma"),(null,"LEÓN","TOLSTÓI","Toscana"),(null,"EMILE","ZOLA","Italia"),(null,"BRAM","STOKER","Roma");

describe AUTOR_MATERIAL;
select * from  AUTOR_MATERIAL;
insert into AUTOR_MATERIAL() values(null,1,20),(null,2,19),(null,2,19),(null,3,18),(null,4,17),(null,5,16),(null,6,15),(null,7,14),(null,8,13),(null,8,12),(null,9,11),(null,10,10),(null,11,9),
(null,12,8),(null,13,7),(null,14,6),(null,15,5),(null,16,4),(null,17,3),(null,18,2),(null,19,2),(null,20,1);


describe USUARIO;
select * from  USUARIO;
insert into USUARIO() values("CC","123456","Laura","Susano",'2002-06-22',"Tecnologa","3189674953","Calle 5 #12-14", "Bucaramanga","Estudiante","laura@gmail.com","123"),("TI","234567","Thomas","Ballesteros",'2010-08-26',"Bachiller","3201648596","Calle 2 #21-02", "Socorro","Estudiante","thomas@gmail.com","963"),
("CC","345678","Juan","Jaimes",'2001-12-11',"Ingeniero","3165801594","Calle 2 #23-54","San Gil","Empleado","juanfer@gmail.com","246"),("CC","456789","Sandy","Garcia",'1993-08-11',"Bachiller","3124567895","Carrera 31B #13-70","San Gil","Estudiante", "sandy@gmail.com","234"),
("CC","987654","Karla","Suarez",'1992-06-12',"Posgrado","3221465896","Carrera 21D #32-96", "Curiti","Docente","karla@gmail.com","461"),("CC","321987","Pablo","Duarte",'1995-04-27',"Posgrado","3214786312","Carrera 11 #10-21","Pinchote","Profesor", "pablo@gmail.com","741"),
("CC","123789","Adriana","Perez",'1998-08-22',"Tecnologa","3159634527","Calle 3 #21-17", "Socorro","Empleada","adriana@gmail.com","347"),("TI","789123","Daniela","Salazar",'2009-05-14',"Bachiller","3145627483","Calle 2 #43-67","Bucaramanga","Estudiante","daniela@gmail.com","235"),
("CC","741963","Dylan","Jaimes",'2004-02-02',"Ninguno","3105674231","Carrera 8 #12-24", "Villanueva","Reciclador","dylan@gmail.com","712"),("CC","369147","Juana","Quevedo",'1992-01-01',"Tecnologa","3506984235","Carrera 22 #31-23","Charala","Empleada","juana@gmail.com","693"),
("TI","753951","Karol","Sanchez",'2007-06-19',"Bachiller","3198627812","Calle 8 #12-86", "Pinchote","Estudiante","karol@gmail.com","824"),("CC","456913","Marcela","Rincon",'2002-12-17',"Master","3189685476","Carrera 27 #31-42", "Bogota","Docente","marcela@gmail.com","453"),
("CC","493716","Arnulfo","Mendez",'1978-11-22',"Tecnologo","3201567892","Carrera 15B #12-69", "Villanueva","Empleado","arnulfo@gmail.com","764"),("TI","467918","Carlos","Garnica",'2006-12-30',"Bachiller","3124568513","Calle 9 #45-21", "Socorro","Estudiante","carlos@gmail.com","357"),
("CC","891274","Juan","Ortiz",'1997-04-29',"Ingeniero","3507896514","Calle 4C #42-12", "Pinchote","Empleado","juan@gmail.com","493"),("CC","493765","Jorge","Roa",'2001-09-07',"Tecnologo","3164532867","Carrera 2 #43-56", "San Gil","Estudiante","jorge@gmail.com","753"),
("CC","335697","Armando","Casas",'1995-02-24',"Bachiller","3178964523","Carrera 2B #32-12", "Bucaramanga","Comerciante","armando@gmail.com","279"),("CC","791346","Benito","Perez",'2000-03-13',"Ingeniero","3507536984","Calle 7 #87-54", "Curiti","Empleado","benito@gmail.com","951"),
("TI","203694","Lizeth","Hernandez",'2015-04-22',"Bachiller","3174965273","Carrera 12C #98-09", "Barranca","Estudiante","lizeth@gmail.com","685"),("TI","824639","Humberto","Gomez",'2007-09-12',"Bachiller","3126958672","Carrera 5A #87-32", "Barranca","Estudiante","humberto@gmail.com","326");


select * from  MATERIAL_BIBLIOGRAFICO;
describe PRESTAMO;
select * from PRESTAMO;
insert into PRESTAMO() values(null,"CC","123456",8,'2022-09-15',"Activo"),(null,"TI","824639",1,'2022-09-10',"Activo"),(null,"CC","791346",9,'2022-08-30',"Activo"),(null,"CC","493765",20,'2022-09-08',"Activo"),(null,"TI","467918",13,'2021-11-25',"Inactivo"),
(null,"CC","456913",2,'2022-09-05',"Activo"),(null,"CC","369147",4,'2022-09-04',"Activo"),(null,"CC","456789",4,'2021-04-12',"Inactivo"),(null,"TI","234567",7,'2022-09-01',"Activo"),(null,"CC","345678",18,'2022-09-02',"Activo"),
(null,"CC","987654",3,'2020-12-31',"Inactivo"),(null,"CC","123789",8,'2022-09-05',"Activo"),(null,"CC","741963",6,'2022-09-04',"Activo"),(null,"TI","753951",14,'2022-09-03',"Activo"),(null,"CC","493716",2,'2020-12-11',"Inactivo"),
(null,"CC","493765",11,'2022-09-09',"Activo"),(null,"CC","891274",19,'2021-11-30',"Inactivo"),(null,"CC","335697",7,'2022-09-10',"Activo"),(null,"CC","791346",5,'2022-09-11',"Activo"),(null,"TI","203694",12,'2022-09-12',"Activo");

#----------------------------------------------------------------------------------------------------------------------------------------------------------
# CONSULTAS
describe USUARIO;
# Los usuarios están relacionados con el documento de identidad, la ciudad donde habitan y la clasificación del tipo de usuario respecto a la biblioteca.
SELECT documento, ciudad, escolaridad FROM USUARIO;


# El nombre del material bibliográfico, la fecha de publicación y el tipo de material bibliográfico.
SELECT MB.nombre, MB.fechaPublicacion, MB.tipoMaterial, TM.descripcion FROM MATERIAL_BIBLIOGRAFICO AS MB
JOIN TIPO_MATERIAL AS TM ON MB.tipoMaterial = TM.idTipoMaterial;

# Todos los usuarios que viven en la ciudad de Bucaramanga.
SELECT * FROM USUARIO WHERE ciudad="Bucaramanga";

# Todas las revistas de la biblioteca.
SELECT * FROM MATERIAL_BIBLIOGRAFICO AS MB JOIN TIPO_MATERIAL AS TM ON MB.tipoMaterial = TM.idTipoMaterial WHERE TM.descripcion="Revista";

# Listar todos los datos de cada una de las tablas de la base de datos de la biblioteca.
SELECT P.*, MB.*, A.*,E.*,TM.*, U.*, AU.* , AM.*
FROM USUARIO AS U
INNER JOIN PRESTAMO AS P ON P.UsuarioDocumento = U.documento 
INNER JOIN MATERIAL_BIBLIOGRAFICO AS MB ON P.idMaterialBibliografico = MB.idMaterial
INNER JOIN AREA AS A ON A.idArea = MB.area
INNER JOIN EDITORIAL AS E ON E.idEditorial = MB.editorial
INNER JOIN TIPO_MATERIAL AS TM ON TM.idTipoMaterial = MB.tipoMaterial
INNER JOIN AUTOR_MATERIAL AS AM ON AM.material = MB.idmaterial
INNER JOIN AUTOR AS AU ON AU.idAutor = AM.autor;

# Cambiar la contraseña 123 por el nombre del aprendiz tabla usuario a la fila con número de documento 123456. 
UPDATE USUARIO SET contrasena = USUARIO.nombre WHERE documento = "123456";
SELECT * FROM USUARIO WHERE documento = "123456";

# Eliminar el registro libro 13 de la tabla materialbibliografico.
DELETE FROM MATERIAL_BIBLIOGRAFICO WHERE idMaterial = 13;

# ¿Cuál es el tipo de material bibliográfico más consultado por los niños y/o jóvenes menores a 21 años?
DESCRIBE TIPO_MATERIAL;
DESCRIBE MATERIAL_BIBLIOGRAFICO;
SELECT count(*) AS Numero_prestamos,TM.idTipoMaterial, TM.descripcion FROM TIPO_MATERIAL AS TM 
INNER JOIN MATERIAL_BIBLIOGRAFICO AS MB ON TM.idTipoMaterial = MB.tipoMaterial
INNER JOIN PRESTAMO AS P ON P.idPrestamo = MB.idMaterial
INNER JOIN USUARIO AS U ON U.documento = P.UsuarioDocumento
WHERE TIMESTAMPDIFF(YEAR,U.fechaNacimiento,CURDATE())<=21 group by TM.idTipoMaterial order by COUNT(*) DESC LIMIT 1;

# ¿Cuál es el último libro digital consultado por todos los usuarios que tienen más de 8 años y menos de 18 años? Debe asociarse el nombre del usuario, la edad, el nombre del material bibliográfico y la fecha de consulta del material.
select U.nombre, TIMESTAMPDIFF(YEAR,U.fechaNacimiento,CURDATE()) AS edad, P.fechaPrestamo, MB.nombre 
FROM TIPO_MATERIAL AS TM 
INNER JOIN MATERIAL_BIBLIOGRAFICO AS MB ON TM.idTipoMaterial = MB.tipoMaterial
INNER JOIN PRESTAMO AS P ON P.idPrestamo = MB.idMaterial
INNER JOIN USUARIO AS U ON U.documento = P.UsuarioDocumento
WHERE TIMESTAMPDIFF(YEAR,U.fechaNacimiento,CURDATE())<18 and TIMESTAMPDIFF(YEAR,U.fechaNacimiento,CURDATE())>8 
ORDER BY P.fechaPrestamo DESC LIMIT 1;

# ¿A qué parte del país pertenecen los usuarios que han ejecutado mayor número de consultas en la biblioteca?
SELECT COUNT(*) AS numero_consultas, U.ciudad
FROM TIPO_MATERIAL AS TM 
INNER JOIN MATERIAL_BIBLIOGRAFICO AS MB ON TM.idTipoMaterial = MB.tipoMaterial
INNER JOIN PRESTAMO AS P ON P.idPrestamo = MB.idMaterial
INNER JOIN USUARIO AS U ON U.documento = P.UsuarioDocumento
GROUP BY U.ciudad ORDER BY COUNT(*) DESC LIMIT 1;

# Cuantos materiales bibliográficos tiene cada autor, debe asociarse el nombre y apellido en una sola columna, el nombre de la ciudad y la cantidad de materiales. 
SELECT CONCAT(A.nombre," ",A.apellido) AS nombre_completo, A.ciudad, COUNT(MB.idMaterial) AS numero_materiales
FROM AUTOR_MATERIAL AS AM
INNER JOIN MATERIAL_BIBLIOGRAFICO AS MB ON AM.material = MB.idMaterial
INNER JOIN AUTOR AS A ON A.idAutor = AM.autor 
group by CONCAT(A.nombre," ",A.apellido);

# Mostrar todos los prestamos activos, debe asociarse el tipo de documento, documento, nombre y apellidos, escolaridad del usuario, Nombre del material bibliográfico, 
# fecha publicación, nombre tipo material, nombre del área y nombre de la editorial.
SELECT U.tipoDcto, U.documento, CONCAT(U.nombre," ",U.apellido) AS nombre_completo, U.escolaridad, 
MB.nombre ,MB.fechaPublicacion, TM.descripcion ,A.descripcion, E.nombre, P.estado
FROM USUARIO AS U
INNER JOIN PRESTAMO AS P ON P.UsuarioDocumento = U.documento 
INNER JOIN MATERIAL_BIBLIOGRAFICO AS MB ON P.idMaterialBibliografico = MB.idMaterial
INNER JOIN AREA AS A ON A.idArea = MB.area
INNER JOIN EDITORIAL AS E ON E.idEditorial = MB.editorial
INNER JOIN TIPO_MATERIAL AS TM ON TM.idTipoMaterial = MB.tipoMaterial
WHERE estado="Activo";

