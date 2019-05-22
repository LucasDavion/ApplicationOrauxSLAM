<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Résumé des affectations</title>
	<link rel="stylesheet" type="text/css" href="bootstrap.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->


</head>
<body>

<div class="limiter">
	<div>
		<div>
			<span>
				Résumé des affectations
			</span>


		<form action ="" method="post">

			<div class="form-group">


		<?php


				include "connexion_gesoraux.php";

				// Menu déroulant des discipline
				
				$lesDisiplines=$bdd->query("SELECT id, libelle FROM discipline");

				echo '<select class="custom-select mr-sm-2" name="discipline" id="discipline">';
				echo "<option value='999'>Veuillez selectioner une discipline</option>";
				foreach ($lesDisiplines as $discipline) {
					echo "<option value='$discipline->id'>$discipline->libelle</option>";
				// fin FOREACH	
				}
				echo "</select>";
				echo "</form>";			
/*
				 ___
				/  /
			   /  /  ___
			  /  /  /__/
			 /  /_____   __________
			/_____   /  /______   /
			     /  /  ___    /  /
			    /  /  /__/   /  /
			   /  /  _______/  /
			  /__/  /_________/







				*/
		?>
<div class="resultat"></div>
				
	</div>
	</div>
	</div>
	</div>
</body>
</html>

      



<script 
src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#discipline").change(function(){
			$.ajax({
				url: 'resume_affectation_script.php',
				type: 'POST',
				data: 'discipline=' + $("#discipline").val(),
				dataType : 'html',
				success : function (code_html, status){
					$(".resultat").html(code_html);
				},
				error : function(resultat, statut, error){
					$(".resultat").html("erreur:" + resultat.responseText);
				}
			});
		});
	});
	
</script>
