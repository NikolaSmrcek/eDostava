<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
ob_start();

include_once 'greske.php';


$provjera = $_POST['name'] ? $_POST['name'] : false;


if($provjera == 1){
    $str = $_POST['str'] ? $_POST['str'] : false;
    if($str == "TT"){
    $xml=simplexml_load_file("http://arka.foi.hr/PzaWeb/PzaWeb2004/config/pomak.xml");
    
    $upis = 0;
    foreach($xml->vrijeme->pomak[0]->attributes() as $a => $b) {
        $upis= (int)$b;
    }

    $jsonString = file_get_contents('../config/config.json');
    $data = json_decode($jsonString,true);
    
    $data['pomak'] = $upis;

    $newJsonString = json_encode($data,true);
    file_put_contents('../config/config.json', $newJsonString);
    if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
    Baza_Radnje("Preuzimanje vremena", $_SESSION['email'], 2);
    
    
    echo $upis;
    }
} //ako je 1 preuzimamo

if($provjera == 2){
    $str = $_POST['str'] ? $_POST['str'] : false;
    if($str){
        
        
    $jsonString = file_get_contents('../config/config.json');
    $data = json_decode($jsonString,true);
    
    $data['str'] = $str;

    $newJsonString = json_encode($data,true);
    file_put_contents('../config/config.json', $newJsonString);
    if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
    Baza_Radnje("Postavljanje broja stranica", $_SESSION['email'], 2);
    
    
    echo $str;
        
    }//provjera jeli postavljen str
    
    
}//provjera dali minjamo stranicenje

if($provjera == 3){
    $str = $_POST['str'] ? $_POST['str'] : false;
    if($str){
        
        
    $jsonString = file_get_contents('../config/config.json');
    $data = json_decode($jsonString,true);
    
    $data['neusp'] = $str;

    $newJsonString = json_encode($data,true);
    file_put_contents('../config/config.json', $newJsonString);
    if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
    Baza_Radnje("Postavljanje broja neuspjelih prijava", $_SESSION['email'], 2);
    
    
    echo $str;
        
    }//provjera jeli postavljen str
    
    
}//provjera dali minjamo zakljcavanje


if($provjera == 4){
    $str = $_POST['str'] ? $_POST['str'] : false;
    if($str){
        
        
    $jsonString = file_get_contents('../config/config.json');
    $data = json_decode($jsonString,true);
    
    $data['izgled'] = $str;
    

    
    $newJsonString = json_encode($data,true);
    file_put_contents('../config/config.json', $newJsonString);
    if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
    Baza_Radnje("Postavljanje boje izbornika", $_SESSION['email'], 2);
    
    
    echo true;
        
    }//provjera jeli postavljen str
    
    
}//provjera dali minjamo boju

if($provjera == 5){
    $str = $_POST['str'] ? $_POST['str'] : false;
    if($str){
        
        
    $jsonString = file_get_contents('../config/config.json');
    $data = json_decode($jsonString,true);
    
    $data['graf'] = $str;
    

    
    $newJsonString = json_encode($data,true);
    file_put_contents('../config/config.json', $newJsonString);
    if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
    Baza_Radnje("Postavljanje tipa grafikona", $_SESSION['email'], 2);
    
    
    echo 1;
        
    }//provjera jeli postavljen str
    
    
}//provjera dali minjamo tip grafa