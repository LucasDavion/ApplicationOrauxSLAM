<?php




require('fpdf.php');

class PDF extends FPDF
{
  // En-tête
  function Header()
  {

    //====================
    $lnlyce = "-6";
    //====================
      // Logo
      $this->Image('images/logo.png',10,10,30);
      // Police Arial gras 25
      $this->SetFont('Arial','B',25);
      // Décalage à droite
      $this->Cell(80);
      // Titre
      $this->SetXY(100, 20);
      $this->Cell(0,10,'CONVOCATION',0,0);
      $this->SetFont('Arial','',8);
      $this->SetXY(10, 33);
      $this->Cell(0,10,utf8_decode('Lycée Jean Rostand'),0,1);
      $this->Ln($lnlyce);
      $this->Cell(0,10,utf8_decode('CITÉ SCOLAIRE DE CHANTILLY'),0,1);
      $this->Ln($lnlyce);
      $this->Cell(0,10,utf8_decode('Place Georges Paquier - BP 60329'),0,1);
      $this->Ln($lnlyce);
      $this->Cell(0,10,utf8_decode('60634 Chantilly Cedex'),0,1);
      $this->Ln($lnlyce);
      $this->Cell(0,10,utf8_decode('Téléphone : 03.44.62.47.00'),0,1);
      $this->Ln($lnlyce);
      $this->Cell(0,10,utf8_decode('Couriel : ce.0600009j@ac-amiens.fr'),0,1);
      $this->Ln($lnlyce);
      $this->Cell(0,10,utf8_decode('Site : http://rostand.lyc.ac-amiens.fr'),0,1);

      // Saut de ligne
      $this->Ln(25);
  }

  // Pied de page
  function Footer()
  {
    $lieu = "LeLieu";
    $date = "LaDate";
      // pied de page
      $this->SetY(-15);
      // Police Arial italique
      $this->SetFont('Arial','I',12);
      $this->SetXY(20, 250);
      $this->Cell(0,10,utf8_decode('Fais à '.$lieu.' le '.$date),0,1);
      $this->SetXY(20, 255);
      $this->Cell(20,10,utf8_decode("Signature du chef d'établisement"),0,1);
  }

}


 ?>
