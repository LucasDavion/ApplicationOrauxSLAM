<?php 
$msg="";
session_start();
if (isset($_POST ["ident"])==true && isset($_POST["mdp"])==true)
{
	include "connexion_bd_gesoraux.php";

	extract($_POST);
	if(empty($_POST)==false){
		try{
			$mdp_crypte=sha1($mdp);
			$req= $bdd->prepare("SELECT nom, prenom, idTypeUtilisateur, id, idDiscipline FROM utilisateur WHERE identifiant= :par_identifiant AND motDePasse= :par_motDePasse");
			$req->bindValue(':par_identifiant', $ident, PDO::PARAM_STR);
			$req->bindValue(':par_motDePasse', $mdp_crypte, PDO::PARAM_STR);
			$req->execute();
			$enreg=$req->fetch();	
		}catch (PDOException $e){
			die("Err BDSelect : erreur select table utilisateur dans connexion_verif_app.php<br>
				Message d'erreur :" .$e->getMessage());
		}
		if($enreg==false){
			$msg="Veuillez saisir un identifiant et un mot de passe correct";
		}else{
			$_SESSION['nom_prenom'] = $enreg->nom." ".$enreg->prenom;
			$_SESSION['idTypeUtilisateur'] = $enreg->idTypeUtilisateur;
			$_SESSION['id'] = $enreg->id;
			$_SESSION['idDiscipline']=$enreg->idDiscipline;
			if($enreg->idTypeUtilisateur=='1'){
				header('Location: panel_admin_gesoraux.php');
			}else{
				if($enreg->idTypeUtilisateur=='2'){
					header('Location: panel_prof_gesoraux.php');
				}else{
					if($enreg->idTypeUtilisateur=='3'){
						header('Location: panel_scolarite_gesoraux.php');
					}	
				}
			}
		}
	}
}else{

}

?>