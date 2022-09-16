use jugadores;

show tables;

describe jugador;
SELECT * FROM jugador;

insert into jugador() values (null, "Manuel", "Vasquez", "3124138098","Bogota","Delantero");
insert into jugador() values (null, "Cristian", "Gonzales", "3112345678","Bogota","Portero");
insert into jugador() values (null, "Juan", "Rondon", "3145678976","Bogota","Defensa");
insert into jugador() values (null, " Vazquez", "Cristian", "3124138098","Bogota","Central");
insert into jugador() values (null, "Manuel", "Vazquez", "3124138098","Bogota","MedioCampista");


SELECT * FROM fechas;
insert into fechas() values(null,'2022-01-02','2022-03-01 10:45:01');
insert into fechas() values(null,'2020-02-05','2022-03-03 10:00:00');
insert into fechas() values(null,'2010-05-06','2015-06-11 13:05:00');

SELECT nombreJugador, posicionJuegoJugador FROM jugador;


