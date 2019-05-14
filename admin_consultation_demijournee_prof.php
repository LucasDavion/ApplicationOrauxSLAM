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
                <a href="changemdp.php" class="dropdown-item" href="#">
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
          <br><br><h1>Consulation des demi-journées des profs</h1>
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

                <table class="table">
                  <?php

                  //Select de la date

                  try {
                    $lesenregs = $bdd->query("SELECT DISTINCT date from demijournee");
                    if ($lesenregs->rowCount()==0) {
                      echo "Aucune date dans la base de données";
                    } else {
                      ?>
                      <thead>
                        <tr>
                          <td>
                            <br>
                          </td>
                          <?php

                          //Affichage de toute le dates format français

                          foreach ($lesenregs as $enreg) {
                            ?>
                            <th scope="col">
                              <?php

                              $datejour = $enreg->date;
                              list($year, $month, $day) = explode("-", $enreg->date);
                              $lastmodified = "$day/$month/$year";

                              //Affichage de la date

                              echo"$lastmodified";
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
                          //Select et affichage des profs pour le matin
                          $lesenregs = $bdd->query("SELECT id from demijournee where matinAprem='matin'");
                          foreach ($lesenregs as $enreg) {
                            $idPeriode = $enreg->id;
                            try {
                              $lesenregsmatin = $bdd->query("SELECT utilisateur.nom as 'nom', salle.libelle as 'salle' from choixprofdemijournee join utilisateur on idUtilisateur = utilisateur.id join demijournee on idDemiJournee = demijournee.id join salle on idSalle = salle.id where idDemiJournee = $idPeriode");
                              if ($lesenregsmatin->rowCount()==0) {
                                echo "";
                              } else {
                                ?>
                                <td>
                                  <?php
                                  foreach ($lesenregsmatin as $enregmatin) {
                                    echo "<p>$enregmatin->nom <br> Salle : $enregmatin->salle </p>";
                                  }
                                  ?>
                                </td>
                                <?php
                              }
                            } catch (PDOException $e) {
                              die("Err BDALec02Erreur : erreur de SELECT<br>Message d'erreur:".$e->getMessage());
                            }
                          }

                          ?>
                        </tr>
                        <tr>
                          <th scope="row">Après-Midi</th>
                          <?php
                          //Select et affichage des profs pour le matin
                          $lesenregs = $bdd->query("SELECT id from demijournee where matinAprem='aprem'");
                          foreach ($lesenregs as $enreg) {
                            $idPeriode = $enreg->id;
                            try {
                              $lesenregsmatin = $bdd->query("SELECT utilisateur.nom as 'nom', salle.libelle as 'salle' from choixprofdemijournee join utilisateur on idUtilisateur = utilisateur.id join demijournee on idDemiJournee = demijournee.id join salle on idSalle = salle.id where idDemiJournee = $idPeriode");
                              if ($lesenregsmatin->rowCount()==0) {
                                echo "";
                              } else {
                                ?>
                                <td>
                                  <?php
                                  foreach ($lesenregsmatin as $enregmatin) {
                                    echo "<p>$enregmatin->nom <br> Salle : $enregmatin->salle </p>";
                                  }
                                  ?>
                                </td>
                                <?php

                              }
                            } catch (PDOException $e) {
                              die("Err BDALec03Erreur : erreur de SELECT<br>Message d'erreur:".$e->getMessage());
                            }
                          }

                          ?>
                        </tr>
                        <?php
                      }
                    }
                    catch (PDOException $e) {
                      die("Err BDALec04Erreur : erreur de SELECT<br>Message d'erreur:".$e->getMessage());
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
