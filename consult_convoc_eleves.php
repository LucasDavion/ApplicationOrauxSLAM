<?php
// Permet que les insructions permettant de se positionner sur la bonne obtion fonctionnent correctement
if(isset($_POST['lst_division'])==true){
	$lst_division=$_POST['lst_division'];
}else{
	$lst_division=0;
}
if(isset($_POST['lst_prof'])==true){
	$lst_prof=$_POST['lst_prof'];
}else{
	$lst_prof=0;
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<title>Consultation des convocartions des élèves</title>
</head>
<body>
	<h1>Consultation des convocations des élèves</h1>
	<?php 
	// Connexion à la base de données
	include "connexion_bd_gesoraux.php";
	?>
	<!-- Formulaire avec des listes déroulantes pour selectionner les options -->
	<form action="consult_convoc_eleves.php" method="POST" >
		<!-- Liste déroulante pour la selection des divisions -->
		Division : <select name="lst_division" onchange="this.form.submit();">
			<option value="0">Veuillez saisir une division</option>

			<?php
			// Exécution de la requête qui récupère le contenu de la table division dans le tableau lesDivi
			try{
				$lesDivi=$bdd->query("select id, libelle from division");
			}catch(PDOException $e){
				echo "erreur sql dans la liste déroulate lst_division";
			}
			if($lesDivi->rowCount()==0){
				echo("il y pas de division enregisté");

			}else{
				foreach($lesDivi as $enregD){
					if($lst_division==$enregD->id){
						echo"<option selected value='$enregD->id'>$enregD->libelle</option>";
					}else{
						echo"<option value='$enregD->id'>$enregD->libelle</option>";
					}
				}
			}
			?>
		</select>
		<!-- Liste déroulante pour la selection des professeurs -->
		Professeur : <select name="lst_prof" onchange="this.form.submit();">
			<option value="0">Veuillez saisir un professeur</option>
			<?php
			// Exécution de la requête qui récupère le contenu de la table utilisateur (uniquement les professeurs) dans le tableau lesProf
			try{
				$lesProf=$bdd->query("select utilisateur.id as idProf, nom from utilisateur join typeutilisateur on idTypeUtilisateur=typeutilisateur.id where libelle='Prof' ");
			}catch(PDOException $e){
				echo "erreur sql dans la liste déroulate lst_prof";
			}
			if($lesProf->rowCount()==0){
				echo("il y pas de professeur enregisté");

			}else{
				foreach($lesProf as $enregP){
					if($lst_prof==$enregP->idProf){
						echo"<option selected value='$enregP->idProf'>$enregP->nom</option>";
					}else{
						echo"<option value='$enregP->idProf'>$enregP->nom</option>";
					}
				}
			}
			?>
		</select><br></form>
	</form>
	<?php
	// Exécution de la requête qui récupère toutes les informations que l'on a besion pour la consultation des convocations
	try{
		// Déclaration de la variable $requete dans la quelle se trouve la requete qui sera executé plus tard dans la variable $req
		$requeteConvoc="select eleve.nom as 'nomE',
		 eleve.prenom as 'prenomE', 
		 division.libelle as 'divisionE', 
		 salle.libelle as 'salleE', 
		 discipline.libelle as 'disciplineE', 
		 natureepreuve.libelle as 'epreuveE', 
		 demijournee.date as 'jourE', 
		 plage.heureDebut as 'plagHoraireE' 
		 from passageepreuve join eleve on idEleve=eleve.id
		  join division on idDivision=division.id
		  join salle on idSalle=salle.id
		  join epreuve on idEpreuve=epreuve.id
		  join discipline on idDiscipline=discipline.id
		  join natureepreuve on idNatureEpreuve=natureepreuve.id
		  join plagedemijournee on passageepreuve.idDemiJournee=plagedemijournee.idDemiJournee and passageepreuve.idPlage=plagedemijournee.idPlage
		  join demijournee on plagedemijournee.idDemiJournee=demijournee.id
		  join plage on plagedemijournee.idPlage=plage.id
		  join utilisateur on passageepreuve.idProfAffecte=utilisateur.id
		";
		// Contrôle des valeurs de $lst_division et $lst_prof pour rajouter des conditions à $requete  
		if($lst_division>0 && $lst_prof==0){
			$requeteConvoc=$requeteConvoc." where division.id=:par_division";
		}
		if($lst_prof>0 && $lst_division==0){
			$requeteConvoc=$requeteConvoc." where utilisateur.id=:par_prof";
		}
		if($lst_prof>0 && $lst_division>0){
			$requeteConvoc=$requeteConvoc." where division.id=:par_division and utilisateur.id=:par_prof";
		}
		$requeteConvoc=$requeteConvoc." order by nomE";
		$reqConovoc=$bdd->prepare($requeteConvoc);
		// Contrôle des valeurs de $lst_division et $lst_prof pour rajouter des paramètres à $requete  
		if($lst_division>0 && $lst_prof==0){
			$reqConovoc->bindValue(':par_division', $lst_division, PDO::PARAM_INT);
		}
		if($lst_prof>0 && $lst_division==0){
			$reqConovoc->bindValue(':par_prof', $lst_prof, PDO::PARAM_INT);	
		}
		if($lst_prof>0 && $lst_division>0){
			$reqConovoc->bindValue(':par_division', $lst_division, PDO::PARAM_INT);
			$reqConovoc->bindValue(':par_prof', $lst_prof, PDO::PARAM_INT);
		}
		$reqConovoc->execute();
	}catch(PDOException $e) {
		die("Err BDSelect  : erreur select des convocations dans consult_convoc_eleves.php<br>
			Message d'erreur :" . $e->getMessage());
	}
	// Affichage d'un message à l'utilisateur qui lui signale si il n'y a pas de convocations qui correspondent aux options qu'il a selectionné dans les listes déroulantes
	// Si il existe des convocations qui correspondent aux options selectionnées dans les listes déroulantes, on affiche un tableau récapitulatif des passages
	if($reqConovoc->rowCount()==0){
		echo("<h3>Aucune convocation ne correspond à ces critères</h3>");
	}else{
		echo"<table>
		<tr>
		<th>Nom</th>
		<th>Prenom</th>
		<th>Division</th>
		<th>Discipline</th>
		<th>Epreuve</th>
		<th>Salle</th>
		<th>Jour</th>
		<th>Plage horaire</th>
		</tr>";
		foreach ($reqConovoc as $convoc) {
			list($year, $month, $day) = explode('-', $convoc->jourE);
			$dateConvocFr = "$day/$month/$year";
			echo"<tr>
			<td>$convoc->nomE</td>
			<td>$convoc->prenomE</td>
			<td>$convoc->divisionE</td>
			<td>$convoc->disciplineE</td>
			<td>$convoc->epreuveE</td>
			<td>$convoc->salleE</td>
			<td>$dateConvocFr</td>
			<td>$convoc->plagHoraireE</td>
			</tr>";
		}
		echo"</table>";
	}
	?>
</body>
</html>