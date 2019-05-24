<?php
// Permet que les insructions permettant de se positionner sur la bonne obtion fonctionnent correctement
if(isset($_POST['lst_demijournee'])==true){
	$lst_demijournee=$_POST['lst_demijournee'];
}else{
	$lst_demijournee=0;
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/bootstrap-grid.css">
	<link rel="stylesheet" href="css/bootstrap-reboot.css">
	<title>Consultation des absences</title>
</head>
<body>
	<div class="container">
		<h1><center>Consultation des absences</center></h1>
		<?php 
		// Connexion à la base de données
		include "connexion_bd_gesoraux.php";
		// include du script qui permet de faire fonctionner la fonction dateToFrench()
		include "script_datechaine.php";
		?>
		<!-- Formulaire avec des listes déroulantes pour selectionner les options -->
		<form action="scolarite_consult_absences.php" method="POST" >
			<!-- Liste déroulante pour la selection des demi-journées -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text" for="inputGroupSelect01">Demi-journée</label>
				</div>
				<select class="custom-select" id="inputGroupSelect01" name="lst_demijournee" onchange="this.form.submit();">
					<option value="0">Toutes les demi-journées</option>
					<?php
					// Exécution de la requête qui récupère le contenu de la table division dans le tableau lesDemij
					try{
						$lesDemij=$bdd->query("select id, date, matinAprem from demijournee");
					}catch(PDOException $e){
						echo "erreur sql dans la liste déroulate lst_demijournee";
					}
					if($lesDemij->rowCount()==0){
						echo("il y pas de demijournee enregisté");
					}else{
						foreach($lesDemij as $enregD){
							if($lst_demijournee==$enregD->id){
								
								echo"<option selected value='$enregD->id'>$enregD->date $enregD->matinAprem</option>";
							}else{
								echo"<option value='$enregD->id'>$enregD->date $enregD->matinAprem</option>";
							}
						}
					}
					?>
				</select>
			</div>
		</div>
		<br>
	</form>
   	<form action="consult_absences_PDF.php" method="POST">		
	<center><a href="consult_absences_PDF.php"><input type="submit" class="btn btn-success btn-lg" nane="btn_absence-generer" value="Génération d'un PDF pour la liste des absences" /></a></center><br><br></form>
	<?php
	// Exécution de la requête qui récupère toutes les informations que l'on a besion pour la consultation des absences
	try{
		// Déclaration de la variable $requeteAb dans la quelle se trouve la requete qui sera executé plus tard dans la variable $reqAb
		$requeteAb="select eleve.nom as 'nomE',
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
		where passageepreuve.absence='O'";
		// Contrôle de la valeur de $lst_demijournee pour rajouter des conditions à $requeteAb 
		if($lst_demijournee>0){
			$requeteAb=$requeteAb." and demijournee.id=:par_demijournee";
		}
		$requeteAb=$requeteAb." order by nomE";
		$reqAb=$bdd->prepare($requeteAb);
		// Contrôle de la valeur de $lst_demijournee pour rajouter des paramètres à $requeteAb  
		if($lst_demijournee>0){
			$reqAb->bindValue(':par_demijournee', $lst_demijournee, PDO::PARAM_INT);
		}
		$reqAb->execute();
	}catch(PDOException $e) {
		die("Err BDSelect  : erreur select des absences dans scolarite_consult_absences.php<br>
			Message d'erreur :" . $e->getMessage());
	}
	// Affichage d'un message à l'utilisateur si il n'y a aucune absences qui n'a été enregistée ou qu'il n'y a pas d'absence qui correspondent aux options qu'il a selectionné dans les listes déroulantes
	// Si il existe des absences qui correspondent aux options selectionnées dans les listes déroulantes, on affiche un tableau récapitulatif des absences
	if($reqAb->rowCount()==0 && $lst_demijournee>0){
		echo("<h3><center>Aucun éléve n'à été absent pour cette demi-jounrée</center></h3>");
	}else{
		if($reqAb->rowCount()==0){
			echo("<h3><center>Aucun éléve n'à été absent</center></h3>");
		}else{
			echo"<table class='table table-striped text-center'>
			<thead class='thead-dark'>
			<tr>
			<th scope='col'>Nom</th>
			<th scope='col'>Prenom</th>
			<th scope='col'>Division</th>
			<th scope='col'>Discipline</th>
			<th scope='col'>Epreuve</th>
			<th scope='col'>Plage horaire</th>";
			if($lst_demijournee==0){
				echo"<th scope='col'>Date</th>";
			}
			echo"</tr>
			<thead><tbody>";
			foreach ($reqAb as $absence) {
				echo"<tr>
				<td scope='row'>$absence->nomE</td>
				<td>$absence->prenomE</td>
				<td>$absence->divisionE</td>
				<td>$absence->disciplineE</td>
				<td>$absence->epreuveE</td>
				<td>$absence->plagHoraireE</td>";
				if($lst_demijournee==0){
					$datefinTabl = dateToFrench($absence->jourE,'l j F Y');
				echo "<td>$datefinTabl</td>";
				}
				echo "</tr>";
			}
			echo"</tbody></table>";
		}
	}
	?>
</div>
</body>
</html>