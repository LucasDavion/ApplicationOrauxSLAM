<?php
include"connexion_bd_gesoraux.php";
session_start();
if(isset($_SESSION["idTypeUtilisateur"])==false || $_SESSION["idTypeUtilisateur"] != 1){
    header("Location: connexion_app.php");
}
if (isset($_POST['btn_valider']) == true) {
  extract($_POST);
  if ($chk_horsperiode != 'O') {
    $chk_horsperiode = 'N';
  }
  $req=$bdd->prepare("INSERT into demijournee values(0, :par_date, :par_demijournee, :par_horsperiode)");
  $req->bindValue(':par_date', $txt_date, PDO::PARAM_STR);
  $req->bindValue(':par_demijournee', $opt_periode, PDO::PARAM_STR);
  $req->bindValue(':par_demijournee', $chk_horsperiode, PDO::PARAM_STR);
  $req->execute();
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
      <input type="date" name="txt_date" value="" required>

      <!-- Saisie de la période -->

      <input type="radio" id="matin" name="opt_periode" value="0">
  <label for="matin">Matin</label>
  <input type="radio" id="après-midi" name="opt_periode" value="1">
  <label for="après-midi">Après-Midi</label>

  <!-- Saisie si c'est hors periode -->

<input type="checkbox" id="horsperiode" name="chk_horsperiode" value="O">
<label for="horsperiode">Cochez si cette date doit être utilisé pour le rattrapage</label>

<!-- Bouton valider-->

<input type="submit" name="btn_valider" value="Valider">
    </form>
  </body>
</html>
