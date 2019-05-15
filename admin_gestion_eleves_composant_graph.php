<label><b>Nom :</b></label><br>
<input type="text" name="txt_nom" value="<?php echo $txt_nom;?>" required />
<br><br>
<label><b>Prenom :</b></label><br>
<input type="text" name="txt_prenom" value="<?php echo $txt_prenom;?>"required />
<br><br>
<label><b>Date de naissance :</b></label><br>
<input type="Date" name="txt_dateNai" value="<?php echo $txt_dateNai;?>"required />
<br><br>
<label><b>Tiers-temps :</b></label><br>

<?php
	if($rbt_tiersTemps == "O"){
		echo "<input type='radio' checked name='rbt_tiersTemps' id='tiersOui' value='O'>Oui";
	} else {
		echo "<input type='radio'  name='rbt_tiersTemps' id='tiersOui' value='O'>Oui";
	}
	if($rbt_tiersTemps == "N"){
		echo "<input type='radio' checked name='rbt_tiersTemps' id='tiersNon' value='N'>Non";
	} else {
		echo "<input type='radio' name='rbt_tiersTemps' id='tiersNon' value='N'>Non";
	}
?>
<br><br>
<label><b>Civilite :</b></label><br>
<select name="lst_civilite" required>
	<?php 
		include "connexion_bd_gesoraux.php";
		try{
			$lesEnregs=$bdd->query("SELECT id,libelle from civilite");
		} catch(PDOException $e) {
			die("ErrSelecCiv : erreur lors de la sélection des civilités dans admin_gestion_eleves_composant_graph.php<br>
				Message d'erreur : ".$e->getMessage());
		}
		if($lesEnregs->rowCount()>0) {
			foreach ($lesEnregs as $enreg) {
				if($lst_civilite == $enreg->libelle){
					echo "<option selected value='$enreg->id'>$enreg->libelle</option>";
				} else {
					echo "<option value='$enreg->id'>$enreg->libelle</option>";
				}
			}
		}
	?>		
</select>
<br><br>
<label><b>Division :</b></label><br>
<select name="lst_division" required>
	<?php 
		include "connexion_bd_gesoraux.php";
		try{
			$lesEnregs=$bdd->query("SELECT id,libelle from division");
		} catch(PDOException $e) {
			die("ErrSelecDiv : erreur lors de la sélection des divisions dans admin_gestion_eleves_composant_graph.php<br>
				Message d'erreur : ".$e->getMessage());
		}
		if($lesEnregs->rowCount()>0) {
			foreach ($lesEnregs as $enreg) {
				if($lst_division == $enreg->libelle){
					echo "<option selected value='$enreg->id'>$enreg->libelle</option>";
				} else {
					echo "<option value='$enreg->id'>$enreg->libelle</option>";
				}
			}
		}
	?>
</select>
<br><br>
<label><b>Section :</b></label><br>
<select name="lst_section">
	<?php 
		include "connexion_bd_gesoraux.php";
		try{
			$lesEnregs=$bdd->query("SELECT id,libelle from section");
		} catch(PDOException $e) {
			die("ErrSelecCiv : erreur lors de la sélection des civilités dans admin_gestion_eleves_composant_graph.php<br>
				Message d'erreur : ".$e->getMessage());
		}
		if($lesEnregs->rowCount()>0) {
			echo"<option value=0>Choisissez une section si il y en a une.</option>";
			foreach ($lesEnregs as $enreg) {
				if($lst_section == $enreg->libelle){
					echo "<option selected value='$enreg->id'>$enreg->libelle</option>";
				} else {
					echo "<option value='$enreg->id'>$enreg->libelle</option>";
				}
			}
		}
	?>
</select>
<br><br>
