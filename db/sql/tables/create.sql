--	Implementação banco de dados desafio fale mais
--	Criação de database e tabelas
--	create.sql
--  SGBD MySQL/MariaDB

create schema if not exists faleMais;

use faleMais;

create table if not exists origem(
	id int auto_increment,
	ddd varchar(3) default '000',

	primary key (id)
);

alter table origem auto_increment = 1;

create table if not exists destino(
	id int auto_increment,
	ddd varchar(3) default '000',

	primary key (id)
);

alter table destino auto_increment = 1;

create table if not exists tarifa(
	id int auto_increment,
	id_orig int not null,
	id_dest int not null,
	valor_minuto decimal(6,3) not null,

	foreign key (id_orig) references origem (id),
	foreign key (id_dest) references destino (id),
	primary key (id)
);

alter table tarifa auto_increment = 1;

show warnings;