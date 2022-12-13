create database Colegios;
use Colegios;

create table Docente(
	id int(20),
	nombres varchar(50),
    apellidos varchar(50),
    direccion varchar(60),
    telefono int(15),
    area varchar(30),
	e_civil varchar(20),
    PRIMARY KEY (id)
);

create table Materias(
	id int(20),
    nombre varchar(20),
    PRIMARY KEY (id)
);

create table Carga_Academica(
	id int(20),
    docente int(20),
    curso varchar(50),
    materia int(20),
    intensidad_horaria int(15),
    PRIMARY KEY (id),
    FOREIGN KEY (docente) REFERENCES Docente (id),
    FOREIGN KEY (materia) REFERENCES Materias (id)
);

create table Colegio(
	nit int(20),
    nombre varchar(30),
    nota decimal(2,2),
    PRIMARY KEY (nit)
);

create table Historico(
	id int(20),
    colegio int(20),
    prom int(20) DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (colegio) REFERENCES Colegio (nit)
);

create table Acudente(
	id int(20),
    nombres varchar(50),
    apellidos varchar(50),
    direccion varchar(60),
    telefono int(15),
    PRIMARY KEY (id)
);

create table Grados(
	id int(20),
    nombre varchar(10),
    curso int(20),
    PRIMARY KEY (id)
);

create table Cursos(
	id int(20),
    nombre  varchar(50),
	academica int(20),
    grado int(20),
	PRIMARY KEY (id),
	FOREIGN KEY (academica) REFERENCES Historico (id),
    FOREIGN KEY (grado) REFERENCES Grados(id)
);

create table Estudiantes(
	id int(20),
    nombres varchar(50),
    apellidos varchar(50),
    direccion varchar(60),
    telefono int(15),
    sexo varchar(10),
    acudente int(20),
    colegios int(20),
    curso int(20),
    fecha_nacimiento date,
    PRIMARY KEY (id),
    FOREIGN KEY (acudente) REFERENCES Acudente (id),
    FOREIGN KEY (colegios) REFERENCES Colegio (nit),
    FOREIGN KEY (curso) REFERENCES Cursos (id)
);

