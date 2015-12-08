<?php
ob_start();
if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
include_once 'baza.class.php';
include_once 'greske.php';



$baza = new baza();
$baza->spojiDB();

    $login_user = $_POST['login_user'] ? $_POST['login_user'] : false;
    $login_pw = $_POST['login_pw'] ? $_POST['login_pw'] : false;


if($login_pw && $login_user){
        


    
    $upit = "Select kor_ime,email,lozinka,status,broj_neusp,ime,prezime,grad,adresa from Korisnik Where kor_ime='{$login_user}' OR email='{$login_user}' ";
    $podaci = $baza->selectUpit($upit);
    $red = $podaci->fetch_array();
    
    $kor_ime = $red['kor_ime'];
    $email = $red['email'];
    $lozinka = $red['lozinka'];
    $status = $red['status'];
    $broj_neusp = $red['broj_neusp'];
    $ime = $red['ime'];
    $prezime = $red['prezime'];
    $grad = $red['grad'];
    $adresa = $red['adresa'];
    
   
    $jsonString = file_get_contents('../config/config.json');
    $data = json_decode($jsonString,true);
    
    $neussp = $data['neusp'];
    
    
    if($status === 0){
            trigger_error("Aktivirajte korisnicki racun!",E_USER_ERROR);
        }
    
    if($status === 1){
            trigger_error("Racun vam je blokiran, kontaktirajte administratora kako bi vam aktivirao racun!",E_USER_ERROR);
        }
        
        
    if($status >= 2){ 

        if($login_pw === $lozinka ){
            
            Baza_Radnje("Uspjesna prijava!", $email, 2);
            
            if($broj_neusp>0){
                $upit = "Update Korisnik set broj_neusp=0 where kor_ime='{$kor_ime}'";
                $baza->ostaliUpiti($upit);
                Baza_Radnje(addslashes($upit),$email, 1);
            }
            
            $_SESSION['kor_ime'] = $kor_ime;
            $_SESSION['email'] = $email;
            $_SESSION['status'] = $status;
            $_SESSION['ime'] = $ime;
            $_SESSION['prezime'] = $prezime;
            $_SESSION['grad'] = $grad;
            $_SESSION['adresa'] = $adresa;
            
            $_SESSION['datum_prijave'] = vratiVrime();
            
            setcookie('kor_ime', $kor_ime, time()+3600*24);
            
            
            echo true;

            
        }//uspjesna prijava
        
        else{
            Baza_Radnje("Neuspjesna prijava!", $email, 2);
            if(($broj_neusp<($neussp-1)) && $status<4){
                $upit = "Update Korisnik set broj_neusp=broj_neusp+1 where kor_ime='{$kor_ime}'";
                $baza->ostaliUpiti($upit);
            }
            else{
                if($status<4){
                $upit = "Update Korisnik set status=1 where kor_ime='{$kor_ime}'";
                $baza->ostaliUpiti($upit);
                $upit = "Update Korisnik set broj_neusp='{$status}' where kor_ime='{$kor_ime}'";
                $baza->ostaliUpiti($upit);
                Baza_Radnje("Zakljucavanje korisnickog racuna", $email, 2);
                }
            }
        }//kriva lozinka
        
        echo false;
    }
    
} //kraj provjere ako je postavljen login klik -- dovrsit

else {
    echo false;
}