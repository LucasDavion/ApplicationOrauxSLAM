<?php 
	include"connexion_bd_gesoraux.php";

	// Initialisation variable
	$msg="";
	$txt_nom="";
	$txt_prenom="";
	$txt_dateNai="";
	$rbt_tiersTemps="N";
	$lst_civilite="";
	$lst_division="";
	$lst_section="";
	$rbt_benefLV1="N";
	$rbt_benefLV2="N";
	$rbt_derogLV1="N";
	$rbt_derogLV2="N";
	$lst_epreuveLV1="";
	$lst_epreuveLV2="";


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
		if (isset($rbt_benefLV1)==false) {
			$msg=$msg."Le bénéfice LV1 n'a pas été sélectionné.<br>";
		} 
		if (isset($rbt_benefLV2)==false) {
			$msg=$msg."Le bénéfice LV2 n'a pas été sélectionné.<br>";
		} 
		if (isset($rbt_derogLV1)==false) {
			$msg=$msg."La dérogation LV1 n'a pas été sélectionné.<br>";
		} 
		if (isset($rbt_derogLV2)==false) {
			$msg=$msg."La dérogation LV2 n'a pas été sélectionné.<br>";
		} 
		if (isset($lst_epreuveLV1)==false) {
			$msg=$msg."L'épreuve LV1 n'a pas été sélectionné.<br>";
		} 
		if (isset($lst_epreuveLV2)==false){
			$msg=$msg."L'épreuve LV2 n'a pas été sélectionné.<br>";
		} 

		if($msg==""){
			try{
				//insertion de l'élève
				$insert_eleve=$bdd->prepare("INSERT into eleve values(0,:par_nom, :par_prenom,:par_date,:par_tiers,:par_idCivilite,:par_idSection,:par_idDivision)");
				
				$insert_eleve->bindValue(':par_nom', $txt_nom, PDO::PARAM_STR);
				$insert_eleve->bindValue(':par_prenom', $txt_prenom, PDO::PARAM_STR);
				$insert_eleve->bindValue(':par_date', $txt_dateNai, PDO::PARAM_STR);
				$insert_eleve->bindValue(':par_tiers', $rbt_tiersTemps, PDO::PARAM_STR);
				$insert_eleve->bindValue(':par_idCivilite', $lst_civilite, PDO::PARAM_INT);
				if(isset($lst_section)== true && $lst_section>0){
					$sect=$lst_section;
				} else {
					$sect=null;
				}
				$insert_eleve->bindValue(':par_idSection', $sect, PDO::PARAM_INT);
				$insert_eleve->bindValue(':par_idDivision', $lst_division, PDO::PARAM_INT);
				
				$insert_eleve->execute();
				$idEleve=$bdd->lastInsertId();
			} catch(PDOException $e) {
				die("ERRInsertEleve : Erreur lors de l'insertion d'un élève dans admin_gestion_eleves_ajout_exec.php <br>Message d'erreur".$e->getMessage());
			}

			try{
				$insert_epreuve1=$bdd->prepare("INSERT into passageepreuve values(0,:par_benef,:par_derog,:par_absence,:par_idElev,:par_idDemiJournee,:par_idPlage,:par_idEpreuve,:par_idProfChoix,:par_idSalle,:par_idProfAffecte)");

				$insert_epreuve1->bindValue(':par_benef',$rbt_benefLV1,PDO::PARAM_STR);
				$insert_epreuve1->bindValue(':par_derog',$rbt_derogLV1,PDO::PARAM_STR);
				$insert_epreuve1->bindValue(':par_absence',null,PDO::PARAM_STR);
				$insert_epreuve1->bindValue(':par_idElev',$idEleve,PDO::PARAM_INT);
				$insert_epreuve1->bindValue(':par_idDemiJournee',null,PDO::PARAM_STR);
				$insert_epreuve1->bindValue(':par_idPlage',null,PDO::PARAM_STR);
				$insert_epreuve1->bindValue(':par_idEpreuve',$lst_epreuveLV1,PDO::PARAM_INT);
				$insert_epreuve1->bindValue(':par_idProfChoix',null,PDO::PARAM_STR);
				$insert_epreuve1->bindValue(':par_idSalle',null,PDO::PARAM_STR);
				$insert_epreuve1->bindValue(':par_idProfAffecte',null,PDO::PARAM_STR);

				$insert_epreuve1->execute();

			} catch(PDOException $e) {
				die("ErrInsertEpreuve1 : Erreur lors de l'insertion de l'épreuve 1 dans admin_gestion_eleves_ajout_exec.php<br>Message d'erreur : ".$e->getMessage());
			}
			try{
				$insert_epreuve2=$bdd->prepare("INSERT into passageepreuve values(0,:par_benef,:par_derog,:par_absence,:par_idElev,:par_idDemiJournee,:par_idPlage,:par_idEpreuve,:par_idProfChoix,:par_idSalle,:par_idProfAffecte)");

				$insert_epreuve2->bindValue(':par_benef',$rbt_benefLV2,PDO::PARAM_STR);
				$insert_epreuve2->bindValue(':par_derog',$rbt_derogLV2,PDO::PARAM_STR);
				$insert_epreuve2->bindValue(':par_absence',null,PDO::PARAM_STR);
				$insert_epreuve2->bindValue(':par_idElev',$idEleve,PDO::PARAM_INT);
				$insert_epreuve2->bindValue(':par_idDemiJournee',null,PDO::PARAM_STR);
				$insert_epreuve2->bindValue(':par_idPlage',null,PDO::PARAM_STR);
				$insert_epreuve2->bindValue(':par_idEpreuve',$lst_epreuveLV2,PDO::PARAM_INT);
				$insert_epreuve2->bindValue(':par_idProfChoix',null,PDO::PARAM_STR);
				$insert_epreuve2->bindValue(':par_idSalle',null,PDO::PARAM_STR);
				$insert_epreuve2->bindValue(':par_idProfAffecte',null,PDO::PARAM_STR);

				$insert_epreuve2->execute();

			} catch(PDOException $e) {
				die("ErrInsertEpreuve2 : Erreur lors de l'insertion de l'épreuve 2 dans admin_gestion_eleves_ajout_exec.php<br>Message d'erreur : ".$e->getMessage());
			}
			$msg="L'élève a bien été ajouté.";

			header('Location:admin_gestion_eleves_consultation.php?msg='.$msg);
		}
	}
	echo($msg);
