<?php
require('fpdf.php');
class PDF extends FPDF
{
// En-tête
function Header()
{

    // Police Arial gras 15
    $this->SetFont('Arial','B',15);

    // Titre
    $this->Cell(0,10,"",1,0,'C');
    $this->SetXY(15,10);
    $this->Cell(15,10,utf8_decode("2019 - "),0,0,'C');
    $this->SetXY(30,10);
    $this->Cell(0,10,utf8_decode("DUMONT"),0,0,'L');
    $this->SetXY(15,10);
    $this->Cell(0,10,utf8_decode("Anglais "),0,0,'R');

    // Saut de ligne
    $this->Ln(15);
    $this->SetFont('Arial','',8);
    $this->Cell(36,8,utf8_decode(''),0,0,'C');
    $this->Ln(8);
    $this->Cell(15,8,utf8_decode('Division'),1,0,'C');
    $this->Cell(56,8,utf8_decode('Nom Prénom'),1,0,'C');
    $this->Cell(35,8,utf8_decode('Date'),1,0,'C');
    $this->Cell(15,8,utf8_decode('Heure'),1,0,'C');
    $this->Cell(10,8,utf8_decode('Salle'),1,0,'C');
    $this->Cell(58,8,utf8_decode('Signature'),1,0,'C');

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
$pdf->AddPage("P","A4");
$pdf->SetFont('Arial','',8);
$pdf->SetXY(10,25);
$pdf->Cell(71,8,utf8_decode(''),0,0,'C');
$pdf->Output();
 ?>
