<?php

require_once '../Smarty/libs/Smarty.class.php';
include_once '../php/baza.class.php';
include_once '../php/greske.php';
Smarty::muteExpectedErrors();
$baza = new baza();
$baza->spojiDB();
$smarty = new Smarty();


$upit = "Select kor_ime,prezime,ime,email,lozinka from Korisnik";
$podaci = $baza->selectUpit($upit);

$tablica = "<div id='kont_tab' class='table-responsive'>";
$tablica .= "<table id='htkorisnici' class='table table-hover'><thead><tr><th data-name='kor_ime' data-table='hKorisnik'>Kor_ime</th><th data-name='prezime' data-table='hKorisnik'>Prezime</th><th data-name='ime' data-table='hKorisnik'>Ime</th><th data-name='email' data-table='hKorisnik'>E-mail</th><th data-name='lozinka' data-table='hKorisnik'>Lozinka</th></thead><tbody>";

while ($red = $podaci->fetch_array()){
    
    $tablica .= "<tr><td>{$red['kor_ime']}</td><td>{$red['ime']}</td><td>{$red['prezime']}</td><td>{$red['email']}</td><td>{$red['lozinka']}</td></tr>";
}

$tablica .= "</tbody></table></div>";


$smarty->assign('DODAJ', $tablica);
$smarty->display('../Smarty/templates/user.tpl');
/*
ispisGori();
echo $tablica;
ispisDoli();
*/