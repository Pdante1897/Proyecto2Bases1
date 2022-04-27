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
	id_liecncia numeric not null primary key,
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









