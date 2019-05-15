<?php
session_start();
if (isset($_SESSION["id"])== false ){
  header("Location:connexion_app.php");
}
$nvmdp="";
$nvmdp2="";
$ancienmdp="";
$msg="";
?>
<?php
$id=$_SESSION["id"];  
if(isset($_POST["valider"])==true){

  include "connexion_bd_gesoraux.php";
  extract($_POST);

  $req=$bdd->query("SELECT * from utilisateur where id=$id");
  $enreg=$req->fetch();
  $mdpactuel=$enreg->motDePasse;
  $motDePasseCrypte = sha1($nvmdp);
  $motDePasseCrypte2 = sha1($nvmdp2);
  $ancienMdpCrypte = $mdpactuel;
  $ancienMdpCrypte2 = sha1($ancienmdp);

  if($ancienMdpCrypte != $ancienMdpCrypte2){
    $msg="Le mot de passe que vous avez entrer ne correspond pas à votre mot de passe actuel";
  //echo("Le mot de passe que vous avez entrés ne correspond pas a votre mot de passe actuel.<br>");
  }
    if($motDePasseCrypte != $motDePasseCrypte2){
   // echo("Les mots de passe entrés ne correspondent pas.<br>");
      $msg="Les mots de passe entrés ne correspondent pas.<br>" .$msg;
    } else {
      if($ancienMdpCrypte2==$ancienMdpCrypte && $motDePasseCrypte ==$motDePasseCrypte2){  
        $req = $bdd->prepare("update utilisateur set motDePasse=:motDePasseCrypte where id=:id");
        $req->bindValue(":motDePasseCrypte", $motDePasseCrypte, PDO::PARAM_STR);
        $req->bindValue(":id", $id, PDO::PARAM_INT);
        echo("Mot de passe changer avec succès<br>");
        $msg="Mot de passe changer avec succès<br>";
        $req -> execute();
      }
    }
  }
?>
<?php
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
              <a href="index.html"><img src="assets/images/icon/logo.png" alt="logo"></a>
            </div>
          </div>
          <div class="main-menu">
            <div class="menu-inner">
              <nav>
                <ul class="metismenu" id="menu">
                  <li><a href="barchart.html">Choisir mes éleves</a></li>
                  <li><a href="barchart.html">Choisir mes demi-journées</a></li>
                  <li><a href="barchart.html">Consulter mon planing</a></li>
                  <li><a href="barchart.html">Consulter la liste des éleves</a></li>
                  <li><a href="barchart.html">Consulter la liste des éleves absent aux épreuves</a></li>
                  <li><a href="barchart.html">Consulter/imprimer la liste d’émargement</a></li>
                </ul>
              </nav>
            </div>
          </div>
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
              <ul class="">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle text-white" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <button type="button" name="button" class="btn btn-secondary"><span class="mr-2 d-none d-lg-inline text-white extra-large float-right"><i class="fas fa-user-circle"></i> Mme Anglais</span></button>
                  </a>
                  <!-- Dropdown - User Information -->
                  <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="#">
                      <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                      Mon profil
                    </a>
                    <a href="changement_mot_de_passe.php" class="dropdown-item" href="#">
                      <i class="fas fa-key fa-sm fa-fw mr-2 text-gray-400"></i>

                      Modifier mon mot de passe
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                      <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                      Se déconnecter
                    </a>
                  </div>
                </li>
              </ul>
            </div>
          </div>
          <section>
            <div class="container text-center">
              <br><br><h1>Changement de mot de passe</h1>
              <hr>
            </div>
          </section>
          <section>
            <div class="container text-center">
              <div class="row">
                <div class="col">
                </div>
                <div class="col-6"><br><br><br>
                  <div class="shadow-lg p-3 mb-5 bg-white rounded">
                    <form action="changement_mot_de_passe.php" method="post">
                      <div class="form-group">
                        Ancien mot de passe : <input type="password" name="ancienmdp" placeholder="Veuillez saisir votre ancien mot de passe" required />
                        <br> </br>
                        Nouveau mot de passe : <input type="password" name="nvmdp" placeholder="Veuillez le nouveau mot de passe souhaité " required />
                        <br> <br>
                        Vérification nouveau mot de passe : <input type="password" name="nvmdp2" placeholder="Veuillez ressaisir le mot de passe souhaité" required>
                        <br><br>
                        <input type="submit" class="btn btn-success" name="valider" id="valider" value="Valider"><br>
                        <?php
                        echo $msg;
                        ?>

                      </select>
                    </div>
                  </form>
                </div>
              </div>
              <div class="col">
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
