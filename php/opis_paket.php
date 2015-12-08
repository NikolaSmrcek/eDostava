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



if(isset($_POST['posalji_opis_paketa'])){
    if(count($_FILES['file']['name']) == 3){
    $ruta = isset($_POST['dostupne_rute']) ? $_POST['dostupne_rute'] : false;
    $naziv = isset($_POST['naziv_ppaketa']) ? $_POST['naziv_ppaketa'] : false;
    $tezina = isset($_POST['ppaket_tezina']) ? $_POST['ppaket_tezina'] : false;
    $visina = isset($_POST['ppaket_visina']) ? $_POST['ppaket_visina'] : false;
    $sirina = isset($_POST['ppaketa_sirina']) ? $_POST['ppaketa_sirina'] : false;
    $duzina = isset($_POST['ppaketa_duzina']) ? $_POST['ppaketa_duzina'] : false;
    $id = isset($_POST['id_ppaketa']) ? $_POST['id_ppaketa'] : false;
    
    $upit = "UPDATE Paket set naziv='".$naziv."',tezina=$tezina,visina=$visina,sirina=$sirina,duzina=$duzina where id_paket=$id";
    $baza->ostaliUpiti($upit);
    
    if(!isset($_SESSION)) 
            { 
                session_start(); 
            } 
    
    $vrime= vratiVrime();
    $upit = "UPDATE Paketi_status set datum_preuzimanja='".$vrime."',id_rute=$ruta,status=2,id_kor='".$_SESSION['email']."' where Paket_id_paket=$id ";
    $baza->ostaliUpiti($upit);
    
    for($u=0;$u<3;$u=$u+1){
            $path = "../img/gal/";
        $location = $path . $id. "_img".($u+1).".jpg"; 

        if(move_uploaded_file($_FILES['file']["tmp_name"][$u], $location)){
                
                    chmod($location, 0777);  
                } 
    }//uplodamo svaku sliku
    Baza_Radnje("Paket $id preuzet i opisan ", $_SESSION['email'], 2);
    
    echo "<img src='../img/prst.jpeg' />";
    header( "refresh:2;url=user.php" );
    }//imamo 3 slike
    else{
        echo "<img src='../img/up_again.jpg' />";
        header( "refresh:2;url=user.php" );
    }
}


/*
foreach ($_FILES as $kljuc=>$vrijednost){
        echo "<br> Kljuc: ".$kljuc."  vrijednost:  ".$vrijednost."<br>";
        //$polje[$i]=$vrijednost;
        //$i = $i +1;
        
    }
    */
    
    
    
    /*
    $id = isset($_POST['id_ppaketa']) ? $_POST['id_ppaketa'] : false;
    
    $path = "../img/";
    $location = $path . $id. "img1.jpg"; 
    
    if(move_uploaded_file($_FILES['file']["tmp_name"][0], $location)){
            echo "USPJEH";
                chmod($location, 0777);  
            } 
     * 
     * /*
     */
    //ppaketa_slike[]
    /*
    echo "<br>";
  echo "Upload: " . $_FILES["file"]["name"][0] . "<br>";
   echo "Upload2: " . $_FILES["file"][0]["name"] . "<br>";
  echo "Type: " . $_FILES["file"]["type"][0] . "<br>";
  echo "Size: " . ($_FILES["file"]["size"][0] / 1024) . " kB<br>";
  echo "Stored in: " . $_FILES["file"]["tmp_name"][0];
     
     */