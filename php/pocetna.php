<?php
ob_start();
include_once 'baza.class.php';
include_once 'greske.php';



$baza = new baza();
$baza->spojiDB();


if(isset($_POST['buton_klik'])){
    
    $prolazi = true;
    foreach ($_POST as $kljuc=>$vrijednost){
        if(empty($vrijednost) ){
            trigger_error("Niste unijeli sve podatke! Napomena registracija mora biti u potpunosti popunjena!",E_USER_ERROR);
            $prolazi = false;
        }
    }    
    $ime = $_POST['register_ime'];
    $prez = $_POST['register_prezime'];
    $adresa = $_POST['register_adresa'];
    $grad = $_POST['register_grad']; 
    $email = $_POST['register_email'];
    $kor_ime = $_POST['register_kor_ime'];
    $lozinka = $_POST['register_password'];
    $pon_lozinka = $_POST['re_register_password'];
    $broj = $_POST['register_broj'];
    $date = $_POST['register_datum_rod'];
    $spol = $_POST['register_spol'];
    $posta = $_POST['register_obavijesti'];
        
    if(!(ucfirst($ime) === $ime)){
        trigger_error("Ime mora započetni velikim slovom!",E_USER_ERROR);
        $prolazi = false;
    } //provjera dali ime zapocinje velikim slovom i dali se sastoji samo od slova
    
    if(preg_match('/[^A-zšđčćžŠĐČĆŽ]/', $ime)) 
    {
        trigger_error("Mora započeti slovom!",E_USER_ERROR);
        $prolazi = false;
    } //provjera dali se ime sastoji samo od slova

    
    if(!(ucfirst($prez) === $prez)){
        trigger_error("Prezime mora započetni velikim slovom!",E_USER_ERROR);
        $prolazi = false;
    } //provjera dali prezime zapocinje velikim slovom i dali se sastoji samo od slova
    
    if(preg_match('/[^A-zšđčćžŠĐČĆŽ]/', $prez)) 
    {
        trigger_error("Mora započeti slovom!",E_USER_ERROR);
        $prolazi = false;
    } //provjera dali se prezime sastoji samo od slova
    
    
    if(!(filter_var( $email, FILTER_VALIDATE_EMAIL ))){ //vraca false ako je neispravan, ako je ispravan vraca isti usproedni string
        trigger_error("Unijeti email nije pravilno formatiran npr. nesto@nesto.hr!",E_USER_ERROR);
        $prolazi = false;
    } //provjera ispravnost formata emaila
    
    if(!(($lozinka)===($pon_lozinka))){
        trigger_error("Lozinke nisu identicne!",E_USER_ERROR);
        $prolazi = false;
    }

    //recaptcha
    
     require_once('recaptchalib.php');
        $privatekey = "6Ld-8fISAAAAAB1TZVxuW-AIIBx58cweUTZIv2rM";
        $resp = recaptcha_check_answer ($privatekey,
                                      $_SERVER["REMOTE_ADDR"],
                                      $_POST["recaptcha_challenge_field"],
                                      $_POST["recaptcha_response_field"]);

        if (!$resp->is_valid) {
          // What happens when the CAPTCHA was entered incorrectly
          die ("The reCAPTCHA wasn't entered correctly. Go back and try it again." .
               "(reCAPTCHA said: " . $resp->error . ")");
        } else {
          // Your code here to handle a successful verification
        } 
      
        if($prolazi){

         $actkod = md5(uniqid(rand(), true));
         
         $vrime = vratiVrime();
         
         
         $upit = "insert into Korisnik(email,ime,prezime,adresa,grad,kor_ime,lozinka,broj,datum_rod,spol,obavijesti,status,aktivacija,datum_reg,broj_neusp)".
                 "values('{$email}','{$ime}','{$prez}','{$adresa}','{$grad}','{$kor_ime}','{$lozinka}','{$broj}','{$date}','{$spol}','{$posta}','0','{$actkod}','{$vrime}','0')";         
        if($baza->ostaliUpiti($upit)){
            Baza_Radnje("Registracija korisnika",$email, 2);
            $mailPoruka = "Postovani,  molimo vas da aktivirate vas korisnicki racun klikom na sljedeci link: \n \n     http://arka.foi.hr/WebDiP/2013_projekti/WebDiP2013_079/php/aktivacija.php?kor_mail=$email&act=$actkod  \n \n koji istice za 24 sata. \n \n Vase korisnicko ime je: $kor_ime \n \n Vasa lozinka je: $lozinka \n \n Hvala na registraciji! ";
            mail($email, "Aktivacijski mail", $mailPoruka);
         }
         
         else{
            trigger_error("Neuspjeli zapis u bazu podataka prilikom registracije!",E_USER_ERROR);
        }
        
         
     }//ako je ispravno uneseno - prolazi je true
        
    
    } //kraj ako je sve postavljeno
    


