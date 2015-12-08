/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
    
    

    
    $("body").on("click","#klik_config",function(evt){
        $('#promjene').empty();

        $('#promjene').append("<div id='div_spremanje' class='col-md-10'></div>");
        
        var dodaj = 
                    "<div class='col-md-1'></div><div class='col-md-6'>"+
                    "<br><br><br><h3><strong>Konfiguracija sustava</strong></h3><br>  "+
                    "<br><h4>Konfiguracija vremena</h4><br>"+
                    "<button type='button' class='btn btn-info' id='taketime'> Preuzmi vrijeme </button>"+
                    "<span id='return_msg' class='control-label'></span><br><br>"+
                    //"Unesite pomak:    <input type='text' class='form-control' placeholder='Broj sati...' name='input_pomaka' length='10'></input><br><br>"+
                    "<button type='button' class='btn btn-info' id='settime'> Postavi vrijeme </button><br><br>"+
                    "<h4><strong>Konfiguracija broja stranica</strong></h4><br>"+
                    "Unesite broj prikaza po stranici:    <input type='number' class='form-control' placeholder='Broj stranica...' name='input_stranica' length='10'></input><br>"+
                    "<button type='button' class='btn btn-info' id='setpagee'> Postavi stranice </button><br>"+
                    "<span id='return_msg_2' class='control-label'></span><br>"+
                    "<h4><strong>Konfiguracija za broj neuspjelih prijava</strong></h4><br>"+
                    "Unesite broj neuspjelih prijava:    <input type='number' class='form-control' placeholder='Broj stranica...' name='input_broj_prijava' length='10'></input><br>"+
                    "<button type='button' class='btn btn-info' id='setloginn'> Postavi prijave </button><br>"+
                    "<span id='return_msg_3' class='control-label'></span><br>"+
                    "<h4><strong>Konfiguracija dizajna</strong></h4><br>"+
                    "Boja izbornika:    <input type='text' class='form-control' placeholder='Boja izbornika (green)...' name='input_izgled' length='10'></input><br>"+
                    "<button type='button' class='btn btn-info' id='setdizajn'> Postavi dizajn </button><br>"+
                    "<span id='return_msg_4' class='control-label'></span><br>"+
                    "<h4><strong>Konfiguracija izgleda grafikona</strong></h4><br>"+
                    "Vrsta grafikona:    <input type='text' class='form-control' placeholder='Tip grafa (pie)...' name='input_graff' length='10'></input><br>"+
                    "<button type='button' class='btn btn-info' id='setgraff'> Postavi graf </button><br>"+
                    "<span id='return_msg_5' class='control-label'></span><br>"+
                            "</div>";

        $('#div_spremanje').append(dodaj);
        
    });//generiranje za konfiguraciju
    
    $("body").on("click","#taketime",function(evt){
        var str="TT";
         $.ajax({
                type:"POST",
                url:"../php/config.php",
                dataType:"json",
                data : 
                    {
                     'name' : 1,
                     'str':str
                     },
                success:function(json){
                            var d = new Date();
                            d.setHours(d.getHours()+json);
                            $('#return_msg').text("Vrijeme nakon preuzimanja: "+d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds()+" h.");
                            
                }//uspjeh
            }); //ajax
        
        
    });//preuzimanje vrimena
    
    
    $("body").on("click","#setpagee",function(evt){
        
        var str = $('[name="input_stranica"]').val();
        
         $.ajax({
                type:"POST",
                url:"../php/config.php",
                dataType:"json",
                data : 
                    {
                     'name' : 2,
                     'str' : str
                     },
                success:function(json){

                            $('#return_msg_2').text("Stranice postavljene na: "+json+" Napomena: za efekt trebate ponovno ucitati stranicu!");
                            
                }//uspjeh
            }); //ajax
        
        
    });//postavljanje stranica
    
    $("body").on("click","#setloginn",function(evt){
        
        var str = $('[name="input_broj_prijava"]').val();
        
         $.ajax({
                type:"POST",
                url:"../php/config.php",
                dataType:"json",
                data : 
                    {
                     'name' : 3,
                     'str' : str
                     },
                success:function(json){

                            $('#return_msg_3').text("Broj neuspjelih prijava postavljen na: "+json);
                            
                }//uspjeh
            }); //ajax
        
        
    });//postavljanje stranica
    
    $("body").on("click","#setdizajn",function(evt){
        
        var str = $('[name="input_izgled"]').val();
        
         $.ajax({
                type:"POST",
                url:"../php/config.php",
                dataType:"json",
                data : 
                    {
                     'name' : 4,
                     'str' : str
                     },
                success:function(json){

                            alert("Boja izbornika postavljena!Stranica ce se ponovno ucitati na user.php");
                            document.location.reload(true);
                            
                }//uspjeh
            }); //ajax
        
        
    });//postavljanje stranica
    
    $("body").on("click","#settime",function(evt){
        
        window.location.replace("http://arka.foi.hr/PzaWeb/PzaWeb2004/config/vrijeme.html");
        
        
    });//postavljanje vrimena
    
     $("body").on("click","#setgraff",function(evt){
        
        var str = $('[name="input_graff"]').val();
        
         $.ajax({
                type:"POST",
                url:"../php/config.php",
                dataType:"json",
                data : 
                    {
                     'name' : 5,
                     'str' : str
                     },
                success:function(json){

                            $('#return_msg_5').text("Tip grafa postavljen na: "+str+" molimo učitajte stranicu.");
                            
                }//uspjeh
            }); //ajax
        
        
    });//postavljanje grafa
    
    
   
    
    
});
