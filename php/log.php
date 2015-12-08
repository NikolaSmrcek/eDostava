<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
ob_start();

include_once 'baza.class.php';
include_once 'config.php';




function PrijavaOdjava(){
    $baza = new baza();
    $baza->spojiDB();   
    
    $vrime = vratiVrime();
    
    $upit = "Insert into Prijave (id_pok,id_kor,datum_prijave,datum_odjave)  values ('default','{$_SESSION['email']}','{$_SESSION['datum_prijave']}','{$vrime}')";
    $baza->ostaliUpiti($upit);
}

function Baza_Radnje($opis,$email,$tip){
    $baza = new baza();
    $baza->spojiDB();  
    
    $vrime = vratiVrime();
    
    $upit = "Insert into Radnje_baza (id_baza,id_kor,datum_rada,opis,tip)  values ('default','{$email}','{$vrime}','{$opis}','{$tip}' )";
    $baza->ostaliUpiti($upit);
    
}

function vratiVrime(){
    
    $jsonString = file_get_contents('../config/config.json');
    $data = json_decode($jsonString,true);

    return date("Y-m-d H:i:s", strtotime("+{$data['pomak']} hours"));
    
}