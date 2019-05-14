<!DOCTYPE html>
<html lang="FR-fr">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width-device-width, initial-scale-1.0">
	<meta name="description" content="Generation des convocations">
  <link rel="stylesheet" href="css/bootstrap.css">
	<title>Generation des convocations</title>
</head>
<body>
<?php include "connexion_bd_gesoraux.php"; ?>


<br><br><br>
<h2 class="text-center">Génération des convocations</h2>
<br><br>
<section>


<div class="container">
<div class="row">
	<div class="col">
		<form class="" action="admin_script_convocation.php" method="post">
			<p class="text-center">Générer les convocations de tous les élèves de toutes les classes :</p>
  <div class="form-group d-flex justify-content-center">
		<input type="submit" class="btn btn-success btn-lg" name="btn_tout-generer" value="Tout générer">
  </div>
</form>
</div>
</div>
<hr class="border border-dark" ><br>
<div class="row">
	<div class="col">
		<form class="" action="admin_script_convocation.php" method="post">
				<p class="text-center">Générer pour une classe :</p>
	<div class="form-group">
		<select name="lst_section" class="form-control">
			<?php
				include "connexion_bd_gesoraux.php";

				try {
					$lesEnreg=$bdd->query("SELECT id, libelle FROM division");

				} catch (PDOException $e) {
					echo "erreur : .$e";
				}
				if ($lesEnreg->rowCount () > 0) {
					foreach ($lesEnreg as $enreg) {
						echo "<option value='$enreg->libelle'>$enreg->libelle</option>";
					}
				}

			 ?>
		</select>
	</div>
	<div class="form-group d-flex justify-content-center">
		<input type="submit" class="btn btn-success btn-sm" name="btn_genererclasse" value="Générer pour la classe">
	</div>

</form>
	</div>
	<div class="col">
		<form class="" action="admin_script_convocation.php" method="post">
			<p class="text-center">Générer pour un éléve:</p>
	<div class="form-group">
		<select name="lst_eleve" class="form-control form-group">
			<?php
				include "connexion_bd_gesoraux.php";

				try {
					$lesEnreg=$bdd->query("SELECT eleve.id, nom, prenom FROM eleve ORDER BY nom");

				} catch (PDOException $e) {
					echo "erreur : .$e";
				}
				if ($lesEnreg->rowCount () > 0) {
					foreach ($lesEnreg as $enreg) {
						echo "<option value='$enreg->id'>$enreg->nom  $enreg->prenom</option>";
					}
				}

			 ?>
		</select>
	</div>
	<div class="form-group d-flex justify-content-center">
		<input type="submit" class="btn btn-success btn-sm" name="btn_generereleve" value="Générer pour l'élève">
	</div>
</form>
	</div>
</div>
</div>
</section>
</body>
</html>

<!-- gwendal est passé par là -->
