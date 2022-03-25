--	Implementação banco de dados desafio fale mais
--	Deletando conteúdo das tabelas
--	delete.sql
--  SGBD MySQL/MariaDB

delete from tarifa;
delete from origem;
delete from destino;

alter table origem auto_increment = 1;
alter table destino auto_increment = 1;
alter table tarifa auto_increment = 1;

show warnings;