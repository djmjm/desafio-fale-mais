
select * from (
	select table_schema "db",
	        ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "Size (MBs)" 
	from information_schema.tables 
	group by table_schema) as result where db = "falemais"; 