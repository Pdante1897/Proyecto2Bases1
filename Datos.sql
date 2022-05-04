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

INSERT INTO  sequence VALUES (400000000);

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
insert into FECHA (desc_fecha) values(STR_TO_DATE('15/02/1930','%d/%m/%Y %H:%i:%S'));
insert into FECHA (desc_fecha) values(STR_TO_DATE('15/02/1940','%d/%m/%Y %H:%i:%S'));


insert into PERSONA values(9000000000101, 'Adan', null, null, 'White', null);
insert into PERSONA values(9000000000201, 'eva', null, null, 'Black', null);

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


insert into PERSONA values(2000000000101, 'Virgilio', null, null, 'Morales', null);
insert into PERSONA values(2000000010101, 'Mercedes', null, null, 'Santos', null);

insert into PERSONA values(1000000000101, 'Juan', 'Andres', null, 'Perez', 'Lopez');
insert into PERSONA values(1000000010101, 'Pedro', 'Juan', null, 'Ambrosio', 'Espania');
insert into PERSONA values(1000000020101, 'Mario', 'Roberto', null, 'De Leon', 'Leon');
insert into PERSONA values(1000000030101, 'Carlos', 'Andres', null, 'Rebolorio', 'Quiroa');
insert into PERSONA values(1000000040101, 'Keneth', 'Rolando', null, 'Guzman', 'Guzman');
insert into PERSONA values(1000000050101, 'Jony', null, null, 'Macario', 'Guzman');
insert into PERSONA values(1000000060101, 'Jonathan', 'Josue', null, 'Lopez', 'Quiniones');
insert into PERSONA values(1000000070101, 'Andrew', 'Ryan', null, 'Perez', 'Pelaez');
insert into PERSONA values(1000000080101, 'Pablo', 'Fernando', null, 'Juarez', 'Roldan');
insert into PERSONA values(1000000090101, 'Andres', 'Ricardo', null, 'Milos', 'Quinteros');


insert into PERSONA values(1000010000101, 'Juana', 'Andrea', null, 'Perez', 'Lopez');
insert into PERSONA values(1000010010101, 'Maria', 'Juana', null, 'Ambrosio', 'Espania');
insert into PERSONA values(1000010020101, 'Maria', 'Roberta', null, 'De Leon', 'Leon');
insert into PERSONA values(1000010030101, 'Carla', 'Andrea', null, 'Rebolorio', 'Quiroa');
insert into PERSONA values(1000010040101, 'Karen', 'Aurelia', null, 'Guzman', 'Guzman');
insert into PERSONA values(1000010050101, 'Jessy', null, null, 'Macario', 'Guzman');
insert into PERSONA values(1000010060101, 'Jessenia', 'Geraldin', null, 'Lopez', 'Quiniones');
insert into PERSONA values(1000010070101, 'Sandra', 'Rebeca', null, 'Perez', 'Pelaez');
insert into PERSONA values(1000010080101, 'Paola', 'Fernanda', null, 'Juarez', 'Roldan');
insert into PERSONA values(1000010090101, 'Andrea', 'Fernanda', null, 'Milos', 'Quinteros');


insert into PERSONA values(1900000100101, 'Maria', 'Rene', null, 'Leiva', 'Robledo');
insert into PERSONA values(1900000200101, 'Walter', null, null, 'Perez', 'Santos');


insert into DPI values(9000000000101, 1, 18, 0101);
insert into DPI values(9000000000201, 1, 18, 0101);

insert into DPI values(1900000100101, 1, 3, 406);
insert into DPI values(1900000200101, 1, 3, 406);

insert into DPI values(3564360440101, 1, 10, 0101);
insert into DPI values(3564360430101, 1, 9, 0101);

insert into DPI values(2000000000101, 1, 10, 501);
insert into DPI values(2000000010101, 1, 9, 501);

insert into DPI values(3564360480101, 1, 9, 0101);
insert into DPI values(3564360540101, 1, 10, 0101);




insert into ACTA_NAC values(null, 10, 3564360440101, 0101, 3564360480101, 3564360540101, 1);
insert into ACTA_NAC values(null, 9, 3564360430101, 0101, 2000000000101, 2000000010101, 2);

insert into ACTA_NAC values(null, 1, 3564360470101, 0101, 3564360440101, 3564360430101, 1);
insert into ACTA_NAC values(null, 7, 3564360420101, 0101, 1900000200101, 1900000100101, 2);



