<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../Smarty/libs/Smarty.class.php'; //pristup Smarty sustavu

//PHP
$template_dir = "../Smarty/templates";
$compileDir = "../Smarty/templates_c";
$cacheDir = "../Smarty/cache";


//SMARTY
$smarty = new Smarty;

$smarty->setTemplateDir($template_dir); 
$smarty->setCompileDir($compileDir); 
$smarty->setCacheDir($cacheDir);     
