

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
	<script type="text/javascript">
		function confirmer_suppres()
		{
			return(confirm('Etes-vous sûr de vouloir supprimer cet élève ainsi que ses épreuves.'));
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

    			<?php
    			if(isset($_GET['msg'])==true){
    				$msg=$_GET['msg'];
    			} else {
    				$msg="";
    			}
    			?>
    			<header>
    				<br>
    				<h1 class="text-center">Consultation des élèves</h1>
    			</header>

    			<!--<?php // include "nav_admin.html" ?> !-->

    			<section class="">
    				
    					<div class="col "></div>
    						<br>
    						<div class="d-flex justify-content-center">
    							<a href='admin_gestion_eleves_ajout.php'>
    								<input class="btn btn-success btn-lg" type='button' name='AjoutEleve' value='Ajouter un élève'/>
    							</a>

    						</div>
    						<br>	
    						<?php 
    						if($msg != ""){
    							echo"<div class='alert alert-success'>";
    							echo $msg; 
    							echo "</div>";
    						}
    						?>

    						<br>

    						<div class="d-flex justify-content-center">
    							<?php 



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
    								echo "<table class ='table table-striped text-center'>";
    								echo"<thead class='thead-dark'>";
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
    								echo "</thead>";

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
    									<input class='btn btn-info' type='button' name='Modifier' value='Modifier'/></a></td>";
    									echo "<td><a href ='admin_gestion_eleves_suppression.php?idElev=$enreg->eleId&idEp=$enreg->pasId' onclick='return confirmer_suppres();'>
    									<input class='btn btn-danger'type='button' name='Supprimer' value='Supprimer'/></a></td>";

    								}
    								echo "</table>";
    							} catch(PDOException $e) {
    								die("ErrSelectEleEpre : erreur de selection des élèves ou des passages épreuve dans admin_gestio_eleves_consultation.php
    									<br>Message d'erreur : " .$e->getMessage());
    							}				
    							?>		
    						</div>		
    					</div>
    				</div>
    			</div>
    		</section>
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
