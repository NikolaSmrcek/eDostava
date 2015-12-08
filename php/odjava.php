<?php
if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
    ob_start();
include_once 'greske.php';

if(isset($_SESSION['email'])){

    echo $_SESSION['email'];
    
PrijavaOdjava();
session_unset();
session_destroy();

}

header('Location: pocetna.php');


