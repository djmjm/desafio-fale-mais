--	Implementação banco de dados desafio fale mais
--	Query2
--	query2.sql
--  SGBD MySQL/MariaDB
--
--  PROBLEMA:
--  Necessita-se estudar as ligações com origem no ddd (51).
--  Para isso, é necessário obter o destino, junto com a tarifa vinculada a ligação,
--  em duas colunas diferentes. Também precisa-se ordenar do menor ao maior (ascendente)
--  usando a coluna valor_minuto como base;;


select ddd as ddd_dest, valor_minuto from
	(select * from
		(select id_dest, valor_minuto from
			(select origem.id as id_orig from origem
			   where origem.ddd = '051') as orig_l join tarifa 
			   		on orig_l.id_orig = tarifa.id_orig) as tarifa_l join destino
						on destino.id = id_dest) as final_l order by valor_minuto asc;

show warnings;
