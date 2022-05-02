 
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
    else
    select concat( 'no se pudo, me dio amsieda :c ') as 'mensaje error';
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
    if DATE(STR_TO_DATE(fecha_fall,'%d-%m-%Y %H:%i:%S')) >= DATE(fecha_nacido) then insert ignore into ACTA_DEFUNCION values(null, codigo_fecha, cui_fallecido, motivo_muerte); 
    else
    select concat( 'no se pudo, me dio amsieda :c ') as 'mensaje error';
    end if;
	
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
    else
    select concat( 'no se pudo, me dio amsieda :c ') as 'mensaje error';
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
    else
    select concat( 'no se pudo, me dio amsieda :c ') as 'mensaje error';
    end if;
END$$

call AddDivorcio(2, '19-04-1992');

drop procedure if exists AddLicencia;

DELIMITER $$
CREATE PROCEDURE AddLicencia(IN cui int8, IN fecha_emision varchar(10), IN tipo char)
BEGIN
	declare codigo_fecha int8;
	declare codigo_fechafin int8;

    declare codigo_fecha_nac int8;
	declare codigo_fecha_antiguedad_c int;
	declare codigo_fecha_antiguedad_b int;

    declare fecha_nacido date;
    declare fecha_antiguedad_c date;
	declare fecha_antiguedad_b date;

	declare antiguedad_c int;
	declare antiguedad_b int;
    declare edad int;
    
    declare licencia_c int;
    declare licencia_b int;
    
	declare licencia_tipo_a int8;
	declare licencia_tipo_b int8;
	declare licencia_tipo_c int8;
	declare licencia_tipo_e int8;
	declare licencia_tipo_m int8;

    declare codigo_tipo int8;
    
    
    select id_tipo into codigo_tipo from tipo_licencia where nombre_tipo=tipo;
    
    select fecha_nac  into codigo_fecha_nac  from ACTA_NAC where persona = cui;
	select desc_fecha into fecha_nacido from fecha where id_fecha=codigo_fecha_nac;
	SELECT TIMESTAMPDIFF(YEAR, fecha_nacido, STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S')) into edad;

	insert ignore into FECHA (desc_fecha) values(STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S'));
    select id_fecha into codigo_fecha from fecha where desc_fecha=STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S');
    
    insert ignore into FECHA (desc_fecha) values(DATE_ADD(STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S'), INTERVAL 1 year));
    select id_fecha into codigo_fechafin from fecha where desc_fecha=DATE_ADD(STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S'), INTERVAL 1 year);
    
    select id_licencia into licencia_tipo_a from LICENCIA_CONDUCIR where cui=persona and tipo_licencia = 1;
	select id_licencia into licencia_tipo_b from LICENCIA_CONDUCIR where cui=persona and tipo_licencia = 2;
    select id_licencia into licencia_tipo_c from LICENCIA_CONDUCIR where cui=persona and tipo_licencia = 3;
	select id_licencia into licencia_tipo_m from LICENCIA_CONDUCIR where cui=persona and tipo_licencia = 4;
    select id_licencia into licencia_tipo_e from LICENCIA_CONDUCIR where cui=persona and tipo_licencia = 5;

	select id_licencia, fecha into licencia_c, codigo_fecha_antiguedad_c from LICENCIA_CONDUCIR where cui=persona and tipo_licencia=3;
	select id_licencia, fecha into licencia_b, codigo_fecha_antiguedad_b from LICENCIA_CONDUCIR where cui=persona and tipo_licencia=2;

	select desc_fecha into fecha_antiguedad_c from fecha where id_fecha=codigo_fecha_antiguedad_c;
	select desc_fecha into fecha_antiguedad_b from fecha where id_fecha=codigo_fecha_antiguedad_b;


	SELECT TIMESTAMPDIFF(YEAR, fecha_antiguedad_c, STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S')) into antiguedad_c;
	SELECT TIMESTAMPDIFF(YEAR, fecha_antiguedad_b, STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S')) into antiguedad_b;

    if licencia_tipo_c is null and tipo = 'C' 
    then 
			if edad >= 16 
            then
				insert into LICENCIA_CONDUCIR values(null, cui, codigo_tipo, codigo_fecha);
				select id_licencia into licencia_c from LICENCIA_CONDUCIR where cui=persona and tipo_licencia=3;
                insert into VIGENCIA values(null, licencia_c, codigo_fecha, codigo_fechafin);

			else
				select concat( 'no se pudo, edad insuficiente para licencia, y me dio amsieda :c ') as 'mensaje error';
			end if;
	elseif licencia_tipo_m is null and 	tipo = 'M'    
    then 
			if edad >= 16 
            then
				insert into LICENCIA_CONDUCIR values(null, cui, codigo_tipo, codigo_fecha);
                select id_licencia into licencia_m from LICENCIA_CONDUCIR where cui=persona and tipo_licencia=4;
                insert into VIGENCIA values(null, licencia_c, codigo_fecha, codigo_fechafin);
			else
				select concat( 'no se pudo, edad insuficiente para licencia, y me dio amsieda :c ') as 'mensaje error';
			end if;
		
	elseif licencia_tipo_e is null and 	tipo = 'E'   
    then 
			if edad >= 16 
            then
				insert into LICENCIA_CONDUCIR values(null, cui, codigo_tipo, codigo_fecha);
                select id_licencia into licencia_e from LICENCIA_CONDUCIR where cui=persona and tipo_licencia=5;
                insert into VIGENCIA values(null, licencia_c, codigo_fecha, codigo_fechafin);
			else
				select concat( 'no se pudo, edad insuficiente para licencia, y me dio amsieda :c ') as 'mensaje error';
			end if;
		
	elseif licencia_tipo_b is null and 	tipo = 'B'
    then
			if edad >= 23  and antiguedad_c >=2
			then
				insert into LICENCIA_CONDUCIR values(null, cui, codigo_tipo, codigo_fecha);
			else
				select concat( 'no se pudo, edad insuficiente para licencia, y me dio amsieda :c ') as 'mensaje error';
			end if;
	elseif licencia_tipo_a is null and 	tipo = 'A'
        then
			if edad >= 25  and antiguedad_c >=3 or antiguedad_b>=3 
            then
				insert into LICENCIA_CONDUCIR values(null, cui, codigo_tipo, codigo_fecha);
			else
				select concat( 'no se pudo, edad insuficiente para licencia, y me dio amsieda :c ') as 'mensaje error';
			end if;
		else
			select concat( 'no se pudo, revisa tipo de licencia que me dio amsieda :c ') as 'mensaje error';
	end if;
    
END$$

call AddLicencia(3564360470101 , '18-04-2018', 'M');

call AddLicencia(3564360440101 , '18-04-2018', 'C');
call AddLicencia(3564360470101 , '18-04-2018', 'A');
call AddLicencia(3564360470101 , '18-04-2023', 'B');

call AddLicencia(3564360420101 , '18-04-2022', 'C');



drop procedure if exists renewLicencia;

DELIMITER $$
CREATE PROCEDURE renewLicencia(IN cui int8, IN fecha_emision varchar(10), IN tipo char)
BEGIN
	declare codigo_fecha int8;
	declare codigo_fechafin int8;

    declare codigo_fecha_nac int8;
	declare codigo_fecha_antiguedad_c int;
	declare codigo_fecha_antiguedad_b int;

    declare fecha_nacido date;
    declare fecha_antiguedad_c date;
	declare fecha_antiguedad_b date;

	declare antiguedad_c int;
	declare antiguedad_b int;
    declare edad int;
    
    declare licencia_c int;
    declare licencia_b int;
    
	declare licencia_tipo_a int8;
	declare licencia_tipo_b int8;
	declare licencia_tipo_c int8;
	declare licencia_tipo_e int8;
	declare licencia_tipo_m int8;

    declare codigo_tipo int8;
    
    
    select id_tipo into codigo_tipo from tipo_licencia where nombre_tipo=tipo;
    
    select fecha_nac  into codigo_fecha_nac  from ACTA_NAC where persona = cui;
	select desc_fecha into fecha_nacido from fecha where id_fecha=codigo_fecha_nac;
	SELECT TIMESTAMPDIFF(YEAR, fecha_nacido, STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S')) into edad;

	insert ignore into FECHA (desc_fecha) values(STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S'));
    select id_fecha into codigo_fecha from fecha where desc_fecha=STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S');
    
    insert ignore into FECHA (desc_fecha) values(DATE_ADD(STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S'), INTERVAL 1 year));
    select id_fecha into codigo_fechafin from fecha where desc_fecha=DATE_ADD(STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S'), INTERVAL 1 year);
    
    select id_licencia into licencia_tipo_a from LICENCIA_CONDUCIR where cui=persona and tipo_licencia = 1;
	select id_licencia into licencia_tipo_b from LICENCIA_CONDUCIR where cui=persona and tipo_licencia = 2;
    select id_licencia into licencia_tipo_c from LICENCIA_CONDUCIR where cui=persona and tipo_licencia = 3;
	select id_licencia into licencia_tipo_m from LICENCIA_CONDUCIR where cui=persona and tipo_licencia = 4;
    select id_licencia into licencia_tipo_e from LICENCIA_CONDUCIR where cui=persona and tipo_licencia = 5;

	select id_licencia, fecha into licencia_c, codigo_fecha_antiguedad_c from LICENCIA_CONDUCIR where cui=persona and tipo_licencia=3;
	select id_licencia, fecha into licencia_b, codigo_fecha_antiguedad_b from LICENCIA_CONDUCIR where cui=persona and tipo_licencia=2;

	select desc_fecha into fecha_antiguedad_c from fecha where id_fecha=codigo_fecha_antiguedad_c;
	select desc_fecha into fecha_antiguedad_b from fecha where id_fecha=codigo_fecha_antiguedad_b;


	SELECT TIMESTAMPDIFF(YEAR, fecha_antiguedad_c, STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S')) into antiguedad_c;
	SELECT TIMESTAMPDIFF(YEAR, fecha_antiguedad_b, STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S')) into antiguedad_b;

    if licencia_tipo_c is null and tipo = 'C' 
    then 
			if edad >= 16 
            then
				insert into LICENCIA_CONDUCIR values(null, cui, codigo_tipo, codigo_fecha);
				select id_licencia into licencia_c from LICENCIA_CONDUCIR where cui=persona and tipo_licencia=3;
                insert into VIGENCIA values(null, licencia_c, codigo_fecha, codigo_fechafin);

			else
				select concat( 'no se pudo, edad insuficiente para licencia, y me dio amsieda :c ') as 'mensaje error';
			end if;
	elseif licencia_tipo_m is null and 	tipo = 'M'    
    then 
			if edad >= 16 
            then
				insert into LICENCIA_CONDUCIR values(null, cui, codigo_tipo, codigo_fecha);
                select id_licencia into licencia_m from LICENCIA_CONDUCIR where cui=persona and tipo_licencia=4;
                insert into VIGENCIA values(null, licencia_c, codigo_fecha, codigo_fechafin);
			else
				select concat( 'no se pudo, edad insuficiente para licencia, y me dio amsieda :c ') as 'mensaje error';
			end if;
		
	elseif licencia_tipo_e is null and 	tipo = 'E'   
    then 
			if edad >= 16 
            then
				insert into LICENCIA_CONDUCIR values(null, cui, codigo_tipo, codigo_fecha);
                select id_licencia into licencia_e from LICENCIA_CONDUCIR where cui=persona and tipo_licencia=5;
                insert into VIGENCIA values(null, licencia_c, codigo_fecha, codigo_fechafin);
			else
				select concat( 'no se pudo, edad insuficiente para licencia, y me dio amsieda :c ') as 'mensaje error';
			end if;
		
	elseif licencia_tipo_b is null and 	tipo = 'B'
    then
			if edad >= 23  and antiguedad_c >=2
			then
				insert into LICENCIA_CONDUCIR values(null, cui, codigo_tipo, codigo_fecha);
			else
				select concat( 'no se pudo, edad insuficiente para licencia, y me dio amsieda :c ') as 'mensaje error';
			end if;
	elseif licencia_tipo_a is null and 	tipo = 'A'
        then
			if edad >= 25  and antiguedad_c >=3 or antiguedad_b>=3 
            then
				insert into LICENCIA_CONDUCIR values(null, cui, codigo_tipo, codigo_fecha);
			else
				select concat( 'no se pudo, edad insuficiente para licencia, y me dio amsieda :c ') as 'mensaje error';
			end if;
		else
			select concat( 'no se pudo, revisa tipo de licencia que me dio amsieda :c ') as 'mensaje error';
	end if;
    
END$$





drop procedure if exists generarDPI;

DELIMITER $$
CREATE PROCEDURE generarDPI(IN cui int8, IN fecha_emision varchar(10), IN codigo_municipio int8)
BEGIN
	declare codigo_fecha int8;
    declare codigo_fecha_nac int8;
    declare fecha_nacido date;
	declare codigo_dpi int8;

    declare edad int;
    
	insert ignore into FECHA (desc_fecha) values(STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S'));
    select id_fecha into codigo_fecha from fecha where desc_fecha=STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S');

	select fecha_nac  into codigo_fecha_nac  from ACTA_NAC where persona = cui;
	select desc_fecha into fecha_nacido from fecha where id_fecha=codigo_fecha_nac;
	SELECT TIMESTAMPDIFF(YEAR, fecha_nacido, STR_TO_DATE(fecha_emision,'%d-%m-%Y %H:%i:%S')) into edad;

	select id_dpi into codigo_dpi from dpi where cui=id_dpi;

	if edad >= 18 and codigo_dpi is null 
    then 
		insert into dpi values (cui, 1, codigo_fecha, codigo_municipio); 
    else
		select concat( 'no se pudo, revisa si cumple requisitos que me dio amsieda :c ') as 'mensaje error';
    end if;

END$$

call generarDPI(3564360470101 , '18-04-2015', 0101);


















drop procedure if exists getNacimiento;

DELIMITER $$
CREATE PROCEDURE getNacimiento(IN cui int8)
BEGIN
	select id_acta_nac as no_acta , persona.cui as cui, concat(persona.apellido1, ' ', ifnull(persona.apellido2,'')) as apellidos, 
    concat(persona.nombre1, ' ', ifnull(persona.nombre2,''), ' ', ifnull(persona.nombre3,'')) as nombres, padre as dpi_padre,
    (select concat(persona.nombre1, ' ', ifnull(persona.nombre2,''), ' ', ifnull(persona.nombre3,'')) from persona where persona.cui= dpi_padre) as nombres_padre,
    (select     concat(persona.apellido1, ' ', ifnull(persona.apellido2,'')) from persona where persona.cui= dpi_padre) as apellidos_padre,
    madre as dpi_madre,
    (select concat(persona.nombre1, ' ', ifnull(persona.nombre2,''), ' ', ifnull(persona.nombre3,'')) from persona where persona.cui= dpi_madre) as nombres_madre,
    (select     concat(persona.apellido1, ' ', ifnull(persona.apellido2,'')) from persona where persona.cui= dpi_madre) as apellidos_madre,
    desc_fecha as fecha, nombre_departamento as departamento, nombre_municipio as municipio, nombre_genero as genero
    from acta_nac inner join persona inner join fecha on fecha_nac=id_fecha inner join municipio on acta_nac.municipio=id_municipio 
    inner join departamento on municipio.departamento = id_departamento  
    inner join genero on acta_nac.genero = id_genero
    where acta_nac.persona = persona.cui and persona.cui = cui ;
END$$
    
call getNacimiento(3564360420101);


drop procedure if exists getDPI;

DELIMITER $$
CREATE PROCEDURE getDPI(IN cui_persona int8)
BEGIN
	select persona.cui as cui , concat(persona.apellido1, ' ', ifnull(persona.apellido2,'')) as apellidos, 
    concat(persona.nombre1, ' ', ifnull(persona.nombre2,''), ' ', ifnull(persona.nombre3,'')) as nombres,
    desc_fecha as fecha_mac, nombre_departamento as departamento, nombre_municipio as municipio,
    (select nombre_departamento from departamento inner join municipio on municipio.departamento=id_departamento where municipio.id_municipio = dpi.municipio) as departamento_vecindad, 
    (select nombre_municipio from municipio where municipio.id_municipio = dpi.municipio) as municipio_vecindad,
    nombre_genero as Genero
    from dpi inner join persona on persona.cui = cui_persona
    inner join municipio on dpi.municipio=id_municipio 
    inner join departamento on municipio.departamento = id_departamento  
    inner join acta_nac on acta_nac.persona = cui
	inner join fecha on acta_nac.fecha_nac=id_fecha 
    inner join genero on acta_nac.genero = id_genero
    where dpi.id_dpi = persona.cui ;
END$$

call getDPI(3564360470101);


drop procedure if exists getDivorcio;

DELIMITER $$
CREATE PROCEDURE getDivorcio(IN codigo_matri int8)
BEGIN
	select id_act_div as NoDivorcio, acta_matri.esposo as DPIHombre,
    (select concat(persona.nombre1, ' ', ifnull(persona.nombre2,''), ' ', ifnull(persona.nombre3,''),persona.apellido1, ' ', ifnull(persona.apellido2,'')) from persona where persona.cui= acta_matri.esposo) as NombreHombre,
	acta_matri.esposa as DPIMujer,
    (select concat(persona.nombre1, ' ', ifnull(persona.nombre2,''), ' ', ifnull(persona.nombre3,''),persona.apellido1, ' ', ifnull(persona.apellido2,'')) from persona where persona.cui= acta_matri.esposa) as NombreMujer,
	desc_fecha as Fecha
    from acta_divorcio inner join acta_matri on acta_matri.id_acta_matri=acta_divorcio.acta_matri
	inner join fecha on acta_divorcio.fecha=id_fecha 
    where acta_divorcio.acta_matri=codigo_matri;
END$$


call getDivorcio(2);


drop procedure if exists getDefuncion;

DELIMITER $$
CREATE PROCEDURE getDefuncion(IN cui int8)
BEGIN
	select id_acta_def as NoActa , persona.cui as CUI, concat(persona.apellido1, ' ', ifnull(persona.apellido2,'')) as Apellidos, 
    concat(persona.nombre1, ' ', ifnull(persona.nombre2,''), ' ', ifnull(persona.nombre3,'')) as Nombres,
    desc_fecha as FechaFallecimiento, nombre_departamento as departamento, nombre_municipio as municipio, nombre_genero as Genero,
    acta_defuncion.motivo as Motivo
    from acta_defuncion 
    inner join persona     
    inner join acta_nac on acta_nac.persona = cui
    inner join fecha on acta_defuncion.fecha=id_fecha inner join municipio on acta_nac.municipio=id_municipio 
    inner join departamento on municipio.departamento = id_departamento  
    inner join genero on acta_nac.genero = id_genero
    where acta_defuncion.persona = persona.cui and persona.cui = cui ;
END$$

call getDefuncion(4000000021201);


drop procedure if exists getMatrimonio;

DELIMITER $$
CREATE PROCEDURE getMatrimonio(IN codigo_matri int8)
BEGIN
	select id_acta_matri as NoDivorcio, acta_matri.esposo as DPIHombre,
    (select concat(persona.nombre1, ' ', ifnull(persona.nombre2,''), ' ', ifnull(persona.nombre3,''),persona.apellido1, ' ', ifnull(persona.apellido2,'')) from persona where persona.cui= acta_matri.esposo) as NombreHombre,
	acta_matri.esposa as DPIMujer,
    (select concat(persona.nombre1, ' ', ifnull(persona.nombre2,''), ' ', ifnull(persona.nombre3,''),persona.apellido1, ' ', ifnull(persona.apellido2,'')) from persona where persona.cui= acta_matri.esposa) as NombreMujer,
	desc_fecha as fecha
    from acta_matri  
	inner join fecha on acta_matri.fecha=id_fecha 
    where acta_matri.id_acta_matri=codigo_matri;
END$$


call getMatrimonio(1);





select*from licencia_conducir;

select * from dpi;
select * from tipo_licencia;

select * from fecha;
select * from estado_civil;
select * from persona;
select * from acta_nac;
select * from acta_defuncion;
select * from acta_matri;
select * from acta_divorcio;



select * from municipio;
select * from genero;