<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
ob_start();
include_once 'baza.class.php';
$baza = new baza();
$baza->spojiDB();

$id = isset($_POST['id']) ? $_POST['id'] : false;
$table = isset($_POST['table']) ? $_POST['table'] : false;
$tip = isset($_POST['tip']) ? $_POST['tip'] : false;



if($id && $table && $tip){
    if($table == "ppKorisnik"){
        $table = "Korisnik";
    }
    
    if($table == "POCETNA"){
        $table = "Ruta";
    }
    
    if($table != "GENMAIL"){
        echo dohvatiPod($baza, $id, $table, $tip);
    }
        
    
    
    if($table == "GENMAIL"){
        if($tip == 1){
            $paket = isset($_POST['paket']) ? $_POST['paket'] : false;
            $mailPoruka ="Obavijestavamo Vas da paket, naziva $paket nazalost nije isporučen!";
            mail($id, "Obavijest o neisporuci!", $mailPoruka);
            
             if(!isset($_SESSION)) 
                    { 
                        session_start(); 
                    } 
                    Baza_Radnje("Not.mail {$id},paket-naziv: {$paket}  ",$_SESSION['email'],2);
            
            echo 1;
        } //ako je poslati odredenom korisniku
        
        if($tip== 44){
            if(!isset($_SESSION)) 
                    { 
                        session_start(); 
                    } 
            
            $upit="Select s.id_kors as email, s.id_paketa as paket from Sudionici s RIGHT JOIN Paket p on s.id_paketa=p.id_paket RIGHT JOIN Paketi_status ps on p.id_paket=ps.Paket_id_paket where ps.status=3";
            $podaci = $baza->selectUpit($upit);
            $i = 0;
            while ($red = $podaci->fetch_array()){
                    mail($red['email'], "Obavijest o neisporuci!", "Obavijestavamo Vas da paket, naziva ".$red['paket']." nazalost nije isporučen!");
                $i=$i+1;
            }
            echo 1;
                    }
        
    }//ako je za slanje maila
    
}

function dohvatiPod($baza,$id,$table,$tip){
    

        $upit = "Select * from ".$table."";
    
    
    $podaci = $baza->selectUpit($upit);
    $j = 0;
        while($data = mysqli_fetch_field($podaci)) {
            $th[$j]  = $data->name;
            $j=$j+1;
        }
        
        $upit_2 = "Select * from ".$table." Where ".$th[0]."='{$id}'";
        
        if($table == "Korisnik"){
            $upit_2 = "Select * from ".$table." Where ".$th[5]."='{$id}'";
        }
        
        $podaci_2 = $baza->selectUpit($upit_2);
        
    $i = 0;
        while ($red = $podaci_2->fetch_array()){
            for($z=0;$z<$j;$z++){
            $response[$i][$th[$z]]  = $red[$th[$z]];
            }
            $i = $i+1;
        }


        return json_encode($response);
    
} //modificirana da mi dohvaca podatke o pojedinom podatku za generiranje forme

