
<?php
include_once 'log.php';
require_once '../Smarty/libs/Smarty.class.php';



set_error_handler('obradaPogresaka');

            
            
            function obradaPogresaka($errno, $errstr, $errfile, $errline, $errcontext) {
                 $string .="
                 Opis:  $errstr  <br>
                        ";
                        

                $smarty = new Smarty();
                
                 
               $smarty->assign('naslov', $string);
               $smarty->display('../Smarty/templates/greske.tpl');
                
                exit;
                
                    
            }
            
