
<?php
session_start();
if(isset($_SESSION["idTypeUtilisateur"])==false || $_SESSION["idTypeUtilisateur"] != 1){
	header("Location: connexion_app.php");
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
	<script>
		function confirmer_suppres()
		{
			return(confirm('Êtes-vous sûr de vouloir supprimer les informations de ce professeur ?'));
		}
	</script>
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
    				<a href="panel_admin_gesoraux.php"><img src="images/logo.png" alt="logo"></a>
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

    			<?php
    			if(isset($_GET['msg'])==true){
    				$msg=$_GET['msg'];
    			} else {
					$msg="";
				}
    			?>
    			<header>
    				<br>
    				<h1 class="text-center">Consultation des professeurs </h1>
    			</header>
    			<div class="">
    				<div class="">
    					<div class="col">
    						<br>
    						<div class="d-flex justify-content-center">
    							<a href="admin_gestion_prof_ajout.php"> <input class="btn btn-success btn-lg" type="button" name="btn_ajout_prof" value="Ajouter un professeur"></a>
    						</div>
    						<br>
    						<?php 
    						if($msg != ""){
    							echo"<div class='alert alert-success'>";
    							echo $msg; 
							}
							
    						?>
    					</div>
    					<br>
    					
    					<div class="d-flex justify-content-center">
    						
    						<div class="table table-striped">
    							<?php
    							include "connexion_bd_gesoraux.php";
    							try{
    								$lesEnregs=$bdd->query("SELECT utilisateur.id as 'idUtilisateur',nom, prenom, mail, discipline.libelle as 'discipline', 
    									salle.libelle as 'salle'
    									FROM utilisateur 
    									left outer join discipline on idDiscipline = discipline.id 
    									left outer join salle on idSalleAtt = salle.id
    									Order BY nom"); 
    								if($lesEnregs->rowCount()==0) {
									//le SELECT n'a pas retournée d'enregistrement : on affiche un message d'erreur
    									echo("Aucun professeur n'a été enregistré");
    								} else {
									//-----------------------------------------------------------------------
									//le SELECT a retourné un ou plusieur enregistrements
									//pour chaque enregistrement, on affiche le nom, le prénom, l'email,
									// la discipline et la salle attitrée
									//-----------------------------------------------------------------------
									//affichage de la première ligne du tableau
    									echo" <table class ='table table-striped text-center'>";
    									echo" <thead class='thead-dark'>";
    									echo" <tr>";
    									echo "<th>Nom</th>";
    									echo "<th>Prénom</th>";
    									echo "<th>E-mail</th>";
    									echo "<th>Discipline</th>";
    									echo "<th>Salle</th>";
    									echo "<th>Modifier</th>";
    									echo "<th>Supprimer</th>";
    									echo" </tr>";
    									echo"</tr>";
									// affichage des caractéristiques de chaque professeur
    									foreach($lesEnregs as $enreg){
    										echo" <tr>";
    										echo "<td> $enreg->nom</td>";
    										echo "<td> $enreg->prenom</td>";
    										echo "<td> $enreg->mail</td>";
    										echo "<td> $enreg->discipline</td>";
    										echo "<td> $enreg->salle</td>";
    										echo"<td> <a href='admin_gestion_prof_modif.php?id=$enreg->idUtilisateur'> <input class='btn btn-info' type='button' name='btn_modif_prof' value='Modifier'> </a> </td>";
    										echo"<td> <a href='admin_gestion_prof_supp.php?id=$enreg->idUtilisateur' onclick='return confirmer_suppres();'> <input class='btn btn-danger' type='button' name='btn_supp_prof' value='Supprimer'> </a></td>";
    										echo" </tr>";

    									}
    									echo" </table>";
    								}
    							} catch(PDOException $e) {
    								echo(" erreur de SELECT dans gestion_prof_admin.php<br>Message d'erreur :".$e->getMessage());
    							}
    							?>
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


