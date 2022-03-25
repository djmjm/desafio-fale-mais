<?php
	require "../core/controller/control.php";

	define("GATE_LINKED", true);

	class Tables{

		private $from;
		private $to;
		private $cost;

		private $no_match;
		private $match_cost;

		public function __construct(){
			$this->no_match = true;

			$controller = new Control;
			$this->from = $controller->getFrom();
			$this->to = $controller->getTo();
			$this->cost = $controller->getCost();
			unset($controller);
		}

		public function getFormAllTableFromDdd(){
			$number_elements = count($this->from->id);
			if($number_elements){
				for($i = 1; $i <= $number_elements; $i++){
					echo "<option value=" . $i . ">" . $this->from->ddd[$i] . "</option> <br>";
				}
			}else{
				echo "<option value=" . "null" . ">" . "Nenhum DDD disponível" . "</option> <br>";
			}
		}

		public function getFormAllTableToDdd(){
			$number_elements = count($this->to->id);
			if(count($number_elements)){
				for($i = 1; $i <= $number_elements+1; $i++){
					echo "<option value=" . $i . ">" . $this->to->ddd[$i] . "</option> <br>";
				}
			}else{
				echo "<option value=" . "null" . ">" . "Nenhum DDD disponível" . "</option> <br>";
			}
		}

		public function getFormMatchesFromTo($id_from){
			$this->no_match = true;
			$number_elements = count($this->cost->id);
			for($i = 1; $i <= $number_elements+1; $i++){
				if($id_from == $this->cost->id_from[$i]){
					echo "<option value=" . $this->cost->id_to[$i] . ">" . 
						 $this->to->ddd[$this->cost->id_to[$i]] . 
						 "</option> <br>";
					$this->no_match = false;
				}
			}
			if($this->no_match){
				echo "<option value=null>Nenhum DDD disponível</option>";
			}
		}

		public function getCostData(){
			return $this->cost;
		}
	}
?>