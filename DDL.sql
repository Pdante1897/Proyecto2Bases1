drop database proyecto2;
create database PROYECTO2;
use PROYECTO2;

create table PERSONA(
	cui int8 primary key,
    nombre1 varchar(25) not null,
    nombre2 varchar(25) null,
    nombre3 varchar(25) null,
    apellido1 varchar(25) not null,
    apellido2 varchar(25) null
);

create table FECHA(
	id_fecha int8 auto_increment primary key,
    desc_fecha date not null unique
);

create table MUNICIPIO(
	id_municipio int8 primary key,
    nombre_municipio varchar(30) not null,
    departamento int8 not null
);

create table DEPARTAMENTO(
	id_departamento int8 primary key,
    nombre_departamento varchar(30) not null
);

create table GENERO(
	id_genero int8 auto_increment primary key,
    nombre_genero char not null
);

create table TIPO_LICENCIA(
	id_tipo int8 auto_increment primary key,
    nombre_tipo char not null
);

create table ESTADO_CIVIL(
	id_estado_civil int8 auto_increment primary key,
    nombre_estado_civil varchar(10) not null
);

create table DPI(
	id_dpi int8 primary key,
    estado_civil int8 not null,
    fecha int8 not null,
    municipio int8 not null
);

create table ACTA_NAC(
	id_acta_nac int8 auto_increment primary key,
    fecha_nac int8 not null,
    persona int8 not null unique,
    municipio int8 not null,
    padre int8 not null,
    madre int8 not null,
    genero int8 not null
);

create table ACTA_MATRI(
	id_acta_matri int8 auto_increment primary key,
    fecha int8 not null,
    esposo int8 not null,
    esposa int8 not null
);

create table ACTA_DIVORCIO(
	id_act_div int8 auto_increment primary key,
    fecha int8 not null,
    acta_matri int8 not null
);

create table ACTA_DEFUNCION(
	id_acta_def int8 auto_increment primary key,
    fecha int8 not null,
    persona int8 not null unique,
    motivo varchar(50) not null
);

create table LICENCIA_CONDUCIR(
	id_licencia int8 auto_increment primary key,
    persona int8 not null,
    tipo_licencia int8 not null,
    fecha int8 not null
);

create table ANULADA(
	id_anuladas int8 auto_increment primary key,
    licencia_conducir int8 not null,
    fecha_anulada int8 not null,
    motivo varchar(50) not null
);

create table VIGENCIA(
	id_vigencia int8 auto_increment primary key,
    licencia_conducir int8 not null, 
    fecha_inicio int8 not null,
    fecha_expiracion int8 not null
);


CREATE TABLE if not exists sequence (id INT NOT NULL);

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
ADD FOREIGN KEY (id_dpi) REFERENCES PERSONA(cui); 

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

alter table ANULADA
ADD FOREIGN KEY (licencia_conducir) REFERENCES LICENCIA_CONDUCIR(id_licencia); 

alter table ANULADA
ADD FOREIGN KEY (fecha_anulada) REFERENCES FECHA(id_fecha); 





