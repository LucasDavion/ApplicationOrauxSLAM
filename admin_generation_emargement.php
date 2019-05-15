<!DOCTYPE html>
<html lang="FR-fr">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width-device-width, initial-scale-1.0">
	<meta name="description" content="Generation des convocations">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>Génération des fiches d'émargement</title>
</head>
<body>
<?php include "connexion_bd_gesoraux.php"; ?>
<br><br><br>
<h2 class="text-center">Génération des fiches d'émargement</h2>
<br><br>
<section>
<div class="container">
<div class="row">
	<div class="col">
		<form class="" action="admin_script_emargement.php" method="post">
			<p class="text-center">Générer toutes les fiches d'émargement :</p>
			<div class="form-group d-flex justify-content-center">
				<input type="submit" class="btn btn-success btn-lg" name="btn_tout-generer" value="Tout générer">
			</div>
		</form>
	</div>
</div>
	<hr class="border border-dark" ><br>
<div class="row">
  <div class="col">
  </div>
	<div class="col">
		<form class="" action="admin_script_emargement.php" method="post">
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
	</div>
</div>
</section>
</body>
</html>