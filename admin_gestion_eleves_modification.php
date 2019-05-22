
<?php
session_start();
if(isset($_SESSION["idTypeUtilisateur"])==false || $_SESSION["idTypeUtilisateur"] != 1){
    header("Location: connexion_app.php");
}
?>
<?php 
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
	<br>
<h1 class="text-center">Modification d'un élève</h1> <br>
<form action="" method="post">	

		<?php
			include"admin_gestion_eleves_composant_graph.php";
		?>

		<div class="form-group">
			<label class="col-md-4"><b>Bénéficiaire :</b></label><br>
			<div class="col-md-12">
			<?php
				echo"<div class='form-check form-check-inline'>";
				if($rbt_benef == "O"){
					echo "<input class='form-check-input' type='radio' checked name='rbt_benef' id='benefOui' value='O'>Oui";
				} else {
					echo "<input class='form-check-input' type='radio'  name='rbt_benef' id='benefOui' value='O'>Oui";
				}
				echo"</div>";
				echo"<div class='form-check form-check-inline'>";
				if($rbt_benef == "N"){
					echo "<input class='form-check-input' type='radio' checked name='rbt_benef' id='benefNon' value='N'>Non";
				} else {
					echo "<input class='form-check-input' type='radio' name='rbt_benef' id='benefNon' value='N'>Non";
				}
				echo"</div>";
			?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-4"><b>Dérogation :</b></label><br>
			<div class="col-md-12">
				<?php
					echo"<div class='form-check form-check-inline'>";
					if($rbt_derog == "O"){
						echo "<input class='form-check-input' type='radio' checked name='rbt_derog' id='derogOui' value='O'>Oui";
					} else {
						echo "<input class='form-check-input' type='radio'  name='rbt_derog' id='derogOui' value='O'>Oui";
					}
					echo"</div>";
					echo"<div class='form-check form-check-inline'>";
					if($rbt_derog == "N"){
						echo "<input class='form-check-input' type='radio' checked name='rbt_derog' id='derogNon' value='N'>Non";
					} else {
						echo "<input class='form-check-input' type='radio' name='rbt_derog' id='derogNon' value='N'>Non";
					}
					echo"</div>";
				?>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-4"><b>Epreuve :</b></label><br>
			<div class="col-md-12">
				<select class="custom-select custom-select" name="lst_epreuve">
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
									echo "<option class='form-group' selected value='$enreg->id'>$enreg->libelle</option>";
								} else {
									echo "<option class='form-group' value='$enreg->id'>$enreg->libelle</option>";
								}
							}
						}
					?>
				</select>
			</div>
		</div>
		<div class="form-group d-flex justify-content-center">
			<input class='btn btn-success btn-lg' type="submit" name="btn_valider" value="Valider" />
		</div>
		<?php
			echo $msg;
		?>
		<input type="hidden" name="id" value="<?php echo $idEle,$idEpre;?>"/>
			
	</form>	
</div>
</div>
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
