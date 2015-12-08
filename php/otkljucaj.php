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


$email = isset($_POST['email']) ? $_POST['email'] : false;
$status = isset($_POST['status']) ? $_POST['status'] : false;
$broj_neusp = isset($_POST['broj_neusp']) ? $_POST['broj_neusp'] : false;



if($email && isset($status) && isset($broj_neusp)){
    
    if($status >= 2){
        $upit_r= "Update Korisnik SET status=1,broj_neusp='{$status}'WHERE email = '{$email}'";
        if($baza->ostaliUpiti($upit_r)){
            Baza_Radnje(addslashes($upit_r),$_SESSION['email'],1);
            Baza_Radnje("Korisnicki racun otkljucan, racun korisnika: $email",$_SESSION['email'],2);
        }
        $upit = "Select kor_ime,prezime,ime,email,lozinka,status,broj_neusp from Korisnik ORDER BY status";
        $podaci = $baza->selectUpit($upit);
        $i = 0;
        while ($red = $podaci->fetch_array()){
            $response[$i]['kor_ime']  = $red['kor_ime'];
            $response[$i]['prezime']  = $red['prezime']; 
            $response[$i]['ime']  = $red['ime']; 
            $response[$i]['email']  = $red['email']; 
            $response[$i]['lozinka']  = $red['lozinka']; 
            $response[$i]['status']  = $red['status'];
            $response[$i]['broj_neusp']  = $red['broj_neusp'];
            $i=$i+1;
        }
         echo json_encode($response);
        
    }
    
    if($status ==1){
        $upit_r="Update Korisnik SET status='{$broj_neusp}',broj_neusp=0 WHERE email = '{$email}'";
        
        if($baza->ostaliUpiti($upit_r)){
            Baza_Radnje(addslashes($upit_r),$_SESSION['email'],1);
            Baza_Radnje("Korisnicki racun zakljucan, racun korisnika: $email ",$_SESSION['email'],2);
        }
        
        $upit = "Select kor_ime,prezime,ime,email,lozinka,status,broj_neusp from Korisnik ORDER BY status";
        $podaci = $baza->selectUpit($upit);
        $i = 0;
        while ($red = $podaci->fetch_array()){
            $response[$i]['kor_ime']  = $red['kor_ime'];
            $response[$i]['prezime']  = $red['prezime']; 
            $response[$i]['ime']  = $red['ime']; 
            $response[$i]['email']  = $red['email']; 
            $response[$i]['lozinka']  = $red['lozinka']; 
            $response[$i]['status']  = $red['status'];
            $response[$i]['broj_neusp']  = $red['broj_neusp'];
            $i=$i+1;
        }
         echo json_encode($response);
        
    }
    
    if($status == 0){
        $upit = "Select kor_ime,prezime,ime,email,lozinka,status,broj_neusp from Korisnik ORDER BY status";
        $podaci = $baza->selectUpit($upit);
        $i = 0;
        while ($red = $podaci->fetch_array()){
            $response[$i]['kor_ime']  = $red['kor_ime'];
            $response[$i]['prezime']  = $red['prezime']; 
            $response[$i]['ime']  = $red['ime']; 
            $response[$i]['email']  = $red['email']; 
            $response[$i]['lozinka']  = $red['lozinka']; 
            $response[$i]['status']  = $red['status'];
            $response[$i]['broj_neusp']  = $red['broj_neusp'];
            $i=$i+1;
        }
         echo json_encode($response);
        
    }
}
