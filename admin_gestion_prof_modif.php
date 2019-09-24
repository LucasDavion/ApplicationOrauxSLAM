<?php
session_start();
if(isset($_SESSION["idTypeUtilisateur"])==false || $_SESSION["idTypeUtilisateur"] != 1){
	header("Location: connexion_app.php");
}
?>
<?php
    //include "session_admin.php";
    // le script est-il appelé lors du clic sur le bouton  Modifier situé sur la page
    //d'affichage des professeur (script gestion_prof_admin.php)
$msg="";
$id="1";
if(isset($_GET['id'])==true && $_GET['id']>0){
            // on récupère l'identifiant du professeur passé avec la méthode GET dans la variable $id
	$id=$_GET['id'];
            //connexion à la base de données
	include "connexion_bd_gesoraux.php";
	try{
                //on récupère les caractéristiques du professeur
                //dont l'identifiant est contenu dans la variable $id
		$lesEnregs=$bdd->query("SELECT nom,prenom,mail,idDiscipline,idSalleAtt,idCivilite FROM utilisateur where id=$id");
		if ($lesEnregs->rowCount() == 0) {
			echo "Aucun enregistrement";
		} else {
			$unEnreg=$lesEnregs->fetch();
                // on stocke les caractéristiques du professeur
                // dans les variables ayant le même nom
                //que les contrôles du formulaire.
                //par exemple : la variable $txt_nom contiendra le nom du professeur
			$txt_nom = $unEnreg->nom;
			$txt_prenom = $unEnreg->prenom;
			$txt_mail = $unEnreg->mail;
			$lst_discipline = $unEnreg->idDiscipline;
			$lst_salle = $unEnreg->idSalleAtt;
			$rbt_civilite =$unEnreg->idCivilite;
		}
	}catch(PDOException $e){
		echo("Err BDALec01Erreur : erreur de SELECT dans admin_gestion_prof_modif.php <br>Message d'erreur :".$e->getMessage());
	}
}
    //si le tableau $_POST contient le bouton valider
    // alors cela signifie que le formulaire a été soumis
    //le traitement de mise à jour va avoir lieu

if(isset($_POST['btn_valider'])==true){
            //on appelle la fonction extract qui créée automatiquement les variables
            //dont les noms sont les index de $_POST
            //et leur affecte la valeur associée
	extract($_POST);
            //si le nom n'existe pas dans le tableau $_POST//ou s'il n'est pas renseigné : on ajoute un message d'erreur
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
            // s'il n'y a pas d'erreur de saisie on va modifier l'enregistrement
	echo $msg;
	if($msg==""){
                //connexion à la base de données
		include "connexion_bd_gesoraux.php";
		try{
                    //on réalise la requête de mise à jour (update)
			$req=$bdd->prepare("UPDATE utilisateur SET nom=:par_nom, prenom=:par_prenom, mail=:par_mail, idSalleAtt=:par_salle,idDiscipline=:par_discipline,
				idCivilite=:par_civilite where id=$id");
				//Mettre la première lettre du prénom et du nom en majuscule 
				$nom_prem_maj = ucfirst($txt_nom);
				$prenom_prem_maj =  ucfirst($txt_prenom);
			$req->bindValue (':par_nom', $nom_prem_maj, PDO::PARAM_STR);
			$req->bindValue (':par_prenom', $prenom_prem_maj, PDO::PARAM_STR);
			$req->bindValue (':par_mail', $txt_mail, PDO::PARAM_STR);

			if($lst_salle==0){
				$req->bindValue (':par_salle', null, PDO::PARAM_INT);
			}
			else{
				$req->bindValue (':par_salle', $lst_salle, PDO::PARAM_INT);
			}

			$req->bindValue (':par_discipline', $lst_discipline, PDO::PARAM_INT);
			$req->bindValue (':par_civilite', $rbt_civilite, PDO::PARAM_INT);

			$req->execute();
                    //on indique dans la variable $msg que tout s'est bien passé
			$msg="la modification a bien été prise en compte";

                    //on se redirige vers l'affichage des employés en fournissant le message d'information
			header('Location: admin_gestion_prof_consultation.php?msg='.$msg);
		}catch(PDOException $e){
			echo("Err BDALec01Erreur : erreur de modification dans admin_gestion_prof_modif.php<br>Message d'erreur :".$e->getMessage());
			

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
    		<header>
    			<h1></h1>
    		</header>
    		<?php 
//include "nav_admin.html"
    		?>
    		<section class="jaune">
    			<div id="container">
    				<!-- formulaire de modification -->
    				<form action ="" method="POST">
    					<br>
    					<h1 class="text-center">Modification d'un professeur</h1>
    					<?php include "admin_gestion_prof_comp_graph.php" ?>
    					<input type="hidden" name="id" value="<?php echo $id;?>">
    				</form>
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

