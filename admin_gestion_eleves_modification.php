<?php include"admin_test_session.php";
	$msg="";
	if(isset($_GET['idElev'])==true && $_GET['idElev']>0 && isset($_GET['idEp'])==true && $_GET['idEp']>0){
		$idEle=$_GET['idElev'];
		$idEpre=$_GET['idEp'];
		include"connexion_bd_gesoraux.php";
		try{
			// select des infos de l'élève
			$lesEnregsE=$bdd->prepare("SELECT nom,prenom,dateNaissance,tiersTempsON,section.libelle as secLib,division.libelle as divLib,civilite.libelle as civLib from eleve 
							left outer join section on idSection=section.id 
							join division on idDivision=division.id 
							join civilite on idCivilite=civilite.id 
							where eleve.id=:par_idEleve");
							
			$lesEnregsE->bindValue(":par_idEleve", $idEle, PDO::PARAM_INT);

			$lesEnregsE->execute();

		} catch(PDOException $e){
			echo("ErrSelectCarac1: Erreur lors de la sélection des caractéristiques dans admin_gestion_eleves_modification.php.
				<br>Message d'erreur :".$e->getMessage());
		}

			$eleve=$lesEnregsE->fetch();
		try{
			// select des infos de l'épreuve 
			$lesEnregP=$bdd->prepare("SELECT inscritBenef,derogation,discipline.libelle as disLib,natureepreuve.libelle as natLib from passageepreuve 
				join epreuve on idEpreuve=epreuve.id 
				join natureepreuve on idNatureEpreuve=natureepreuve.id 
				join discipline on idDiscipline=discipline.id 
				where idEleve=:par_idEleve && passageepreuve.id=:par_idPass");
			$lesEnregP->bindValue(':par_idEleve',$idEle, PDO::PARAM_INT);
			$lesEnregP->bindValue(':par_idPass',$idEpre, PDO::PARAM_STR);
			$lesEnregP->execute();
		} catch(PDOException $e){
			echo("ErrSelectCarac2: Erreur lors de la sélection des caractéristiques dans admin_gestion_eleves_modification.php.
				<br>Message d'erreur :".$e->getMessage());
		}
			$passage=$lesEnregP->fetch();
			
			
			$txt_nom=$eleve->nom;
			$txt_prenom=$eleve->prenom;
			$txt_dateNai=$eleve->dateNaissance;
			$rbt_tiersTemps=$eleve->tiersTempsON;
			$lst_civilite=$eleve->civLib;
			$lst_division=$eleve->divLib;
			$lst_section=$eleve->secLib;
			$rbt_benef=$passage->inscritBenef;			
			$rbt_derog=$passage->derogation;			
			$lst_epreuve=$passage->disLib;
			

	}
			
	
	if(isset($_POST['btn_valider'])==true){
		extract($_POST);
		if (isset($txt_nom)==false) {
			$msg=$msg."Le nom est obligatoire.<br>";
		} 
		if(isset($txt_prenom)==false){
			$msg=$msg."Le prénom est obligatoire.<br>";
		} 
		if (isset($txt_dateNai)==false) {
			$msg=$msg."La date de naissance est obligatoire.<br>";
		} 
		if (isset($rbt_tiersTemps)==false) {
			$msg=$msg."Le tiers temps n'a pas été sélectionné.<br>";
		} 
		if (isset($lst_civilite)==false) {
			$msg=$msg."La civilité est obligatoire.<br>";
		} 
		if(isset($lst_division)==false) {
			$msg=$msg."La division est obligatoire.<br>";
		} 
		if (isset($rbt_benef)==false) {
			$msg=$msg."Le bénéfice n'a pas été sélectionné.<br>";
		} 

		if (isset($rbt_derog)==false) {
			$msg=$msg."La dérogation n'a pas été sélectionné.<br>";
		} 

		if(isset($lst_epreuve)==false) {
			$msg=$msg."L'épreuve n'a pas été sélectionné.<br>";
		} 

		if($msg==""){
			include"connexion_bd_gesoraux.php";
			try{
				$lesEnregsE=$bdd->prepare("UPDATE eleve set nom=:par_nom,prenom=:par_prenom,dateNaissance=:par_date,tiersTempsON=:par_tiers,idCivilite=:par_idCivilite,idSection=:par_idSection,idDivision=:par_idDivision where id=:par_idE");

				$lesEnregsE->bindValue(':par_idE',$idEle, PDO::PARAM_INT);
				$lesEnregsE->bindValue(':par_nom', $txt_nom, PDO::PARAM_STR);
				$lesEnregsE->bindValue(':par_prenom', $txt_prenom, PDO::PARAM_STR);
				$lesEnregsE->bindValue(':par_date', $txt_dateNai, PDO::PARAM_STR);
				$lesEnregsE->bindValue(':par_tiers', $rbt_tiersTemps, PDO::PARAM_STR);
				$lesEnregsE->bindValue(':par_idCivilite', $lst_civilite, PDO::PARAM_INT);
				if(isset($lst_section)==true){
					$sect=$lst_section;
				} else {
					$sect=null;
				}
				$lesEnregsE->bindValue(':par_idSection', $sect, PDO::PARAM_INT);
				$lesEnregsE->bindValue(':par_idDivision', $lst_division, PDO::PARAM_INT);
				
				$lesEnregsE->execute();

			} catch(PDOException $e) {
				echo("ErrUpdateEleve : Erreur lors de la modification d'un eleve dans admin_gestion_eleves_modification.php.
				<br>Message d'erreur :".$e->getMessage());
			}	

			try{
				$lesEnregP=$bdd->prepare("UPDATE passageepreuve set inscritBenef=:par_benef,derogation=:par_derog,idEpreuve=:par_idEpreuve where id=:par_idP");

				$lesEnregP->bindValue(':par_idP',$idEpre,PDO::PARAM_INT);
				$lesEnregP->bindValue(':par_benef',$rbt_benef,PDO::PARAM_STR);
				$lesEnregP->bindValue(':par_derog',$rbt_derog,PDO::PARAM_STR);											
				$lesEnregP->bindValue(':par_idEpreuve',$lst_epreuve,PDO::PARAM_INT);
			
				$lesEnregP->execute();
			} catch(PDOException $e) {
				echo("ErrUpdateEpreuve : Erreur lors de la modification de l'épreuve de l'élève dans admin_gestion_eleves_modification.php.
				<br>Message d'erreur :".$e->getMessage());
			}	

				$msg="La modification a bien été effectué.";

				header('Location: admin_gestion_eleves_consultation.php?msg='.$msg);
			
		}
	}			
?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<meta name ="vieuwport" content="width=device-width, initial-scale-1.0">
	<meta name="description" content="Site de gestion d'oraux">
	<link rel="stylesheet" href="style.css">
	<title>Modification d'un élève</title>
</head>
<body>
	
	<div id="container">
	<header>
		<h1>Modification d'un élève</h1>
	</header>
	<form action="" method="post">	

		<?php
			include"admin_gestion_eleves_composant_graph.php";
		?>
		<label><b>Bénéficiaire :</b></label><br>
		<?php
			if($rbt_benef == "O"){
				echo "<input type='radio' checked name='rbt_benef' id='benefOui' value='O'>Oui";
			} else {
				echo "<input type='radio'  name='rbt_benef' id='benefOui' value='O'>Oui";
			}
			if($rbt_benef == "N"){
				echo "<input type='radio' checked name='rbt_benef' id='benefNon' value='N'>Non";
			} else {
				echo "<input type='radio' name='rbt_benef' id='benefNon' value='N'>Non";
			}
		?>
		<br><br>
		<label><b>Dérogation :</b></label><br>
		<?php
			if($rbt_derog == "O"){
				echo "<input type='radio' checked name='rbt_derog' id='derogOui' value='O'>Oui";
			} else {
				echo "<input type='radio'  name='rbt_derog' id='derogOui' value='O'>Oui";
			}
			if($rbt_derog == "N"){
				echo "<input type='radio' checked name='rbt_derog' id='derogNon' value='N'>Non";
			} else {
				echo "<input type='radio' name='rbt_derog' id='derogNon' value='N'>Non";
			}
		?>
		<br><br>
		<label><b>Epreuve :</b></label><br>
		<select name="lst_epreuve">
			<?php 
				include "connexion_bd_gesoraux.php";
				try{
					$lesEnregs=$bdd->query("SELECT id,libelle from discipline");
				} catch(PDOException $e) {
					die("ErrSelecCiv : erreur lors de la sélection des civilités dans admin_gestion_eleves_composant_graph.php<br>
						Message d'erreur : ".$e->getMessage());
				}
				if($lesEnregs->rowCount()>0) {
					foreach ($lesEnregs as $enreg) {
						if($lst_epreuve == $enreg->libelle){
							echo "<option selected value='$enreg->id'>$enreg->libelle</option>";
						} else {
							echo "<option value='$enreg->id'>$enreg->libelle</option>";
						}
					}
				}
			?>
		</select>
		<br><br>
		<input type="submit" name="btn_valider" value="Valider" />
		<?php
			echo $msg;
		?>
		<input type="hidden" name="id" value="<?php echo $idEle,$idEpre;?>">
				
	</form>
</div>
</body>
</html>