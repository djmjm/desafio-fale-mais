<?php
	require "../core/model/db.php";

	class Call{
		public $id;
		public $ddd;
	}

	class Cost{
		public $id;
		public $id_from;
		public $id_to;
		public $money;
	}

	class Control{

		private $content_table_origem;
		private $content_table_destino;
		private $content_table_tarifa;

		private $from;
		private $to;
		private $cost;

		private function loadFrom(){
			$index = 1;
			while($row = mysqli_fetch_array($this->content_table_origem)){
				$this->from->id[$index] = $row['id'];
				$this->from->ddd[$index++] = $row['ddd'];
			}
		}

		private function loadTo(){
			$index = 1;
			while($row = mysqli_fetch_array($this->content_table_destino)){
				$this->to->id[$index] = $row['id'];
				$this->to->ddd[$index++] = $row['ddd'];
			}
		}

		private function loadCost(){
			$index = 1;
			while($row = mysqli_fetch_array($this->content_table_tarifa)){
				$this->cost->id[$index] = $row['id'];
				$this->cost->id_from[$index] = $row['id_orig'];
				$this->cost->id_to[$index] = $row['id_dest'];
				$this->cost->money[$index++] = $row['valor_minuto'];
			}
		}

		public function __construct(){
			$db = new Database;

			$this->from = new Call;
			$this->to = new Call;
			$this->cost = new Cost;

			$this->content_table_origem = $db->getTableOrigem();
			$this->content_table_destino = $db->getTableDestino();
			$this->content_table_tarifa = $db->getTableTarifa();

			$this->loadFrom();
			$this->loadTo();
			$this->loadCost();

			unset($db);
		}

		public function getFrom(){
			return $this->from;
		}

		public function getTo(){
			return $this->to;
		}

		public function getCost(){
			return $this->cost;
		}
	}
?>