insert into ACTA_NAC values(null, 19, 1000000000101, 0101, 9000000000101, 9000000000201, 1);
insert into ACTA_NAC values(null, 19, 1000000010101, 0101, 9000000000101, 9000000000201, 1);
insert into ACTA_NAC values(null, 19, 1000000020101, 0101, 9000000000101, 9000000000201, 1);
insert into ACTA_NAC values(null, 19, 1000000030101, 0101, 9000000000101, 9000000000201, 1);
insert into ACTA_NAC values(null, 19, 1000000040101, 0101, 9000000000101, 9000000000201, 1);
insert into ACTA_NAC values(null, 19, 1000000050101, 0101, 9000000000101, 9000000000201, 1);
insert into ACTA_NAC values(null, 19, 1000000060101, 0101, 9000000000101, 9000000000201, 1);
insert into ACTA_NAC values(null, 19, 1000000070101, 0101, 9000000000101, 9000000000201, 1);
insert into ACTA_NAC values(null, 19, 1000000080101, 0101, 9000000000101, 9000000000201, 1);
insert into ACTA_NAC values(null, 19, 1000000090101, 0101, 9000000000101, 9000000000201, 1);

insert into ACTA_NAC values(null, 19, 1000010000101, 0101, 9000000000101, 9000000000201, 2);
insert into ACTA_NAC values(null, 19, 1000010010101, 0101, 9000000000101, 9000000000201, 2);
insert into ACTA_NAC values(null, 19, 1000010020101, 0101, 9000000000101, 9000000000201, 2);
insert into ACTA_NAC values(null, 19, 1000010030101, 0101, 9000000000101, 9000000000201, 2);
insert into ACTA_NAC values(null, 19, 1000010040101, 0101, 9000000000101, 9000000000201, 2);
insert into ACTA_NAC values(null, 19, 1000010050101, 0101, 9000000000101, 9000000000201, 2);
insert into ACTA_NAC values(null, 19, 1000010060101, 0101, 9000000000101, 9000000000201, 2);
insert into ACTA_NAC values(null, 19, 1000010070101, 0101, 9000000000101, 9000000000201, 2);
insert into ACTA_NAC values(null, 19, 1000010080101, 0101, 9000000000101, 9000000000201, 2);
insert into ACTA_NAC values(null, 19, 1000010090101, 0101, 9000000000101, 9000000000201, 2);



insert into DPI values(1000010000101, 1, 9, 0101);
insert into DPI values(1000010010101, 1, 9, 0101);
insert into DPI values(1000010020101, 1, 9, 0101);
insert into DPI values(1000010030101, 1, 9, 0101);
insert into DPI values(1000010040101, 1, 9, 0101);
insert into DPI values(1000010050101, 1, 9, 0101);
insert into DPI values(1000010060101, 1, 9, 0101);
insert into DPI values(1000010070101, 1, 9, 0101);
insert into DPI values(1000010080101, 1, 9, 0101);
insert into DPI values(1000010090101, 1, 9, 0101);


insert into DPI values(1000000000101, 1, 9, 0101);
insert into DPI values(1000000010101, 1, 9, 0101);
insert into DPI values(1000000020101, 1, 9, 0101);
insert into DPI values(1000000030101, 1, 9, 0101);
insert into DPI values(1000000040101, 1, 9, 0101);
insert into DPI values(1000000050101, 1, 9, 0101);
insert into DPI values(1000000060101, 1, 9, 0101);
insert into DPI values(1000000070101, 1, 9, 0101);
insert into DPI values(1000000080101, 1, 9, 0101);
insert into DPI values(1000000090101, 1, 9, 0101);





#--------------------------------------------------------------------------------------------------------
call generarDPI(3564360470101 , '18-04-2015', 0101);
call generarDPI(3564360420101 , '12-1-2024', 0101);


call AddNacimiento(3564360470101, 3564360420101, 'Violet', 'Natalia', null, '07-07-2029', 0101, 'F');
call AddNacimiento(3564360440101, 3564360430101, 'Pedro', 'Saul', null, '07-07-2010', 0101, 'M');
call AddNacimiento(3564360440101, 3564360430101, 'Sofia', 'Violeta', null, '07-06-2010', 0101, 'F');
call AddNacimiento(1000000090101, 1000010000101, 'Raul', 'Riquelme', null, '05-08-1980', 1201, 'M');
call AddNacimiento(1000000090101, 1000010000101, 'Sofia', 'Violeta', null, '06-05-1975', 1201, 'F');
call AddNacimiento(1000000080101, 1000010010101, 'Mario', 'Riquelme', null, '05-08-1988', 510, 'M');
call AddNacimiento(1000000080101, 1000010010101, 'Carla', 'Violeta', null, '06-05-1977', 510, 'F');
call AddNacimiento(1000000070101, 1000010020101, 'Pedro', 'Riquelme', null, '05-05-1984', 510, 'M');
call AddNacimiento(1000000070101, 1000010020101, 'Marla', 'Violeta', null, '06-01-1972', 510, 'F');
call AddNacimiento(1000000060101, 1000010030101, 'Rodrigo', 'Riquelme', null, '05-06-1988', 510, 'M');
call AddNacimiento(1000000060101, 1000010030101, 'Sara', 'Violeta', null, '06-04-1977', 510, 'F');
call AddNacimiento(1000000050101, 1000010040101, 'Federico', 'Riquelme', null, '05-08-1988', 510, 'M');
call AddNacimiento(1000000050101, 1000010040101, 'Perla', 'Violeta', null, '04-04-1978', 510, 'F');
call AddNacimiento(1000000040101, 1000010050101, 'Pablo', 'Riquelme', null, '04-06-1988', 510, 'M');
call AddNacimiento(1000000040101, 1000010050101, 'Penelope', 'Violeta', null, '06-05-1979', 510, 'F');
call AddNacimiento(1000000030101, 1000010060101, 'Ramiro', 'Riquelme', null, '15-05-1988', 510, 'M');
call AddNacimiento(1000000030101, 1000010060101, 'Raquel', 'Violeta', null, '13-03-1977', 510, 'F');


