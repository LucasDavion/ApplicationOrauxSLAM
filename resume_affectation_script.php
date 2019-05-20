<?php

include "connexion_gesoraux.php";

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