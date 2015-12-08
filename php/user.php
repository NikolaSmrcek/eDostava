<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
ob_start();
include_once 'greske.php';




Smarty::muteExpectedErrors();
require_once '../Smarty/libs/Smarty.class.php';
include_once 'baza.class.php';
$baza = new baza();
$baza->spojiDB();

$smarty = new Smarty();
                


if(!isset($_SESSION)) 
    { 
        session_start(); 
    }            
              


if($_SESSION['status']){
    
  $prenesi ='';
    
    if($_SESSION['status'] == 4){
        $prenesi .= "
        <li class='dropdown'>
        <a href='#' class='dropdown-toggle' data-toggle='dropdown'><strong>Registrirani korisnik </strong> <b class='caret'></b></a>
        <ul class='dropdown-menu'>
          <li id='klik_spaket'><a href='#'>Slanje paketa</a></li>
          <li id='klik_scruta'><a href='#'>Cijena Ruta</a></li>
          <li id='stat_kur' data-table='STATKUR' data-name='Broj'><a href='#'>Statistika kurirskih sluzbi</a></li>
          <li id='stat_rute' data-table='STATRUT' data-name='Broj'><a href='#'>Statistika ruta</a></li>

        </ul>
      </li>
      <li class='dropdown'>
        <a href='#' class='dropdown-toggle' data-toggle='dropdown'><strong>Moderator </strong> <b class='caret'></b></a>
        <ul class='dropdown-menu'>
          <li id='klik_tablicee'><a href='#'>Određivanje dostavnih lokacija</a></li>
          <li id='klik_tablicee'><a href='#'>Definiranje rute</a></li>
          <li id='klik_tablicee'><a href='#'>Preuzmi paket</a></li>
          <li id='klik_tablicee'><a href='#'>Azuriraj paket</a></li>
          <li id='klik_gal_slik' data-gal='10'><a href='#'>Galerija slika</a></li>
          <li id='stat_mod1' data-table='modstat1' data-name='Broj'><a href='#'>Statistika</a></li>
          
        </ul>
      </li>
        <li class='dropdown'>
        <a href='#' class='dropdown-toggle' data-toggle='dropdown'><strong>Administrator</strong> <b class='caret'></b></a>
        <ul class='dropdown-menu'>
          <li id='klik_config'><a href='#'>Konfiguracija sustava</a></li>
          <li id='klik_blok_kor'><a href='#'>Otkljucavanje/blokiranje</a></li>
          <li id='klik_dnevnikr'><a href='#'>Dnevnik radnji i baze</a></li>
          <li id='klik_dnevnikp'><a href='#'>Dnevnik prijave i odjave</a></li>
          <li id='klik_tablicee'><a href='#'>CRUD</a></li>
          <li id='klik_dodjela'><a href='#'>Dodijeli postara</a></li>
          <li id='klik_mailslanje' data-table='GENMAIL'><a href='#'>Slanje notifikacijskog</a></li>
          <li id='statadmin' data-table='adminstat' data-name='Ukupno'><a href='#'>Statistika</a></li>
        </ul>
      </li>"; //dodajemo menije
        
      
    }
    
    if($_SESSION['status'] == 3){
        $prenesi .= "
        <li class='dropdown'>
        <a href='#' class='dropdown-toggle' data-toggle='dropdown'><strong>Registrirani korisnik </strong> <b class='caret'></b></a>
        <ul class='dropdown-menu'>
          <li id='klik_spaket'><a href='#'>Slanje paketa</a></li>
          <li id='klik_scruta'><a href='#'>Cijena Ruta</a></li>
          <li id='stat_kur' data-table='STATKUR' data-name='Broj'><a href='#'>Statistika kurirskih sluzbi</a></li>
          <li id='stat_rute' data-table='STATRUT' data-name='Broj'><a href='#'>Statistika ruta</a></li>

        </ul>
      </li>
      <li class='dropdown'>
        <a href='#' class='dropdown-toggle' data-toggle='dropdown'><strong>Moderator </strong> <b class='caret'></b></a>
        <ul class='dropdown-menu'>";
        $upit=  "Select status from Djelatinici where id_kor = '".$_SESSION['email']."'";
        $odg = $baza->selectUpit($upit);
        if($nesto = $odg->fetch_array() ){
             if($nesto['status']==1){
                $prenesi .= "<li id='klik_sdostave'><a href='#'>Određivanje dostavnih lokacija</a></li>";
                $prenesi .= "<li id='klik_defrute'><a href='#'>Definiranje rute</a></li>";
                $prenesi .= "<li id='klik_preuzmi'><a href='#'>Preuzmi paket</a></li>";
                $prenesi .= "<li id='klik_azuriraj'><a href='#'>Ažuriraj paket</a></li>";
                $prenesi .= "<li id='klik_gal_slik' data-gal='10'><a href='#'>Galerija slika</a></li>";
                $prenesi .= "<li id='stat_mod1' data-table='modstat1' data-name='Broj'><a href='#'>Statistika</a></li>";
                }
             else{
                 $prenesi .= "<li><a href='#'>Nemate dodijeljenu sluzbu</a></li>";
             }
            }
        else{
            $prenesi .= "<li><a href='#'>Nemate dodijeljenu sluzbu</a></li>";
        }
          
        $prenesi .= "</ul>
      </li>";
        
        
    }
    
    
    if($_SESSION['status'] == 2){
        $prenesi .= "
        <li class='dropdown'>
        <a href='#' class='dropdown-toggle' data-toggle='dropdown'><strong>Registrirani korisnik </strong> <b class='caret'></b></a>
        <ul class='dropdown-menu'>
          <li id='klik_spaket'><a href='#'>Slanje paketa</a></li>
          <li id='klik_scruta'><a href='#'>Cijena Ruta</a></li>
          <li id='stat_kur' data-table='STATKUR' data-name='Broj'><a href='#'>Statistika kurirskih sluzbi</a></li>
          <li id='stat_rute' data-table='STATRUT' data-name='Broj'><a href='#'>Statistika ruta</a></li>
        </ul>
      </li>"; //dodajemo menije
        
        
       
    }
     
    
    
    $smarty->assign('var', $prenesi);
    $smarty->assign('ime', $_SESSION['ime']);
    $smarty->assign('prezime', $_SESSION['prezime']);
    $smarty->assign('kor', $_SESSION['kor_ime']);
    $smarty->assign('DODAJ',"<img class='img-responsive' id='div_spremanje' src='../img/WELCOME.jpg' ></img>");
    $smarty->display('../Smarty/templates/user.tpl');
}


