
<?php
session_start();
if(isset($_SESSION["idTypeUtilisateur"])==false || $_SESSION["idTypeUtilisateur"] != 2){
    header("connexion_app.php");
}
$id  = $_SESSION['id'];				
include"connexion_bd_gesoraux.php"
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
                  <a href="panel_prof_gesoraux.php"><img src="images/logo.png" alt="logo"></a>
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
				<div>
					<h1 class="text-center">Saisie des élèves absents</h1> <br>
					<form action ="" method="POST">
						<?php
							$msg = "";
							$compt=0;
							try{
								$lesDemijournees=$bdd->query("SELECT demijournee.id as 'idDemi' , idUtilisateur , date , matinAprem from choixprofdemijournee
								join demijournee on idDemiJournee = demijournee.id
								where idUtilisateur = ".$id." ");
							}catch(PDOException $e){
								echo("ERR BDSelect : erreur de lecture table 
									<br>Message d'erreur:".$e->getMessage());
							}
								
							if($lesDemijournees->rowCount () >0) {
								echo "<select class='form-control' name='demijournee' id='demijournee' onchange='this.form.submit();'>";
								echo "<option value= '0'>Veuillez sélectionner une plage horaire</option>";
								foreach ($lesDemijournees as $demijournee){
									list($year, $month, $day) = explode("-", $demijournee->date);
									$date_fr = $day."/".$month."/".$year;
									
									if ($demijournee == $demijournee->idDemi) {
										echo "<option selected value='$demijournee->idDemi'>$date_fr $demijournee->matinAprem</option>";
									}else{
										echo "<option value='$demijournee->idDemi'>$date_fr $demijournee->matinAprem</option>";
									}
								}
								echo "</select>";					
							} else{
								echo "<br><h4 class='erreur'>Consultation impossible : aucun enregistrement n'a été effectué</h4>";
							}
							
							if (isset ($_POST['demijournee']) == true && $_POST['demijournee']>0) {	
														
								try {
									$lesEnregs=$bdd->query("SELECT absence , passageepreuve.idDemiJournee , demijournee.date, eleve.nom as 'nom', eleve.prenom as 'prenom', division.libelle as 'division', natureepreuve.libelle as 'natureepreuve', plage.heureDebut as 'heurepassage' , passageepreuve.id as 'idPassage'
									from passageepreuve 
									left outer join utilisateur on idProfChoix=utilisateur.id 
									left outer join eleve on idEleve=eleve.id 
									join division on idDivision=division.id 
									join epreuve on idEpreuve=epreuve.id 
									join natureepreuve on idNatureEpreuve=natureepreuve.id 
									join plage on idPlage=plage.id 
									join demijournee on idDemijournee = demijournee.id 
									where idDemiJournee = ".$_POST['demijournee'].
									" order by eleve.nom ");

								
								}catch(PDOException $e){
									echo("ERR BDSelect : erreur de lecture table 
									<br>Message d'erreur:".$e->getMessage());
								}

								
								if ($lesEnregs->rowCount () ==0) {
									echo "<br> Il n'y a aucun élèves sur cette plage horaire";
								} else {				
									echo "<br><table class='table table-striped text-center'>";
									echo "<thead class='thead-dark'>";
									echo "<tr>"; 
									echo "<th scope='col'>Nom</th>";
									echo "<th scope='col'>Prénom</th>";
									echo "<th scope='col'>Division</th>";
									echo "<th scope='col'>Discipline</th>";
									echo "<th scope='col'>Heure de passage</th>";
									echo "<th scope='col'>Absence</th>";
									echo "</tr>";
									echo "</thead>";
									echo "<tbody>";
									foreach ($lesEnregs as $enreg) {
										echo"<tr>";
										echo"<td>$enreg->nom</td>";
										echo "<td>$enreg->prenom</td>";
										echo "<td>$enreg->division</td>";
										echo "<td>$enreg->natureepreuve</td>";
										echo "<td>$enreg->heurepassage</td>";			
										if($enreg->absence =='O'){							
											echo"<td><input type='checkbox' checked name='Abs$enreg->idPassage' value='$enreg->idPassage'/></input></td>";
											$compt ++;
										}
										else{
											echo "<td><input type='checkbox' name='Abs$enreg->idPassage' value='$enreg->idPassage'/></input></td>";
										}						
										echo "</tr>";						
									}
									echo "</tbody>";
									echo"</table>";
									echo"<div class='d-flex justify-content-center'>";
									echo'<input type="submit" class="btn btn-success btn-lg" name="btn_valider" id="btn_valider" value="Soumettre" />';
									echo "</div>";
								}
							}	
											
							$valeur="";
							$val_abs="";
							if(isset($_POST['btn_valider'])== true){
								echo 'cc';
								extract($_POST);
								
								try{
									$req=$bdd->prepare("UPDATE passageepreuve set absence ='N' where absence = 'O' ");									
									$req->execute();		
								}catch(PDOException $e){
									echo("ErrBDUpdate : erreur update table <br>
										Message d'erreur :" .$e->getMessage());									
								}
								foreach($_POST as $cle=>$valeur){
									
									if(strpos($cle,"abs")==0 ){
										try{
											$req=$bdd->prepare("UPDATE passageepreuve set absence =:par_absence where id =:par_idabsence  ");
											$req->bindValue(':par_absence', 'O', PDO::PARAM_STR);
											$req->bindValue(':par_idabsence', $valeur, PDO::PARAM_INT);
											$req->execute();		
										}catch(PDOException $e){
											echo("ErrBDUpdate : erreur update table <br>
												Message d'erreur :" .$e->getMessage());
										}
									}
								} 
								if($compt == 1){
										$msg = "L'élève a bien été noté(e) absent(e)";
									}else{
										$msg = "Les élèves ont bien été notés absents";
									}
								echo $compt;
								echo $msg; 
							}				
					?>
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