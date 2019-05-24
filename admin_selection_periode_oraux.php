<?php

session_start();
if(isset($_SESSION["idTypeUtilisateur"])==false || $_SESSION["idTypeUtilisateur"] != 1){
    header("Location: connexion_app.php");
}
    // connaître toutes les dates entre deux dates
function getDatesBetween($debut, $fin){
    if($debut>$fin){
        return false;
    }

                // définir la date de début et date de fin

    $debDate=strtotime($debut);
    $finDate=strtotime($fin);

                // création du tableau
    $dates=array();

                // mise dans un tableau de toutes les dates entre les deux dates saisies
    for($i=$debDate; $i <= $finDate; $i += strtotime('+1 day', 0)){
        $dates[] = date('Y-m-d', $i);
    }
    return $dates;

}

    // connaître tous les jours fériers
function getHolidays($year=null){

    if ($year === null)
    {
        $year = intval(strftime('%Y'));
    }

    $easterDate = easter_date($year);
    $easterDay = date('j', $easterDate);
    $easterMonth = date('n', $easterDate);
    $easterYear = date('Y', $easterDate);

    $holidays = array(
                        // Jours feries fixes
                        date('Y-m-d',mktime(0, 0, 0, 1, 1, $year)),// 1er janvier
                        date('Y-m-d',mktime(0, 0, 0, 5, 1, $year)),// Fete du travail
                        date('Y-m-d',mktime(0, 0, 0, 5, 8, $year)),// Victoire des allies
                        date('Y-m-d',mktime(0, 0, 0, 7, 14, $year)),// Fete nationale
                        date('Y-m-d',mktime(0, 0, 0, 8, 15, $year)),// Assomption
                        date('Y-m-d',mktime(0, 0, 0, 11, 1, $year)),// Toussaint
                        date('Y-m-d',mktime(0, 0, 0, 11, 11, $year)),// Armistice
                        date('Y-m-d',mktime(0, 0, 0, 12, 25, $year)),// Noel

                        // Jour feries qui dependent de paques
                        date('Y-m-d',mktime(0, 0, 0, $easterMonth, $easterDay + 1, $easterYear)),// Lundi de paques
                        date('Y-m-d',mktime(0, 0, 0, $easterMonth, $easterDay + 39, $easterYear)),// Ascension
                        date('Y-m-d',mktime(0, 0, 0, $easterMonth, $easterDay + 50, $easterYear)), // Pentecote
                    );

    sort($holidays);

    return $holidays;
}


include"connexion_bd_gesoraux.php";

$msg="";
$txt_dateDeb="";
$txt_dateFin="";

if(isset($_POST['btn_valider'])==true){
    extract($_POST);

    if(isset($txt_dateDeb)==false){
        $msg=$msg."La date de début est obligatoire.<br>";
    }
    if(isset($txt_dateFin)==false){
        $msg=$msg."La date de fin est obligatoire.<br>";
    }

    // savoir si les professeurs ont déja choisi leurs voeux
    $lesChoix=$bdd->query("SELECT count(*) as 'choixProf' from passageepreuve where idProfChoix is not null");
    $choix=$lesChoix->fetch();

    if($choix->choixProf>0)
    {
        echo "Il y a déja des professeurs qui ont fait des choix.";
    } else {

        // suppression de la table demijournee
        $supp=$bdd->query("Delete from demijournee");

        // tableau contenant les dates

        $dates = getDatesBetween($txt_dateDeb,$txt_dateFin);

        // tableau contenant les jours fériers
        $holidays = getHolidays();
        $trouve=false;
        $ind=0;

        if($msg==""){
            foreach ($dates as $date) {  
                // savoir si le jour est un jour férié
                while($trouve==false && $ind<count($holidays)){
                    if($holidays[$ind]==$date){
                        $trouve = true;
                    } else {
                        $ind=$ind+1;
                    }   
                } 
                if($trouve== false){

                    // si le jour saisi est différent d'un samedi=6, d'un dimanche=0, on insère le matin
                    if(date("w",strtotime($date))!=0 && date("w",strtotime($date))!=6 ){ 

                        // insert du matin                                          
                        try{
                            $lesEnregs=$bdd->prepare("insert into demijournee values(0,:par_date,:par_matin,:par_periode)");
                            $lesEnregs->bindValue(":par_date", $date, PDO::PARAM_STR);
                            $lesEnregs->bindValue(":par_matin", "matin", PDO::PARAM_STR);
                            $lesEnregs->bindValue(":par_periode", "N", PDO::PARAM_STR);
                            $lesEnregs->execute();
                        } catch(PDOException $e){
                            echo("ErrInsDemiJour : Erreur lors de l'insertion de la demi-journee du matin dans admin_selection_periode_oraux.php.<br>
                                Message d'erreur : ".$e->getMessage());
                        }
                    }
                    // si le jour saisi est différent d'un samedi=6, d'un dimanche=0,d'un mercredi=3 et n'est pas un jour férier, on insère l'après-midi
                    if(date("w",strtotime($date))!=0 && date("w",strtotime($date))!=6 && date("w",strtotime($date))!=3){
                        // insert de l'après-midi
                        try{
                            $lesEnregs=$bdd->prepare("insert into demijournee values(0,:par_date,:par_aprem,:par_periode)");
                            $lesEnregs->bindValue(":par_date", $date, PDO::PARAM_STR);
                            $lesEnregs->bindValue(":par_aprem", "après-midi", PDO::PARAM_STR);
                            $lesEnregs->bindValue(":par_periode", "N", PDO::PARAM_STR);
                            $lesEnregs->execute();
                        } catch(PDOException $e){
                            echo ("ErrInsDemiJour : Erreur lors de l'insertion de la demi-journee de l'après-midi dans admin_selection_periode_oraux.php.<br>Message d'erreur : ".$e->getMessage());
                        }
                    }
                }                

            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
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
    <!
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

    <!-- code !-->
    <section>
        <header>
            <h1 class="text-center">Sélection de la période des oraux</h1>
        </header>

        <div class="container">
            <div class="">
                <div classe="col">                 
                    <br>
                    <form class="" action="" method="post">
                        <div class="form-group">
                            <label class="col-md-4">Date de début</label>
                            <div class="col-md-8">
                                <input class="form-control" type="Date" name="txt_dateDeb" value="<?php echo $txt_dateDeb;?>" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4">Date de fin</label>
                            <div class="col-md-8">
                                <input class="form-control" type="Date" name="txt_dateFin" value="<?php echo $txt_dateFin;?>" required>
                            </div>
                        </div>                      
                        <div class="form-group d-flex justify-content-center">
                            <input class='btn btn-success btn-lg' type="submit" name="btn_valider" value="Valider" />
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </section>


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
