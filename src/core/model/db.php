<?php 
	class Database{
		private $connection;

		private $table_origem;
		private $table_destino;
		private $table_tarifa;

		private function printTableOrigem(){
			while($row = mysqli_fetch_array($this->table_origem)){
				echo $row['id'] . " - " . $row['ddd'] . "<br>";
			}
		}

		private function printTableDestino(){
			while($row = mysqli_fetch_array($this->table_destino)){
				echo $row['id'] . " - " . $row['ddd'] . "<br>";
			}
		}

		private function printTableTarifa(){
			while($row = mysqli_fetch_array($this->table_tarifa)){
				echo $row['id'] . " - " . $row['id_orig']
								. " - " . $row['id_dest']
								. " - " . $row['valor_minuto']
								. "<br>" ;
			}
		}

		private function checkConnection(){
			if(mysqli_connect_errno()){
				throw new Exception('Falha de conexão com database (banco de dados inexistente!)...');
			}
		}

		private function loadTableOrigem(){
			$query = "select * from origem";
			$this->table_origem = mysqli_query($this->connection, $query);
		}

		private function loadTableDestino(){
			$query = "select * from destino";
			$this->table_destino = mysqli_query($this->connection, $query);
		}

		private function loadTableTarifa(){
			$query = "select * from tarifa";
			$this->table_tarifa = mysqli_query($this->connection, $query);
		}

		private function loadData(){
			$this->loadTableOrigem();
			$this->loadTableDestino();
			$this->loadTableTarifa();
		}

		private function printData(){
			$this->printTableOrigem();
			echo "<br>";
			$this->printTableDestino();
			echo "<br>";
			$this->printTableTarifa();
		}

		public function __construct(){
			try{
				$this->connection = mysqli_connect("localhost", "root", "", "falemais");
				$this->checkConnection();
			}catch (Exception $e){
				die($e->getMessage());
			}

			$this->loadData();
			//$this->printData(); //Descomentar para debbuger;;

			mysqli_close($this->connection);
		}

		public function getTableOrigem(){
			return $this->table_origem;
		}

		public function getTableDestino(){
			return $this->table_destino;
		}

		public function getTableTarifa(){
			return $this->table_tarifa;
		}
	}
?>