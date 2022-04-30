 
drop procedure if exists addnacimiento;
DELIMITER $$
CREATE PROCEDURE AddNacimiento(IN dpi_padre int8, IN dpi_madre int8, IN primer_nom varchar(30), IN segundo_nom varchar(30), IN tercer_nom varchar(30), IN fecha_nac varchar(10), IN codigo_municipio int8, IN genero char)
BEGIN
	declare apellidoP varchar(30); 
    declare apellidoM varchar(30);
    declare registro int8;
	declare codigo_genero int8;
    declare codigo_fecha int8;   
    declare dpi_padre_e int8;
    declare dpi_madre_e int8;
    select id_dpi into dpi_padre_e from dpi where id_dpi=dpi_padre;
	select id_dpi into dpi_madre_e from dpi where id_dpi=dpi_madre;
    select apellido1 into apellidoP from persona where dpi_padre=cui;
	select apellido1 into apellidoM from persona where dpi_madre=cui;
    select id_genero into codigo_genero from genero where nombre_genero=genero;
	insert ignore into FECHA (desc_fecha) values(STR_TO_DATE(fecha_nac,'%d-%m-%Y %H:%i:%S'));
    select id_fecha into codigo_fecha from fecha where desc_fecha=STR_TO_DATE(fecha_nac,'%d-%m-%Y %H:%i:%S');
    if codigo_municipio < 1000 then select id * 10 into registro from sequence; else select id into registro from sequence; end if;
	if dpi_padre_e is not null and dpi_madre is not null then 
    insert into PERSONA values(CONCAT(registro, codigo_municipio), primer_nom, segundo_nom, tercer_nom, apellidoP, apellidoM );
	insert into ACTA_NAC values(null, codigo_fecha, CONCAT(registro, codigo_municipio), codigo_municipio, dpi_padre, dpi_madre, codigo_genero);
    UPDATE sequence SET id=id+1;
    end if;
END$$

call AddNacimiento(3564360470101, 3564360420101, 'Violet', 'Natalia', null, '07-07-2029', 0101, 'F');


call AddNacimiento(3564360440101, 3564360430101, 'Pedro', 'Saul', null, '07-07-2010', 0101, 'M');
call AddNacimiento(3564360440101, 3564360430101, 'Sofia', 'Violeta', null, STR_TO_DATE('07/06/2010','%d/%m/%Y %H:%i:%S'), 0101, 'F');

call AddNacimiento(1000000000101, 1000000100101, 'Raul', 'Riquelme', null, STR_TO_DATE('05/08/2020','%d/%m/%Y %H:%i:%S'), 1201, 'M');
call AddNacimiento(1000000000101, 1000000100101, 'Sofia', 'Violeta', null, STR_TO_DATE('06/05/2021','%d/%m/%Y %H:%i:%S'), 1201, 'F');

drop procedure if exists AddDefuncion;

DELIMITER $$
CREATE PROCEDURE AddDefuncion(IN cui_fallecido int8, IN fecha_fall varchar(10) , IN motivo_muerte varchar(50))
BEGIN
    declare codigo_fecha int8;
    declare codigo_fecha_nacido int8;
    declare fecha_nacido date;
	insert ignore into FECHA (desc_fecha) values(STR_TO_DATE(fecha_fall,'%d-%m-%Y %H:%i:%S'));
    select id_fecha into codigo_fecha from fecha where desc_fecha=STR_TO_DATE(fecha_fall,'%d-%m-%Y %H:%i:%S');
    select fecha_nac into codigo_fecha_nacido from acta_nac where persona=cui_fallecido;
	select desc_fecha into fecha_nacido from fecha where id_fecha=codigo_fecha_nacido;
    if DATE(STR_TO_DATE(fecha_fall,'%d-%m-%Y %H:%i:%S')) >= DATE(fecha_nacido) then insert ignore into ACTA_DEFUNCION values(null, codigo_fecha, cui_fallecido, motivo_muerte); end if;
	
END$$

call AddDefuncion(4000000021201, '20-04-2022', 'jugar free faller');
call AddDefuncion(4000000021201, '20-04-2022', 'otra cosa xd ');
call AddDefuncion(4000000031201, '05-05-2021', 'no se');
call AddDefuncion(4000000050101, '01-05-2022', 'no se');


