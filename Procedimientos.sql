

drop procedure AddNacimiento;
DELIMITER $$
CREATE PROCEDURE AddNacimiento(IN dpi_padre int8, IN dpi_madre int8, IN primer_nom varchar(30), IN segundo_nom varchar(30), IN tercer_nom varchar(30), IN fecha_nac date, IN codigo_municipio int8, IN genero char)
BEGIN
	declare apellidoP varchar(30); 
    declare apellidoM varchar(30);
    declare registro int8;
	declare codigo_genero int8;
    declare codigo_fecha int8;
    UPDATE sequence SET id=LAST_INSERT_ID(id+1);
    select apellido1 into apellidoP from persona where dpi_padre=cui;
	select apellido1 into apellidoM from persona where dpi_madre=cui;
    select id_genero into codigo_genero from genero where nombre_genero=genero;
	insert ignore into FECHA (desc_fecha) values(fecha_nac);
    select id_fecha into codigo_fecha from fecha where desc_fecha=fecha_nac;
    if codigo_municipio < 1000 then select LAST_INSERT_ID() * 10 into registro; end if;
	insert into PERSONA values(CONCAT(registro, codigo_municipio), primer_nom, segundo_nom, tercer_nom, apellidoP, apellidoM );
	insert into ACTA_NAC values(null, codigo_fecha, CONCAT(registro, codigo_municipio), codigo_municipio, dpi_padre, dpi_madre, codigo_genero);
END$$

call AddNacimiento(3564360440101, 3564360430101, 'Juan', 'Ramon', null, STR_TO_DATE('07/06/2005','%d/%m/%Y %H:%i:%S'), 0101, 'M');

select * from fecha ;
select * from estado_civil
select * from persona
select * from acta_nac
select * from municipio
select * from genero