//Criação do Banco de Dados//

É necessário criar o banco de dados no server "localhost", 
com usuário "root", com password ""(vazio), 
database com nome "falemais";

Configuração escolhida para teste;

Caso contrario a aplicação não irá funcionar, será lançada uma exceção,
com um aviso sobre a inexistencia do banco de dados.

//Como criar//

Duas opções:
1 - Executar scripts create.sql e insert.sql (nessa ordem), encontrados na pasta tables;
2 - Escolher algum dos arquivos dump.sql disponíveis na pasta dump;

//utilizar scripts da pasta queries para verificar se o banco de dados está funcional//

//IMPORTANTE//
Scripts executados no MySQL/MariaDB. Esses scripts não foram testados em outros SGBDs!!!

//FERRAMENTAS UTILIZADAS//
HeidiSQL 11.0.0.5919
MariaDB 10.4.11
InnoDB