call generarDPI(4000000120510 , '18-04-2008', 0102);
call generarDPI(4000000130510 , '12-1-2008', 0102);


call AddDefuncion(4000000031201, '20-04-2022', 'jugar free faller');
call AddDefuncion(4000000050510, '19-05-2010', 'Paro cardiaco');
call AddDefuncion(4000000060510, '19-05-2013', 'Paro cardiaco');
call AddDefuncion(4000000070510, '19-10-2000', 'Apendicitis');
call AddDefuncion(4000000090510, '20-3-2015', 'Complicacion de neumonia');
call AddDefuncion(4000000100510, '17-05-2013', 'Covid-19');




call AddMatrimonio(1000000000101, 1000010090101, '20-01-1963');
call AddMatrimonio(1000000010101, 1000010080101, '20-02-1963');
call AddMatrimonio(1000000020101, 1000010070101, '20-03-1963');
call AddMatrimonio(1000000030101, 1000010060101, '20-04-1963');
call AddMatrimonio(1000000040101, 1000010050101, '20-05-1963');
call AddMatrimonio(1000000050101, 1000010040101, '20-06-1963');
call AddMatrimonio(1000000060101, 1000010030101, '20-07-1963');
call AddMatrimonio(1000000070101, 1000010020101, '20-08-1963');
call AddMatrimonio(1000000080101, 1000010010101, '20-09-1963');
call AddMatrimonio(1000000090101, 1000010000101, '20-10-1963');
call AddMatrimonio(3564360440101, 3564360430101, '20-04-1988');
call AddMatrimonio(3564360470101, 3564360420101, '7-10-2027');


call AddDivorcio(2, '19-04-1995');
call AddDivorcio(3, '19-04-1994');
call AddDivorcio(4, '19-04-1993');
call AddDivorcio(5, '19-04-1992');
call AddDivorcio(6, '19-04-1991');
call AddDivorcio(8, '19-04-1990');



call AddLicencia(3564360470101 , '18-04-2018', 'E');
call AddLicencia(3564360470101 , '18-04-2018', 'M');
call AddLicencia(3564360470101 , '18-04-2018', 'C');

call AddLicencia(3564360440101 , '15-07-2000', 'C');
call AddLicencia(3564360440101 , '15-07-2000', 'M');


call AddLicencia(3564360420101 , '18-04-2022', 'C');

call AddLicencia(4000000120510 , '18-04-2008', 'C');
call AddLicencia(4000000130510 , '18-04-2008', 'C');

call AddLicencia(4000000120510 , '18-04-2008', 'M');
call AddLicencia(4000000130510 , '18-04-2008', 'M');

call AddLicencia(1000000070101 , '5-01-2000', 'E');



/*
call renewLicencia(2, 3 , '25-4-2019', 'C');
call renewLicencia(7, 3 , '25-4-2019', 'C');

call renewLicencia(11, 4 , '10-4-2019', 'E');
call renewLicencia(12, 4 , '10-4-2019', 'M');

call renewLicencia(9, 3 , '15-4-2028', 'A');
call renewLicencia(9, 3 , '15-4-2025', 'B');
call renewLicencia(9, 3 , '15-4-2022', 'C');

call renewLicencia(9, 3 , '15-4-2025', 'B');
call renewLicencia(9, 3 , '15-4-2025', 'B');
call renewLicencia(9, 3 , '15-4-2025', 'B');

call anularLicencia(1,'10-12-2018', 'Exceso de velocidad');





call getNacimiento(3564360470101);
call getDPI(3564360470101);
call getLicencias(3564360440101);
call getLicencias(3564360470101);
call getDivorcio(2);
call getDefuncion(4000000021201);
call getMatrimonio(1);



select * from municipio;
select * from fecha;
select * from dpi;
select * from genero;
select * from persona;
select * from acta_nac;
select * from acta_matri;
select * from acta_divorcio;
select * from acta_defuncion;
select * from licencia_conducir;

select * from persona;

SELECT * FROM ESTADO_CIVIL;

delete from persona where cui = 4000000031201

*/