drop procedure if exists AddMatrimonio;
DELIMITER $$
CREATE PROCEDURE AddMatrimonio(IN dpi_hombre int8, IN dpi_mujer int8 , IN fecha_matrimonio varchar(10))
BEGIN
    declare codigo_fecha int8;
    declare dpi_esposo int8;
	declare dpi_esposa int8;
    declare id_nacimiento_esposo int8;
    declare id_nacimiento_esposa int8;
    declare nacimiento_esposo date;
    declare nacimiento_esposa date;
	declare edad_esposo int;
    declare edad_esposa int;
    declare gen_esposo int8;
    declare gen_esposa int8;
    declare est_esposo int8;
    declare est_esposa int8;
    
	select id_dpi, estado_civil into dpi_esposo, est_esposo from dpi where id_dpi=dpi_hombre;
	select id_dpi, estado_civil into dpi_esposa, est_esposa from dpi where id_dpi=dpi_mujer;
    
    
    select fecha_nac, genero  into id_nacimiento_esposo, gen_esposo  from ACTA_NAC where persona = dpi_hombre;
	select fecha_nac, genero  into id_nacimiento_esposa, gen_esposa  from ACTA_NAC where persona = dpi_mujer;
    
	select desc_fecha into nacimiento_esposo from fecha where id_fecha=id_nacimiento_esposo;
	select desc_fecha into nacimiento_esposa from fecha where id_fecha=id_nacimiento_esposa;

    SELECT TIMESTAMPDIFF(YEAR, nacimiento_esposo, STR_TO_DATE(fecha_matrimonio,'%d-%m-%Y %H:%i:%S')) into edad_esposo;
	SELECT TIMESTAMPDIFF(YEAR, nacimiento_esposa, STR_TO_DATE(fecha_matrimonio,'%d-%m-%Y %H:%i:%S')) into edad_esposa;

	insert ignore into FECHA (desc_fecha) values(STR_TO_DATE(fecha_matrimonio,'%d-%m-%Y %H:%i:%S'));
    select id_fecha into codigo_fecha from fecha where desc_fecha=STR_TO_DATE(fecha_matrimonio,'%d-%m-%Y %H:%i:%S');
    
    if edad_esposo >=18 and edad_esposa >=18 and gen_esposo = 1 and gen_esposa = 2 and est_esposo != 2 and est_esposa != 2 and dpi_esposo is not null and dpi_esposa is not null 
    then 
    insert into ACTA_MATRI values(null, codigo_fecha, dpi_hombre, dpi_mujer); 
    update dpi set estado_civil = 2 where id_dpi = dpi_hombre;
	update dpi set estado_civil = 2 where id_dpi = dpi_mujer;
    end if;
END$$

call AddMatrimonio(3564360440101, 3564360430101, '20-04-1988');


call AddMatrimonio(3564360430101, 3564360440101, '20-04-1988');



call AddMatrimonio(3564360470101, 3564360420101, '20-04-1922');



SELECT TIMESTAMPDIFF(YEAR, '1997-06-21', '20-04-2022');



drop procedure if exists AddDivorcio;

DELIMITER $$
CREATE PROCEDURE AddDivorcio(IN acta_matrimonio int8, IN fecha_divorcio varchar(10))
BEGIN
    declare codigo_fecha int8;
	declare codigo_fecha_mat int8;
	declare fecha_mat date;

    declare dpi_esposo int8;
	declare dpi_esposa int8;
    
    declare est_esposo int8;
    declare est_esposa int8;
    
    select esposo, esposa, fecha into dpi_esposo, dpi_esposa, codigo_fecha_mat from acta_matri where id_acta_matri = acta_matrimonio;
    
    
	select estado_civil into est_esposo from dpi where id_dpi=dpi_esposo;
	select estado_civil into est_esposa from dpi where id_dpi=dpi_esposa;
    
	select desc_fecha into fecha_mat  from fecha where id_fecha=codigo_fecha_mat;


	insert ignore into FECHA (desc_fecha) values(STR_TO_DATE(fecha_divorcio,'%d-%m-%Y %H:%i:%S'));
    select id_fecha into codigo_fecha from fecha where desc_fecha=STR_TO_DATE(fecha_divorcio,'%d-%m-%Y %H:%i:%S');
    
    if date(STR_TO_DATE(fecha_divorcio,'%d-%m-%Y %H:%i:%S')) > date(fecha_mat) and est_esposo = 2 and est_esposa = 2 
    then 
    insert into ACTA_DIVORCIO values(null, codigo_fecha, acta_matrimonio); 
    update dpi set estado_civil = 3 where id_dpi = dpi_esposo;
	update dpi set estado_civil = 3 where id_dpi = dpi_esposa;
    end if;
END$$

call AddDivorcio(2, '19-04-1992');





select * from dpi;

select * from fecha;
select * from estado_civil;
select * from persona;
select * from acta_nac;
select * from acta_defuncion;
select * from acta_matri;
select * from acta_divorcio;



select * from municipio;
select * from genero;