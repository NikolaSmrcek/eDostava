<?php

include_once 'baza.class.php';
$baza = new baza();
$baza->spojiDB();


$select = isset($_POST['select']) ? $_POST['select'] : false;
$broj = isset($_POST['broj']) ? $_POST['broj'] : 99;

if(($select) && !($broj==99)){
    
   
    
        $upit = "Select ".$broj." from Korisnik";
        $i = 0;
        $podaci = $baza->selectUpit($upit);
        while ($red = $podaci->fetch_array()){
            $response[$i][$broj]  = $red[$broj]; 
            $i=$i+1;
        }
         echo json_encode($response);
     //gledamo dali se trazi username ili email 1-username
    
    
    
}


 
