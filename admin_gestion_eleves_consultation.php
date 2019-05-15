<?php
	include"admin_test_session.php";
?>
<!DOCTYPE html>
<html lang="fr-FR">
<head>
	<meta charset="UTF-8">
	<meta name ="vieuwport" content="width=device-width, initial-scale-1.0">
	<meta name="description" content="Site de gestion d'oraux">
	<link rel="stylesheet" href="bootstrap.min.css">
	<title>Consultation des élèves</title>
	<script type="text/javascript">
		function confirmer_suppres()
		{
			return(confirm('Etes-vous sûr de vouloir supprimer cet élève.'));
		}
	</script>
</head>
<body>
	<header>
		<h1>Consultation des élèves</h1>
	</header>

		<!--<?php // include "nav_admin.html" ?> !-->

	<section class="bleu">
		<h1>Gestion des élèves (liste, ajout, modification, suppression)</h1>

		<div class="sec">
			<div class="table">
				<a href='admin_gestion_eleves_ajout.php'>
					<input type='button' name='AjoutEleve' value='Ajouter un élève'/>
				</a>
			</div>
			<?php 
					if(isset($_GET['msg'])==true){
						$msg=$_GET['msg'];
					} else {
						$msg="";
					}
					include "connexion_bd_gesoraux.php";
					// Sélection des informations 
					try {
						$lesEnregs=$bdd->query("SELECT eleve.id as eleId,nom,prenom,dateNaissance,tiersTempsON,section.libelle as secLib,division.libelle as divLib,civilite.libelle as civLib,passageepreuve.id as pasId,inscritBenef,derogation,discipline.libelle as disLib,natureepreuve.libelle as natLib from passageepreuve 
							join eleve on idEleve=eleve.id
							left outer join section on idSection=section.id 
							join division on idDivision=division.id 
							join civilite on idCivilite=civilite.id 
							join epreuve on idEpreuve=epreuve.id 
							join natureepreuve on idNatureEpreuve=natureepreuve.id 
							join discipline on idDiscipline=discipline.id 
							order by nom");

						
						// affichage de la première ligne du tableau
						echo "<table class ='table text-center'>";
						echo "<tr>";
						echo "<th>Nom</th>";
						echo "<th>Prénom</th>";
						echo "<th>Date de Naissance</th>";
						echo "<th>Civilité</th>";
						echo "<th>Section</th>";
						echo "<th>Division</th>";
						echo "<th>Nature Epreuve</th>";
						echo "<th>Langue</th>";
						echo "<th>Tiers-Temps</th>";
						echo "<th>Bénéfice</th>";
						echo "<th>Dérogation</th>";

						echo "<th>Modifier</th>";
						echo "<th>Supprimer</th>";
					    echo "</tr>";

					    // affichage des caractéristiques de chaque élève
					    foreach($lesEnregs as $enreg) {
					    	echo "<tr>";
					    	echo "<td>$enreg->nom</td>";
					    	echo "<td>$enreg->prenom</td>";

					    	list($year, $month, $day) = explode("-", $enreg->dateNaissance);
     						$date_fr = $day."/".$month."/".$year;

					    	echo "<td>$date_fr</td>";
					    	echo "<td>$enreg->civLib</td>";
					    	echo "<td>$enreg->secLib</td>";
					    	echo "<td>$enreg->divLib</td>";
					    	echo "<td>$enreg->natLib</td>";
					    	echo "<td>$enreg->disLib</td>";
					    	echo "<td>$enreg->tiersTempsON</td>";
					    	echo "<td>$enreg->inscritBenef</td>";
					    	echo "<td>$enreg->derogation</td>";
					    	
				    		// boutton modif et supprimer
					    	echo "<td><a href ='admin_gestion_eleves_modification.php?idElev=$enreg->eleId&idEp=$enreg->pasId'>
					    		<input type='button' name='Modifier' value='Modifier'/></a></td>";
					    	echo "<td><a href ='admin_gestion_eleves_suppression.php?idElev=$enreg->eleId&idEp=$enreg->pasId' onclick='return confirmer_suppres();'>
					    		<input type='button' name='Supprimer' value='Supprimer'/></a></td>";
					    		
					    }
					    echo "</table>";
					} catch(PDOException $e) {
						die("ErrSelectEleEpre : erreur de selection des élèves ou des passages épreuve dans admin_gestio_eleves_consultation.php
							<br>Message d'erreur : " .$e->getMessage());
					}
					echo $msg;
		    ?>
		</div>
	</section>
	<footer>
		
	</footer>
</body>
</html>