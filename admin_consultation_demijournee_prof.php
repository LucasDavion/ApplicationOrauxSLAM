<?php
include"connexion_bd_gesoraux.php";
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
      <?php include "admin_nav.html" ?>
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
          <?php include "bouton_profil.php"; ?>
        </div>
      </div>
      <section>
        <div class="container text-center">
          <br><br><h1>Consultation des demi-journées des professeurs</h1>
          <hr>
        </div>
      </section>
      <section>
        <div class="container text-center">
          <div class="row">
            <div class="col">
            </div>

              <div class="shadow-lg p-3 mb-5 bg-white rounded">

                <!-- Mon scrip a moi-->

                <table class="table table-striped">
                  <?php

                  /*
                  *********************************************
                  Sélection des dates de la période sélectionné
                  *********************************************
                  */

                  //Select des dates

                  try {
                    $lesDates = $bdd->query("SELECT DISTINCT date from demijournee");
                    if ($lesDates->rowCount()==0) {
                      echo "Aucune date dans la base de données";
                    } else {
                      ?>
                      <thead class="thead-dark">
                        <tr>
                          <td>
                            <br>
                          </td>
                          <?php

                          //Affichage de toute les dates dans la base de données

                          foreach ($lesDates as $uneDate) {
                            ?>
                            <th scope="col">
                              <?php

                              //Conversion au format français

                              $datejour = $uneDate->date;
                              list($annee, $mois, $jour) = explode("-", $datejour);
                              $dateFormatFrançais = "$jour/$mois/$annee";

                              //Affichage de la date

                              echo"$dateFormatFrançais";
                              ?>
                            </th>
                            <?php
                          } //fin du foreach qui affiche les dates
                          ?>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">Matin</th>
                          <?php
                          /*
                          ***************************************************
                          Sélection des professeurs de la période sélectionné
                          ***************************************************
                          */
                          $lesPeriodesMatins = $bdd->query("SELECT id from demijournee where matinAprem='matin'");
                          foreach ($lesPeriodesMatins as $periodeMatin) {
                            $idPeriode = $periodeMatin->id;
                            try {
                              $lesProfsMatins = $bdd->query("SELECT utilisateur.nom as 'nom', salle.libelle as 'salle' from choixprofdemijournee join utilisateur on idUtilisateur = utilisateur.id join demijournee on idDemiJournee = demijournee.id join salle on idSalle = salle.id where idDemiJournee = $idPeriode");
                              if ($lesProfsMatin->rowCount()==0) {
                                echo "";
                              } else {
                                ?>
                                <td>
                                  <?php

                                  //Affichage des profs

                                  foreach ($lesProfsMatins as $profMatin) {
                                    echo "<p>$profMatin->nom <br> Salle : $profMatin->salle </p>";
                                  }
                                  ?>
                                </td>
                                <?php
                              }

                              //Message d'erreurs pour le select des professeurs pour les matins en fonction de la date

                            } catch (PDOException $e) {
                              echo("Err BDALec01Erreur : erreur de SELECT<br>Message d'erreur:".$e->getMessage());
                            }
                          }

                          //Mettre un fond rouge quand c'est vide

                          $lesPeriodesVides = $bdd->query("SELECT DISTINCT date, id from demijournee where matinAprem = 'matin'");
                          foreach ($lesPeriodesVides as $periodeVide) {
                            $periodeUtiliser = $bdd->query("SELECT idDemiJournee from choixprofdemijournee where idDemiJournee = $enreg->id");
                            if ($periodeUtiliser->rowCount()==0) {
                              echo "<td class='table-danger'>Aucun</td>";
                            }
                          }
                          ?>
                        </tr>
                        <tr>
                          <th scope="row">Après-Midi</th>
                          <?php
                          /*
                          ***************************************************
                          Sélection des professeurs de la période sélectionné
                          ***************************************************
                          */
                          $lesPeriodesAprems = $bdd->query("SELECT id from demijournee where matinAprem='après-midi'");
                          foreach ($lesProfsAprems as $profAprem) {
                            $idPeriode = $enreg->id;
                            try {
                              $lesProfsAprems = $bdd->query("SELECT utilisateur.nom as 'nom', salle.libelle as 'salle' from choixprofdemijournee join utilisateur on idUtilisateur = utilisateur.id join demijournee on idDemiJournee = demijournee.id join salle on idSalle = salle.id where idDemiJournee = $idPeriode");
                              if ($lesProfsAprems->rowCount()==0) {
                                echo "";
                              } else {
                                ?>
                                <td>
                                  <?php

                                  //Affichage des professeurs

                                  foreach ($lesProfsAprems as $profAprem) {
                                    echo "<p>$enregmatin->nom <br> Salle : $enregmatin->salle </p>";
                                  }
                                }
                                  ?>
                                </td>
                                <?php

                                //Mettre un fond rouge quand c'est vide

                                $lesPeriodesAprems = $bdd->query("SELECT DISTINCT date, id from demijournee where matinAprem = 'après-Midi'");
                                  $periodeUtiliser = $bdd->query("SELECT idDemiJournee from choixprofdemijournee where idDemiJournee = $enreg->id");
                                  if ($periodeUtiliser->rowCount()==0) {
                                    echo "<td class='table-danger'>Aucun</td>";

                                    //Message d'erreurs pour le select des professeurs pour les après-midi en fonction de la date

                                  }
                            } catch (PDOException $e) {
                              echo("Err BDALec02Erreur : erreur de SELECT<br>Message d'erreur:".$e->getMessage());
                            }
                          }

                          ?>
                        </tr>
                        <?php
                      }
                    }

                    //Message d'erreur pour le select des dates

                    catch (PDOException $e) {
                      echo("Err BDALec03Erreur : erreur de SELECT<br>Message d'erreur:".$e->getMessage());
                    }
                    ?>
                  </tbody>
                </table>

                <!-- Fin de mon script a moi -->

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
