--	Implementação banco de dados desafio fale mais
--	Inserindo conteúdo nas tabelas
--	insert.sql
--  SGBD MySQL/MariaDB

use faleMais;

insert into origem (ddd) values
	('051'), ('011'), ('033'),
	('041'), ('081'), ('044'),
	('031'), ('021'), ('099'),
	('091'), ('052'), ('064');

insert into destino (ddd) values
	('051'), ('011'), ('033'),
	('041'), ('081'), ('044'),
	('031'), ('021'), ('099'),
	('091'), ('052'), ('064');

-- valor_minuto vai ser truncado devido ao tipo (decimal)
-- e precisão definida (6,3)
-- vai gerar warning
insert into tarifa (id_orig, id_dest, valor_minuto) values
	(8, 6, 6.4923814125),
	(9, 7, 12.9154485670),
	(3, 1, 10.6066463209),
	(2, 1, 11.8084606330),
	(12, 3, 11.3450247016),
	(2, 1, 2.0898536069),
	(7, 3, 1.3708974896),
	(6, 10, 11.4043113152),
	(7, 12, 5.7453122285),
	(7, 5, 2.6896473781),
	(1, 5, 2.6896473781),
	(1, 3, 1.3708974896);


show warnings;