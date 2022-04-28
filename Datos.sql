#--------------------Carga de departamentos
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/departamentos.csv' 
IGNORE
INTO TABLE DEPARTAMENTO 
fields terminated by ';' 
lines terminated by '\n' 
ignore 1 lines(id_departamento, nombre_departamento);

#---------------------Carga de municipios
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/municipios.csv' 
IGNORE
INTO TABLE MUNICIPIO
fields terminated by ';' 
lines terminated by '\n' 
ignore 1 lines(id_municipio, nombre_municipio, departamento);


insert into GENERO (nombre_genero) values('M');
insert into GENERO (nombre_genero) values('F');

insert into TIPO_LICENCIA (nombre_tipo) values('A');
insert into TIPO_LICENCIA (nombre_tipo) values('B');
insert into TIPO_LICENCIA (nombre_tipo) values('C');
insert into TIPO_LICENCIA (nombre_tipo) values('M');
insert into TIPO_LICENCIA (nombre_tipo) values('E');

insert into ESTADO_CIVIL (nombre_estado_civil) values('soltero');
insert into ESTADO_CIVIL (nombre_estado_civil) values('casado');
insert into ESTADO_CIVIL (nombre_estado_civil) values('divorciado');
insert into ESTADO_CIVIL (nombre_estado_civil) values('viudo');

insert into FECHA (desc_fecha) values(STR_TO_DATE('18/04/1997','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('18/04/1998','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('28/08/1990','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('19/09/1988','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('29/09/1996','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('06/03/1998','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('29/12/2005','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('01/10/2000','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('15/06/1967','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('15/07/1960','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('11/08/1967','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('13/04/2004','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('10/05/2003','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('25/04/1950','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('07/05/1997','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('31/12/1998','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('15/02/2002','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('28/08/1990','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('28/08/1990','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('28/08/1990','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('28/08/1990','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('28/08/1990','%d/%m/%Y %H:%i:%S'));

insert into PERSONA values(3564360470101, 'Bryan', 'Gerardo', null,'Paez', 'Morales');
insert into PERSONA values(3564360460101, 'Douglas', 'Alexsander', null,'Paez', 'Morales');
insert into PERSONA values(3564360450101, 'Nestor', 'Ariel', null,'Paez', 'Morales');
insert into PERSONA values(3564360440101, 'Cesar', 'Augusto', null,'Paez', 'Pinto');
insert into PERSONA values(3564360430101, 'Natalia', 'De Jesus', null,'Morales', 'Santos');
insert into PERSONA values(3564360420101, 'Maria', 'Ximena', null,'Perez', 'Leiva');
insert into PERSONA values(3564360410101, 'Carlos', 'Eduardo', null,'Paez', 'Pinto');
insert into PERSONA values(3564360400101, 'Nixon', 'Rolando', null,'Paez', 'Pinto');
insert into PERSONA values(3564360390101, 'Salvador', null, null,'Paez', 'Pinto');
insert into PERSONA values(3564360480101, 'Alberto', null, null,'Paez', 'Contreras');
insert into PERSONA values(3564360540101, 'Blanca', 'Iris', 'Cleotilde','Pinto', 'Landaverry');
insert into PERSONA values(3564360490101, 'Bianca', null, null,'Paez', 'Arriola');
insert into PERSONA values(3564360500101, 'Irantzu', null, null,'Gonzales', null);
insert into PERSONA values(3564360510101, 'Gael', 'Alejandro', null,'Gonzales', null);
insert into PERSONA values(3564360520101, 'Jennifer', 'Paola', null,'Lopez', 'Muralles');
insert into PERSONA values(3564360530101, 'Andrea', null, null,'Alaniz', null);







select * from persona;

SELECT * FROM ESTADO_CIVIL;

