<?php
ob_start();
include_once 'baza.class.php';
$baza = new baza();
$baza->spojiDB();


$name = isset($_POST['name']) ? $_POST['name'] : false;
$table = isset($_POST['table']) ? $_POST['table'] : false;
$order = isset($_POST['order']) ? $_POST['order'] : false;




if($name && $table && $order){
    
    if(($table === 'hKorisnik')||($table === 'otKorisnik') ||($table === 'ppKorisnik')){
        $table = 'Korisnik';
        if($name == "ZZ"){
            $name =1;
        }
        $upit = "Select kor_ime,prezime,ime,email,lozinka,status,broj_neusp from ".$table." ORDER BY ".$name." ".$order."";
        $podaci = $baza->selectUpit($upit);
        $i = 0;
        while ($red = $podaci->fetch_array()){
            $response[$i]['kor_ime']  = $red['kor_ime'];
            $response[$i]['prezime']  = $red['prezime']; 
            $response[$i]['ime']  = $red['ime']; 
            $response[$i]['email']  = $red['email']; 
            $response[$i]['lozinka']  = $red['lozinka']; 
            $response[$i]['status']  = $red['status'];
            $response[$i]['broj_neusp']  = $red['broj_neusp'];
            $i=$i+1;
        }
         echo json_encode($response);
        
        
    }
    
     else{
        echo dohvatiPod($baza,$name,$table,$order);
     }
}

