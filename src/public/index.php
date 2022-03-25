<?php 
	function main(){
		require "../core/controller/control.php";
		$controller = new Control;

		readFile("../core/view/view.html");
	}

	function checkDB(){
		require "../core/model/db.php" ;
		$db = new Database;
		unset($db);

		echo "Database ok!";
	}

	function checkControl(){
		require "../core/controller/control.php" ;
		$controller = new Control;
		unset($controller);

		echo "Controle ok!";
	}

	function checkGate(){
		require "../core/controller/gate.php" ;

		echo "Gate ok!";
	}

	//main();
	//main() //descomentar essa função para debbuger
	//comentar @main();;
	@main();

	//checkDB(); //Descomentar para checar banco de dados
	//checkControl(); //Descomentar para checar acesso ao controle
	//checkGate(); //Descomentar para checar acesso ao gate(view <=> control)
?>