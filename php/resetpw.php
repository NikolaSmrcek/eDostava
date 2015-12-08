<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once 'baza.class.php';
include_once 'greske.php';


$baza = new baza();
$baza->spojiDB();

$akt = $_GET['akti'];
$email = $_GET['email'];

$string = md5(uniqid(rand(), true));
    
$lozinka =substr($string, 0, 8);
    

    
    $upit = "Update Korisnik set lozinka='{$lozinka}' where aktivacija='{$akt}'";
    $baza->ostaliUpiti($upit);
    
    $mailPoruka = "Postovani, za email adresu : \n \n $email je nova lozinka s kojom se mozete logirati:  \n \n $lozinka  \n \n ";
    mail($email, "Potvrda ponovne lozinke", $mailPoruka);
    
    Baza_Radnje("Dodijeljena nova lozinka",$email, 2);
    
    ispisGori();
    echo '<img class="img-responsive" src="../img/mail.jpg" alt="">';
    ispisDoli();