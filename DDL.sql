drop database proyecto2;
create database PROYECTO2;
use PROYECTO2;

create table PERSONA(
	cui numeric not null primary key,
    nombre1 varchar(25) not null,
    nombre2 varchar(25) null,
    nombre3 varchar(25) null,
    apellido1 varchar(25) not null,
    apellido2 varchar(25) null
);

create table FECHA(
	id_fecha numeric not null primary key,
    desc_fecha date not null
);

create table MUNICIPIO(
	id_municipio numeric not null primary key,
    nombre_municipio varchar(30) not null,
    departamento numeric not null
);

create table DEPARTAMENTO(
	id_departamento numeric not null primary key,
    nombre_departamento varchar(30) not null
);

create table GENERO(
	id_genero numeric not null primary key,
    nombre_genero varchar(10) not null
);

create table TIPO_LICENCIA(
	id_tipo numeric not null primary key,
    nombre_tipo char not null
);

create table ESTADO_CIVIL(
	id_estado_civil numeric not null primary key,
    nombre_estado_civil varchar(10) not null
);

create table DPI(
	id_dpi numeric not null primary key,
    cui numeric not null,
    estado_civil numeric not null,
    fecha numeric not null,
    municipio numeric not null
);

create table ACTA_NAC(
	id_acta_nac numeric not null primary key,
    fecha_nac numeric not null,
    persona numeric not null,
    municipio numeric not null,
    padre numeric not null,
    madre numeric not null,
    genero numeric not null
);

create table ACTA_MATRI(
	id_acta_matri numeric not null primary key,
    fecha numeric not null,
    esposo numeric not null,
    esposa numeric not null
);

create table ACTA_DIVORCIO(
	id_act_div numeric not null primary key,
    fecha numeric not null,
    acta_matri numeric not null
);

create table ACTA_DEFUNCION(
	id_acta_def numeric not null primary key,
    fecha numeric not null,
    persona numeric not null,
    municipio numeric not null
);

create table LICENCIA_CONDUCIR(
	id_licencia numeric not null primary key,
    persona numeric not null,
    tipo_licencia numeric not null,
    fecha numeric not null
);

create table ANULADA(
	id_anuladas numeric not null primary key,
    licencia_conducir numeric not null,
    motivo varchar(50) not null
);

create table VIGENCIA(
	id_vigencia numeric not null primary key,
    licencia_conducir numeric not null, 
    fecha_inicio numeric not null,
    fecha_expiracion numeric not null
);


alter table ACTA_NAC 
ADD FOREIGN KEY (genero) REFERENCES GENERO(id_genero); 

alter table ACTA_NAC 
ADD FOREIGN KEY (padre) REFERENCES DPI(id_dpi); 

alter table ACTA_NAC 
ADD FOREIGN KEY (madre) REFERENCES DPI(id_dpi); 

alter table ACTA_NAC 
ADD FOREIGN KEY (municipio) REFERENCES MUNICIPIO(id_municipio); 

alter table ACTA_NAC 
ADD FOREIGN KEY (fecha_nac) REFERENCES FECHA(id_fecha); 

alter table ACTA_NAC 
ADD FOREIGN KEY (persona) REFERENCES PERSONA(cui); 

alter table DPI
ADD FOREIGN KEY (cui) REFERENCES PERSONA(cui); 

alter table DPI
ADD FOREIGN KEY (fecha) REFERENCES FECHA(id_fecha); 

alter table DPI
ADD FOREIGN KEY (municipio) REFERENCES MUNICIPIO(id_municipio); 

alter table DPI
ADD FOREIGN KEY (estado_civil) REFERENCES ESTADO_CIVIL(id_estado_civil); 

alter table ACTA_MATRI
ADD FOREIGN KEY (esposo) REFERENCES DPI(id_dpi); 

alter table ACTA_MATRI
ADD FOREIGN KEY (esposa) REFERENCES DPI(id_dpi); 

alter table ACTA_MATRI
ADD FOREIGN KEY (fecha) REFERENCES FECHA(id_fecha); 

alter table ACTA_DIVORCIO
ADD FOREIGN KEY (acta_matri) REFERENCES ACTA_MATRI(id_acta_matri); 

alter table ACTA_DIVORCIO
ADD FOREIGN KEY (fecha) REFERENCES FECHA(id_fecha); 

alter table MUNICIPIO
ADD FOREIGN KEY (departamento) REFERENCES DEPARTAMENTO(id_departamento); 

alter table ACTA_DEFUNCION
ADD FOREIGN KEY (fecha) REFERENCES FECHA(id_fecha); 

alter table ACTA_DEFUNCION
ADD FOREIGN KEY (municipio) REFERENCES MUNICIPIO(id_municipio); 

alter table ACTA_DEFUNCION
ADD FOREIGN KEY (persona) REFERENCES PERSONA(cui); 

alter table LICENCIA_CONDUCIR
ADD FOREIGN KEY (fecha) REFERENCES FECHA(id_fecha); 

alter table LICENCIA_CONDUCIR
ADD FOREIGN KEY (persona) REFERENCES PERSONA(cui); 

alter table LICENCIA_CONDUCIR
ADD FOREIGN KEY (tipo_licencia) REFERENCES TIPO_LICENCIA(id_tipo); 

alter table VIGENCIA
ADD FOREIGN KEY (fecha_inicio) REFERENCES FECHA(id_fecha); 

alter table VIGENCIA
ADD FOREIGN KEY (fecha_expiracion) REFERENCES FECHA(id_fecha); 

alter table VIGENCIA
ADD FOREIGN KEY (licencia_conducir) REFERENCES LICENCIA_CONDUCIR(id_licencia); 










