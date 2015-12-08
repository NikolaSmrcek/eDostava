/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
var orderst = false;
        var bozo=2;
        var order = "";
        $.ajax({
                async:false,
                type:"POST",
                url:"../config/config.json",
                dataType:"json",
                success:function(json){                          
                            bozo = parseInt(json['str']);
                            }//uspjeh
            }); //ajax
            
            var table = "POCETNA";
             
            
            $.ajax({
                
                type:"POST",
                url:"../php/sorttable.php",
                dataType:"json",
                data : 
                    {
                     'name' : "id", 
                     'table' : "POCETNA",
                     'order' : "ASC"
                     },
                success:function(json){                          
                    $('#promjene').append("<div id='div_spremanje' class='table-responsive'></div>");
                    
                    var tablica ="<br><br><br><table id='genTab' class='table table-hover'><thead><tr>";
                    
                    $.each(json[0], function(key, value){
                        tablica += "<th data-name="+key+" data-table="+table+">"+key+"</th>";
                        //alert(key);
                    });

                   if(table == "POCETNA"){
                       tablica += "<th>Više</th>";
                   }
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
                         
                        if(table=="POCETNA" && polje[broj_i][2]){
                         tablica += "<td><button class='btn btn-success' data-tip='1' data-id="+polje[broj_i][2]+"  data-table="+table+">Više</button></td>"; 
                        }
                        
                        if(!(polje[broj_i][2])){
                         tablica += "<td><button class='btn btn-danger'>NULL</button></td>"; 
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
                    $('#div_spremanje').append(tablica);
                    $('#genTab').dataTable
                        ( {
                            "iDisplayLength": bozo,
                            "bLengthChange": false,
                            "ordering": false
                         } ); //datatable
                    
                }//uspjeh
                            
                            
            }); //ajax
            
            
            $("body").on("click","th",function(evt){
            var name =($(this).attr('data-name'))?($(this).attr('data-name')): "NADOPUNI";

            var table = ($(this).attr('data-table'))?($(this).attr('data-table')): "POCETNA";
            
            if(orderst){
                    order = "ASC";
                }
                else{
                    order = "DESC";
                }
             
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
                    $('#genTab').dataTable().fnDestroy();
                    $('#div_spremanje').remove();
                    $('#promjene').append("<div id='div_spremanje' class='table-responsive'></div>");
                    
                    var tablica ="<br><br><br><table id='genTab' class='table table-hover'><thead><tr>";
                    
                    $.each(json[0], function(key, value){
                        tablica += "<th data-name="+key+" data-table="+table+">"+key+"</th>";
                        //alert(key);
                    });

                   if(table == "POCETNA"){
                       tablica += "<th>Više</th>";
                   }
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
                         
                        if(table=="POCETNA" && polje[broj_i][2]){
                         tablica += "<td><button class='btn btn-success' data-tip='1' data-id="+polje[broj_i][2]+"  data-table="+table+">Više</button></td>"; 
                        }
                        
                        if(!(polje[broj_i][2])){
                         tablica += "<td><button class='btn btn-danger'>NULL</button></td>"; 
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
                    $('#div_spremanje').append(tablica);
                    $('#genTab').dataTable
                        ( {
                            "iDisplayLength": bozo,
                            "bLengthChange": false,
                            "ordering": false
                         } ); //datatable
                    
                }//uspjeh
            }); //ajax
             
            }); // sortiranje
        
        
            $("body").on("click","#genTab > tbody > tr > td > button",function(evt){
            
            var tip = $(this).attr('data-tip');
            var name =$(this).attr('data-id');
            var table = $(this).attr('data-table');
            $('#div_spremanje_2').remove();
            $('#upis_pocetna').append("<div id='div_spremanje_2' class='mojcenter'></p></div>");

            $.ajax({
                     type:"POST",
                     url:"../php/sorttable.php",
                     dataType:"json",
                     data : 
                         {
                          'name' : name, 
                          'table' : table,
                          'order' : tip
                          },
                     success:function(json){
                          
                         var tabz = "<br><br><br><br><form role='form' id='gen_forma' name='gen_forma' class='mojcenterform mojcenter' "+
                                 "<div class='form-group'>";  //div i formu zatvorit
                              $.each(json[0], function(key, value){
                                
                                 
                                 if(tip == 1 && key != "grad"){
                                 tabz += "<div class='form-group'>";
                                 tabz += "<span>"+key+"</span><br>";
                                 tabz += "<input name="+key+" type='text' value="+value+" readonly></input><br>";
                                }
                                
                                 tabz += "</div>";
                       
                    }); //each
                    tabz +="<div class='form-group'><span>Tocke kojima prolazi</span><br>";
                    tabz += "<input readonly type='text' value='";
                    for (var i =0;i<json.length;i++){
                        if(i == (json.length-1)){
                            tabz += " "+json[i].grad+" ";
                        }
                        else{
                        tabz += " "+json[i].grad+" - ";
                        }
                    }//kraj fora
                    tabz += "'></input><br></div>";
                    
                         tabz += "</div></form>";
                         $("#div_spremanje_2").append(tabz);
                     
                          },//uspjeh
                          error:function(){
                              $("#div_spremanje_2").append("<br><br><br><br><br><br>Dostavne tocke odabrane rute nisu dostupne!");
                          }
                 }); //ajax


                 });
});
                 