<?php 
	//include du script permettant de vérifier que l'on est connecté en tant qu'administrateur
	//include "session_admin.php";

	//on initialise la variable $msg qui contiendra la liste des erreurs
$msg="";

	//-------------------------------------------------------------
	//est ce que l'id du professeur à supprimer à été passé en GET ?
	//-------------------------------------------------------------
if(isset($_GET['id'])==true && $_GET['id']>0){
		//connnexion à la base de données
	include "connexion_bd_gesoraux.php";
	$id=$_GET['id'];
	try{
			//---------------------------------------------------------
			//on supprime (requête delete) le professeur dont l'identifiant 
			//est dans $_GET['id']
			//---------------------------------------------------------
		$id=$_GET['id'];
		$req=$bdd->prepare("DELETE FROM utilisateur where id=:par_id");
		$req->bindValue (':par_id', $id, PDO::PARAM_INT);
		$req->execute();
			//on indique dans la variable $msg que tout s'est bien passé
			//et on fait une redirection(header) vers gestion_prof_admin.php
			//en passant la variable $msg

		$msg="Le professeur a bien été supprimé";
		header('Location: admin_gestion_prof_consultation.php?msg='.$msg);

	}catch(PDOException $e){
		echo("Err BDInsert  : erreur suppression table employe dans admin_gestion_prof_supp.php<br>
			Message d'erreur :".$e->getMessage());
	}
}
?>