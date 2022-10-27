use proyecto_coderhouse;
/*Vistas*/
CREATE VIEW vista_autos
AS select * from autos;
create view vista_chofer
as select * from chofer;
create view vista_viaje
as select * from viaje;
create view vista_usuarios
as select * from usuarios;
create view vista_medios
as select * from medios_de_pago;

/*Funciones*/
DELIMITER //
create function iva(monto_viaje decimal) returns decimal
deterministic
begin 
return monto_viaje * 0.21;
end;
//
select monto_viaje,iva(monto_viaje) from `comision de chofer`;
DELIMITER //
create function comision(monto_viaje decimal) returns decimal
deterministic
begin
return monto_viaje * 0.25;
end;
//
select monto_viaje,comision(monto_viaje) from `comision de chofer`;
/*Stored Procedures*/

/*Este Stored Procedure tiene como objetivo ordenar la tabla autos, este recibe 2 parametros(columna y orden)
Los cuales utiliza para elegir por cual columna va a ordenar la tabla y si va a ser en orden ASC o DESC*/
DELIMITER //
CREATE PROCEDURE autos_ordenado (in columna varchar(200),in orden varchar(200))
BEGIN
set @columna=columna;
set @orden=orden;
set @q= 'SELECT * FROM autos ORDER BY ';
set @qfinal = concat(@q,' ',@columna,' ',@orden,';');
prepare ejecutar from @qfinal;
execute ejecutar;
deallocate prepare ejecutar;
END
//

/*Este Stored Procedure tiene como objetivo ingresar un registro en la tabla autos, mediante el parametro patente
se puede verificar si el auto ya esta registrado, en el caso de estarlo devuleve la leyenda Patente existente,
En el caso de no estarlo usa el resto de los parametros para registrar el valor*/

DELIMITER //
CREATE PROCEDURE ingreso_registro(in patente varchar(45), in modelo varchar(45), in color varchar(45),in marca varchar(45),in seguro varchar(45))
begin 
if (select count(patente) from autos where patente=patente)>0 then
	select 'Patente existente';
else insert into autos values(patente,modelo,color,marca,seguro);
end if;
end
//

/*Triggers*/

/*Creacion de la tabla LOG de autos*/
CREATE TABLE `autos_log` (
  `id_autos` int NOT NULL AUTO_INCREMENT,
  `patente` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `seguro` varchar(45) NOT NULL,
  PRIMARY KEY (`id_autos`)
);
/*Creacion de la tabla LOG de usuarios*/
CREATE TABLE `usuarios_log` (
  `id_usuario` int NOT NULL,
  `fecha_de_creacion` datetime DEFAULT NULL,
  `ranking` int DEFAULT NULL,
  `medios_de_pago` int DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `medio_idx` (`medios_de_pago`),
  CONSTRAINT `medios` FOREIGN KEY (`medios_de_pago`) REFERENCES `medios_de_pago` (`id_medios`)
);
/*Este trigger se llamara cada vez que se inserte un dato en la tabla autos
y guardara la fecha, hora, usuario y el nuevo dato que fue guardado*/
create trigger insertar_log 
after insert on autos
for each row 
insert into autos_log (fecha,hora,usuario_id,new_dato,tipo_operacion)
values
(curdate(),curtime(),session_user(),NEW.dato,'se inserta dato');

/*Este trigger se llamara cada vez que se inserte un dato en la tabla usuarios
y guardara la fecha, hora, usuario y el nuevo dato que fue guardado*/
create trigger insertar_log 
after insert on usuarios
for each row 
insert into autos_log (fecha,hora,usuario_id,new_dato,tipo_operacion)
values
(curdate(),curtime(),session_user(),NEW.dato,'se inserta dato');

/*Este trigger se llamara cada vez que se elimine un dato en la tabla autos
y guardara la fecha, hora, usuario y el dato que fue eliminado con anterioridad*/
DELIMITER //
create trigger borrar_log 
before delete on autos
for each row 
begin
insert into autos_log (fecha,hora,usuario_id,old_dato,tipo_operacion)
values
(curdate(),curtime(),session_user(),OLD.dato,'se borra dato');
end
//

/*Este trigger se llamara cada vez que se elimine un dato en la tabla usuarios
y guardara la fecha, hora, usuario y el dato que fue eliminado con anterioridad*/
DELIMITER //
create trigger borrar_log 
before delete on usuarios
for each row 
begin
insert into usuarios_log (fecha,hora,usuario_id,old_dato,tipo_operacion)
values
(curdate(),curtime(),session_user(),OLD.dato,'se borra dato');
end
//
