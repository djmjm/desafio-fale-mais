--	Implementação banco de dados desafio fale mais
--	Query3
--	query3.sql
--  SGBD MySQL/MariaDB
--
--  PROBLEMA:
--  Necessita-se descobrir qual é a ligação mais cara (valor por minuto)
--  com origem no ddd (031). Importante exibir o destino e a tarifa paga;;


select ddd as ddd_dest, valor_minuto from
	(select * from
		(select id_dest, valor_minuto from
			(select origem.id as id_orig from origem
			   where origem.ddd = '031') as orig_l join tarifa 
			   		on orig_l.id_orig = tarifa.id_orig) as tarifa_l join destino
						on destino.id = id_dest) as final_l order by valor_minuto desc limit 1;

show warnings;