?>
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

<div class="container">
		<header>
			<br>
			<h1 class="text-center">Ajout d'un élève</h1><br>
		</header>
		
			<form class="" action="" method="post">		
				<?php
					include"admin_gestion_eleves_composant_graph.php";
				?>
				<div class="form-group">
					<label class="col-md-4"><b>Bénéficiaire LV1 :</b></label><br>
					<div class="col-md-12">
						<?php
							echo"<div class='form-check form-check-inline'>";
							if($rbt_benefLV1 == "O"){
								echo "<input class='form-check-input' type='radio' checked name='rbt_benefLV1' id='benefLV1Oui' value='O'>Oui";
							} else {
								echo "<input class='form-check-input' type='radio'  name='rbt_benefLV1' id='benefLV1Oui' value='O'>Oui";
							}
							echo"</div>";
							echo"<div class='form-check form-check-inline'>";
							if($rbt_benefLV1 == "N"){
								echo "<input class='form-check-input' type='radio' checked name='rbt_benefLV1' id='benefLV1Non' value='N'>Non";
							} else {
								echo "<input class='form-check-input' type='radio' name='rbt_benefLV1' id='benefLV1Non' value='N'>Non";
							}
							echo"</div>";
						?>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4"><b>Bénéficiaire LV2 :</b></label><br>
					<div class="col-md-12">
						<?php
							echo"<div class='form-check form-check-inline'>";
							if($rbt_benefLV2 == "O"){
								echo "<input class='form-check-input' type='radio' checked name='rbt_benefLV2' id='benefLV2Oui' value='O'>Oui";
							} else {
								echo "<input class='form-check-input' type='radio'  name='rbt_benefLV2' id='benefLV2Oui' value='O'>Oui";
							}
							echo"</div>";
							echo"<div class='form-check form-check-inline'>";
							if($rbt_benefLV2 == "N"){
								echo "<input class='form-check-input' type='radio' checked name='rbt_benefLV2' id='benefLV2Non' value='N'>Non";
							} else {
								echo "<input class='form-check-input' type='radio' name='rbt_benefLV2' id='benefLV2Non' value='N'>Non";
							}
							echo"</div>";
						?>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4"><b>Dérogation LV1 :</b></label><br>
					<div class="col-md-12">
						<?php
							echo"<div class='form-check form-check-inline'>";
							if($rbt_derogLV1 == "O"){
								echo "<input class='form-check-input' type='radio' checked name='rbt_derogLV1' id='derogLV1Oui' value='O'>Oui";
							} else {
								echo "<input class='form-check-input' type='radio'  name='rbt_derogLV1' id='derogLV1Oui' value='O'>Oui";
							}
							echo"</div>";
							echo"<div class='form-check form-check-inline'>";
							if($rbt_derogLV1 == "N"){
								echo "<input class='form-check-input' type='radio' checked name='rbt_derogLV1' id='derogLV1Non' value='N'>Non";
							} else {
								echo "<input class='form-check-input' type='radio' name='rbt_derogLV1' id='derogLV1Non' value='N'>Non";
							}
							echo"</div>";
						?>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4"><b>Dérogation LV2 :</b></label><br>
					<div class="col-md-12">
						<?php
							echo"<div class='form-check form-check-inline'>";
							if($rbt_derogLV2 == "O"){
								echo "<input class='form-check-input' type='radio' checked name='rbt_derogLV2' id='derogLV2Oui' value='O'>Oui";
							} else {
								echo "<input class='form-check-input' type='radio'  name='rbt_derogLV2' id='derogLV2Oui' value='O'>Oui";
							}
							echo"</div>";
							echo"<div class='form-check form-check-inline'>";
							if($rbt_derogLV2 == "N"){
								echo "<input class='form-check-input' type='radio' checked name='rbt_derogLV2' id='derogLV2Non' value='N'>Non";
							} else {
								echo "<input class='form-check-input'type='radio' name='rbt_derogLV2' id='derogLV2Non' value='N'>Non";
							}
							echo"</div>";
						?>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4"><b>Epreuve LV1 :</b></label><br>
					<div class="col-md-12">
						<select class="custom-select custom-select" name="lst_epreuveLV1">
							<?php 
								$natuId1=1;
								try{
									$lesEnregs=$bdd->query("SELECT epreuve.id as idEpr, discipline.libelle as discLib, natureepreuve.libelle as natLibe from epreuve join discipline on discipline.id=idDiscipline join natureepreuve on idNatureEpreuve=natureepreuve.id where natureepreuve.id=$natuId1");
								} catch(PDOException $e) {
									die("ErrSelecCiv : erreur lors de la sélection des civilités dans admin_gestion_eleves_composant_graph.php<br>
										Message d'erreur : ".$e->getMessage());
								}
								if($lesEnregs->rowCount()>0) {
									foreach ($lesEnregs as $enreg) {
										if($lst_epreuveLV1 == $enreg->idEpr){
											echo "<option class='form-group' selected value='$enreg->idEpr'>$enreg->discLib $enreg->natLibe</option>";
										} else {
											echo "<option class='form-group' value='$enreg->idEpr'>$enreg->discLib $enreg->natLibe</option>";
										}																	
									}
								}
							?>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4"><b>Epreuve LV2 :</b></label><br>
					<div class="col-md-12">
						<select class="custom-select custom-select" name="lst_epreuveLV2">
							<?php 
							$natuId2=2;
								try{
									$lesEnregs=$bdd->query("SELECT epreuve.id as idEpr, discipline.libelle as discLib, natureepreuve.libelle as natLibe from epreuve join discipline on discipline.id=idDiscipline join natureepreuve on idNatureEpreuve=natureepreuve.id where natureepreuve.id=$natuId2");
								} catch(PDOException $e) {
									die("ErrSelecCiv : erreur lors de la sélection des civilités dans admin_gestion_eleves_composant_graph.php<br>
										Message d'erreur : ".$e->getMessage());
								}
								if($lesEnregs->rowCount()>0) {
									foreach ($lesEnregs as $enreg) {
										if($lst_epreuveLV2 == $enreg->idEpr){
											echo "<option class='form-group' selected value='$enreg->idEpr'>$enreg->discLib $enreg->natLibe</option>";
										} else {
											echo "<option class='form-group' value='$enreg->idEpr'>$enreg->discLib $enreg->natLibe</option>";
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


