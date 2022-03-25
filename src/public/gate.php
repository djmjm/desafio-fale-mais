<?php
	$access_key = -9999;
	if(isset($_POST["a1489"])){
		$access_key = $_POST["a1489"];
		//echo $access_key . "<br>";
		$condition_to_link = (
								$access_key != 723985351696906928929 
								&&
								$access_key != 920436725706975835362 
								&&
								$access_key != 635102192029198264181
					 		);
		
		$condition_to_link ? die('Acesso direto não permitido!!!') : require("../core/controller/gate.php");

	}else die('Sem permissão para acessar esse arquivo!!!');

	if(defined('GATE_LINKED')){
		$tables = new Tables;
		switch($access_key){
			case 723985351696906928929:
				$tables->getFormAllTableFromDdd();
				break;

			case 920436725706975835362:
				$id_from = $_POST["a9824"];
				$tables->getFormMatchesFromTo($id_from);
				break;

			case 635102192029198264181:
				$id_from = $_POST["a9824"];
				$id_to = $_POST["a9512"];
				$minutes = floatval($_POST["a1463"]);
				$plan = intval($_POST["a5726"]);

				$cost_data = $tables->getCostData();
				$no_match = true;
				$money = 0.000;

				$condition_to_process = (
											$id_from != "null"
											&&
											$id_to != "null"
											&&
											(
												is_array($cost_data->id)?
													count($cost_data->id):
													false
											)
										);

				if(!$condition_to_process){
					echo $money;
					return;
				}

				for($i = 1; $i <= count($cost_data->id); $i++){
  					$condition_to_echo = ($cost_data->id_from[$i]
  										 ==
  										 $id_from
  										 &&
  										 $cost_data->id_to[$i]
  										 ==
  										 $id_to);

  					if($condition_to_echo){
  						switch($plan){
  							case 1:	$money = floatval((
												(floatval(0.10) * floatval($cost_data->money[$i]) )
												+
												floatval($cost_data->money[$i]) 
											)
												* max(
													floatval($minutes - 30), 
													floatval(0.000)
											));
  									break;

							case 2:	$money = floatval((
												(floatval(0.10) * floatval($cost_data->money[$i]) )
												+
												floatval($cost_data->money[$i]) 
											)
												* max(
													floatval($minutes - 60), 
													floatval(0.000)
											));
  									break;

  							case 3:	$money = floatval((
												(floatval(0.10) * floatval($cost_data->money[$i]) )
												+
												floatval($cost_data->money[$i]) 
											)
												* max(
													floatval($minutes - 120), 
													floatval(0.000)
											));
  									break;

  							default: $money = floatval($cost_data->money[$i]) 
  											  *
  											  floatval($minutes);
  									break;
  						}
						echo $money;
						$no_match = false;
						break;
  					}
				}

				if(!$no_match){
					/*echo "<script>";
	  				echo "console.log(". $id_from .");";
	  				echo "console.log(". $id_to .");";
	  				echo "console.log(". $money .");";
	  				echo "</script>";*/
				}else{
					/*echo "<script>";
	  				echo "console.log(false);";
	  				echo "</script>";*/
					echo $money;
				}
				break;

			default: break;
		}
	}
?>