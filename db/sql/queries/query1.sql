--	Implementação banco de dados desafio fale mais
--	Query1
--	query1.sql
--  SGBD MySQL/MariaDB
--
--  PROBLEMA:
--  Necessita-se exibir todos os ddds de destino e origem
--  em colunas diferentes;;


-- Emulação full outer join MySQL/mariaDB
-- table 1 - origem
-- table 2 - destino

select * from origem
left join destino on origem.id = destino.id
union
select * from destino
left join origem on destino.id = origem.id;


show warnings;
