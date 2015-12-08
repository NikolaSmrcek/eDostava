

$(document).ready(function() {
    
    var orderst = false;
    var bozo=3;
    var tipG="";
    var order = "DESC";
    
   

                    $.ajax({
                    async:false,
                   
                   url:"../config/config.json",
                   dataType:"json",
                   success:function(json){                          
                               bozo = parseInt(json['str']);
                               tipG = json['graf'];
                               
                               }//uspjeh
               }); //ajax
        
   $('#htkorisnici').dataTable
                        ( {
                            "iDisplayLength": bozo,
                            "bLengthChange": false,
                            "ordering": false
                         } ); //datatable
   

         
    $("body").on("click","th, #klik_mailslanje, #cijene_where, #stanje_paketa",function(evt){
       var name =($(this).attr('data-name'))?($(this).attr('data-name')): "NADOPUNI";
       var pomoc = ($(this).attr('data-pomoc'))?($(this).attr('data-pomoc')): "NADOPUNI";
       var table = ($(this).attr('data-table'))?($(this).attr('data-table')): "NADOPUNI";
       if(table == "GENMAIL" || table=='STANJEP'){
            
            $('#promjene').empty();
       }
       
       if(table == "STATKUR" || table == "STATRUT" || table=="statmod1" || table=="statmod2" || table=="statmod3"){
                       //$('#promjene').empty();
                       return;
                   }
       
       if(orderst){
           order = "ASC";
       }
       else{
           order = "DESC";
       }
       if(table == "GENCIJENE"){
           name = ($('#trazena_ruta').val()) ? ($('#trazena_ruta').val()) : null;
           
       }
       
      
       if(table === 'hKorisnik'){
           $.ajax({
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {
                     'name' : name, 
                     'table' : table,
                     'order' : order
                     },
                success:function(json){
                    $('#htkorisnici').dataTable().fnDestroy();
                    $('#htkorisnici').remove();
                    
                    var tablica ="<table id='htkorisnici' class='table table-hover'><thead><tr><th data-name='kor_ime' data-table='hKorisnik'>Kor_ime</th><th data-name='prezime' data-table='hKorisnik'>Prezime</th><th data-name='ime' data-table='hKorisnik'>Ime</th><th data-name='email' data-table='hKorisnik'>E-mail</th><th data-name='lozinka' data-table='hKorisnik'>Lozinka</th></thead><tbody>";

                    for (var i =0;i<json.length;i++){
                            tablica+= "<tr>";
                        
                            tablica += "<td>" + json[i].kor_ime + "</td>";
                            tablica += "<td>" + json[i].prezime + "</td>";
                            tablica += "<td>" + json[i].ime + "</td>";
                            tablica += "<td>" + json[i].email + "</td>";
                            tablica += "<td>" + json[i].lozinka + "</td>";
                            
                            tablica += "</tr>";
                    } //for petlja
                    tablica += "</tbody></table>";
                    if(orderst === false){
                        orderst = true;
                    }
                    else{
                        orderst =false;
                    }
                    $('#kont_tab').append(tablica);
                    
                    $('#htkorisnici').dataTable
                        ( {
                            "iDisplayLength": bozo,
                            "bLengthChange": false,
                            "ordering": false
                         } ); //datatable
                    
                }//uspjeh
            }); //ajax
       } //tablica za htaccess
       if(table === 'otKorisnik'){
           $.ajax({
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {
                     'name' : name, 
                     'table' : table,
                     'order' : order
                     },
                success:function(json){
                    $('#otkorisnici').dataTable().fnDestroy();
                    $('#div_spremanje').remove();
                    $('#div_cijene_ruta').remove();
                    $('#promjene').append("<div id='div_spremanje' class='table-responsive'></div>");
                    
                    var tablica ="<br><br><br><table id='otkorisnici' class='table table-hover'><thead><tr><th data-name='kor_ime' data-table='otKorisnik'>Kor_ime</th><th data-name='prezime' data-table='otKorisnik'>Prezime</th><th data-name='ime' data-table='otKorisnik'>Ime</th><th data-name='email' data-table='otKorisnik'>E-mail</th><th data-name='lozinka' data-table='otKorisnik'>Lozinka</th>"+
                                "<th data-name='status' data-table='otKorisnik'>Status</th>"+
                                "<th data-name='broj_neusp' data-table='otKorisnik'>Broj neusp</th>"+
                                "<th>Otkljucaj/Zakljucaj</th>"+
                                "</thead><tbody>";
                     for (var i =0;i<json.length;i++){
                                    tablica+= "<tr>";

                                    tablica += "<td>" + json[i].kor_ime + "</td>";
                                    tablica += "<td>" + json[i].prezime + "</td>";
                                    tablica += "<td>" + json[i].ime + "</td>";
                                    tablica += "<td>" + json[i].email + "</td>";
                                    tablica += "<td>" + json[i].lozinka + "</td>";
                                    tablica += "<td>" + json[i].status + "</td>";
                                    tablica += "<td>" + json[i].broj_neusp + "</td>";
                                    if(json[i].status ==1){
                                    tablica += "<td>" + "<button class='btn btn-success' data-email="+json[i].email+" data-status="+json[i].status+" data-broj_neusp="+json[i].broj_neusp+">Otkljucaj</button>" + "</td>";
                                      }
                                      else{
                                    tablica += "<td>" + "<button class='btn btn-danger' data-email="+json[i].email+" data-status="+json[i].status+" data-broj_neusp="+json[i].broj_neusp+">Zakljucaj</button>" + "</td>";
                                      }
                                    tablica += "</tr>";
                    } //for petlja
                    if(orderst === false){
                        orderst = true;
                    }
                    else{
                        orderst =false;
                    }
                    tablica += "</tbody></table>";
                    $('#div_spremanje').append(tablica);
                    $('#otkorisnici').dataTable
                        ( {
                            "iDisplayLength": bozo,
                            "bLengthChange": false,
                            "ordering": false
                         } ); //datatable
                    
                }//uspjeh
            }); //ajax
       } //tablica za otkljucavanje
       
       if((table !== "hKorisnik") && (table !== "otKorisnik")){
        
        

        
        $.ajax({
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {
                     'name' : name, 
                     'table' : table,
                     'order' : order,
                     'pomoc' : pomoc
                      },
                success:function(json){
                    $('#genTab').dataTable().fnDestroy();
                    $('#div_spremanje').remove();
                    
                    $('#promjene').append("<div id='div_spremanje' class='table-responsive'></div>");
                    
                    
                    
                    
                    var tablica ="<br><br><br><table id='genTab' class='table table-hover'><thead><tr>";
                    
                    $.each(json[0], function(key, value){
                        if(table == "GENCIJENE" || table == "GENCIJENE_2"){
                            tablica += "<th data-name="+key+" data-table='GENCIJENE_2' data-pomoc="+json[0].Ruta+">"+key+"</th>";
                        }
                        else{
                        tablica += "<th data-name="+key+" data-table="+table+">"+key+"</th>";
                    }
                        //alert(key);
                    });
                    if($('#div_select').length){
                    tablica += "<th>Izmjeni</th>";
                    tablica += "<th>Dodaj</th>";
                   }
                   if(table == "GENMAIL"){
                       tablica += "<th>Posalji</th>";
                   }
                   
                   if(table == "PREUZIMANJE"){
                       tablica += "<th data-name='ID' data-table='PREUZIMANJE'>Preuzmi</th>";
                   }
                    tablica += "</tr></thead><tbody>";
                    
                    var polje=[];
                    var broj_i=0;
                    $.each(json, function(key, value){
                        tablica += "<tr>";
                        
                        var broj_j=0;
                        var polje_2=[];
                        $.each(value, function(key, value){
                                if(table == "PREUZIMANJE" && key=="Dostava"){
                                    if(key=="Dostava" && value=="1"){
                                        tablica += "<td>obicna</td>";
                                    }
                                    if(key=="Dostava" && value=="2"){
                                        tablica += "<td>brza</td>";
                                    }
                                    if(key=="Dostava" && value=="3"){
                                        tablica += "<td>posebna</td>";
                                    }
                                }
                                else{
                                    
                                    
                                    tablica += "<td>" + value + "</td>";
                                }
                                polje_2[broj_j]=value;
                                broj_j=broj_j+1;
                            });
                         polje[broj_i]=polje_2;
                         if($('#div_select').length ){
                         tablica += "<td><button class='btn btn-danger' data-tip='1' data-id="+polje[broj_i][0]+" data-table="+table+">Izmjena</button></td>"; ;
                         tablica += "<td><button class='btn btn-danger' data-tip='2' data-id="+polje[broj_i][0]+" data-table="+table+">Dodaj</button></td>" ;
                        }
                        if(table=="GENMAIL"){
                         tablica += "<td><button class='btn btn-danger' data-tip='1' data-paket="+polje[broj_i][3]+" data-id="+polje[broj_i][0]+" data-table="+table+">Mail</button></td>"; ;

                        }
                        if(table== "PREUZIMANJE"){
                         tablica += "<td><button name='preuzmi_paket' data-id="+polje[broj_i][0]+" class='btn btn-success'>Preuzmi</button></td>";

                        }
                         tablica += "</tr>";
                         broj_i=broj_i+1;
                        //alert(key);
                    });
                     if(orderst === false){
                        orderst = true;
                    }
                    else{
                        orderst =false;
                    }
                    tablica += "</tbody></table>";
                    if(table === "GENMAIL"){
                        tablica += "<br><br>Legenda (Sudjelovao):";
                        tablica += "<br>1 = posiljatelj paketa";
                        tablica += "<br>2 = primatelj paketa";
                        
                        tablica += "<br><br><button type='button' id='slanjesvima' class='btn btn-success' data-table='GENMAIL' data-id='RND' data-tip='44'>Pošalji svima</button>";
                    }//ako se radi o generiranju tablice za mailanje
                    
                    if(table === "STANJEP"){
                        tablica += "<br><br>Legenda<br> (Uloga):";
                        tablica += "<br>1 = posiljatelj paketa";
                        tablica += "<br>2 = primatelj paketa";
                        tablica += "<br><br>(Stanje):";
                        tablica += "<br>1 = Paket postavljen";
                        tablica += "<br>2 = Paket preuzet";
                        tablica += "<br>3 = Paket neisporučen";
                        tablica += "<br>4 = Paket isporučen";
                    }//ako se radi o generiranju stanja
                    
                   
                    
                    $('#div_spremanje').append(tablica);
                    $('#genTab').dataTable
                        ( {
                            "iDisplayLength": bozo,
                            "bLengthChange": false,
                            "ordering": false
                         } ); //datatable
                    
                }, //uspjeh
               error:function(){
                  
                   if(table=='STANJEP'){
                     $('#promjene').empty();
                   $('#promjene').append("<div id='div_spremanje' class='mojcenter'></div>");
                   $("#div_spremanje").append("<img class='img-responsive mojcenter' src='../img/data.jpg' ></img>");  
                   }
                   
               }
            }); //ajax
       }
       
    }); //kraj klika za sort
    
    
    $("body").on("click","#klik_blok_kor",function(evt){
         $('#promjene').empty();
         $('#promjene').append("<div id='div_spremanje' class='table-responsive'></div>");

            $.ajax({
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {
                     'name' : 'status', 
                     'table' : 'hKorisnik',
                     'order' : 'ASC'
                     },
                success:function(json){

                    var tablica ="<br><br><br><table id='otkorisnici' class='table table-hover'><thead><tr><th data-name='kor_ime' data-table='otKorisnik'>Kor_ime</th><th data-name='prezime' data-table='otKorisnik'>Prezime</th><th data-name='ime' data-table='otKorisnik'>Ime</th><th data-name='email' data-table='otKorisnik'>E-mail</th><th data-name='lozinka' data-table='otKorisnik'>Lozinka</th>"+
                                "<th data-name='status' data-table='otKorisnik'>Status</th>"+
                                "<th data-name='broj_neusp' data-table='otKorisnik'>Broj neusp</th>"+
                                "<th>Otkljucaj/Zakljucaj</th>"+
                                "</thead><tbody>";

                                for (var i =0;i<json.length;i++){
                                    tablica+= "<tr>";

                                    tablica += "<td>" + json[i].kor_ime + "</td>";
                                    tablica += "<td>" + json[i].prezime + "</td>";
                                    tablica += "<td>" + json[i].ime + "</td>";
                                    tablica += "<td>" + json[i].email + "</td>";
                                    tablica += "<td>" + json[i].lozinka + "</td>";
                                    tablica += "<td>" + json[i].status + "</td>";
                                    tablica += "<td>" + json[i].broj_neusp + "</td>";
                                    if(json[i].status ==1){
                                    tablica += "<td>" + "<button class='btn btn-success' data-email="+json[i].email+" data-status="+json[i].status+" data-broj_neusp="+json[i].broj_neusp+">Otkljucaj</button>" + "</td>";
                                      }
                                      else{
                                    tablica += "<td>" + "<button class='btn btn-danger' data-email="+json[i].email+" data-status="+json[i].status+" data-broj_neusp="+json[i].broj_neusp+">Zakljucaj</button>" + "</td>";
                                      }
                                    tablica += "</tr>";
                    } //for petlja
                    tablica += "</tbody></table>";
                    $('#div_spremanje').append(tablica);
                    $('#otkorisnici').dataTable
                        ( {
                            "iDisplayLength": bozo,
                            "bLengthChange": false,
                            "ordering": false
                         } ); //datatable
                    
                    
                     }//uspjeh
            }); //ajax
        
        
        
    });
    
    $("body").on("click","#klik_dnevnikr",function(evt){
        
        $('#promjene').empty();
        $('#promjene').append("<div id='div_spremanje' class='table-responsive'></div>");
        
        $.ajax({
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {
                     'name' : 'tip', 
                     'table' : 'Radnje_baza',
                     'order' : 'ASC'
                     },
                success:function(json){

                    var tablica ="<br><br><br><table id='genTab' class='table table-hover'><thead><tr>"+
                                "<th data-name='id_baza' data-table='Radnje_baza'>ID</th>"+
                                "<th data-name='id_kor' data-table='Radnje_baza'>Email</th>"+
                                "<th data-name='datum_rada' data-table='Radnje_baza'>Datum i vrijeme</th>"+
                                "<th data-name='opis' data-table='Radnje_baza'>Opis</th>"+
                                "<th data-name='tip' data-table='Radnje_baza'>Tip</th>"+
                                "</thead><tbody>";

                                for (var i =0;i<json.length;i++){
                                    tablica+= "<tr>";

                                    tablica += "<td>" + json[i].id_baza + "</td>";
                                    tablica += "<td>" + json[i].id_kor + "</td>";
                                    tablica += "<td>" + json[i].datum_rada + "</td>";
                                    tablica += "<td>" + json[i].opis + "</td>";
                                    tablica += "<td>" + json[i].tip + "</td>";
                                    
                                    tablica += "</tr>";
                    } //for petlja
                    tablica += "</tbody></table>";
                    $('#div_spremanje').append(tablica);
                    $('#genTab').dataTable
                        ( {
                            "iDisplayLength": bozo,
                            "bLengthChange": false,
                            "ordering": false
                         } ); //datatable
                    
                    
                     }//uspjeh
            }); //ajax
        
    });//dnevnik radnji i baze
    
    
    $("body").on("click","#klik_dnevnikp",function(evt){
        
        $('#promjene').empty();
        $('#promjene').append("<div id='div_spremanje' class='table-responsive'></div>");
        
        $.ajax({
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {
                     'name' : 'id_pok', 
                     'table' : 'Prijave',
                     'order' : 'ASC'
                     },
                success:function(json){

                    var tablica ="<br><br><br><table id='prkorisnici' class='table table-hover'><thead><tr>"+
                                "<th data-name='id_pok' data-table='Prijave'>ID</th>"+
                                "<th data-name='id_kor' data-table='Prijave'>Email</th>"+
                                "<th data-name='datum_prijave' data-table='Prijave'>Datum prijave</th>"+
                                "<th data-name='datum_odjave' data-table='Prijave'>Datum odjave</th>"+
                                "</tr></thead><tbody>";

                                for (var i =0;i<json.length;i++){
                                    tablica+= "<tr>";

                                    tablica += "<td>" + json[i].id_pok + "</td>";
                                    tablica += "<td>" + json[i].id_kor + "</td>";
                                    tablica += "<td>" + json[i].datum_prijave + "</td>";
                                    tablica += "<td>" + json[i].datum_odjave + "</td>";
                                    
                                    tablica += "</tr>";
                    } //for petlja
                    tablica += "</tbody></table>";
                    $('#div_spremanje').append(tablica);
                    $('#prkorisnici').dataTable
                        ( {
                            "iDisplayLength": bozo,
                            "bLengthChange": false,
                            "ordering": false
                         } ); //datatable
                    
                    
                     }//uspjeh
            }); //ajax
        
    });//dnevnik prijave
    
     $("body").on("click","#klik_tablicee",function(evt){
        
        
        $('#promjene').empty();
        $('#promjene').append("<div id='div_select'><br><br><br><p class='text-center' id='selektiranje_tab'></p></div>");
        $('#promjene').append("<div id='div_spremanje' class='table-responsive'></div>");
        
        var tab_sel="<select id='vrijednost'>"+
                    "<option value='ppKorisnik'>Korisnici</option>"+
                    "<option value='Cjenik'>Cjenik</option>"+
                    "<option value='Dio_rute'>Dio_rute</option>"+
                    
                    "<option value='Djelatinici'>Djelatnici</option>"+
                    
                    "<option value='Dostavne_lok'>Dostavne_lokacije</option>"+
                    "<option value='Gal_slik'>Gal_slik</option>"+
                    "<option value='Kur_sluzba'>Kur_sluzba</option>"+
                    "<option value='Mjesto_primanja'>Mjesto_primanja</option>"+
                    "<option value='Paket'>Paket</option>"+
                    "<option value='Paketi_status'>Paketi_status</option>"+
                    "<option value='Prijave'>Prijave</option>"+
                    "<option value='Radnje_baza'>Radnje_baza</option>"+
                    "<option value='Ruta'>Ruta</option>"+
                    "<option value='Sudionici'>Sudionici</option>"+
                    "<option value='Tip_dostave'>Tip_dostave</option>"+
                    "</select>"+
                    "<br><br><button class='btn btn-info' id='gen_tab'>Generiraj</button>";
             $('#selektiranje_tab').append(tab_sel);
            
        
    });//tablice
    
    $("body").on("click","#gen_tab",function(evt){
        $('#div_cijene_ruta').remove();
        $('#div_spremanje').remove();
        $('#promjene').append("<div id='div_spremanje' class='table-responsive'></div>");
        var table = ($('#vrijednost').val());
        
        $.ajax({
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {
                     'name' : "ZZ", 
                     'table' : table,
                     'order' : "ASC"
                     },
                success:function(json){
                    
                    $('#genTab').dataTable().fnDestroy();
                    $('#div_spremanje').remove();
                    $('#div_cijene_ruta').remove();
                    $('#promjene').append("<div id='div_spremanje' class='table-responsive'></div>");
                    
                    var tablica ="<br><br><br><table id='genTab' class='table table-hover'><thead><tr>";
                    
                    $.each(json[0], function(key, value){
                        tablica += "<th data-name="+key+" data-table="+table+">"+key+"</th>";
                        
                        //alert(key);
                    });
                    
                    tablica += "<th>Izmjeni</th>";
                    tablica += "<th>Dodaj</th>";
                    tablica += "</tr></thead><tbody>";
                    
                    var polje=[];
                    var broj_i=0;
                    
                    $.each(json, function(key, value){
                        tablica += "<tr>";
                        
                        var broj_j=0;
                        var polje_2=[];
                        $.each(value, function(key, value){
                               
                                tablica += "<td>" + value + "</td>";
                                polje_2[broj_j]=value;
                                broj_j=broj_j+1;
                            });
                         polje[broj_i]=polje_2;
                         tablica += "<td><button class='btn btn-danger' data-tip='1' data-id="+polje[broj_i][0]+" data-table="+table+">Izmjena</button></td>"; ;
                         tablica += "<td><button class='btn btn-danger' data-tip='2' data-id="+polje[broj_i][0]+" data-table="+table+">Dodaj</button></td>" ;
                         tablica += "</tr>";
                           
                           broj_i=broj_i+1;
                        //alert(key);
                    });
                    
                    
                    tablica += "</tbody></table>";
                    $('#div_spremanje').append(tablica);
                    $('#genTab').dataTable
                        ( {
                            "iDisplayLength": bozo,
                            "bLengthChange": false,
                            "ordering": false
                         } ); //datatable
                    
                }//uspjeh
            }); //ajax
        
        
        
    }); //kraj generiranja dinamik tablice
    
    $("body").on("click","#otkorisnici > tbody > tr > td > button",function(evt){
        var email =$(this).attr('data-email');

       var status = $(this).attr('data-status');
       var broj_neusp = $(this).attr('data-broj_neusp');
       
       
       $('#div_spremanje').remove();
       $('#div_cijene_ruta').remove();
       
         $('#promjene').append("<div id='div_spremanje' class='table-responsive'></div>");

            $.ajax({
                type:"POST",
                url:"../php/otkljucaj.php",
                dataType:"json",
                data : 
                    {
                     'email' : email, 
                     'status' : status,
                     'broj_neusp' : broj_neusp
                     },
                success:function(json){

                    var tablica ="<br><br><br><table id='otkorisnici' class='table table-hover'><thead><tr><th data-name='kor_ime' data-table='otKorisnik'>Kor_ime</th><th data-name='prezime' data-table='otKorisnik'>Prezime</th><th data-name='ime' data-table='otKorisnik'>Ime</th><th data-name='email' data-table='otKorisnik'>E-mail</th><th data-name='lozinka' data-table='otKorisnik'>Lozinka</th>"+
                                "<th data-name='status' data-table='otKorisnik'>Status</th>"+
                                "<th data-name='broj_neusp' data-table='otKorisnik'>Broj neusp</th>"+
                                "<td>Otkljucaj/Zakljucaj</td>"+
                                "</thead><tbody>";

                                for (var i =0;i<json.length;i++){
                                    tablica+= "<tr>";

                                    tablica += "<td>" + json[i].kor_ime + "</td>";
                                    tablica += "<td>" + json[i].prezime + "</td>";
                                    tablica += "<td>" + json[i].ime + "</td>";
                                    tablica += "<td>" + json[i].email + "</td>";
                                    tablica += "<td>" + json[i].lozinka + "</td>";
                                    tablica += "<td>" + json[i].status + "</td>";
                                    tablica += "<td>" + json[i].broj_neusp + "</td>";
                                    if(json[i].status ==1){
                                    tablica += "<td>" + "<button class='btn btn-success' data-email="+json[i].email+" data-status="+json[i].status+" data-broj_neusp="+json[i].broj_neusp+">Otkljucaj</button>" + "</td>";
                                      }
                                      else{
                                    tablica += "<td>" + "<button class='btn btn-danger' data-email="+json[i].email+" data-status="+json[i].status+" data-broj_neusp="+json[i].broj_neusp+">Zakljucaj</button>" + "</td>";
                                      }
                                    tablica += "</tr>";
                    } //for petlja
                    tablica += "</tbody></table>";
                    $('#div_spremanje').append(tablica);
                    $('#otkorisnici').dataTable
                        ( {
                            "iDisplayLength": bozo,
                            "bLengthChange": false,
                            "ordering": false
                         } ); //datatable
                    
                    
                     }//uspjeh
            }); //ajax
    });
   
    $("body").on("click","#genTab > tbody > tr > td > button, #slanjesvima",function(evt){
        var id =$(this).attr('data-id');
        var paket =($(this).attr('data-paket'))?($(this).attr('data-paket')): "NADOPUNI";
       var table = $(this).attr('data-table');
       var tip = $(this).attr('data-tip');
       $('#promjene').empty();
       $('#promjene').append("<div id='div_spremanje' class='mojcenter'></p></div>");
       
       $.ajax({
                type:"POST",
                url:"../php/modd.php",
                dataType:"json",
                data : 
                    {
                     'id' : id, 
                     'table' : table,
                     'tip' : tip,
                     'paket':paket
                     },
                success:function(json){
                    if(table== "GENMAIL"){
                        $("#klik_mailslanje").trigger("click");
                    }
                    else{
                    var tabz = "<form role='form' id='gen_forma' name='gen_forma' class='mojcenterform mojcenter' novalidate action='dodaj.php' method='POST'"+
                            "<div class='form-group'>";  //div i formu zatvorit
                         $.each(json[0], function(key, value){
                                 tabz += "<div class='form-group'>";
                                 tabz += "<span>"+key+"</span><br>";
                                 if(tip == 1){
                                 tabz += "<input name="+key+" type='text' value="+value+"></input><br>";
                                }
                                if(tip == 2){
                                 tabz += "<input name="+key+" type='text' ></input><br>";
                                }
                                 tabz += "</div>";
                       
                    }); //each
                    tabz += "<input name='id_posZ' type='text' value="+id+" hidden></input>";
                    tabz += "<input name='id_tabZ' type='text' value="+table+" hidden></input>";
                    tabz += "<input name='id_tipZ' type='text' value="+tip+" hidden></input>";
                    tabz += "<br><button type='submit' name='buton' class='btn btn-danger' data-table="+table+" data-id="+id+" data-tip="+tip+" >Submit</button>";
                    tabz += "</div></form>";
                    $("#div_spremanje").append(tabz);
                } //ako se ne radi o tablici za mail
                     }//uspjeh
            }); //ajax
       
    }); //za dodavanje / modificiranje
    
    $("body").on("click","#klik_dodjela, #gen_postar",function(evt){
            var kur = ($('#vrijednost').val()) ? ($('#vrijednost').val()) : null;
            var email = ($('#vrijednost_2').val()) ? ($('#vrijednost_2').val()) : null;
            var vrsta= 1;
            if(kur && email){
                vrsta =2;
            }
            $.ajax({
                type:"POST",
                url:"../php/dodjela.php",
                dataType:"json",
                data : 
                    {
                     'vrsta' : vrsta,
                     'kur': kur,
                     'email':email
                     },
                success:function(json){
                    $('#promjene').empty();
                    $('#promjene').append("<div id='div_spremanje' class='mojcenter'></div>");
                    
                    var dodaj = "<br><br>"+
                                "<select id='vrijednost'><option selected></option>";
                                
                        for (var i =0;i<json.length;i++){
                           
                                    dodaj+= "<option value="+json[i].ID+">"+json[i].Naziv+"</option>";
                                        
                        } //for petlja
                                
                                dodaj += "</select>";
                                dodaj += "<br><br>"+
                                "<select id='vrijednost_2'><option selected></option>";
                        for (var i =0;i<json.length;i++){
                                if(json[i].EMAIL){
                                    dodaj+= "<option value="+json[i].EMAIL+">"+json[i].EMAIL+"</option>";
                                }
                        } //for petlja
                    
                    dodaj +="</select>"+
                                "<br><br><button class='btn btn-info' id='gen_postar'>Dodijeli</button>";
                    
                    $('#div_spremanje').append(dodaj);
                    
                    
                }//uspjeh
            });//ajax
        
    });
    
    $("body").on("click","#klik_spaket",function(evt){
        $('#promjene').empty();
        $('#promjene').append("<div id='div_spremanje' class='mojcenter'></div>");
        
         var tabz = "<form role='form' id='paket_forma' name='gen_forma' class='mojcenterform mojcenter' novalidate action='kreiranjepaketa.php' method='POST'>"+
                            "<div class='form-group' ";
                    
                    tabz += "<br><br><br><span class='control-label'>*Primatelj</span>";
                    tabz += "<input class='form-control' name='primatelj_paketa' type='text' ></input>";
                    
                    tabz += "</div>";
                    tabz += "<div class='form-group' id='dodat_paket' ></div></form>";
        
        $("#div_spremanje").append(tabz);
        
    });//kreiranje pocetne forme za slanje paketa
    
    $("body").on("change","[name='primatelj_paketa']",function(evt){
        $("#dodat_paket").empty();
        $("#paket_kur").empty();
        var primatelj = $('[name="primatelj_paketa"]').val()? $('[name="primatelj_paketa"]').val() : false;
        var vrsta_upit_paket = 1;
        $.ajax({
                type:"POST",
                url:"../php/kreiranjepaketa.php",
                dataType:"json",
                data : 
                    {
                     'primatelj' : primatelj, 
                     'vrsta_upit_paket' : vrsta_upit_paket
                     },
                success:function(json){
                            
                            if(json[0].grad){
                            var tabz='<br>';
                            tabz += "<span class='control-label'>*Adresa primatelja</span>";
                            tabz += "<input class='form-control' name='adresa_odred_paketa' type='text' value='"+json[0].adresa+"' readonly></input><br>";
                            tabz += "<span class='control-label'>*Grad primatelja</span>";
                            tabz += "<input class='form-control' name='grad_odred_paketa' type='text' value="+json[0].grad+" readonly></input><br>";
                            tabz += "<span class='control-label'>*Tip dostave</span><br>";
                            tabz += "<select class='form-control' name='dostava_odred_paketa'>";
                            tabz += "<option></option>";
                            tabz += "<option value=1>Obicna</option>";
                            tabz += "<option value=2>Brza</option>";
                            tabz += "<option value=3>Posebna</option>";
                            tabz += "</select><br><div class='form-group' id='paket_kur'></div>";
                            $('#dodat_paket').append(tabz);
                        }
                     }//uspjeh
            }); //ajax
    
    });
    
    
    $("body").on("change","[name='dostava_odred_paketa']",function(evt){
        var primatelj = $('[name="grad_odred_paketa"]').val()? $('[name="grad_odred_paketa"]').val() : false;
        var vrsta_upit_paket = 2;
        $("#paket_kur").empty();
        $.ajax({
                type:"POST",
                url:"../php/kreiranjepaketa.php",
                dataType:"json",
                data : 
                    {
                     'primatelj' : primatelj, 
                     'vrsta_upit_paket' : vrsta_upit_paket
                     },
                success:function(json){
                            
                            var tabz ="<br>";
                            tabz += "<span class='control-label'>*Kurirska služba</span><br>";
                            tabz += "<select  class='form-control' name='kur_odred_paketa'>";
                             for (var i =0;i<json.length;i++){
                                    tabz += "<option value="+json[i].id_kur+">"+json[i].naziv+"</option>";
                                }
                            
                            
                            tabz += "</select><br>";
                            tabz += "<button type='submit' name='buton_paket' class='btn btn-success' value='1'>Submit</button>";
                            tabz += "<input  name='primatelj' type='text' value='0' hidden></input>";
                            tabz += "<input  name='vrsta_upit_paket' type='text' value='0' hidden></input>";

                            $('#paket_kur').append(tabz);
                     },//uspjeh
                error:function(ee){
                    var tabz = "<span>Nemoguca dostava!</span>";
                    $('#paket_kur').append(tabz);
                }
            }); //ajax
        
    });
    
    
    $("body").on("click","#klik_scruta",function(evt){
        $('#promjene').empty();
        $('#promjene').append("<div id='div_cijene_ruta' class='mojcenter'><br><br><br><p class='text-center'></p></div>");
        $('#promjene').append("<div id='div_spremanje' class='table-responsive'></div>");
        
         $.ajax({
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {
                     'name' : "naziv", 
                     'table' : "Ruta_cijena",
                     'order' : "ASC"
                     },
                success:function(json){
                 
                    var tabz = "<form class='mojcenterform'><span class='control-label'>*Ruta</span><br>";
                    tabz += "<select id='trazena_ruta'  class='form-control'>";
                    
                    for (var i =0;i<json.length;i++){
                                    tabz += "<option value="+json[i].naziv+">"+json[i].naziv+"</option>";
                                }
                    tabz += "</select><br>";
                    
                   
                    
                    tabz += "<button type='button' id='cijene_where' data-table='GENCIJENE' class='btn btn-success'>Submit</button></form>";
                    $('#div_cijene_ruta').append(tabz);
                }
        
    });//kraj ajaxa
    
    });
    
    $("body").on("click","#klik_sdostave",function(evt){
        $('#promjene').empty();
        $('#promjene').append("<div id='div_spremanje' class='mojcenter'></div>");
        
        var tabz = "<br><form class='mojcenterform' id='rute_nep' method='POST' action='../php/dostavnelokacije.php'>";
        var async1 = $.ajax({
                async:false,
                type:"POST",
                url:"../php/dostavnelokacije.php",
                dataType:"json",
                data : 
                    {
                     'GENLOK' : "gen_mista"
                     },
                success:function(result1){
                
                 $("#postojece").remove();
                    tabz += "<div id='nepostojece'>";
                    tabz += "<span class='control-label'>Nepostojece lokacije</span><br><select class='form-control' name='nepostojece_name'>";
                    
                    for (var i =0;i<result1.length;i++){
                                    tabz += "<option value="+result1[i].ID_m+">"+result1[i].grad+"</option>";
                                }
                    tabz += "</select></div><br>";
                    
                    $('#div_spremanje').append(tabz);
                }
        
        });//kraj ajaxa
        
        var async2 =  $.ajax({
                type:"POST",
                url:"../php/dostavnelokacije.php",
                dataType:"json",
                data : 
                    {
                     'GENLOK' : "gen_lok"
                     },
                success:function(result2){
                    $("#rute_nep").remove();
                    $("#nepostojece").remove();
                    tabz += "<div id='postojece'>";
                    tabz += "<button  id='buton_dodaj_lok' class='btn btn-default btn-sm' type='button' data-tip='1' data-kur='"+result2[0].ID+"'><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;&nbsp;&nbsp;";
                    tabz += "<button  id='buton_brisi_lok' class='btn btn-default btn-sm' type='button' data-tip='2' data-kur='"+result2[0].ID+"'><span class='glyphicon glyphicon-minus'></span></button><br><br>";
                    tabz += "<span class='control-label'>Postojece lokacije</span><br><select class='form-control' name='postojece_name'>";
                    
                    for (var i =0;i<result2.length;i++){
                                    tabz += "<option value="+result2[i].ID_m+">"+result2[i].grad+"</option>";
                                }
                    
                    
                    
                    tabz += "</select></div></form><br>";

                    $('#div_spremanje').append(tabz);
                }
        
        });//kraj ajaxa
        
        
    }); //kraj dodavanja lokacija
    
    $("body").on("click","#buton_dodaj_lok, #buton_brisi_lok",function(evt){
        var vrsta_nep =$(this).attr('data-tip');
        var kur_sluzb = $(this).attr('data-kur');
        if(vrsta_nep == 1){
            var saljem_nep=$('[name="nepostojece_name"]').val()? $('[name="nepostojece_name"]').val() : false;
        }
        else{
            var saljem_nep=$('[name="postojece_name"]').val()? $('[name="postojece_name"]').val() : false;
        }

        $.ajax({
                type:"POST",
                url:"../php/dostavnelokacije.php",
                dataType:"json",
                data : 
                    {
                     'vrsta_nep' : vrsta_nep,
                     'saljem_nep': saljem_nep,
                     'kur_sla' : kur_sluzb
                     },
                success:function(result1){
                    $("#klik_sdostave").trigger("click");
                    
                }
                
        });//kraj ajaxa
    });


    $("body").on("click","#klik_defrute",function(evt){
        $('#promjene').empty();
        $('#promjene').append("<div id='div_spremanje' class='mojcenter'></div>");
      
         $.ajax({
                type:"POST",
                url:"../php/dostavnelokacije.php",
                dataType:"json",
                data : 
                    {
                     'GENLOK' : "gen_lok"
                     },
                success:function(json){
                    
                    var tabz ="<br><br><form role='form' method='POST' name='forma_rute' action='../php/rute_dod.php' novalidate class='mojcenterform'>";
                        tabz += "<div class='form-group'>"; //to i formu zatvorit
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Naziv rute</span>";
                        tabz += "<input type='text' name='naziv_rute' class='form-control'></input></div>";
                        
                        tabz += "<input type='text' name='hidden_kur' value="+json[0].ID+" hidden></input>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Pocetak rute</span>";
                        tabz += "<select name='pocetak_rute' class='form-control'>";
                        
                        for (var i =0;i<json.length;i++){
                                    tabz += "<option value="+json[i].ID_m+">"+json[i].grad+"</option>";
                                }
                        
                        tabz += "</select></div>";
                        tabz += "<div class='form-group' id='dod_dio_ruta'>";
                        tabz += "<button id='dod_gumb_ruta' class='btn btn-default btn-sm' type='button'><span class='glyphicon glyphicon-plus'></span></button></div>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Kraj rute</span>";
                        tabz += "<select name='kraj_rute' class='form-control'>";
                        
                        for (var i =0;i<json.length;i++){
                                    tabz += "<option value="+json[i].ID_m+">"+json[i].grad+"</option>";
                                }
                        
                        tabz += "</select></div>";
                        
                        tabz += "<input type='text' name='hidden_pomoc' hidden value='POMOC'></input>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Vrijeme trajanje rute</span>";
                        tabz += "<input type='text' name='ruta_vrim' class='form-control' placeholder='00:00:00'></input></div>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Kilometraza</span>";
                        tabz += "<input type='number' name='ruta_kilo' class='form-control' ></input></div>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Obična cijena</span>";
                        tabz += "<input type='number' name='obicna' class='form-control' ></input></div>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Brza cijena</span>";
                        tabz += "<input type='number' name='ruta_brza' class='form-control' ></input></div>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Posebna cijena</span>";
                        tabz += "<input type='number' name='posebna' class='form-control' ></input></div>";
                        
                        tabz += "<button name='dod_rute_buton_name' type='submit' class='btn btn-success'>Send</button>";
                        
                        tabz += "</form></div>";
                        
                    $('#div_spremanje').append(tabz);
                }
        
        });//kraj ajaxa
        
    }); //definiranje ruta
    
    $("body").on("click","#dod_gumb_ruta",function(evt){
        
        $.ajax({
                type:"POST",
                url:"../php/dostavnelokacije.php",
                dataType:"json",
                data : 
                    {
                     'GENLOK' : "gen_lok"
                     },
                success:function(json){
                    var tabz = "";
                    
                     //alert($('#dod_dio_ruta').children().length);
                    
                    tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Dio rute</span>";
                        tabz += "<select name='dio_rute_"+$('#dod_dio_ruta').children().length+"' class='form-control'>";
                        
                        for (var i =0;i<json.length;i++){
                                    tabz += "<option value="+json[i].ID_m+">"+json[i].grad+"</option>";
                                }
                        
                        tabz += "</select></div>";

                    $('#dod_dio_ruta').append(tabz);
                }
        
        });//kraj ajaxa
        
    });
    
    $("body").on("click","#klik_preuzmi",function(evt){
        $('#promjene').empty();
        
        
        $.ajax({
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {
                     'name' : "Odrediste", 
                     'table' : "PREUZIMANJE",
                     'order' : "ASC"
                     },
                success:function(json){
                    $('#genTab').dataTable().fnDestroy();
                    $('#div_spremanje').remove();
                    
                    $('#promjene').append("<div id='div_spremanje' class='table-responsive'></div>");
                    
                    var tablica ="<br><br><br><table id='preuz_pak' class='table table-hover'><thead><tr>";
                    
                    $.each(json[0], function(key, value){
                        tablica += "<th data-name="+key+" data-table='PREUZIMANJE'>"+key+"</th>";
                        
                        
                        });
                        tablica += "<th data-name='ID' data-table='PREUZIMANJE'>Preuzmi</th>";
                        tablica += "</tr></thead><tbody>";
                        for (var i =0;i<json.length;i++){
                                    tablica+= "<tr>";

                                    tablica += "<td>" + json[i].ID + "</td>";
                                    tablica += "<td>" + json[i].Odrediste + "</td>";
                                    if(json[i].Dostava==1){
                                        tablica += "<td>obicna</td>";
                                    }
                                    if(json[i].Dostava==2){
                                        tablica += "<td>brza</td>";
                                    }
                                    if(json[i].Dostava==3){
                                        tablica += "<td>posebna</td>";
                                    }
                                    tablica += "<td><button name='preuzmi_paket' data-id="+json[i].ID+" class='btn btn-success'>Preuzmi</button></td>";
                                    
                                    tablica += "</tr>";
                    } //for petlja
                    tablica += "</tbody></table>";
                        
                    
                    $('#div_spremanje').append(tablica);
                    $('#preuz_pak').dataTable
                        ( {
                            "iDisplayLength": bozo,
                            "bLengthChange": false,
                            "ordering": false
                         } ); //datatable
                        
                        //alert(key);
                    
                    
                }
            }); //kraj ajaxa
        
    });
    
    $("body").on("click","[name='preuzmi_paket']",function(evt){
        
        var id =($(this).attr('data-id'))?($(this).attr('data-id')): "NADOPUNI";
        
        
        $('#promjene').empty();
        $('#promjene').append("<div id='div_spremanje' class='mojcenter'></div>");
        
        $.ajax({
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {
                     'name' : "naziv", 
                     'table' : "Rute_prim",
                     'order' : "ASC"
                     },
                success:function(json){
                 
                    

                    var tabz ="<br><br><form role='form' method='POST' name='forma_preuzmi_pak' action='../php/opis_paket.php' novalidate class='mojcenterform' enctype='multipart/form-data'>";
                        tabz += "<div class='form-group'>"; //to i formu zatvorit
                        
                        tabz += "<div class='form-group'>";
                        
                        tabz += "<input type='text' name='id_ppaketa' value="+id+" hidden></input></div>";
                        
                        tabz += "<div class='form-group'>";
                        tabz +="<span class='control-label'>*Dostupne rute</span><br>";
                        tabz += "<select name='dostupne_rute' class='form-control'>";

                        for (var i =0;i<json.length;i++){
                                        tabz += "<option value="+json[i].id+">"+json[i].naziv+"</option>";
                                    }
                        tabz += "</select></div>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Naziv paketa</span>";
                        tabz += "<input type='text' name='naziv_ppaketa' class='form-control'></input></div>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Težina</span>";
                        tabz += "<input type='number' name='ppaket_tezina' class='form-control'></input></div>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Visina paketa</span>";
                        tabz += "<input type='number' name='ppaket_visina' class='form-control'></input></div>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Širina paketa</span>";
                        tabz += "<input type='number' name='ppaketa_sirina' class='form-control'></input></div>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Dužina paketa</span>";
                        tabz += "<input type='number' name='ppaketa_duzina' class='form-control'></input></div>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Galerija slika</span>";
                        tabz += "<input type='file' multiple name='file[]'   id='prikazi_slike' class='form-control' accept='image/jpg' ></input></div>";
                        
                        tabz += "<div class='form-group'";
                        
                        tabz += "<output id='list_3'></output>";
                        tabz += "</div>";
                        
                        tabz += "<div class='form-group'>";
                        
                        tabz += "<button name='posalji_opis_paketa' class='btn btn-success' type='submit'>Submit</button></div>";
        
                        tabz += "</form></div>";
                        
                        $('#div_spremanje').append(tabz);
                      
                        
                        
                }
        
        
        });
        
    });
    
    $("body").on("click","#klik_azuriraj",function(evt){
        
        $('#promjene').empty();
        $.ajax({
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {'name' : "RANDOM",
                     'table' : "AZURIRANJE",
                     'order' : "ASC"
                     },
                success:function(json){
                  $('#promjene').append("<div id='div_spremanje' class='mojcenter'></div>");  
                    var tabz = "<br><br><form role='form'  name='forma_azuriranje' novalidate class='mojcenterform'>";
                        tabz += "<div class='form-group'>";
                        
                        tabz += "<div class='form-group'>";
                        tabz += "<span class='control-label'>*Odaberite paket</span>";
                        tabz += "<select name='azu_paket_od' class='form-control'>";
                        
                        for (var i =0;i<json.length;i++){
                                    tabz += "<option value="+json[i].ID+">"+json[i].naziv+"</option>";
                                }
                        
                        tabz += "</select>";
                        tabz += "<br><button name='azu_odabir' type='button' class='btn btn-success'>Odaberi</button>";
                        tabz += "</div><div class='form-group' id='spr_azu'></div></form>";
                        
                    $('#div_spremanje').append(tabz);
                }
        
        });//kraj ajaxa
        
    }); //azuiraranje paketa
    
    $("body").on("click","[name='azu_odabir']",function(evt){
        $('#spr_azu').empty();
        var paketic = $('[name="azu_paket_od"]').val()? $('[name="azu_paket_od"]').val() : false;
        
        
        $.ajax({
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {'name' : paketic,
                     'table' : "AZURIRANJE_2",
                     'order' : "ASC"
                     },
                success:function(json){
                  var tabz="";
                    for (var i =0;i<json.length;i++){
                        if(json[i].oznaka == 3){
                            
                            tabz += "<span class='control-label'>"+json[i].grad+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='class='btn btn-default btn-sm' name='fin_azu' data-lok='"+json[i].grad+"' data-oznaka='4' data-id="+paketic+"><span class='glyphicon glyphicon-ok'></span></button>";
                            tabz += "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='class='btn btn-default btn-sm' name='fin_azu' data-lok='"+json[i].grad+"' data-id="+paketic+" data-oznaka='3'><span class='glyphicon glyphicon-remove'></span></button>";
                        }
                        else{
                            tabz += "<span class='control-label'>"+json[i].grad+"</span>&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='class='btn btn-default btn-sm' name='fin_azu' data-lok='"+json[i].grad+"' data-id="+paketic+" data-oznaka='2'><span class='glyphicon glyphicon-star    '></span></button><br>";
                        }
                        
                        
                       //tabz += "<option value="+json[i].ID_m+">"+json[i].grad+"</option>";
                    }
                    $('#spr_azu').append(tabz);
                }
        
        });//kraj ajaxa
        
        
    }); //kraj klika
    
    $("body").on("click","[name='fin_azu']",function(evt){
        var znacka = $(this).attr('data-oznaka');
        var uppaket = $(this).attr('data-id');
        var lok = $(this).attr('data-lok');
        $.ajax({
                type:"POST",
                url:"../php/azuriranje.php",
                dataType:"json",
                data : 
                    {'znacka' : znacka,
                     'uppaket' : uppaket,
                     'lok' : lok
                     
                     },
                success:function(json){
                  
                }
        
        });//kraj ajaxa
        
    }); //kraj click eventa za gumbice azuriranja paketa
    
    var gal_max = 0;
    var gal_curr=1;
    $("body").on("click","#klik_gal_slik, #gal_livo, #gal_desno, #gal_search",function(evt){
        var gal =($(this).attr('data-gal'))?($(this).attr('data-gal')): 10;
        
        if(gal == 10){
        $('#promjene').empty();
        $('#promjene').append("<div id='div_spremanje'></div>");
        
        $.ajax({
                async:false,
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {'name' : gal,
                     'table' : "GALSLIKA",
                     'order' : "ASC"
                     },
                success:function(json){
                    gal_max=json[0].id_paket;
                    
                }
        
            });//kraj ajaxa
        
        } //AKO SE RADI O KLIKU NA STRANICU
        
        else{
            if(gal==1){
                $('#promjene').empty();
                $('#promjene').append("<div id='div_spremanje'></div>");
                if(gal_curr==1){
                    gal_curr = 1;
                }//ako je na pocetku ostavi ga na 1.
                else{
                    gal_curr=gal_curr-1;
                }//ako nije na pocetku smanji ga za 1
            }//gumb lijevo
            if(gal==2){
                $('#promjene').empty();
                $('#promjene').append("<div id='div_spremanje'></div>");
                if(gal_curr==gal_max){
                    gal_curr=gal_max;
                }//ako je na kraju ostavimo ga na kraju
                
                else{
                    gal_curr=gal_curr+1;
                }//ako nije na kraju uvecavamo za 1
            }//gumb desno
            if(gal==3){
                var ggal_pomakl = $('[name="gal_slika_unos"]').val()? $('[name="gal_slika_unos"]').val() : 1;
                $('#promjene').empty();
                $('#promjene').append("<div id='div_spremanje'></div>");
                //gal_slika_unos
                
                if(ggal_pomakl >0 && ggal_pomakl <=gal_max){
                    gal_curr = ggal_pomakl;
                }//ako se radi o rasponu gdje moze unosit
                if(ggal_pomakl > gal_max){
                    gal_curr=gal_max;
                }//ako ce prekoraciti maksimalni vratimo ga na maksimalni
                if(ggal_pomakl <1){
                    gal_curr = 1;
                }//ako je manji od jedan vracamo ga na nbajmanji paket
                
            }//ako se radi o gumbu di sami unosimo
            
        }//KRAJ ELSE-a
        
        var slika="<div class='intro-header' id='home'>";
            slika +="<div id='carousel-example-generic' class='carousel slide' data-ride='carousel'>";
            slika +="<ol class='carousel-indicators'>";
            slika +="<li data-target='#carousel-example-generic' data-slide-to='0' class='active'></li>";
            slika +="<li data-target='#carousel-example-generic' data-slide-to='1'></li>";
            slika +="<li data-target='#carousel-example-generic' data-slide-to='2'></li>";
            slika +="</ol>";
            slika +="<div class='carousel-inner'>";
            slika +="<div class='item active'>";
            slika +="<img src='../img/gal/"+gal_curr+"_img1.jpg' alt='Prva slika'>";
            slika +="<div class='carousel-caption'>";
            slika +="Prva slika";
            slika +="</div>";
            slika +="</div>";
            slika +="<div class='item'>";
            slika +="<img src='../img/gal/"+gal_curr+"_img2.jpg' alt='Druga slika'>";
            slika +="<div class='carousel-caption'>";
            slika +="Druga slika";
            slika +="</div>";
            slika +="</div>";
            slika +="<div class='item'>";
            slika +="<img src='../img/gal/"+gal_curr+"_img3.jpg' alt='Treća slika'>";
            slika +="<div class='carousel-caption'>";
            slika +="Treća slika";
            slika +="</div>";
            slika +="</div>";
            slika +="</div>";
            slika +="<a class='left carousel-control' href='#carousel-example-generic' data-slide='prev'>";
            slika +="<span class='glyphicon glyphicon-chevron-left'></span>";
            slika +="</a>";
            slika +="<a class='right carousel-control' href='#carousel-example-generic' data-slide='next'>";
            slika +="<span class='glyphicon glyphicon-chevron-right'></span>";
            slika +="</a>";
            slika +="</div>";
            slika +="</div>";
            
            
            
            slika += "<br><div class='mojcenter col-md-6 col-md-offset-3'>";
            slika += "<span class='control-label'>Paket "+gal_curr+" / "+gal_max+"</span><br>";
            slika += "<span class='control-label'>Odi na</span>";
            slika += "<input name='gal_slika_unos' type='number' class='form-control'>";

            slika += "</input></div><br>";
            
            slika += "<br><br><div class='btn-group btn-group-justified'>";
            slika += "<div class='btn-group'>";
            slika += "<button type='button' id='gal_livo' data-gal='1' class='btn btn-default'><span class='glyphicon glyphicon-chevron-left'></span></button>";
            slika += "</div>";
            
            slika += "<div class='btn-group'>";
            slika += "<button type='button' id='gal_search' data-gal='3' class='btn btn-default'><span class='glyphicon glyphicon glyphicon-search'></span></button>";
            slika += "</div>";
            
            slika += "<div class='btn-group'>";
            slika += "<button type='button' id='gal_desno' data-gal='2' class='btn btn-default'><span class='glyphicon glyphicon-chevron-right'></span></button>";
            slika += "</div>";
            
            slika += "</div>";
            
            $("#div_spremanje").append(slika);
    }); //kreiranje galerija slika
   
  

    var out = [];

//TU SAN STA

   $("body").on("click","#sakrigraf1",function(){
       $("#graf1").hide();
   });
   
    $("body").on("click","#postavigraf1",function () {
        $("#graf1").show();
        var chart = $('#graf1').highcharts();
        chart.series[0].setData(out);
        
    });
    
  
    
    $("body").on("click","#stat_kur,#stat_rute,#stat_mod1,#stat_mod2,#stat_mod3, #genstatmod,#statadmin, #STATKURr > thead > tr > th ",function(evt){
       var name =($(this).attr('data-name'))?($(this).attr('data-name')): "NADOPUNI";
       var table =($(this).attr('data-table'))?($(this).attr('data-table')): "NADOPUNI";
       var od =($(this).attr('data-od'))?($(this).attr('data-od')): "NADOPUNI";
       var do_o =($(this).attr('data-do'))?($(this).attr('data-do')): "NADOPUNI";
       var tablica='';
       
       if(orderst){
           order = "ASC";
       }
       else{
           order = "DESC";
       }
       
       var mod =($(this).attr('data-gen'))?($(this).attr('data-gen')): "NADOPUNI";
       if(mod=="DA"){
            od = $('[name="od"]').val()? $('[name="od"]').val() : false;
            do_o = $('[name="do"]').val()? $('[name="do"]').val() : false;
           table = $('[name="vrstagenmod"]').val()? $('[name="vrstagenmod"]').val() : false;
           name="Broj";
   
           
       }//ako je mod postavljen odnosno ako on generira statistiku
       
       if(mod=="AD"){
           od = $('[name="od"]').val()? $('[name="od"]').val() : false;
           do_o = $('[name="do"]').val()? $('[name="do"]').val() : false;
          var statupit=$('[name="vrstagenadmin"]').val()? $('[name="vrstagenadmin"]').val() : false;
           table = "adminstat";
           name="Ukupno";
           
       }//radi se o ADMINU
       
       
       $("#promjene").empty();
       $("#div_spremanje").remove();
       if(table == 'modstat1' || table== 'statmod1' || table=='statmod2' || table=='statmod3' || table=="adminstat"){
           tablica+="<br><br><br><div class='mojcenter col-md-3 col-md-offset-4' id='div_spremanje'>";
           tablica+="<div class='form-group'>";
           tablica+="<span class='control-label'>Od</span>";
           tablica+="<div id='datepicker1' data-date-format='YYYY-MM-DD hh:mm:ss' class='input-group date'>";
           tablica+="<input class='date-picker form-control' type='text'  name='od'></input>";
           tablica+="<span class='input-group-addon btn'>";
           tablica+="<span class='glyphicon glyphicon-calendar'></span></span>";
           tablica+="</div></div>";
           tablica+="<div class='form-group'>";
           tablica+="<span class='control-label'>Do</span>";
           tablica+="<div id='datepicker2' data-date-format='YYYY-MM-DD hh:mm:ss' class='input-group date'>";
           tablica+="<input class='date-picker form-control' type='text'  name='do'></input>";
           tablica+="<span class='input-group-addon btn'>";
           tablica+="<span class='glyphicon glyphicon-calendar'></span></span>";
           tablica+="</div></div>";
           
           
           
           if(table!="adminstat"){
           tablica+="<div class='form-group'>";
           tablica+="<span class='control-label'>Odaberi</span>";
           tablica += "<select name='vrstagenmod' class='form-control'>";
           tablica += "<option></option>";
           tablica += "<option value='statmod1'>Broj paketa</option>";
           tablica += "<option value='statmod2'>Aktivnost korisnika</option>";
           tablica += "<option value='statmod3'>Korištenost ruta</option>";
           tablica += "</select>";
           tablica+="</div>";
           tablica += "<button id='genstatmod' type='button' class='btn btn-success' data-gen='DA'>Prikaži</button>";
           }
           if(table=="adminstat"){
           tablica+="<div class='form-group'>";
           tablica+="<span class='control-label'>Statistika po:</span>";
           tablica += "<select name='vrstagenadmin' class='form-control'>";
           tablica += "<option></option>";
           tablica += "<option value='Uspjesne_prijave'>Uspješne prijave</option>";
           tablica += "<option value='Neuspjesne_prijave'>Neuspješne prijave</option>";
           tablica += "<option value='Ostalo'>Ostalo</option>";
           tablica += "<option value='Ukupno'>Ukupno</option>";
           tablica += "</select>";
           tablica+="</div>";
           tablica += "<br><button id='genstatmod' type='button' class='btn btn-success' data-gen='AD'>Prikaži</button>";    
           }
           
           tablica+="</div>";
           $('#promjene').append(tablica);
           $('#datepicker1').datetimepicker({
                            language: 'hr'
                          });
            $('#datepicker2').datetimepicker({
                            language: 'hr'
                            });
       }
        if(table=="modstat1"){
            return;
        }
        $.ajax({
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {
                     'name' : name,
                     'table' : table,
                     'order' : order,
                     'od' : od,
                     'do' : do_o
                     },
                success:function(json){
                    out=[];
                    $('#STATKURr').dataTable().fnDestroy();
                   $('#promjene').append("<div id='div_spremanje_2' class='table-responsive'></div>"); 
                    
                    tablica ="<br><br><br><table id='STATKURr' class='table table-hover'><thead><tr>";
                    
                    $.each(json[0], function(key, value){
                        tablica += "<th data-name="+key+" data-od='"+od+"' data-do='"+do_o+"' data-table='"+table+"'>"+key+"</th>";
                    }); //radimo imena stupaca
                         tablica += "</tr></thead><tbody>";
                         
                         
                         $.each(json,function(key,value){
                             tablica+="<tr>";
                             $.each(value, function(key, value){
                                 
                                tablica += "<td>"+value+"</td>";
                                
                             });
                            tablica+="</tr>";
                         }); // punjene tablice podacima
                                 
                         
                    tablica += "</tbody></table>";
                    tablica +="<br><br><button id='postavigraf1'><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id='sakrigraf1'><span class='glyphicon glyphicon-minus'></span></button><br>";   
                   // tablica += "<br><button type='button class='btn btn-info' onclick=javascript:window.print() value='Print Current Page'>Print</button>"; 
                    tablica += "<div id='graf1'  class='col-sm-offset-3'></div>";
                    //nnbsp;
                    $('#div_spremanje_2').append(tablica);
                    
                    if(orderst === false){
                        orderst = true;
                    }
                    else{
                        orderst =false;
                    }
                    
                   $("#graf1").hide();
                for (var i = 0; i < json.length; i++) {
                            var tmp = [];
                            for (var i2 in json[i]) {
                                if(statupit){
                                    tmp.push(json[i].Korisnik);
                                    tmp.push(json[i][statupit]);
                                }//ako je admin psotavia
                                else{
                                    if(json[i].Ruta){
                                    tmp.push(json[i].Naziv);
                                    tmp.push(json[i].Broj);
                                }
                                else{
                                    tmp.push(json[i][i2]);
                                }
                                }//ako nie admin postavia
                                
                            }
                            out.push(tmp);
                    } //sluzi za formatiranje jsona u polje kako bi mogao prikazati graf
                    var titl="";
                    if(table == "adminstat"){
                        if(statupit=="Uspjesne_prijave"){
                            titl="Statistika uspješnih prijava";
                        }
                        if(statupit=="Neuspjesne_prijave"){
                            titl="Statistika neuspješnih prijava";
                        }
                        if(statupit=="Ostalo"){
                            titl="Radnje bez prijava";
                        }
                        if(statupit=="Ukupno"){
                            titl="Sve radnje korisnika";
                        }
                        if(statupit==""){
                            titl="Statistika uspješnih prijava";
                        }
                    }
                    
                    if(table=="statmod1"){
                        titl="Broj paketa po kurirskim službama";
                    }
                    if(table=="statmod2"){
                        titl="Aktivnost korisnika unutar mod. službe";
                    }
                    if(table=="statmod3"){
                        titl="Statistika korištenosti ruta";
                    }
                    
                    if(table=="STATKUR"){
                        titl="Statistika kurirskih službi";
                    }
                    if(table=="STATRUT"){
                        titl="Statistika ruti";
                    }
                    var dodatni_tekst="";
                    if(tipG=='pie'){
                        dodatni_tekst='{series.name}: <b>{point.percentage:.1f}%</b>';
                    }
                    else{
                        dodatni_tekst="";
                    }
                    //
                    $('#graf1').highcharts({
                            chart: {renderTo: 'graf1',
                                    type: tipG},
                                title: {
                                 text: titl
                             },
                             tooltip: {
                                    pointFormat: dodatni_tekst
                                },
                            plotOptions: {
                                series: {
                                    allowPointSelect: true,
                                    showInLegend : false
                                },
                                pie: {
                                    allowPointSelect: true,
                                    cursor: 'pointer',
                                    dataLabels: {
                                        enabled: true,
                                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                        style: {
                                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                        }
                                    }
                                }
                            },
                            series: [{
                                type: tipG,
                                
                                data: []
                            }]
                        });
                $('#STATKURr').dataTable
                                        ( {"dom": 'T<"clear">lfrtip',
                                                "otableTools": {
                                                    "sSwfPath": "../swf/copy_csv_xls_pdf.swf"
                                                },
                                            "iDisplayLength": bozo,
                                            "bLengthChange": false,
                                            "ordering": false
                                             
                                         } ); //datatable
                    

                    }//SUCCESS
            });//kraj ajaxa
        
    });
    
    $("body").on("change","#prikazi_slike",function(evt){
        $("#list_3").empty();
        var files = evt.target.files; // FileList object

    // Loop through the FileList and render image files as thumbnails.
    for (var i = 0, f; f = files[i]; i++) {

      // Only process image files.
      if (!f.type.match('image.*')) {
        continue;
      }

      var reader = new FileReader();

      // Closure to capture the file information.
      reader.onload = (function(theFile) {
        return function(e) {
          // Render thumbnail.
          var span = document.createElement('span');
          span.innerHTML = ['<img class="thumb" width="100" height="100" src="', e.target.result,
                            '" title="', escape(theFile.name), '"/>'].join('');
          document.getElementById('list_3').insertBefore(span, null);
        };
      })(f);

      // Read in the image file as a data URL.
      reader.readAsDataURL(f);
    }
    });
    
}); //kraj dokumenta

