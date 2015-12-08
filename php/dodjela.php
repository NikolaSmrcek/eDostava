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

$vrsta = isset($_POST['vrsta']) ? $_POST['vrsta'] : false;

if($vrsta){
    if($vrsta == 2){
    $kur = isset($_POST['kur']) ? $_POST['kur'] : false;
    $email = isset($_POST['email']) ? $_POST['email'] : false;
     
        if($kur && $email){
                $upit = "INSERT INTO Djelatinici VALUES ('{$kur}','{$email}',1)";
                $baza->ostaliUpiti($upit);
                
                if(!isset($_SESSION)) 
                    { 
                        session_start(); 
                    } 
                    
                Baza_Radnje(addslashes($upit),$_SESSION['email'],1);
                Baza_Radnje("Dodijeljen postar {$kur}, Kurirskoj sluzbi s ID: {$email} ...",$_SESSION['email'],2);
                
        } //ako su dospjeli podaci koga treba dodati kome
    
        
    }//ako se radi od dodavanju
        $upit = "Select Kur_sluzba.naziv AS Naziv,Kur_sluzba.id_kur AS ID from Kur_sluzba";
        $podaci = $baza->selectUpit($upit);
        $i = 0;
        while ($red = $podaci->fetch_array()){
            $response[$i]['Naziv']  = $red['Naziv'];
            $response[$i]['ID']  = $red['ID']; 
            $i=$i+1;
        }//while
        
        
        $upit_2="Select DISTINCT Korisnik.email as EMAIL from Korisnik where NOT EXISTS (Select Djelatinici.id_kor FROM Djelatinici WHERE Djelatinici.id_kor = Korisnik.email) AND Korisnik.status=3 ";
        $podaci_2 = $baza->selectUpit($upit_2);
        $j = 0;
        while ($red_2 = $podaci_2->fetch_array()){
            $response[$j]['EMAIL']  = $red_2['EMAIL'];
            $j=$j+1;
        }//while
         echo json_encode($response);
    
    
    
} // ako je postavljen 