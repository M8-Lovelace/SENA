create database Registro_SENA;
use Registro_SENA;

create table Persona(
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	telefono varchar(20) not null unique,
	direccion varchar(70) not null unique,
    tipo_documento varchar(20) not null,
    ficha_tecnica varchar(20) not null,
    correo varchar(40) not null,
	numero_documento varchar(20) primary key,
    equipo varchar(40),
    rol varchar(20) not null
);

create table Registros(
	serial_equipo varchar(40) primary key,
    tipo_equipo varchar(40) not null,
    marca varchar(40) not null,
    estado_actual varchar(20) default "Terminado",
    fecha_ingreso date  not null,
    fecha_salida date not null,
    guarda varchar(20)  not null,
    dueño varchar(20) not null,
    foreign key (dueño) references Persona(numero_documento),
    foreign key (guarda) references Persona(numero_documento)
);

create table equipos_registrados(
	serial_id int auto_increment primary key,
    dueño varchar(20) not null,
    equipos varchar(40) not null,
	guarda varchar(20) not null,
    foreign key (guarda) references Persona(numero_documento),
    foreign key (dueño) references Persona(numero_documento),
    foreign key (equipos) references Registros(serial_equipo)
); 


describe persona;
insert into persona() values("Laura","Susano","3147596492","calle 5","CC","1234","lauris@gmail.com","4321","12345","aprendiz");
insert into persona() values("Jorge","Perez","3124963158","calle 8a","CC","2345","jorge@gmail.com","5432","23456","guarda");
insert into registros(serial_equipo, tipo_equipo , marca, fecha_ingreso,  guarda, dueño, estado_actual) values("12345","portatil","samsung","2022-05-21", "5432","4321","en proceso");
insert into equipos_registrados(dueño,equipos, guarda) values("4321","12345","5432");

insert into persona() values("Andrea","Sarmiento","3244567892","calle 15","TI","3456","andrea@gmail.com","6543","34567","aprendiz");
insert into persona() values("Anyi","Lopez","3156784523","calle 21b","CC","4567","anyi@gmail.com","7654","45678","aprendiz");
insert into persona() values("Samanta","Suarez","3245678921","calle 18a","TI","5678","samanta@gmail.com","8765","56789","aprendiz");
insert into persona() values("Liz","Zambrano","3123497685","calle 05","CC","7890","liz@gmail.com","0987","78901","aprendiz");
insert into persona() values("Camila","Valbuena","3102679302","calle 11","TI","8523","camila@gmail.com","3258","85234","aprendiz");
insert into persona() values("Ivana","Torres","3142973562","calle 78","TI","5678","ivana@gmail.com","7856","56780","aprendiz");
insert into persona() values("Karol","Garcia","3112586430","calle 96b","CC","1234","karol@gmail.com","2134","12348","aprendiz");
insert into persona() values("Danna","Sanchez","3107946132","calle 35","CC","2589","danna@gmail.com","8259","25896","aprendiz");
insert into persona() values("Sara","Ardila","3171236548","calle 45","CC","6789","sara@gmail.com","9876","0","guarda");
insert into persona() values("Daniel","Mendez","3194561390","calle 35ab","CC","7391","daniel@gmail.com","1937","73915","aprendiz");

insert into Registros(serial_equipo, tipo_equipo , marca, fecha_ingreso, fecha_salida, guarda, dueño ) values("34567","tv","lg","2022-03-21","2022-03-22","5432","6543");
insert into Registros(serial_equipo, tipo_equipo , marca, fecha_ingreso, fecha_salida, guarda, dueño ) values("45678","pc","xiaomy","2022-03-22","2022-04-24", "9876","7654");
insert into Registros(serial_equipo, tipo_equipo , marca, fecha_ingreso, fecha_salida, guarda, dueño ) values("56789","portatil","apple","2022-03-27","2022-03-27", "5432","8765");
insert into Registros(serial_equipo, tipo_equipo , marca, fecha_ingreso, fecha_salida, guarda, dueño ) values("78901","tv","samsung","2022-03-21","2022-04-19", "5432","0987");
insert into Registros(serial_equipo, tipo_equipo , marca, fecha_ingreso, fecha_salida, guarda, dueño ) values("85234","portatil","xiaomy","2022-03-27","2022-04-02", "5432","3258");
insert into Registros(serial_equipo, tipo_equipo , marca, fecha_ingreso, fecha_salida, guarda, dueño ) values("56780","pc","lg","2022-03-30","2022-04-06", "5432","7856");
insert into Registros(serial_equipo, tipo_equipo , marca, fecha_ingreso, fecha_salida, guarda, dueño ) values("12348","portatil","dell","2022-04-01","2022-04-01", "5432","2134");
insert into Registros(serial_equipo, tipo_equipo , marca, fecha_ingreso, fecha_salida, guarda, dueño ) values("25896","portatil","hp","2022-04-11","2022-04-12", "5432","8259");
insert into Registros(serial_equipo, tipo_equipo , marca, fecha_ingreso, fecha_salida, guarda, dueño ) values("73915","tv","lg","2022-04-19","2022-04-20", "5432","1937");

insert into equipos_registrados(dueño,equipos, guarda) values("6543","34567","5432");
insert into equipos_registrados(dueño,equipos, guarda) values("7654","45678","9876");
insert into equipos_registrados(dueño,equipos, guarda) values("8765","56789","5432");
insert into equipos_registrados(dueño,equipos, guarda) values("0987","78901","5432");
insert into equipos_registrados(dueño,equipos, guarda) values("3258","85234","5432");
insert into equipos_registrados(dueño,equipos, guarda) values("7856","56780","5432");
insert into equipos_registrados(dueño,equipos, guarda) values("2134","12348","5432");
insert into equipos_registrados(dueño,equipos, guarda) values("8259","25896","5432");
insert into equipos_registrados(dueño,equipos, guarda) values("1937","73915","5432");


select * from persona;
select * from Registros;
select * from equipos_registrados;
