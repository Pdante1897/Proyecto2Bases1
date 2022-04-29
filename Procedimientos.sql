

DELIMITER $$
CREATE PROCEDURE AddNacimiento(IN dpi_padre int8, IN dpi_madre int8, IN primer_nom varchar(30), IN segundo_nom varchar(30), IN tercer_nom varchar(30), IN fecha_nac date, IN codigo_municipio int8, IN genero char)
BEGIN
	declare apellidoP varchar(30); 
    declare apellidoM varchar(30);
    declare registro int8;
	declare codigo_genero int8;
    declare codigo_fecha int8;   
    select apellido1 into apellidoP from persona where dpi_padre=cui;
	select apellido1 into apellidoM from persona where dpi_madre=cui;
    select id_genero into codigo_genero from genero where nombre_genero=genero;
	insert ignore into FECHA (desc_fecha) values(fecha_nac);
    select id_fecha into codigo_fecha from fecha where desc_fecha=fecha_nac;
    if codigo_municipio < 1000 then select id * 10 into registro from sequence; else select id into registro from sequence; end if;
	insert into PERSONA values(CONCAT(registro, codigo_municipio), primer_nom, segundo_nom, tercer_nom, apellidoP, apellidoM );
	insert into ACTA_NAC values(null, codigo_fecha, CONCAT(registro, codigo_municipio), codigo_municipio, dpi_padre, dpi_madre, codigo_genero);
    UPDATE sequence SET id=id+1;
END$$

call AddNacimiento(3564360440101, 3564360430101, 'Roberto', 'Ramon', null, STR_TO_DATE('07/06/2005','%d/%m/%Y %H:%i:%S'), 0101, 'M');
call AddNacimiento(3564360440101, 3564360430101, 'Sofia', 'Violeta', null, STR_TO_DATE('07/06/2010','%d/%m/%Y %H:%i:%S'), 0101, 'F');

call AddNacimiento(1000000000101, 1000000100101, 'Raul', 'Riquelme', null, STR_TO_DATE('05/08/2020','%d/%m/%Y %H:%i:%S'), 1201, 'M');
call AddNacimiento(1000000000101, 1000000100101, 'Sofia', 'Violeta', null, STR_TO_DATE('06/05/2021','%d/%m/%Y %H:%i:%S'), 1201, 'F');

drop procedure AddDefuncion;

DELIMITER $$
CREATE PROCEDURE AddDefuncion(IN cui_fallecido int8, IN fecha_fall date , IN motivo_muerte varchar(50))
BEGIN
    declare codigo_fecha int8;
    declare codigo_fecha_nacido int8;
    declare fecha_nacido date;
	insert ignore into FECHA (desc_fecha) values(fecha_fall);
    select id_fecha into codigo_fecha from fecha where desc_fecha=fecha_fall;
    select fecha_nac into codigo_fecha_nacido from acta_nac where persona=cui_fallecido;
	select desc_fecha into fecha_nacido from fecha where id_fecha=codigo_fecha_nacido;
    if DATE(fecha_fall) > DATE(fecha_nacido) then insert ignore into ACTA_DEFUNCION values(null, codigo_fecha, cui_fallecido, motivo_muerte); end if;
	
END$$

call AddDefuncion(4000000021201, STR_TO_DATE('20/04/2022','%d/%m/%Y %H:%i:%S'), 'jugar free faller');
call AddDefuncion(4000000021201, STR_TO_DATE('20/04/2022','%d/%m/%Y %H:%i:%S'), 'otra cosa xd ');
call AddDefuncion(4000000031201, STR_TO_DATE('05/05/2021','%d/%m/%Y %H:%i:%S'), 'no se');
call AddDefuncion(4000000031201, STR_TO_DATE('07/05/2021','%d/%m/%Y %H:%i:%S'), 'no se');



select * from fecha;
select * from estado_civil;
select * from persona;
select * from acta_nac;
select * from acta_defuncion;

select * from municipio;
select * from genero;