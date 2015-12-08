<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
ob_start();

if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 

include_once 'baza.class.php';
$baza = new baza();
$baza->spojiDB();

if(isset($_POST['dod_rute_buton_name'])){
    
    $i = 0;
    $polje= array();
    foreach ($_POST as $kljuc=>$vrijednost){
        //echo "<br> Kljuc: ".$kljuc."  vrijednost:  ".$vrijednost."<br>";
        $polje[$i]=$vrijednost;
        $i = $i +1;
        
    }
    
    
    $upit = "INSERT INTO Ruta values(default,".$polje[1].",'".$polje[0]."','".$polje[$i-6]."','".$polje[$i-5]."',1)";
    $baza->ostaliUpiti($upit);
    
    $upit_2 = "INSERT INTO Cjenik values (1,(Select id_ruta from Ruta order by id_ruta DESC LIMIT 1),".$polje[1].",'".$polje[$i-4]."')";
    $baza->ostaliUpiti($upit_2);
    
    $upit_4 = "INSERT INTO Cjenik values (2,(Select id_ruta from Ruta order by id_ruta DESC LIMIT 1),".$polje[1].",'".$polje[$i-3]."')";
    $baza->ostaliUpiti($upit_4);
    
    $upit_5 = "INSERT INTO Cjenik values (3,(Select id_ruta from Ruta order by id_ruta DESC LIMIT 1),".$polje[1].",'".$polje[$i-2]."')";
    $baza->ostaliUpiti($upit_5);
    
    $upit_3 = "INSERT INTO Dio_rute values (default,(Select id_ruta from Ruta order by id_ruta DESC LIMIT 1),".$polje[1].",".$polje[2].",1)";
    $baza->ostaliUpiti($upit_3);
    
    //pocinje 3 karja je i-8
    
    for($ll=3;$ll<($i-8);$ll=$ll+1){
        $upit_z="INSERT INTO Dio_rute values (default,(Select id_ruta from Ruta order by id_ruta DESC LIMIT 1),".$polje[1].",".$polje[$ll].",2)";
        $baza->ostaliUpiti($upit_z);
    }
    
    $upit_10 = "INSERT INTO Dio_rute values (default,(Select id_ruta from Ruta order by id_ruta DESC LIMIT 1),".$polje[1].",".$polje[$i-8].",3)";
    $baza->ostaliUpiti($upit_10);
    
    Baza_Radnje("Kreirana ruta", $_SESSION['email'], 2);
    
    echo "<img src='../img/prst.jpeg' />";
    header( "refresh:2;url=user.php" );
} //IF

