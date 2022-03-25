var script = document.createElement('script');
script.src = 'https://code.jquery.com/jquery-3.6.0.min.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);

/* Descomentar para testar linkagem jquery;;
script.onload = jqueryHandler;
function jqueryHandler(){
	console.log("jQuery version - " + $().jquery);
	console.log("Type of jQuery - " + (typeof $().jquery));
	(typeof $().jquery) ? console.log("jQuery loaded!") : console.log("jQuery fail!");
}
*/

script.onload = jqueryQuery;

function jqueryQuery(){

	$.post('/gate.php',
		  { a1489 : 723985351696906928929 },
	      function (data) {  
	          console.log("Callback /gate.php is working! DDD-FROM loaded!");
	          $('#from').html(data);
	    });

	console.log("onload select from!!!");
	$.post('/gate.php',
		  { a1489 : 920436725706975835362,
		  	a9824 : 1,
		  },
	      function (data) {  
	          console.log("Callback /gate.php is working! DDD-TO updated!");
	          $('#to').html(data);
	    });
}

function updateCosts(){

	$.post('/gate.php',
		  { a1489 : 635102192029198264181,
		  	a9824 : $("#from option:selected").val(),
		  	a9512 : $("#to option:selected").val(),
		  	a1463 : $("#minute").val(),
		  	a5726 : $("#plan").val(),
		   },
	      function (data) {  
	          console.log("Callback /gate.php is working! Final Cost plan updated!");
	          let answer = formatValueToCurrency(data);
	          $('#finalcostplan').html(answer);
	    });

	$.post('/gate.php',
		  { a1489 : 635102192029198264181,
		  	a9824 : $("#from option:selected").val(),
		  	a9512 : $("#to option:selected").val(),
		  	a1463 : $("#minute").val(),
		  	a5726 : 0,
		   },
	      function (data) {  
	          console.log("Callback /gate.php is working! Final Cost noplan updated!");
	          let answer = formatValueToCurrency(data);
	          $('#finalcostnoplan').html(answer);
	    });
}

function updateToDdd(){
	console.log("onload select from!!!");
	$.post('/gate.php',
		  { a1489 : 920436725706975835362,
		  	a9824 : $("#from option:selected").val(),
		  },
	      function (data) {  
	          console.log("Callback /gate.php is working! DDD-TO updated!");
	          $('#to').html(data);
	    });
}

function formatValueToCurrency(value){
	if(value > 99999999999999) return "99999999999999,99 (valor máximo de pagamento atingido!!)";
	
	let new_value = value.toString();

	let index_dot = new_value.indexOf('.', 0);
	if(index_dot > 0) new_value = new_value.slice(0, index_dot) + 
					  "," + new_value.slice(index_dot+1, value.length);

	let start_parser = index_dot > 0 ? index_dot : new_value.length;

	let final_value = new_value;
	for(let i = start_parser - 3; i > 0; i-=3){
		let condition_break = (i >= index_dot
							  &&
							  index_dot > 0);
		if (condition_break){ break; }
		else {
			final_value = final_value.slice(0, i) + "." 
						  + final_value.slice(i, final_value.length);
			}
	}
	if(index_dot <= 0){ final_value = final_value + ",00"; }

	index_dot = final_value.indexOf(',', 0);
	let dif_dot = final_value.slice(0, index_dot);
	dif_dot = (final_value.length - dif_dot.length) - 1;

	if(dif_dot == 1) { final_value += "0"; }
	else if(dif_dot > 2){
		dif_dot -= 2;
		final_value = final_value.slice(0, final_value.length - dif_dot);
	}

	return final_value;
}