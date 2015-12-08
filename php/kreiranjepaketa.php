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
include_once 'greske.php';



$baza = new baza();
$baza->spojiDB();



if(isset($_POST['buton_paket'])){

    $primatelj_email = $_POST['primatelj_paketa'] ? $_POST['primatelj_paketa'] : false;
    $adresa_odred_paketa = $_POST['adresa_odred_paketa'] ? $_POST['adresa_odred_paketa'] : false;
    $grad_odred_paketa = $_POST['grad_odred_paketa'] ? $_POST['grad_odred_paketa'] : false;
    $tip_dostave = $_POST['dostava_odred_paketa'] ? $_POST['dostava_odred_paketa'] : false;
    $kur_odred_paketa = $_POST['kur_odred_paketa'] ? $_POST['kur_odred_paketa'] : false;
    
    
    $upit_broj = "Select COUNT(*)id_paket from Paket";
    $podaci = $baza->selectUpit($upit_broj);
    $red = $podaci->fetch_array();
    $id_nex = $red['id_paket'];

    $id_next = $id_nex+1;

    $upit_gal = 'Insert into Gal_slik values('.$id_next.',"'.$id_next.'_img1.jpg","'.$id_next.'_img2.jpg","'.$id_next.'_img3.jpg")';
    $baza->ostaliUpiti($upit_gal);

    $upit_paket = 'Insert into Paket (id_paket,id_kurs,id_topd,naziv,adresa_prim,grad_prim,adresa_pos,grad_pos,gal_slik) values ('.$id_next.','.$kur_odred_paketa.','.$tip_dostave.',"naziv_'.$id_next.'","'.$adresa_odred_paketa.'","'.$grad_odred_paketa.'","'.$_SESSION['adresa'].'","'.$_SESSION['grad'].'",'.$id_next.')';
    $baza->ostaliUpiti($upit_paket);

    $upit_pos = 'Insert into Sudionici values ("'.$_SESSION['email'].'",'.$id_next.',1)';
    $baza->ostaliUpiti($upit_pos);

    $upit_prim = "Insert into Sudionici values ((Select email from Korisnik where email='{$primatelj_email}' OR kor_ime='{$primatelj_email}'),$id_next,2)";
    $baza->ostaliUpiti($upit_prim);
    

    $vrime=  vratiVrime();
    
    $upit_status = 'Insert into Paketi_status (paket_id_paket,datum_postavljanja,status) values ('.$id_next.',"'.$vrime.'",1)';
    $baza->ostaliUpiti($upit_status);
    
    Baza_Radnje("Kreiran paket primatelj: {$primatelj_email}", $_SESSION['email'], 2);
    
    echo "<img src='../img/sent.jpg' />";
    header( "refresh:2;url=user.php" );
}

else{
$primatelj = $_POST['primatelj'] ? $_POST['primatelj'] : false;
$vrsta_upit_paket = $_POST['vrsta_upit_paket'] ? $_POST['vrsta_upit_paket'] : false;
if($primatelj !=="false" && $vrsta_upit_paket){
    if($vrsta_upit_paket == 1){
        $upit = "Select adresa,grad from Korisnik Where (kor_ime='{$primatelj}' OR email='{$primatelj}') AND email!='".$_SESSION['email']."' ";
        $podaci = $baza->selectUpit($upit);
        $red = $podaci->fetch_array();

        $response[0]['grad']  = $red['grad']; 
        $response[0]['adresa']  = $red['adresa']; 

        echo json_encode($response);
    } // ako triba nadopunit adresu
    if($vrsta_upit_paket == 2){
    
        $upit ="Select k.id_kur,k.naziv FROM Kur_sluzba k LEFT JOIN Dostavne_lok d ON k.id_kur=d.id_kurs LEFT JOIN Mjesto_primanja m ON d.id_mprima=m.id_mprim where m.grad='{$primatelj}'";
        $podaci = $baza->selectUpit($upit);
        $i =0;
        while ($red = $podaci->fetch_array()){
            $response[$i]['id_kur']  = $red['id_kur']; 
            $response[$i]['naziv']  = $red['naziv']; 

            $i=$i+1;
        }
         echo json_encode($response);
        
        
    } // ako triba dobit select za kurirske sluzbe
        
    
}
}