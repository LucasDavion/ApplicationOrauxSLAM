<?php
    include "connexion_bd_gesoraux.php";
    //variables de session
    session_start();
    $idProf = $_SESSION['id'];  
    $valeur="";
    $val_select="";
    if(isset($_POST['btn_valider'])==true){
        echo "hello";
        extract($_POST);
        foreach($_POST as $cle=>$valeur){
            if(strpos($cle,"sel")==0){
                try{
                    $req=$bdd->prepare("UPDATE passageepreuve set idProfChoix =:par_idProf where id=:par_idEpreuve");
                    $req->bindValue(':par_idProf', $idProf,PDO::PARAM_INT);
                    $req->bindValue(':par_idEpreuve', $valeur,PDO::PARAM_INT);
                    $req->execute();
                    //on se redirige vers l'affichage des employés en fournissant le message d'information
                    $msg="Les élèves ont bien été sélectionnés.";
                    header('Location: eleve_selection.php?msg='.$msg);
                }catch(PDOException $e){
                    die("err BDUpdate : erreur d'update tables dans valider.php<br>
                    Message d'erreur : ".$e->getMessage());
                }
            }
        
        }
    }
?>