<?php /* Smarty version Smarty-3.1.18, created on 2014-06-23 21:02:51
         compiled from "../Smarty/templates/greske.tpl" */ ?>
<?php /*%%SmartyHeaderCode:137544552453a879db89a250-14665696%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e0b8dc3d39d2d67002d6041d694cedb4c01f9e80' => 
    array (
      0 => '../Smarty/templates/greske.tpl',
      1 => 1403548267,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '137544552453a879db89a250-14665696',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'naslov' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_53a879db906353_66512060',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53a879db906353_66512060')) {function content_53a879db906353_66512060($_smarty_tpl) {?><!DOCTYPE html>
    <html>
    <head>
        <title>Greske!</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link href="../css/bootstrap.css" rel="stylesheet">

    <!-- Custom Google Web Font -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" rel="stylesheet" type="text/css">
        
    </head>
    <body>
        
            
        
        <div class="container">

            <div class="row">
                <div class="col-lg-5 col-sm-6">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">Greska
                    <p class="lead">
                        <?php echo $_smarty_tpl->tpl_vars['naslov']->value;?>

                        </p>
                </div>
                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                    <img class="img-responsive" src="../img/error.jpg" alt="">
                </div>
            </div>

        </div>
    </body>
</html><?php }} ?>
