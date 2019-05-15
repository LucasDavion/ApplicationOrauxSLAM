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
	<div class="container-login100">
		<div class="wrap-login101 p-t-30 p-b-50">
			<span class="login101-form-title p-b-41">
				Résumé des affectations
			</span>


		<form class="login100-form validate-form p-b-33 p-t-5" action ="" method="post">

			<div class="wrap-input100 validate-input">


		<?php


				include "connexion_gesoraux.php";

				// Menu déroulant des discipline
				
				$lesDisiplines=$bdd->query("SELECT id, libelle FROM discipline");

				echo '<select class="form-control" name="discipline" id="discipline" onchange="this.form.submit()">';
				echo "<option value='999'>Discipline</option>";
				foreach ($lesDisiplines as $discipline) {
					echo "<option value='$discipline->id'>$discipline->libelle</option>";
				// fin FOREACH	
				}
				echo "</select>";
				echo "</form>";


				if (isset($_POST['discipline'])==true){


							//donne dans une variable le nb d'éleve selectionné
   							//pour chaque proféseur de la discipline selectionnée.
   						
   							$lesComptageProfs=$bdd->query("
								SELECT utilisateur.id,utilisateur.nom,utilisateur.prenom , D2.libelle , natureepreuve.libelle as natureEpreuve, COUNT(*) as compte
								FROM passageepreuve 
								join epreuve ON idEpreuve = epreuve.id
								join natureepreuve on idNatureEpreuve = natureepreuve.id
								JOIN utilisateur ON idProfChoix = utilisateur.id
                                JOIN discipline as D1 ON utilisateur.idDiscipline = D1.id
								JOIN discipline as D2 ON epreuve.idDiscipline = D2.id
								where D2.id = ".$_POST['discipline']."
								GROUP BY utilisateur.id , D2.libelle , natureepreuve.libelle
								");


							
   							$idProf = 0;
   							foreach ($lesComptageProfs as $comptageProf) {
   								
								if ($idProf!=$comptageProf->id) {
									echo "<ul  class='list-group'>";
									echo "<br>";
									echo "<br>";
									echo "<li class='list-group-item list-group-item-secondary'>";
									echo "<strong>  $comptageProf->nom $comptageProf->prenom</strong>";
									echo "</li>";

   								// donne dans une variable le nb de demi journée selectionnée
	   							// pour chaque proféseur de la discipline selectionnée.
	   							$lesChoixDJ=$bdd->query("
									SELECT choixprofdemijournee.idDemiJournee
									FROM choixprofdemijournee
									JOIN utilisateur on idUtilisateur=utilisateur.id
									where utilisateur.id=$comptageProf->id
	   								");
	   							$nbDemiJournee=$lesChoixDJ->rowCount();
								echo " <li class='list-group-item'> Nombre de demi-journées: $nbDemiJournee </li>";

								$idProf=$comptageProf->id;
								//fin IF
								}
   								echo "<li class='list-group-item'> Nombre d'éleves en $comptageProf->natureEpreuve : $comptageProf->compte </li>";
   								echo "</ul>";

								
							//fin FOREACH
	   						}

  								echo "<br><br>";	

   				//fin IF
   				}
   				else
   				{
   					echo "<em><ul  class='list-group'> <li class='list-group-item'> Page de consultation des affectations. Sélectionnez une discipline, le nombre de demi-journées et d'éleves en LV1 et LV2 </li></ul></em>";
   				}
   				
		?>
	</div>
	</div>
	</div>
	</div>
</body>
</html>