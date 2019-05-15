<?php
require('fpdf.php');

include "connexion_bd_gesoraux.php";
include "script_datechaine.php";
extract($_POST);
if (isset($_POST["btn_tout-generer"]) == true) {
  $lesEleves = $bdd->query("SELECT Distinct nomE, prenomE, divisionE, idE FROM elevespassantep ORDER BY nomE");
} else {
  if (isset($_POST["btn_genererclasse"]) == true) {
    $lesEleves = $bdd->query("SELECT Distinct nomE, prenomE, divisionE, idE FROM elevespassantep WHERE divisionE = '$lst_section' ORDER BY nomE");
  }
}


class PDF extends FPDF
{
// En-tête
function Header()
{

    // Police Arial gras 15
    $this->SetFont('Arial','B',15);

    // Titre
    $this->Cell(0,10,'##ORAUX DE LANGUES##',1,0,'C');
    $this->Text(15, 17,utf8_decode("##SESSION 2019##"));
    // Saut de ligne
    $this->Ln(15);
    $this->SetFont('Arial','',8);
    $this->Cell(36,8,utf8_decode(''),0,0,'C');
    $this->Ln(8);
    $this->Cell(15,8,utf8_decode('Division'),1,0,'C');
    $this->Cell(56,8,utf8_decode('Nom Prénom'),1,0,'C');
    $this->Cell(15,8,utf8_decode('Choix'),1,0,'C');
    $this->Cell(35,8,utf8_decode('Date'),1,0,'C');
    $this->Cell(15,8,utf8_decode('Heure'),1,0,'C');
    $this->Cell(10,8,utf8_decode('Salle'),1,0,'C');
    $this->Cell(15,8,utf8_decode('Choix'),1,0,'C');
    $this->Cell(35,8,utf8_decode('Date'),1,0,'C');
    $this->Cell(15,8,utf8_decode('Heure'),1,0,'C');
    $this->Cell(10,8,utf8_decode('Salle'),1,0,'C');
    $this->Cell(56,8,utf8_decode('Signature'),1,0,'C');

}

// Pied de page
function Footer()
{
    // Positionnement à 1,5 cm du bas
    $this->SetY(-15);
    // Police Arial italique 8
    $this->SetFont('Arial','I',8);
    // Numéro de page

}
}

// Instanciation de la classe dérivée
$pdf = new PDF();
$pdf->AddPage("L","A4");
$pdf->SetFont('Arial','',8);

$ep = 1;
$maxf = 0;
foreach ($lesEleves as $eleve) {
  if ($ep == 1) {
    $pdf->SetXY(10,25);
    $pdf->Cell(71,8,utf8_decode(''),0,0,'C');
    $compteep=0;
    $LesNomEpreuves = $bdd->query("SELECT Distinct epreuveE FROM elevespassantep");
    foreach ($LesNomEpreuves as $epr) {
      $pdf->Cell(75,8,utf8_decode($epr->epreuveE),1,0,'C');
      $compteep ++;
    }
    if ($compteep != 2) {
      $this->Cell(75,8,utf8_decode(''),1,0,'C');
    }
    $pdf->SetXY(10,36);
  }
  $ep = 0;
  $id = $eleve->idE;
  $pdf->Ln(5);
  $pdf->SetFont('Arial','',7);
  $pdf->Cell(15,5,utf8_decode($eleve->divisionE),1,0,'C');
  $pdf->Cell(56,5,utf8_decode($eleve->nomE." ".$eleve->prenomE),1,0,'L');

  $lesEpreuves = $bdd->query("SELECT * FROM elevespassantep where idE = $id");
  $compte = 0;
  foreach ($lesEpreuves as $epreuve) {
    // converti la date en chaine Ex.Lundi 12 juin 2019
     $datefin = dateToFrench($epreuve->jourE,'l j F Y');
    $pdf->Cell(15,5,utf8_decode("".$epreuve->disciplineE),1,0,'C');
    $pdf->Cell(35,5,utf8_decode("".$datefin),1,0,'C');
    $pdf->Cell(15,5,utf8_decode("".$epreuve->plagHoraireE),1,0,'C');
    $pdf->Cell(10,5,utf8_decode("".$epreuve->salleE),1,0,'C');
    $compte ++;
  }

  if ($compte != 2) {
    $pdf->Cell(75,5,utf8_decode(""),1,0,'C');
  }

  $pdf->Cell(56,5,utf8_decode(''),1,0,'C');
  $maxf = $maxf + 1;
  if ($maxf == 28) {
    $pdf->AddPage("L","A4");
    $pdf->Ln(3);
    $maxf = 0;
    $ep = 1;
  }
}
$pdf->Output();
?>
