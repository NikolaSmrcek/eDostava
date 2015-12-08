function provjeriEmail(sEmail) {
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (filter.test(sEmail)) {
        
        return true;
    }
    else {
        
        return false;
    }
} //funkcija kojom provjeravamo valjanost email formata

function provjeriText(sText) {
    
    var filter = /[^A-zšđčćžŠĐČĆŽ]/;
    var filter_2 = /[^A-zšđčćžŠĐČĆŽ]{1}/;
    
    if(sText.length<3){
        return 3;
    } 
    
    
    if (filter.test(sText)){

        return 1;
    } 
    
    
    
    if(filter_2.test(sText[0])){

        return 2;
    } 
    
    
    
    return false;  
} //funkcija kojom provjeravamo valjanost imena i prezimena


$(document).ready(function() {
    
    $('input[type="submit"]').attr('disabled','disabled');
    
    var ime_us= false;
    var prez_us= false;
    var kor_us= false;
    var email_us= false;
    var pw_us= false;
    var pww_us= false;
    $('#login_form').removeAttr('disabled');
    

    
    $('[name="register_ime"]').focusout(function(evt){
       
         var sText = $('[name="register_ime"]').val();
        
        $('#span_ime').text('Ime');
        $('#div_ime').removeClass('has-error');
        
        if(!sText){
            $('#div_ime').addClass('has-error');
            $('#span_ime').text('Ime - nie uneseno');
            prolazi = false;
        }
        
        if(odg = provjeriText(sText)){
            $('#div_ime').addClass('has-error');
            switch(odg){
                case 1:$('#span_ime').text('Ime - treba početi s slovom');
                        break;
                case 2:$('#span_ime').text('Ime - treba započeti s velikim slovom');
                        break;
                case 3:$('#span_ime').text('Ime - minimalna duljina je 3');
                        break;
                default:{$('#span_ime').text('Ime');
                         $('#div_ime').removeClass('has-error');
                         
                    }
            }
            
            
        }
        
        else{
            ime_us = true;
        }
         
     }); //provjera za ime
     
     
     $('[name="register_prezime"]').focusout(function(evt){
         
         var sText = $('[name="register_prezime"]').val();
        
        $('#span_prezime').text('Prezime');
        $('#div_prezime').removeClass('has-error');
        
        if(!sText){
             $('#div_prezime').addClass('has-error');
             $('#span_prezime').text('Prezime - nije uneseno');
        }
        
        
        if(odg = provjeriText(sText)){
            $('#div_prezime').addClass('has-error');
            switch(odg){
                case 1:$('#span_prezime').text('Prezime - treba započeti s slovom');
                        break;
                case 2:$('#span_prezime').text('Prezime - treba započeti s velikim slovom');
                        break;
                case 3:$('#span_prezime').text('Prezime - minimalna duljina je 3');
                        break;
                
                default:{$('#span_prezime').text('Prezime');
                         $('#div_prezime').removeClass('has-error');}
            }
            
            
        }
        else{
            prez_us = true;
        }
         
     }); //provjera za prezime

     $('[name="register_kor_ime"]').focusout(function(evt){
        
        var kor_ime = $('[name="register_kor_ime"]').val();
        if(!kor_ime){
            $('#div_kor').addClass('has-error');
            $('#span_kor_ime').text('Niste unijeli korisničko ime!');
        }
        
        var odg =  provjeriText(kor_ime);
            
        if(odg === 3){
            $('#div_kor').addClass('has-error');
            $('#span_kor_ime').text('Korisnicko ime treba imati barem 6 znakova!');
        }
        
        else{
            $('#div_kor').removeClass('has-error');
            $('#span_kor_ime').text('Korisničko ime');
            var select = true;
            var broj = 'kor_ime';
           
            
            $.ajax({
                type:"POST",
                url:"provjera_kor_ime.php",
                dataType:"json",
                data : 
                    {
                     'select' : select, // the variable you're posting.
                     'broj' : broj
                     },
                success:function(json){
                    for (var i =0;i<json.length;i++){
                        if(kor_ime === json[i].kor_ime){
                            $('#div_kor').addClass('has-error');
                            $('#span_kor_ime').text('Postoji korisnik s odabranim korisničkim imenom!');
                            kor_us=false;
                            return true;    
                        } //usporedba jesu ista korisnicka imena
                        else{
                            kor_us=true;
                        }
                    }//kraj prolaska kroz ptelju pokusavajuci naci isti username
                } //uspjesno dohvacanje podataka
                
                
                
            }); //kraj dohvata ajax
            
            
        } //u slucaju da postoji vrijednost zadana u polju korisnicko ime
        
        
        
     } ) ; // kraj provjere korisnickog imena preko AJAX-a
     
     $('[name="register_email"]').focusout(function(evt){
         
         $('#div_email').removeClass('has-error');
         $('#span_email').text('Email');
        var email = $('[name="register_email"]').val();
         
         if(!email){
           $('#div_email').addClass('has-error');
           $('#span_email').text('Email - nije unesen');
        }
         
         
         if (provjeriEmail(email)){
            
            var select = true;
            var broj = "email";
            
             $.ajax({
             type:"POST",
                url:"provjera_kor_ime.php",
                dataType:"json",
                data : 
                    {
                     'select' : select, // the variable you're posting.
                     'broj' : broj
                     },
                success:function(json){
                    for (var i =0;i<json.length;i++){
                        if(email === json[i].email){
                            $('#div_email').addClass('has-error');
                            $('#span_email').text('Postoji korisnik s odabranim emailom!');
                            email_us=false;
                            return true;    
                        } //usporedba jesu ista korisnicka imena
                        
                        else{
                            email_us = true;
                        }
                        
                    }//kraj prolaska kroz ptelju pokusavajuci naci isti username
                } //kraj uspjesnog povrata
            });//kraj ajaxa
         }//ako je email dobrog formata provjeravamo dali ima u bazi
         
         else{
              $('#div_email').addClass('has-error');
              $('#span_email').text('Email - neispravan format');
         }
     }); //kraj provjere za email
     
     $('[name="register_password"]').focusout(function(evt){
        
         $('#div_loz').removeClass('has-error');
         $('#span_lozinka').text('Lozinka');
        var lozinka = $('[name="register_password"]').val();
        
        if(!lozinka){
            $('#div_loz').removeClass('has-success');
            $('#div_loz').addClass('has-error');
            $('#span_lozinka').text('Lozinka - nije unesena');
        }
        
        else{
            var odg =  provjeriText(lozinka);
            
            if(odg === 3){
            $('#div_loz').removeClass('has-success');
            $('#div_loz').addClass('has-error');
            $('#span_lozinka').text('Lozinka - treba biti min. duljine 6');
            }
            
            else{
            $('#div_ponloz').removeClass('has-error');
            $('#div_loz').addClass('has-success');
            $('#span_lozinka').text('Lozinka');
            pw_us = true;
            }
        }
        
     }); //lozinka
     
     $('[name="re_register_password"]').focusout(function(evt){
         
         $('#div_ponloz').removeClass('has-error');
         $('#span_ponloz').text('Ponovite lozinku');
        var lozinka = $('[name="re_register_password"]').val();
        
        if(!lozinka){
            $('#div_ponloz').removeClass('has-success');
            $('#div_ponloz').addClass('has-error');
            $('#span_ponloz').text('Ponovite lozinku - nema unosa');
        }
        
        else{
            var odg =  provjeriText(lozinka);
            
            if(odg === 3){
            $('#div_ponloz').removeClass('has-success');
            $('#div_ponloz').addClass('has-error');
            $('#span_ponloz').text('Ponovite lozinku - min duljina 6');
            }
            
            else{
            var org_loz = $('[name="register_password"]').val();
                if(!(org_loz === lozinka)){
                    $('#div_ponloz').removeClass('has-success');
                    $('#div_ponloz').addClass('has-error');
                    $('#span_ponloz').text('Ponovite lozinku - lozinke nisu identične');   
                }
                
                else{
                    $('#div_ponloz').removeClass('has-error');
                    $('#span_ponloz').text('Lozinke su identične');
                    $('#div_ponloz').addClass('has-success');
                    pww_us=true;
                }
            }
        }
        
        
        
        
        
     }); //lozinka
     
     $('#lost_pw').one("click",function(){
         var trazi = $('[name="login_email"]').val();
         $.ajax({
             type:"POST",
                url:"lostpw.php",
                dataType:"json",
                data : 
                    {
                     'trazi' : trazi
                     },
                success:function(json){
                    $('#lost_pw').text("Provjerite email!");
                    $('#lost_pw').css('color', 'blue');
                } 
            });//kraj ajaxa
         
     }); //zaboravljena lozinka
     
     $('#login_form').click(function(evt){
         
         var login_user = $('[name="login_email"]').val();
         var login_pw = $('[name="login_password"]').val();
         $.ajax({
             type:"POST",
                url:"prijava.php",
                dataType:"json",
                data : 
                    {
                     'login_user': login_user,
                     'login_pw': login_pw
                     },
                success:function(json){
                    $('#prijava_ret').text("");
                    window.location.replace("user.php");
                     // dodat link za user-a
                },
                error:function(json){
                    $('#prijava_ret').text("Neuspjela prijava!");
                    $('#prijava_ret').css('color', 'red');
                }
            });//kraj ajaxa
         
     }); //prijava
     
     var $fields = $("form#signup_details :input");
     
        $fields.keyup(function() {
            var $emptyFields = $fields.filter(function() {

                // remove the $.trim if whitespace is counted as filled
                return $.trim(this.value) === "";
            });

            if ((!$emptyFields.length) && ime_us && prez_us && kor_us && email_us && pw_us && pww_us) {
                $('#submit_form').removeAttr('disabled');
            } else {
                $('#submit_form').attr('disabled','disabled');
            }
    }); // provjera jel isve uneseno i dali su unosi ispravni
     
     
     $('#datepicker55').datetimepicker({
                            language: 'hr'
                          });
    
} ) ; //kraj dokumenta



