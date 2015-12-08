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


$znacka = isset($_POST['znacka']) ? $_POST['znacka'] : false;
$uppaket = isset($_POST['uppaket']) ? $_POST['uppaket'] : false;
$lok = isset($_POST['lok']) ? $_POST['lok'] : false;


if($znacka && $uppaket && $lok){
     if(!isset($_SESSION)) 
            { 
                session_start(); 
            } 
    
    if($znacka==2){
        $vrime=  vratiVrime();
        $upit = "Update Paketi_status set status=$znacka,lokacija='".$lok."',datum_lok='".$vrime."' where Paket_id_paket=$uppaket";
        $baza->ostaliUpiti($upit);
        Baza_Radnje("Azurirana lokacija za paket $uppaket", $_SESSION['email'], 2);
        echo true;
    }
    if($znacka == 3 || $znacka==4){
        $vrime= vratiVrime();
        $upit = "Update Paketi_status set status=$znacka,lokacija='".$lok."',datum_lok='".$vrime."',datum_dostave='".$vrime."' where Paket_id_paket=$uppaket";
        $baza->ostaliUpiti($upit);
        if($znacka == 3){
        Baza_Radnje("Paket $uppaket nije preuzet", $_SESSION['email'], 2);
        echo true;
        }
        else{
        Baza_Radnje("Paket $uppaket je preuzet", $_SESSION['email'], 2);
        echo true;
        }
    }
    
}