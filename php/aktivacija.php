<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
ob_start();
include_once 'baza.class.php';
include_once 'greske.php';

$baza = new baza();
$baza->spojiDB();

$kor = $_GET["kor_mail"];
$act = $_GET["act"];


$upit = "select Korisnik.datum_reg,Korisnik.status from Korisnik where Korisnik.email = '{$kor}' AND Korisnik.aktivacija = '{$act}'";



if($tdat = $baza->selectUpit($upit)){
    $red = $tdat->fetch_array();
    $datum_reg = $red['datum_reg']; //datum registracije korisinika sa kliknutim aktivacijskim linkom
    $status = $red['status']; //status provjeravmo zbog dodatne provjere
    if($status==0){
    if((  (strtotime('-1 day') < (strtotime($datum_reg))) && (strtotime('+1 day') > (strtotime($datum_reg))) )  ){ //pretvaramo u unixov format za vrijeme i usporedujemo da vidimo dali je prosao jedan dan
        $upit = "UPDATE Korisnik SET status=2 WHERE Korisnik.email = '{$kor}' AND Korisnik.aktivacija = '{$act}'"; //upit s kojim mjenjamo status
        if($baza->ostaliUpiti($upit)){
           Baza_Radnje("Uspjesna aktivacija",$kor,2);
           header("Location: pocetna.php");
           exit;
        }
    }
    
    else {
        trigger_error("Istekao vam je aktivacijski link!",E_USER_ERROR);
       } //istekao rok od 24h
} //provjera dali se radi o neregistrianom clanu

else{
    trigger_error("Email adresa je vec zabiljezena u bazi podataka...",E_USER_ERROR);
}


} //kraj ifa ako uspije upit
else{
    trigger_error("Greska s bazom podataka!",E_USER_ERROR);
} //greska baze