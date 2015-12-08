<?php /* Smarty version Smarty-3.1.18, created on 2014-06-24 04:53:44
         compiled from "../Smarty/templates/user.tpl" */ ?>
<?php /*%%SmartyHeaderCode:79137615953a8817785cd42-95391257%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fa9acd02a86d0ab6736d117108200a886c454f63' => 
    array (
      0 => '../Smarty/templates/user.tpl',
      1 => 1403578422,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '79137615953a8817785cd42-95391257',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_53a88177910b96_80840224',
  'variables' => 
  array (
    'ime' => 0,
    'prezime' => 0,
    'var' => 0,
    'kor' => 0,
    'DODAJ' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53a88177910b96_80840224')) {function content_53a88177910b96_80840224($_smarty_tpl) {?><!DOCTYPE html>
<html lang='hr'>

<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta name='description' content=''>
    <meta name='author' content='Nikola Smrček'>

    <title>E-dostava</title>
    
    <!-- Bootstrap core CSS -->
    <link href='../css/bootstrap.css' rel='stylesheet'>

    <!-- Custom Google Web Font -->
    <link href='../font-awesome/css/font-awesome.min.css' rel='stylesheet'>
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>

    <!-- Add custom CSS here -->
    <link href='../css/custom.css' rel='stylesheet'>
    
    <!-- CSS recaptche -->
    <link rel='stylesheet' href='../css/responsive_recaptcha.css'>
    <link href='http://datatables.net/download/build/nightly/jquery.dataTables.css' rel='stylesheet' type='text/css' />  
    <link href='../css/dataTables.tableTools.min.css' rel='stylesheet' type='text/css' />

    <!-- JavaScript -->
    <script src='../js/jquery-1.10.2.js'></script>
    <script src='../js/bootstrap.js'></script>
    <script src='../js/custom.js'></script>
    <script src='http://datatables.net/download/build/nightly/jquery.dataTables.js'></script>
    <script src='../js/moment.js'></script>
    <script src='../js/bootstrap-dtp.js'></script>
    <script src='../js/bootstrap-dtp-hr.js'></script>
    <script src='../js/dataTables.tableTools.js'></script>

     <script src='../js/formattablica.js'></script> 
     <script src='../js/dinamikuser.js'></script> 
     <script src='../js/highcharts.js'></script>
     <script src='../js/exporting.js'></script>
    
</head>

<body>

	<nav class='navbar navbar-default navbar-fixed-top' role='navigation'>
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class='navbar-header'>
    <button type='button' class='navbar-toggle' data-toggle='collapse' data-target='#bs-example-navbar-collapse-1'>
      <span class='sr-only'>Toggle navigation</span>
      <span class='icon-bar'></span>
      <span class='icon-bar'></span>
      <span class='icon-bar'></span>
    </button>
    <span class='navbar-brand' >Dobrodošli <?php echo $_smarty_tpl->tpl_vars['ime']->value;?>
  &nbsp  <?php echo $_smarty_tpl->tpl_vars['prezime']->value;?>
 </span>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class='collapse navbar-collapse' id='bs-example-navbar-collapse-1'>
    <ul class='nav navbar-nav navbar-right'>
      
      <li><a href='../privatno/htkorisnici.php'>Hkorisnici</a></li>
      <li><a href='Dokumentacija.php' >Dokumentacija</a></li>
      <?php echo $_smarty_tpl->tpl_vars['var']->value;?>

      <li class='dropdown'>
        <a href='#' class='dropdown-toggle' data-toggle='dropdown'><strong> <?php if (isset($_smarty_tpl->tpl_vars['kor']->value)) {?> <?php echo $_smarty_tpl->tpl_vars['kor']->value;?>
 <?php } else { ?> Odabir <?php }?> </strong> <b class='caret'></b></a>
        <ul class='dropdown-menu'>
          <li><a href='../php/pocetna.php'>Početna</a></li>
          <?php if (isset($_smarty_tpl->tpl_vars['kor']->value)) {?>
          <li id='stanje_paketa' data-table='STANJEP' data-name='ID'><a href='#'>Stanje paketa</a></li>
          <li class='divider'></li>
          <li><a href='odjava.php'>Odjava</a></li>
          <?php }?>
         
        </ul>
      </li>
    </ul>
    <!-- 
    <form class='navbar-form navbar-right' role='search'>
      <div class='form-group'>
        <input type='text' class='form-control' placeholder='Search'>
      </div>
      <button type='submit' class='btn btn-default'>Submit</button>
    </form>
    -->
  </div><!-- /.navbar-collapse -->
  </nav>

  
  <div class='content-section-a' id='about'>

        <div class='container'>

            <div class='row'>
                
                   
                    
                    <p class='lead' id='promjene'> 
                            <?php echo $_smarty_tpl->tpl_vars['DODAJ']->value;?>

                        </p>

        </div>
        <!-- /.container -->

    </div>
            
<footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li><a href="../php/pocetna.php">Početna stranica</a>
                        </li>
                        
                    </ul>
                    <p class="copyright text-muted small">Autorska prava &copy; Nikola Smrček. Sva prava pridržana</p>
                </div>
            </div>
        </div>
    </footer>

       

</body>

</html><?php }} ?>