echo '
<!DOCTYPE html>

<html lang="hr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>E-dostava</title>
    
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet">

    <!-- Custom Google Web Font -->
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" rel="stylesheet" type="text/css">

    <!-- Add custom CSS here -->
    <link href="../css/custom.css" rel="stylesheet">
    <link href="http://datatables.net/download/build/nightly/jquery.dataTables.css" rel="stylesheet" type="text/css" />  
    <!-- CSS recaptche -->
    <link rel="stylesheet" href="../css/responsive_recaptcha.css">
    
    <!-- JavaScript -->
    
    <script src="../js/jquery-1.10.2.js"></script>
    <script src="../js/POCETNA.js"></script>  <!--  skripta za tablicu neregistriranog -->
    <script src="../js/bootstrap.js"></script>
    <script src="../js/custom.js"></script>
    <script src="http://datatables.net/download/build/nightly/jquery.dataTables.js"></script>
    <script src="../js/moment.js"></script>
    <script src="../js/bootstrap-dtp.js"></script>
    <script src="../js/bootstrap-dtp-hr.js"></script>

    <script src="../js/validacija_klient.js"></script>  <!--  skripta validacije klienta -->
   
    
</head>

<body>
           <script type="text/javascript">
            var RecaptchaOptions = {
               theme : "custom",
               custom_theme_widget: "responsive_recaptcha"
            };
            </script>  <!-- skripta za  responsive -->
    
    
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">E-dostava</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#" class="scroll-link" data-id="home">Početna</a></li>
      <li><a href="Dokumentacija.php" >Dokumentacija</a></li>
      <li><a href="../privatno/htkorisnici.php">Hkorisnici</a></li>
      <li><a style="cursor:pointer;" id="loginpopup">Prijava / Registracija</a></li>
      ';
            if(session_start()){
                if($_SESSION){
              echo '<li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><strong>Dobrodošli</strong> <b class="caret"></b></a>
        <ul class="dropdown-menu">';
              echo  '<li><a href="user.php">Moj račun</a></li>';
              echo '<li class="divider"></li>
                    <li><a href="odjava.php">Odjava</a></li>
                  </ul>
                </li>';
                }
                else{
            echo '<li><a href="#">Dobrodošli</a></li>';
            }
            }
            
            
         echo '
    </ul>
    <!-- 
    <form class="navbar-form navbar-right" role="search">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
    -->
  </div><!-- /.navbar-collapse -->
  </nav>
  <!-- Code for Login / Signup Popup -->
  <!-- Modal Log in -->
	<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
	  <div class="modal-dialog" style="margin-top: 150px;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel1">Prijava</h4>
	      </div>
             
              <form role="form" class="modal-body" id="login_details"
                          name="login_details"
                          action="" 
                          method="POST"
                          enctype="multipart/form-data"
                          novalidate>
			<div class="form-group">
				<div class="form-group" id="div_login_user">
					<span> Već imate korisnički račun? </span> </br></br>
					*<span style="font-weight:bold;">Email ili korisnicko ime</span><br />
					<input type="text" placeholder="primjer@gmail.com OR username" name="login_email"  /> <br /></br>
				</div>
				<div class="form-group" id="div_password">
					*<span style="font-weight:bold;" >Lozinka</span><br />
					<input type="password" placeholder="Lozinka" name="login_password" /><br />
				</div>
                        </div>

                    <div class="modal-footer" >
		<input style="float: left" type="button" class="btn btn-success"  value="Prijava!" name="buton_klik_login" id="login_form" /> 
                <span class="fp-link" id="lost_pw"> <a href="#">Zaboravljena lozinka?</a></span><br>
                <span id="prijava_ret"></span>
	       </br>
			<span> Niste član?</span>
			<span id="signup-link" style="cursor:pointer;" class="text-info">Registracija!</span>
		 </div>
                    
		</form>
              
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
 <!--Modal Login Ends -->
 <!-- Modal Sign-up Starts -->
	<div class="modal fade" id="signup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
	  <div class="modal-dialog" style="margin-top: 100px;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel2">Registracija</h4>
	      </div>
		    <form role="form" class="modal-body" id="signup_details"
                          name="signup_details"
                          action="" 
                          method="POST"
                          enctype="multipart/form-data"
                          novalidate>
			<div class="form-group">
				<div class="form-group" id="div_ime">
					*<span class="control-label" id="span_ime">Ime</span>
					<input type="text" class="form-control" placeholder="Ime" name="register_ime" maxlength="25"/> 
				</div>
				<div class="form-group" id="div_prezime">
					*<span class="control-label" id="span_prezime" >Prezime</span>
					<input type="text" class="form-control" placeholder="Prezime" name="register_prezime" maxlength="35"/> 
				</div>
				<div class="form-group" id="div_adresa">
					*<span >Adresa</span>
					<input type="text" placeholder="Adresa" name="register_adresa" maxlength="45" /> 
				</div>
				<div class="form-group" id="div_grad">
					*<span >Grad</span>
					<input type="text" placeholder="Grad" name="register_grad" maxlength="20"/> 
				</div>
				<div class="form-group" id="div_broj">
					*<span >Broj</span>
					<input type="text" placeholder="Format XXX XXXXXXX"  name="register_broj" maxlength="12"/> 
				</div>
				
				
				
                                
                                <div class="form-group"  id="div_datumrod">
           <span class="control-label">Datum rođenja</span>
           <div id="datepicker55" data-date-format="YYYY-MM-DD" class="input-group date">
           <input class="date-picker form-control" type="date"  name="register_datum_rod"></input>
           <span class="input-group-addon btn">
           <span class="glyphicon glyphicon-calendar"></span></span>
           </div></div>


				*<span>Spol</span>
				<div class="radio">
					<label>
						<input type="radio" name="register_spol" 
								value="Muski" checked>
								Muški
						</label>
				</div>
				
				<div class="radio">
					<label>
						<input type="radio" name="register_spol" 
								value="Zenski">
								Ženski
						</label>
				</div>
				
				*<span>Obavijesti</span>
				<div class="radio">
					<label>
						<input type="radio" name="register_obavijesti" 
								value="1" checked>
								Da
						</label>
				</div>
				
				<div class="radio">
					<label>
						<input type="radio" name="register_obavijesti" 
								value="2">
								Ne
						</label>
				</div>
				
				<div class="form-group" id="div_kor">
					*<span class="control-label" id="span_kor_ime">Korisničko ime</span>
					<input type="text" placeholder="Korisničko ime" name="register_kor_ime" class="form-control" maxlength="20" /> 
                                        
				</div>
				<div class="form-group" id="div_email">
					*<span class="control-label" id="span_email">Email</span>
					<input type="text" class="form-control" placeholder="primjer@gmail.com" name="register_email" />
				</div>
				<div class="form-group" id="div_loz">
					*<span class="control-label" id="span_lozinka">Lozinka</span>
					<input type="password" placeholder="Lozinka" name="register_password" maxlength="20"/>
				</div>
				<div class="form-group" id="div_ponloz">
					*<span class="control-label" id="span_ponloz">Ponovite lozinku</span>
					<input type="password" placeholder="Ponovna lozinka" name="re_register_password" maxlength="20"/>
				</div>
                        </div>
                    
                        
                        
	      
		 
                        <?php
                    require_once("recaptchalib.php");
                    $publickey = "6Ld-8fISAAAAAAUbvdYwgHhkJS5COyP2otxZ1o5G"; // you got this from the signup page (dobije se nakon singupa)
                    echo recaptcha_get_html($publickey);
                  ?>
                        
                                        <div id="responsive_recaptcha" style="display:none">  <!-- pocetak recaptcha -->

                       <div id="recaptcha_image"></div>
                       <div class="recaptcha_only_if_incorrect_sol" style="color:red">Incorrect please try again</div>

                      <label class="solution">
                        <span class="recaptcha_only_if_image">Type the two words:</span>
                        <span class="recaptcha_only_if_audio">Enter the numbers you hear:</span>

                        <input type="text" id="recaptcha_response_field" name="recaptcha_response_field" />
                      </label>
                      <div class="options">
                        <a href="javascript:Recaptcha.reload()" id="icon-reload">Get another CAPTCHA</a>
                        <a class="recaptcha_only_if_image" href="javascript:Recaptcha.switch_type("audio")" id="icon-audio">Get an audio CAPTCHA</a>
                        <a class="recaptcha_only_if_audio" href="javascript:Recaptcha.switch_type("image")" id="icon-image">Get an image CAPTCHA</a>
                        <a href="javascript:Recaptcha.showhelp()" id="icon-help">Help</a>
                      </div>
                    </div>

                 <script type="text/javascript"
                    src="http://www.google.com/recaptcha/api/challenge?k=6Ld-8fISAAAAAAUbvdYwgHhkJS5COyP2otxZ1o5G">
                 </script>

                 <noscript>
                   <iframe src="http://www.google.com/recaptcha/api/noscript?k=6Ld-8fISAAAAAAUbvdYwgHhkJS5COyP2otxZ1o5G"
                        height="300" width="500" frameborder="0"></iframe><br>
                   <textarea name="recaptcha_challenge_field" rows="3" cols="40">
                   </textarea>
                   <input type="hidden" name="recaptcha_response_field"
                        value="manual_challenge">
                    </noscript>  <!-- kraj recaptcha -->
                        
                    <div class="modal-footer" >
		<input style="float: left" type="submit" class="btn btn-success"  value="Registriraj me!" name="buton_klik" id="submit_form" /> 
	       <span>&nbsp;&nbsp;&nbsp; Već ste član? </span><span id="login-link" class="text-info" style="cursor:pointer;">  Prijavite se  </span> 
		 </div>
                    
		</form>
                  
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
  <!-- Modal Sign up ends! -->
  <!-- End code for Login / Signup Popup -->

    <div class="intro-header" id="home">
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					  <!-- Indicators -->
					  <ol class="carousel-indicators">
					    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
					  </ol>
					
					  <!-- Wrapper for slides -->
					  <div class="carousel-inner">
					    <div class="item active">
					      <img src="../img/img1.jpg" alt="First Image">
					      <div class="carousel-caption">
					        First Image
					      </div>
					    </div>
					    <div class="item">
					      <img src="../img/img2.jpg" alt="Second Image">
					      <div class="carousel-caption">
					        Second Image
					      </div>
					    </div>
					    <div class="item">
					      <img src="../img/img3.jpg" alt="Third Image">
					      <div class="carousel-caption">
					        Third Image
					      </div>
					    </div>
					  </div>
					
					  <!-- Controls -->
					  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
					    <span class="glyphicon glyphicon-chevron-left"></span>
					  </a>
					  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right"></span>
					  </a>
					</div>
        
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->

    <div class="content-section-a" id="about">

        <div class="container">

            <div class="row">
                <span class="text-center">Popis kurirskih sluzbi s rutama na koje šalju pakete</span>
                <div class="col-lg-5 col-sm-6" id="promjene">
                </div>
                <div class="col-lg-5 col-lg-offset-2 col-sm-6" id="upis_pocetna">
                    
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-a -->

    <!-- /.content-section-a -->

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li><a href="#home">Početna stranica</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li><a href="Dokumentacija.php">Dokumentacija</a>
                        </li>';
                        
                if($_SESSION){
              echo '<li class="footer-menu-divider">&sdot;</li>
                        <li><a href="user.php">Moj račun</a>';
      
                            }
                        
                        
                      echo'  </li>
                       
                    </ul>
                    <p class="copyright text-muted small">Autorska prava &copy; Nikola Smrček Sva prava pridržana</p>
                </div>
            </div>
        </div>
    </footer>

</body>

</html>

';