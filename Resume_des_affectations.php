<?php include "assets_haut_prof.php"?>
            
            <section>
                <h1 class="text-center">Résumé des affectations</h1><br>
<div class="limiter">
	<div>
		<div>
			<span>
				Résumé des affectations
			</span>


		<form action ="" method="post">

			<div class="form-group">


		<?php


				include "connexion_bd_gesoraux.php";

				// Menu déroulant des discipline
				
				$lesDisiplines=$bdd->query("SELECT id, libelle FROM discipline");

				echo '<select class="custom-select mr-sm-2" name="discipline" id="discipline">';
				echo "<option value='999'>Veuillez selectioner une discipline</option>";
				foreach ($lesDisiplines as $discipline) {
					echo "<option value='$discipline->id'>$discipline->libelle</option>";
				// fin FOREACH	
				}
				echo "</select>";
				echo "</form>";			

		?>
<div class="resultat"></div>
				
	</div>
	</div>
	</div>
	</div>
            </section>
<?php include "assets_bas.php"?>
<script 
src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#discipline").change(function(){
			$.ajax({
				url: 'resume_affectation_script.php',
				type: 'POST',
				data: 'discipline=' + $("#discipline").val(),
				dataType : 'html',
				success : function (code_html, status){
					$(".resultat").html(code_html);
				},
				error : function(resultat, statut, error){
					$(".resultat").html("erreur:" + resultat.responseText);
				}
			});
		});
	});
	
</script>
