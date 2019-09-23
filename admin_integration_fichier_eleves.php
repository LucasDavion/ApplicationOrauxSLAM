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
    
    <!-- modernizr css -->

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

        $messages = "";
//ouverture du fichier $fic pointe sur le fichier
        if (isset($_POST["envoyer"])== true) {
    # code...
            $dossier = 'upload/';
            $fichier = basename($_FILES['fichierEleve']['name']);
            $extension = pathinfo($fichier, PATHINFO_EXTENSION); 
            //Début des vérifications de sécurité...
            if($extension != "csv") //Si l'extension n'est pas dans le tableau
            {
                $erreur = 'Vous devez uploader un fichier de type csv';
            }
            else
            {//S'il n'y a pas d'erreur, on upload

                if(move_uploaded_file($_FILES['fichierEleve']['tmp_name'], $dossier . $fichier)) /* la fonction renvoie TRUE, c'est que ça a fonctionné... */ { 
                    echo "Upload du fichier effectué avec succès";
                }
                else { //Sinon (la fonction renvoie FALSE).

                    echo "Echec de l'upload !";
                }

                // include "connexion_bd_gesoraux.php";
                include "connexion_bd_gesoraux.php";
                
                //ouverture du fichier impossible
                $fic = fopen("upload/".$_FILES['fichierEleve']['name'], "r");
                if ($fic == false) {

                    echo "ouverture du fichier impossible";
                } 
                else 
                {

                    $nb_fic= 0;
                    while ($enreg=fgetcsv($fic, 13421772,';'))
                    {
                        $nb_valeurs = count($enreg);
                        if ($nb_valeurs != 24) {
                            $message = "Nombre de données par élève incorrecte";
                        } else {
                            try {
                                $pos = strpos($enreg[0], 'L');

                                if ($pos === false) 
                                {
                                    $pos1 = strpos($enreg[0], "SERIE");
                                    if ($pos1 === false)
                                    {
                                        $pos2 = strpos($enreg[0], "Date");
                                        if ($pos2 === false)
                                        {
                                    //changement du format de la date
                                    $enreg[4] = str_replace('/', '-', $enreg[4]); // On remplace les '/' par des '-' car php ne gère pas bien les '/'
                                    $enreg[4] = date("Y-m-d", strtotime($enreg[4]));

                                    $req = $bdd->prepare("insert into eleve values(0, :par_nom, :par_prenom, :par_datenaissance, :par_tierstemps, :par_idcivilite, :par_idsection, :par_iddivision)");

                                    //requete du format de la civilité
                                    $lesEnregs = $bdd -> query("SELECT id FROM civilite WHERE code = '$enreg[2]'"); 
                                    $enregs = $lesEnregs -> fetch();
                                    $req->bindValue(':par_idcivilite', $enregs->id, PDO::PARAM_INT );

                                    //requete du format de idSection(section euro)
                                    if ($enreg[8] == '') 
                                    {
                                        $req->bindValue(':par_idsection', NULL, PDO::PARAM_INT );
                                    }
                                    else
                                    {
                                        $enreg[8] = str_replace('EUROPEENNE', 'Européenne', $enreg[8]);
                                        $enreg[8] = str_replace('INTERNATION.', 'Internationale', $enreg[8]);
                                        $lesEnregs = $bdd -> query("SELECT id FROM section WHERE libelle = '$enreg[8]'");
                                        $enregs = $lesEnregs -> fetch();
                                        if ($enregs != false)
                                        {
                                            $req->bindValue(':par_idsection', $enregs->id, PDO::PARAM_INT );
                                        }
                                        else 
                                        {
                                            $req->bindValue(':par_idsection', NULL, PDO::PARAM_INT );
                                        }
                                    }


                                //requete du format de idDivison(classe)
                                    $lesEnregs = $bdd -> query("SELECT id FROM division WHERE libelle = '$enreg[1]'");
                                    $enregs = $lesEnregs ->fetch();
                                    $req->bindValue(':par_iddivision', $enregs->id, PDO::PARAM_INT );

                                //requete insert(ELEVES) nom;prenom;dateNaissance;tiersTempsON;idCivilite;idSection ;idDivision
                                    $enregNom = $enreg[3];
                                    list($nom, $prenom) = explode("/", $enregNom);
                                    $req->bindValue(':par_nom', $nom, PDO::PARAM_STR);
                                    $req->bindValue(':par_prenom', $prenom, PDO::PARAM_STR );
                                    $req->bindValue(':par_datenaissance', $enreg[4], PDO::PARAM_STR );
                                    $req->bindValue(':par_tierstemps', $enreg[5], PDO::PARAM_STR );
                                    $req->execute();
                                    $messages = "Les élèves ont bien été intégrés à la base de données.<br>";


                                    $req = $bdd->prepare("insert into passageepreuve(id, inscritBenef, derogation, idEleve, idEpreuve ) values(0, :par_inscritBenef, :par_derogation, :par_ideleve, :par_idepreuve )");


                                //POSITION LV1
                                    $enreg[10] = str_replace('INSCRIT', 'N', $enreg[10]);
                                    $enreg[10] = str_replace('BENEFICE','O', $enreg[10]);
                                    $req->bindValue('par_inscritBenef', $enreg[10], PDO::PARAM_STR);


                                //DEROGATION LV1
                                    $req->bindValue('par_derogation', $enreg[12], PDO::PARAM_STR);


                                //IDELEVE
                                    $lesEnregs = $bdd -> prepare("SELECT id FROM eleve WHERE nom = :par_nom and prenom = :par_prenom");
                                    $lesEnregs->bindValue('par_nom', $nom, PDO::PARAM_STR);
                                    $lesEnregs->bindValue('par_prenom', $prenom, PDO::PARAM_STR);
                                    $lesEnregs->execute();
                                    $enregs = $lesEnregs -> fetch();
                                    if ($lesEnregs != false) 
                                    {
                                        $req->bindValue('par_ideleve', $enregs->id, PDO::PARAM_INT );
                                    }

                                // ID EPREUVE
                                    $lesEnregs = $bdd -> query("SELECT epreuve.id FROM epreuve join discipline on idDiscipline=discipline.id WHERE libelle = '$enreg[11]' and idNatureEpreuve=1 ");

                                    if ($lesEnregs->rowCount()>0) 
                                    {
                                        $enregs = $lesEnregs -> fetch();
                                        $req->bindValue('par_idepreuve', $enregs->id, PDO::PARAM_INT);
                                        $req->execute();
                                        $messages = "Les épreuves LV1 ont bien été intégrées.<br>".$messages;
                                    }
                                //2eme EPREUVE
                                    $req = $bdd->prepare("insert into passageepreuve(id, inscritBenef, derogation, idEleve, idEpreuve ) values(0, :par_inscritBenef, :par_derogation, :par_ideleve, :par_idepreuve )");

                                //POSITION LV2
                                    $enreg[13] = str_replace('INSCRIT', 'N', $enreg[13]);
                                    $enreg[13] = str_replace('BENEFICE','O', $enreg[13]);
                                    $req->bindValue('par_inscritBenef', $enreg[13], PDO::PARAM_STR);


                                //DEROGATION LV2
                                    $req->bindValue('par_derogation', $enreg[15], PDO::PARAM_STR);


                                //IDELEVE
                                    $lesEnregs = $bdd -> prepare("SELECT id FROM eleve WHERE nom = :par_nom and prenom = :par_prenom");
                                    $lesEnregs->bindValue('par_nom', $nom, PDO::PARAM_STR);
                                    $lesEnregs->bindValue('par_prenom', $prenom, PDO::PARAM_STR);
                                    $lesEnregs->execute();
                                    $enregs = $lesEnregs -> fetch();
                                    if ($lesEnregs != false) 
                                    {
                                        $req->bindValue('par_ideleve', $enregs->id, PDO::PARAM_INT );
                                    }

                                // ID EPREUVE
                                    $lesEnregs = $bdd -> query("SELECT epreuve.id FROM epreuve join discipline on idDiscipline=discipline.id WHERE libelle = '$enreg[14]' and idNatureEpreuve=2 ");

                                    if ($lesEnregs->rowCount()>0) 
                                    {
                                        $enregs = $lesEnregs -> fetch();
                                        $req->bindValue('par_idepreuve', $enregs->id, PDO::PARAM_INT);
                                        $req->execute();
                                        $messages = "Les épreuves LV2 ont bien été intégrées.<br>".$messages;                                     
                                    } else {
                                        //echo $erreur;
                                    } 
                                }
                            }
                                }                              
                            } catch (PDOException $e) {
                                die("Enregistrement err ! " . $e->getMessage());
                            }
                        }
                    }                   
                }  
            }   
        }  
        ?>

            <form method="POST" action="" enctype="multipart/form-data" class="text-center">
                <div class="form-group">
                 <!-- On limite le fichier à 100Ko -->
                 <input  class="form-control-file" type="hidden" name="MAX_FILE_SIZE" value="4654567498">
                 Fichier : <input class="form-control-file"  type="file" name="fichierEleve">
                 <br>
                 <input class="btn btn-success" type="submit" name="envoyer" value="Envoyer le fichier">   
                 <?php 
                 echo $messages;
                 ?>
             </div>
         </form>

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