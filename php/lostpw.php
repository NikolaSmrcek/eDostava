<?php
include_once 'baza.class.php';
include_once 'greske.php';

$baza = new baza();
$baza->spojiDB();

$trazi = isset($_POST['trazi']) ? $_POST['trazi'] : false;

if($trazi){
    
   
    
    $upit_2 = "Select email,aktivacija from Korisnik where kor_ime='{$trazi}' OR email='{$trazi}'";
    $podaci = $baza->selectUpit($upit_2);
    
    if($red = $podaci->fetch_array()){
    $email = $red['email'];
    $akt = $red['aktivacija'];
    
    Baza_Radnje("Zahtjev za novom lozinkom",$email, 2);
    
    $mailPoruka = "Postovani,  kliknite na sljedeći link kako biste dobili novu lozinku: \n \n http://arka.foi.hr/WebDiP/2013_projekti/WebDiP2013_079/php/resetpw.php?akti=$akt&email=$email     \n \n   \n \n ";
    mail($email, "Potvrda ponovne lozinke", $mailPoruka);
    echo true;
    }
    
    else{
        trigger_error("Nepostojeci username ili email!",E_USER_ERROR);
    }
}

