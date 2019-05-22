<?php
session_start();

// $id_Util=$_SESSION['id'];
$id_Util=11;
$valeur="";
$val_chb="";
$msg="";
$chbapremJ="";
$chbmatinJ="";
$demiJournee="";
$idDemiJournee="";
$idSalle="";
$compteur=0;
$erreur="";


// Connexion à la base de données
include "connexion_gesoraux.php";		


if(isset($_POST['bouton_valider'])==true){
	extract($_POST);
	
	// pour une modification venant de l'utilisateur, on doit d'abord supprimer ses précédentes sélections dans la base de données pour les rajouter en plus des nouvelles (ou les enlever)
	try{
		$lesEnregs=$bdd->prepare("Delete from choixprofdemijournee where idUtilisateur=:par_id_Util");
		$lesEnregs->bindValue(":par_id_Util",$id_Util,PDO::PARAM_INT);
		$lesEnregs->execute();

	} catch(PDOException $e){
		echo("ErrSuppChoixProfDemiJournee : Erreur lors de la suppression d'un choix du prof pour une demi journée dans saisie_demi_journee.php.
			<br>Message d'erreur :".$e->getMessage());
	}

	foreach($_POST as $cle=>$valeur){
		if (strpos($cle, "chb")===0) {
			$val_chb=$valeur;
		} else {
			//liste
			if(strpos($cle, "salle") === 0 && $val_chb != "") {

				// on vérifie que la salle n'est pas déjà prise à cette demi journée là
				$lesSallesPrises=$bdd->prepare("SELECT idDemiJournee from choixprofdemijournee where idSalle=$valeur and idDemijournee=$val_chb");
				$lesSallesPrises->execute();
				$laSallePrise = $lesSallesPrises->fetch();
				// le SELECT a retourné un enregistrement: on récupère l'enregistrement 
				
				// la salle n'existe pas dans la base de donnée : on peut donc l'enregistrer avec un insert
				if($laSallePrise == false)
				{

					$requete=$bdd->prepare("INSERT into choixprofdemijournee values(:par_idUtil, :par_idDemiJournee, :par_idSalle)");
					$requete->bindValue(':par_idUtil', $id_Util, PDO::PARAM_INT);
					$requete->bindValue(':par_idDemiJournee', $val_chb, PDO::PARAM_INT);
					$requete->bindValue(':par_idSalle', $valeur, PDO::PARAM_INT);
					$requete->execute();
					$val_chb=""; // cette variable contient le numéro de demi-journée
							    // dans $valeur on a le numéro de salle
				} else {

					// la salle est déjà prise, on affiche un message d'erreur pour dire quelles salles sont prises. il faut récupérer les libellés exactes de celles-ci (et pour les demi-journées également)		
					$lesSalles=$bdd->prepare("SELECT libelle from salle where id=$valeur");
					$lesSalles->execute();
					$laSalle=$lesSalles->fetch();

					$lesDemis=$bdd->prepare("SELECT date, matinAprem from demijournee where id=$val_chb");
					$lesDemis->execute();
					$laDemi=$lesDemis->fetch();

					list($year, $month, $day) = explode("-", $laDemi->date);
      				$date_fr = $day."/".$month."/".$year;

      				if($laDemi->matinAprem=="matin")
      				{
      					$erreur=$erreur."<br>La salle $laSalle->libelle pour le $laDemi->matinAprem du $date_fr est déjà prise, veuillez en sélectionner une autre.";
					} else {
      					$erreur=$erreur."<br>La salle $laSalle->libelle pour l'$laDemi->matinAprem du $date_fr est déjà prise, veuillez en sélectionner une autre.";
					}
      				$val_chb="";
					
				}

			} 
		}
	}
	echo $erreur;

}

?>


<!DOCTYPE html>
<html lang="fr-FR">
<head>
	<meta charset="UTF-8">
	<meta name ="vieuwport" content="width=device-width, initial-scale-1.0">
	<meta name="description" content="Saisie des demi-journées">
	<title>Saisie et Modification des demi-journées</title>
	
</head>

<body>
	<section class="orange">
		<h1>Saisie et Modification des demi-journées</h1>
		<div class="sec">		
			<table>

				<!-- début formulaire !-->
				<form action='saisie_demi_journee.php' method='post'>
					
					<?php

				// on prend les dates dans la bdd
					$lesDemiJournees=$bdd->query("SELECT distinct date from demijournee");	
					$lesDemiJournees->execute();
					

				// et on sauvegarde la date de la demi-journée en l'affichant dans un tableau
					echo "<tr><th></th>";
					foreach ($lesDemiJournees as $laDemiJournee)
					{
						// on affiche les dates "à la française"
						list($year, $month, $day) = explode("-", $laDemiJournee->date);
      					$date_fr = $day."/".$month."/".$year;
						echo "<th>$date_fr</th>";

					}
					echo "</tr>";

				// affichage de la première ligne matin
					echo "<tr>
					<th><strong>Matin</strong></th>" ;

				// ligne matin
					$lesDemiJournees=$bdd->query("SELECT id, date from demijournee where matinAprem='matin'");		
					foreach ($lesDemiJournees as $demiJournee)
					{

						$lesDemi=$bdd->query("SELECT idDemiJournee from choixprofdemijournee join demijournee on idDemijournee=$demiJournee->id and idUtilisateur=$id_Util");
						$selection=$lesDemi -> fetch();
						if($lesDemi->rowCount () != 0) {
							// si la demi journée représentée par la checkbox a déjà été sélectionnée par l'utilisateur connecté, la checkbox sera déjà cochée pour la demi-journée
							echo "<th><input type='checkbox' checked name='chbmatinJ$demiJournee->id' id='chbmatinJ$demiJournee->id' value='$demiJournee->id'/><br>";
						} else {

							echo "<th><input type='checkbox' name='chbmatinJ$demiJournee->id' id='chbmatinJ$demiJournee->id' value='$demiJournee->id' /><br>";
						}

						// on prend les salles qui sont déjà attribuées à un utilisateur (s'il en a)
						$lesSalles=$bdd->query("SELECT libelle, salle.id from utilisateur join Salle on idSalleAtt=Salle.id where utilisateur.id=$id_Util and idSalleAtt is not null");

						// le SELECT a retourné un enregistrement: on récupère l'enregistrement 
						$salle =$lesSalles ->fetch();

						// si l'utilisateur n'a pas de salle attribuée, on veut lui afficher toutes les salles
						if($salle==false)
						{
							// on prend les salles dans la bdd
							echo "<select name='salle$demiJournee->id'>";
							$lesSalles=$bdd->query("SELECT id, libelle from salle where id not in (select idSalle from choixprofdemijournee where idDemiJournee=$demiJournee->id and idUtilisateur!=$id_Util)");
							foreach ($lesSalles as $salle)
							{
								$lesSallesSelect=$bdd->query("SELECT idSalle from choixprofdemijournee where idUtilisateur=$id_Util and idDemiJournee=$demiJournee->id");
								
								if($lesSallesSelect->rowCount() !=0 )
								{
									$uneSalleSelect=$lesSallesSelect ->fetch();
									if ($uneSalleSelect->idSalle == $salle->id ) {
										echo "<option selected value='$salle->id'>$salle->libelle</option>";
									} else {
										echo "<option value='$salle->id'>$salle->libelle</option>";
									}
								} else {
									echo "<option value='$salle->id'>$salle->libelle</option>";
								}			

							}
							echo "</select>";
						} 
						else 
						{
							echo "$salle->libelle";
						}
					}
					

					
					
					echo "</tr>";

					echo "<tr>
					<th><strong>Après-midi</strong></th>" ;
				// ligne aprem
					$lesDemiJournees=$bdd->query("SELECT id, date from demijournee where matinAprem='après-midi'");		
					foreach ($lesDemiJournees as $demiJournee)
					{

						$lesDemi=$bdd->query("SELECT idDemiJournee from choixprofdemijournee where idUtilisateur=$id_Util and idDemiJournee=$demiJournee->id ");
						if($lesDemi->rowCount () != 0) {
							echo "<th><input type='checkbox' checked name='chbapremJ$demiJournee->id' id='chbapremJ$demiJournee->id' value='$demiJournee->id'/><br>";
						} else {

							echo "<th><input type='checkbox' name='chbapremJ$demiJournee->id' id='chbapremJ$demiJournee->id' value='$demiJournee->id' /><br>";
						}

						$lesSalles=$bdd->query("SELECT libelle, salle.id from utilisateur join Salle on idSalleAtt=Salle.id where utilisateur.id=$id_Util and idSalleAtt is not null");

						// le SELECT a retourné un enregistrement: on récupère l'enregistrement 
						$salle =$lesSalles ->fetch();

						if($salle==false)
						{
							// on prend les salles dans la bdd
							echo "<select name='salle$demiJournee->id'>";			

							$lesSalles=$bdd->query("SELECT id, libelle from salle where id not in (select idSalle from choixprofdemijournee where idDemiJournee=$demiJournee->id and idUtilisateur!=$id_Util)");
							foreach ($lesSalles as $salle)
							{
								$lesSallesSelect=$bdd->query("SELECT idSalle from choixprofdemijournee where idUtilisateur=$id_Util and idDemiJournee=$demiJournee->id");
								
								if($lesSallesSelect->rowCount() !=0 )
								{
									$uneSalleSelect=$lesSallesSelect ->fetch();
									if ($uneSalleSelect->idSalle == $salle->id ) {
										echo "<option selected value='$salle->id'>$salle->libelle</option>";
									} else {
										echo "<option value='$salle->id'>$salle->libelle</option>";
									}
								} else {
									echo "<option value='$salle->id'>$salle->libelle</option>";
								}
							}
							echo "</select>";
						} 
						else 
						{

							echo "$salle->libelle";
							echo "<input type='hidden' name='salle$demiJournee->id' value='$salle->id' /><br>";
						}
					}
					
					




					?>
				</table>

				<input type="submit" name="bouton_valider" id="bouton_valider" value="Valider" />
				<!-- fin formulaire !-->
			</form>

			</div>
		</section>

	</body>
	</html>