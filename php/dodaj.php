<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
ob_start();
include_once 'baza.class.php';
include_once 'greske.php';





if(isset($_POST['buton'])){
    
    $baza = new baza();
    $baza->spojiDB();
    
    $prvakolona="";
    foreach ($_POST as $kljuc=>$vrijednost){

            $polje[$kljuc]=$vrijednost;
        }
        
        if($polje['id_tabZ'] === "ppKorisnik"){
            $polje['id_tabZ'] = "Korisnik";
        }
        
    if($polje['id_tipZ'] == 1){
        $upit = "UPDATE {$polje['id_tabZ']} SET";  
        $counter = 4;   
            foreach($polje as $kljuc=>$vrijednost){
                if($counter ==4){
                    $prvakolona=$kljuc;
                }
                
                if($polje['id_tabZ'] == "Korisnik" && $counter==9){
                     $prvakolona=$kljuc;
                }
                
                if($counter == count($polje)) {continue;} //da izbjegnemo 4 nepotrebne vrijednosti
                if($counter == (count($polje)-1)){
                $upit .= " {$kljuc}='{$vrijednost}' ";    
                }
                else{
                    $upit .= " {$kljuc}='{$vrijednost}' , ";
                }
                $counter++;
            }
        $upit .= " WHERE {$prvakolona}='{$polje['id_posZ']}'";
        
        if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
               
        if($baza->ostaliUpiti($upit)){
        Baza_Radnje("Uspjesna izmjena podatka {$prvakolona} u tablici  {$polje['id_tabZ']}",$_SESSION['email'],2);
        Baza_Radnje(addslashes($upit),$_SESSION['email'],1);
        header("Location: user.php");
        }
    }//ako se radi o UPDATE
    
    if($polje['id_tipZ'] == 2){
        $upit = "INSERT INTO {$polje['id_tabZ']} VALUES (";
        
        $counter = 4;   
            foreach($polje as $kljuc=>$vrijednost){
                
                if($counter == count($polje)) {continue;}
                
                if($counter == (count($polje)-1)){
                $upit .= " '{$vrijednost}' ) ";    
                }
                else{
                    $upit .= " '{$vrijednost}', ";
                }
                $counter++;
                
            } //foreach
            
        if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
            
        if($baza->ostaliUpiti($upit)){
        Baza_Radnje(addslashes($upit),$_SESSION['email'],1);
        Baza_Radnje("Uspjesno dodavanje u tablicu {$polje['id_tabZ']}",$_SESSION['email'],2);
        header("Location: user.php");
        }
    } //if 
}