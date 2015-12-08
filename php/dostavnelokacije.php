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

$uvjet = isset($_POST['GENLOK']) ? $_POST['GENLOK'] : false;

if($uvjet == "gen_lok" || $uvjet== "gen_mista"){
    
    if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
    
    $upit = "Select k.id_kur AS 'ID',k.naziv as 'NAZIV' from Kur_sluzba k right join Djelatinici d on k.id_kur=d.id_kurs where d.id_kor='".$_SESSION['email']."'";
    $podaci = $baza->selectUpit($upit);
    
    $red = $podaci->fetch_array();
    
    $response[0]['ID']=$red['ID'];
    $response[0]['NAZIV']=$red['NAZIV'];
    

    
    if($uvjet == "gen_mista"){
        $upit_2 = "Select m.id_mprim AS 'ID mjesta',m.grad as 'Grad' from Mjesto_primanja m where m.id_mprim  NOT IN (Select m.id_mprim  from Mjesto_primanja m left join Dostavne_lok d on m.id_mprim=d.id_mprima WHERE d.id_kurs=".$response[0]['ID']." and d.status=1) GROUP BY Grad ORDER BY Grad";

        $podaci_2 = $baza->selectUpit($upit_2);

    

        $i = 0;
            while ($red_2 = $podaci_2->fetch_array()){
                $response[$i]['ID_m']  = $red_2['ID mjesta'];
                $response[$i]['grad']  = $red_2['Grad']; 
                $i=$i+1;
            }

            echo json_encode($response);
    }
    
    
    if($uvjet == "gen_lok"){
        $upit_2 = "Select m.id_mprim AS 'ID mjesta',m.grad as 'Grad' from Mjesto_primanja m left join Dostavne_lok d on m.id_mprim=d.id_mprima WHERE d.id_kurs=".$response[0]['ID']." AND d.status=1";

        $podaci_2 = $baza->selectUpit($upit_2);

   
        $i = 0;
            while ($red_2 = $podaci_2->fetch_array()){
                $response[$i]['ID_m']  = $red_2['ID mjesta'];
                $response[$i]['grad']  = $red_2['Grad']; 
                $i=$i+1;
            }

            echo json_encode($response);
    } //ako se radi o drugom selectu
}



if(isset($_POST['vrsta_nep'])){
    
    if($_POST['vrsta_nep'] == 1){
        
        $kur = isset($_POST['kur_sla']) ? $_POST['kur_sla'] : false;
        $misto = isset($_POST['saljem_nep']) ? $_POST['saljem_nep'] : false;
        
        
            $upit = "Select id_mprima from Dostavne_lok where id_kurs=$kur AND id_mprima=$misto";
            $odg = $baza->selectUpit($upit);
            if($nesto = $odg->fetch_array() ){
                $upit = "Update Dostavne_lok set status=1 where id_kurs=$kur AND id_mprima=$misto";
                $baza->ostaliUpiti($upit);
                echo true;
            }
            else{
                $upit = "Insert into Dostavne_lok values ($kur,$misto,1)";
                $baza->ostaliUpiti($upit);
                echo true;
            }
    } //dodavanje
    
    if($_POST['vrsta_nep'] == 2){
        
        $kur = isset($_POST['kur_sla']) ? $_POST['kur_sla'] : false;
        $misto = isset($_POST['saljem_nep']) ? $_POST['saljem_nep'] : false;
                
        $upit = "Update Dostavne_lok set status=0 where id_kurs=$kur AND id_mprima=$misto";
        $baza->ostaliUpiti($upit);
        echo true;
    } //dodavanje
    

    
}//ako se radi o dodavanju ili brisanju

 