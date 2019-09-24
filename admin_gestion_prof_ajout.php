<?php
session_start();
if(isset($_SESSION["idTypeUtilisateur"])==false || $_SESSION["idTypeUtilisateur"] != 1){                                                                                                                                                                                                                                                                                                                                                                                                                     
	header("Location: connexion_app.php");
}

//include "session_admin.php";
include "connexion_bd_gesoraux.php";
$msg ="";
  //on initialise les variables utilisées
  //pour afficher en cas d'erreur les valeurs saisies
  //au préalable dans le formulaire
$txt_nom="";
$txt_prenom="";
$txt_mail="";
$lst_discipline="";
$lst_salle="";
$rbt_civilite="";
  //si le tableau $_POST contient le bouton valider
  //alors cela signifie que le formulaire à été soumis 
if(isset ($_POST['btn_valider'])==true){
    //appel de la fonction extract qui créé automatiquement les variables
    //dont les noms sont les index de $_POST
    // et leurs affecte la valeur associé
	extract($_POST);
    //si le nom n'existe pas dans le tableau $_POST
    //ou s'il n'est pas renseigné : on ajoute un message d'erreur
	if(isset($txt_nom)==false || trim ($txt_nom)==""){
		$msg=$msg."Le nom est obligatoire<br>";
	}
	if(isset($txt_prenom)==false|| trim ($txt_prenom)==""){
		$msg=$msg."Le prénom est obligatoire";
	}
	if(isset ($txt_mail)==false || trim ($txt_mail)==""){
		$msg=$msg."<br> Le mail est obligatoire";
	}
	if(isset ($lst_discipline)==false || trim ($lst_discipline)==""){ 
		$msg=$msg."<br> La discipline est obligatoire";
	}
	if(isset ($rbt_civilite)==false || trim ($rbt_civilite)==""){
		$msg=$msg."<br> La civilité est obligatoire";
	}

    //s'il n'y a pas d'erreur de saisie on va ajouter l'enregistrement
	if($msg=="")
	{
      //on passe le nom et le prénom  en minuscule
		$nom_min = strtolower($txt_nom);
		$prenom_min = strtolower($txt_prenom);

      //on récupère l'année en cours 
		$annee = date("Y");

      //on génère le compte composé du prénom suivi du nom
		$identifiant = $prenom_min.".".$nom_min;
		
      //on génère le mot de passe composé des 2 premiers caractères du nom
      //suivis de l'année en cours suivie de 2 premiers caractères du prénom
		$mot_de_passe_en_clair = substr($nom_min, 0,2).$annee.substr($prenom_min, 0,2);
      //on appelle la fonction sha1 pour crypter le mot de passe avec le grain de sel
      //$mot_de_passe_crypte = sha1($identifiant.$mot_de_passe_en_clair);
		$mot_de_passe_crypte = sha1($mot_de_passe_en_clair);

		//Mettre la première lettre du prénom et du nom en majuscule 
		$nom_prem_maj = ucfirst($txt_nom);
		$prenom_prem_maj =  ucfirst($txt_prenom);

      // on prépare la requête insert
		try {
			$req=$bdd->prepare("INSERT into utilisateur values(0, :par_ident,:par_mdp,:par_mail, :par_nom, :par_prenom, :par_typeUtili,:par_salleAtt, :par_discipline,:par_civilite)");
			$req->bindValue (':par_ident', $identifiant, PDO::PARAM_STR);
			$req->bindValue (':par_mdp',$mot_de_passe_crypte , PDO::PARAM_STR);
			$req->bindValue (':par_mail',$txt_mail, PDO::PARAM_STR);
			$req->bindValue (':par_nom', $nom_prem_maj, PDO::PARAM_STR);
			//$req->bindValue (':par_nom', $nom_min, PDO::PARAM_STR);
			$req->bindValue (':par_prenom', $prenom_prem_maj, PDO::PARAM_STR);
			//$req->bindValue (':par_prenom', $prenom_min, PDO::PARAM_STR);
			$req->bindValue (':par_typeUtili',"2", PDO::PARAM_INT);
			if($lst_salle==0){
				$req->bindValue (':par_salleAtt', null, PDO::PARAM_INT);
			}
			else{
				$req->bindValue (':par_salleAtt', $lst_salle, PDO::PARAM_INT);
			}
			$req->bindValue (':par_discipline', $lst_discipline, PDO::PARAM_INT);
			$req->bindValue (':par_civilite', $rbt_civilite, PDO::PARAM_INT);
			$req->execute();
			$msg="Le professeur a bien été ajouté";

                //on se redirige vers l'affichage des employés en fournissant le message d'information
			header('Location: admin_gestion_prof_consultation.php?msg='.$msg);

		} catch(PDOException $e){
			echo("Err BDInsert  : erreur ajout table utilisateur dans admin_gestion_prof_ajout.php<br>
				Message d'erreur :".$e->getMessage());
				echo $identifiant;
		}
	}
}
?>
<!doctype html>
<html class="no-js" lang="fr-FR">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Application</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/png" href="assets/images/icon/icon.ico">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/themify-icons.css">
	<link rel="stylesheet" href="assets/css/metisMenu.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="assets/css/slicknav.min.css">
	<!-- amchart css -->
	<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
	<!-- others css -->
	<link rel="stylesheet" href="assets/css/typography.css">
	<link rel="stylesheet" href="assets/css/default-css.css">
	<link rel="stylesheet" href="assets/css/styles.css">
	<link rel="stylesheet" href="assets/css/responsive.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<!-- modernizr css -->
	<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
    <!-- preloader area start -->
    <div id="preloader">
    	<div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- page container area start -->
    <div class="page-container">
    	<!-- sidebar menu area start -->
    	<div class="sidebar-menu">
    		<div class="sidebar-header">
    			<div class="logo">
    				<a href="index.html"><img src="images/logo.png" alt="logo"></a>
    			</div>
    		</div>
    		<?php  
    		if($_SESSION["idTypeUtilisateur"]=='1'){
    			include "admin_nav.html";
    		}else{
    			if($_SESSION["idTypeUtilisateur"]=='2'){
    				include "prof_nav.html";
    			}else{
    				if($_SESSION["idTypeUtilisateur"]=='3'){
    					include "scolarite_nav.html";
    				}   
    			}
    		}
    		?>

    	</div>
    	<!-- sidebar menu area end -->
    	<!-- main content area start -->
    	<div class="main-content">
    		<!-- header area start -->
    		<div class="header-area">
    			<div class="row align-items-center">
    				<!-- nav and search button -->
    				<div class="nav-btn pull-left">
    					<span></span>
    					<span></span>
    					<span></span>
    				</div>
    				<div class="col-auto">
    				</div>
    				<div class="col-auto mr-auto"></div>
    				<!-- Nav Item - User Information -->
    				<?php 
    				include "bouton_profil.php";
    				?>
    			</div>
    		</div>
    		<section>

    			<div class="">
    				<form class="" action = "admin_gestion_prof_ajout.php" method="post">
    					<h1 class="text-center">Ajout d'un professeur</h1>
    					<?php include "admin_gestion_prof_comp_graph.php"?>
    				</form>
    				<div class="col">
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</section>
</div>
</div>
<!-- jquery latest version -->
<script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
<!-- bootstrap 4 js -->
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/metisMenu.min.js"></script>
<script src="assets/js/jquery.slimscroll.min.js"></script>
<script src="assets/js/jquery.slicknav.min.js"></script>

<!-- start chart js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<!-- start highcharts js -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<!-- start zingchart js -->
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
<script>
	zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
	ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
</script>
<!-- all line chart activation -->
<script src="assets/js/line-chart.js"></script>
<!-- all pie chart -->
<script src="assets/js/pie-chart.js"></script>
<!-- others plugins -->
<script src="assets/js/plugins.js"></script>
<script src="assets/js/scripts.js"></script>
</body>
</html>




