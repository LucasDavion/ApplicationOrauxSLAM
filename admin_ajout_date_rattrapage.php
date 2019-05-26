<?php
include"connexion_bd_gesoraux.php";
session_start();
if(isset($_SESSION["idTypeUtilisateur"])==false || $_SESSION["idTypeUtilisateur"] != 1){
    header("Location: connexion_app.php");
}
if (isset($_POST['btn_valider']) == true) {
  extract($_POST);
  $req=$bdd->prepare("INSERT into demijournee values");
}
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <form action="admin_ajout_date_rattrapage.php" method="post">

      <!-- Saisie des dates -->

      <p>Date</p>
      <input type="date" name="btn_date" value="" required>

      <!-- Saisie de la période -->

      <input type="radio" id="matin" name="opt_periode" value="0">
  <label for="matin">Matin</label>
  <input type="radio" id="après-midi" name="opt_periode" value="1">
<label for="après-midi">Après-Midi</label>
<input type="submit" name="btn_valider" value="Valider">
    </form>
  </body>
</html>