function dohvatiPod($baza,$name,$table,$order){
   
    if($name == "ZZ"){
        $upit = "Select * from ".$table." ORDER BY 1 ".$order."";
    }
    
    else{
        $upit = "Select * from ".$table." ORDER BY ".$name." ".$order."";
    }
    
    if($table=="Ruta_cijena"){
        
        $upit = "Select DISTINCT(naziv) from Ruta ORDER BY ".$name." ".$order."";
    }
    
    if($table == "GALSLIKA"){
        $upit="Select COUNT(*)id_paket from Paket";
    }
    
    if($table=="Rute_prim"){
        if(!isset($_SESSION)) 
            { 
                session_start(); 
            } 
        
        $upit = "Select DISTINCT(naziv),id_ruta as id from Ruta where id_kurs=(Select k.id_kur AS 'ID' from Kur_sluzba k right join Djelatinici d on k.id_kur=d.id_kurs where d.id_kor='".$_SESSION['email']."') GROUP BY naziv ORDER BY ".$name." ".$order."";
    }
    
    if($table == "STANJEP"){
        if(!isset($_SESSION)) 
            { 
                session_start(); 
            } 
            
            $upit= "Select s.id_paketa AS ID,s.status_s AS Uloga,p.naziv as Naziv,ps.lokacija AS Lokacija,ps.datum_lok AS Datum,ps.status AS Stanje from Sudionici s RIGHT JOIN Paket p ON s.id_paketa=p.id_paket RIGHT JOIN Paketi_status ps ON p.id_paket=ps.Paket_id_paket  WHERE s.id_kors='".$_SESSION['email']."' Order BY $name $order ";
    }
    
    if($table == "GENMAIL" && $name=="NADOPUNI"){
        $upit ='Select s.id_kors AS "Email",s.status_s AS "Sudjelovao", s.id_paketa AS "Paket",p.naziv AS "Naziv" from Sudionici s left join Paket p ON s.id_paketa = p.id_paket left join Paketi_status ps ON p.id_paket=ps.Paket_id_paket WHERE ps.status = 3 ORDER BY s.id_paketa '.$order.'';
    }
    
    if($table == "GENMAIL" && $name!=="NADOPUNI"){
        $upit ='Select s.id_kors AS "Email",s.status_s AS "Sudjelovao", s.id_paketa AS "Paket",p.naziv AS "Naziv" from Sudionici s left join Paket p ON s.id_paketa = p.id_paket left join Paketi_status ps ON p.id_paket=ps.Paket_id_paket WHERE ps.status = 3 ORDER BY '.$name.' '.$order.'';

    }
    
    if($table == "GENCIJENE"){
       

        $upit = 'SELECT r.naziv AS Ruta, r.vrim_traj AS  "Vrijeme trajanja", r.kilometraza AS Kilometraza, k.naziv AS  "Kurirska sluzba", t.vrsta AS  "Vrsta dostave", c.cijena AS Cijena
FROM Tip_dostave t
LEFT JOIN Cjenik c ON t.id_tip = c.id_tipd
LEFT JOIN Ruta r ON c.id_rutaa = r.id_ruta
LEFT JOIN Kur_sluzba k ON r.id_kurs = k.id_kur 
WHERE r.naziv =  "'.$name.'" 
ORDER BY "Vrsta dostave"';
        
    }
    
    //NOVA TABLICA
    if($table == "PREUZIMANJE"){
        if(!isset($_SESSION)) 
            { 
                session_start(); 
            } 
            
            $upit = "Select p.id_paket as ID,p.grad_prim as Odrediste,p.id_topd as Dostava from Paket p RIGHT JOIN Paketi_status ps on p.id_paket=ps.Paket_id_paket where p.id_kurs= (Select k.id_kur AS 'ID' from Kur_sluzba k right join Djelatinici d on k.id_kur=d.id_kurs where d.id_kor='".$_SESSION['email']."') AND ps.status=1 ORDER BY ".$name." ".$order."";
            
    }
    
    if($table == "GENCIJENE_2"){
        $pomoc = isset($_POST['pomoc']) ? $_POST['pomoc'] : false;
        
        $upit = 'SELECT r.naziv AS Ruta, r.vrim_traj AS  "Vrijeme trajanja", r.kilometraza AS Kilometraza, k.naziv AS  "Kurirska sluzba", t.vrsta AS  "Vrsta dostave", c.cijena AS Cijena
FROM Tip_dostave t
LEFT JOIN Cjenik c ON t.id_tip = c.id_tipd
LEFT JOIN Ruta r ON c.id_rutaa = r.id_ruta
LEFT JOIN Kur_sluzba k ON r.id_kurs = k.id_kur 
WHERE r.naziv = "'.$pomoc.'"
ORDER BY  '.$name.' '.$order.'';
    }
    
    
    
    if($table == "POCETNA"){
        $upit ='Select k.id_kur as "Broj kur.s",k.naziv as "Naziv kur.s",r.id_ruta as "Broj rute",r.naziv as "Naziv rute" from Kur_sluzba k left join Ruta r on k.id_kur = r.id_kurs ORDER BY 1 '.$order.'';
    }
    
    if($table == "POCETNA" && $order==1){
        $upit='Select r.naziv ,r.kilometraza,r.vrim_traj,m.grad FROM Mjesto_primanja m LEFT JOIN Dostavne_lok ON m.id_mprim=Dostavne_lok.id_mprima left join Dio_rute ON Dostavne_lok.id_mprima=Dio_rute.id_dostavnog LEFT JOIN Ruta r ON Dio_rute.id_rute = r.id_ruta where r.id_ruta='.$name.' AND Dostavne_lok.status=1 GROUP BY m.grad ORDER BY Dio_rute.oznaka';
    }
    
    if($table == "AZURIRANJE"){
        if(!isset($_SESSION)) 
            { 
                session_start(); 
            } 
        
        $upit = "Select ps.Paket_id_paket as ID,p.naziv as naziv from Paket p RIGHT JOIN Paketi_status ps ON p.id_paket=ps.Paket_id_paket where ps.status=2 AND ps.id_kor='".$_SESSION['email']."' ";
        
    }
    
    if($table=="STATKUR"){
        $upit="Select k.naziv as Naziv, count(*) AS Broj from Paket p RIGHT JOIN Kur_sluzba k ON p.id_kurs=k.id_kur  group by id_kurs Order by ".$name." ".$order."";
    }
    
    if($table == "STATRUT"){
        $upit="Select r.naziv as Naziv,r.id_ruta as Ruta, count(*) AS Broj from Paketi_status ps LEFT JOIN Ruta r ON ps.id_rute=r.id_ruta WHERE ps.id_rute IS NOT NULL group by id_rute Order by ".$name." ".$order."";

    }
    
    if($table=="AZURIRANJE_2"){
        
        $upit= "Select m.grad AS grad,dr.oznaka as oznaka from Paketi_status as ps RIGHT JOIN Ruta r ON ps.id_rute=r.id_ruta RIGHT JOIN Dio_rute dr ON r.id_ruta=dr.id_rute RIGHT JOIN Dostavne_lok d ON dr.id_dostavnog=d.id_mprima RIGHT JOIN Mjesto_primanja m ON d.id_mprima=m.id_mprim where ps.Paket_id_paket=".$name." AND ps.status=2 AND d.status=1 GROUP by grad ORDER BY oznaka ASC";
        
    }
    
    if($table=="statmod1"){
        $do = isset($_POST['do']) ? $_POST['do'] : false;
        $od = isset($_POST['od']) ? $_POST['od'] : false;
        
        $upit = "Select k.naziv as Naziv,count(*) AS Broj from Paket p RIGHT JOIN Kur_sluzba k ON p.id_kurs=k.id_kur LEFT JOIN Paketi_status ps on p.id_paket=ps.Paket_id_paket where ps.datum_postavljanja between '".$od."' AND '".$do."' group by id_kurs Order by ".$name." ".$order."";
        
        }
    
    if($table=="statmod2"){
        $do = isset($_POST['do']) ? $_POST['do'] : false;
        $od = isset($_POST['od']) ? $_POST['od'] : false;
        
        if(!isset($_SESSION)) 
            { 
                session_start(); 
            } 
        
        $upit ="Select s.id_kors as Korisnik,count(*) AS Broj from Sudionici s LEFT JOIN Paket p ON s.id_paketa=p.id_paket LEFT JOIN Paketi_status ps on p.id_paket=ps.Paket_id_paket where (ps.datum_postavljanja between '".$od."' AND '".$do."') AND p.id_kurs=(Select k.id_kur AS 'ID' from Kur_sluzba k right join Djelatinici d on k.id_kur=d.id_kurs where d.id_kor='".$_SESSION['email']."') group by Korisnik Order by ".$name." ".$order."";
    }
       
    if($table=="statmod3"){
        $do = isset($_POST['do']) ? $_POST['do'] : false;
        $od = isset($_POST['od']) ? $_POST['od'] : false;
        
        if(!isset($_SESSION)) 
            { 
                session_start(); 
            } 
        
        $upit ="Select r.naziv as Naziv,r.id_ruta as Ruta, count(*) AS Broj from Paketi_status ps LEFT JOIN Ruta r ON ps.id_rute=r.id_ruta where ps.datum_postavljanja between '".$od."' AND '".$do."' group by id_rute Order by ".$name." ".$order."";
    }
    
    if($table=="adminstat"){
        $do = isset($_POST['do']) ? $_POST['do'] : false;
        $od = isset($_POST['od']) ? $_POST['od'] : false;
        
        $upit="Select r.id_kor as Korisnik,sum(case when opis='Uspjesna prijava!' then 1 else 0 end) as Uspjesne_prijave,sum(case when opis='Neuspjesna prijava!' then 1 else 0 end) as Neuspjesne_prijave,sum(case when (!(opis='Uspjesna prijava!' or opis='Neuspjesna prijava!')) then 1 else 0 end) as Ostalo,count(*) Ukupno from Radnje_baza r  where r.datum_rada between '".$od."' AND '".$do."' group by Korisnik Order by ".$name." ".$order."";
    }
    
    $podaci = $baza->selectUpit($upit);
    $j = 0;
        while($data = mysqli_fetch_field($podaci)) {
            $th[$j]  = $data->name;
            $j=$j+1;
        }


    $i = 0;
        while ($red = $podaci->fetch_array()){
            for($z=0;$z<$j;$z++){
            $response[$i][$th[$z]]  = $red[$th[$z]];
            }
            $i = $i+1;
        }

        if($response){
            return json_encode($response, JSON_NUMERIC_CHECK );
        }
        else{
            return false;
        }
}