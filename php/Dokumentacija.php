<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../Smarty/libs/Smarty.class.php';
include_once '../php/greske.php';
Smarty::muteExpectedErrors();

$smarty = new Smarty();


$tablica = '
    <article>
        <h1>Dokumentacija</h1>
        <h3>Opis projektnog zadatka</h3>
        <br><h4>Kratak opis:</h4>
        <p>Kratak opis projekta:

Sustav služi za praćenje dostavnih paketa kurirske službe.<br>
<h5>Uloge:<h5>
<ol>
<li>Neregistrirani korisnik</li>
<li>Registrirani korisnik</li>
<li>Poštar (Moderator)</li>
<li>Administrator</li>

</ol>

  <h4>Detaljne upute:</h4>
            <b>Administrator:</b>
<ul>
            
            <li>Kreira kurirske službe čije usluge su mogu koristiti za dostavu paketa te im dodjeljuje poštare.</li>
            <li>Administrator vidi statistiku korištenja sustava, pogrešnih/ispravnih prijava, po korisnicima i
vremenskom periodu (od - do).</li>
            <li>Definira mjesta slanja i primanja (lokacije su ograničene na gradove).</li>
            <li>Vidi popis svih neisporučenih paketa i može okinuti slanje maila dotičnim korisnicima.</li>
        </ul>
            
            <b>Poštar:</b>
<ul>
            
            <li>Određuje na koje lokacije dostavlja služba u kojoj je zaposlen.</li>
            <li>Definira rute, put između odredišta i polazišta opisan setom prolaznih mjesta. Za svaku rutu
za koju ima dostavu definira vrijeme trajanja dostave, kilometražu te cijenu dostave prema
tipu (obična dostava, brza i posebna dostava).</li>
            <li>Dobiva zahtjev za dostavu paketa i preuzima paket. Prilikom preuzimanja opisuje paket.
Paket se opisuje imenom, težinom, visina, širina, dužina, galerija slika (min 3) . Pratiti stanje
paketa koje je ili poslao ili koje očekuje.</li>
            <li>Svaki put kada dođe do označene točke na ruti označava je kao prijeđenu. Prilikom dolaska
do konačne adrese označava paket kao isporučen ili kao neisporučen (ukoliko nije preuzet
paket).</li>
            <li>Poštar vidi statistiku koliko je paketa poslano po kojoj kurirskoj službi, vidi naj aktivnije
korisnike unutar svoje službe (koji najviše šalju ili primaju pakete) i najkorištenije rute. I svi
pregledi se baziraju na vremenskom periodu (od - do).</li>
        </ul>

            <b>Registrirani korisnik</b>
<ul>
            
            <li>Može pretraživati rute od početne do odredišne adrese. Uspoređivati troškova slanja između
dviju lokacija za različite kurirske službe (ukoliko više od jedne nudi slanje prema istoj
lokaciji).</li>
            <li>Slati pakete uz definiranje primatelja (adresa odredišta se automatski preuzima), kurirske
službe i vrste dostave.</li>
            <li>Može vidjeti statistiku korištenih kurirskih službi i ruta.
Neregistrirani korisnik – može vidjeti popis kurirskih službi sa rutama na kojima šalju pakete.</li>
            
        </ul>
            
            <b>Neregistrirani korisnik</b>
<ul>
            
            <li>Može vidjeti popis kurirskih službi sa rutama na kojima šalju pakete.</li>
            
            
        </ul>
<h4>Opis projektnog rješenja</h4>

<p>Cijeli sustav se sastoji od pet stranica (user.php,greske.php,htkorisnici.php,Dokumentacija.php,pocetna.php). 
    Sustav je realiziran programima koje smo učili tokom kolegija, kao što su: CSS,HTML,Jquery,Javascript,Smarty,Php...
    Također uz korištenje nekoliko dodataka (DataTables...).
    Sustav je zamišljen kao eDostave, gdje imamo 4 uloge koje imaju svoje funkcionalnosti zadane kroz prethodno navedeni tekst, gdje je
    bilo potrebno odvojiti pristup istim ovisno o ovlastima. Veća ovlast ima viću kontrolu nad aplikacijom i samom web stranicom.
    Skladištenje podataka je realizirano putem mySql baze podataka, kojoj pristupamo preko skripte ili  za potrebe dorađivanja preko phpmyadmina
    sa prethodno dobivenim korisničkim podacima. Korišten je HTML API obrađen na seminarskoj nastavi FileReader kod funkcionalnosti (preuzmianje paketa - moderator).
</p>

<h3>ERA model</h3>
<div class="container">
<img class="img-responsive" alt="era" src="../Baza/projekt.png" >
</div>
    
    
    <h3>Navigacijski dijagram</h3>
<div class="container">
<img class="img-responsive" alt="navigacijski dijagram" src="../Baza/navi.jpg" >
</div>

<h3>Popis i opis skripti</h3>
<h4>Javascript datoteke:</h4>
<b>bootstrap.js</b> - bootstrapova javascript datoteka. <br>
<b>jquery-1.10.2.js</b> - jquery biblioteka. <br>
<b>bootstrap-dtp.js</b> - dodatak jqueryu za odabir datuma i/li vremena. <br>
<b>bootstrap-dtp-hr</b> - prijevod na hrvatski jezik za dodatak Datepicker. <br>
<b>custom.js</b> - biblioteka kao podrška predlošku dizajna. <br>
<b>dataTables.tableTools.js</b> - dodatak Datatable-u za izvoz stranice u raznim oblicima(formatima). <br>
<b>exporting.js</b> - dodatak za izvoz grafa u raznim oblicima(formatima). <br>
<b>highcharts.js</b> - jquery dodatak za generiranje grafova. <br>
<b>moment.js</b> - jquery dodatak nužan za funkcionalnost dataTAbles.tableTools-a. <br>
<b>POCETNA.js</b> - služi za generiranje tablice s popisom kurirskih službi i njenih ruta, te opis ruta po kliku. <br>
<b>dinamikuser.js</b> - služi za generiranje konfiguracijskog sadržaja i ajax poziva za spremanje postavki. <br>
<b>formattablica.js</b> - glavna datoteka funkcionalnosti odnosno modelinga gdje  prikazujemo sav sadržaj koji se generira korisniku ovisno o njegovim ovlastima. <br>
<b>validacija_klient.js</b> - datoteka koja služi za validaciju unosa podataka pri registraciji. <br>

<h4>PHP skripte:</h4>

<b>Dokumentacija.php</b> - kreira sadržaj dokumentacije.<br>
<b>Smarty.php</b> - postavlja Smarty parametre.<br>
<b>aktivacija.php</b> - aktiviranje korisničkog računa.<br>
<b>azuriranje.php</b> - služi za ažuriranje trenutne lokacije paketa (točka rute).<br>
<b>baza.class.php</b> - klasa koja nam nudi set metoda za izvršavanje upita i spajanje s bazom podataka.<br>
<b>config.php</b> - služi za unos konfiguracijskih psotavki u config.json datoteku.<br>
<b>dodaj.php</b> - dodavanje ili izmjena podataka nakon obavljenje operacije kod administrator uloge nad CRUD kontroli.<br>
<b>dodjela.php</b> - dodjeljivanje nezaposlenih moderatora kurirskim službama.<br>
<b>dostavnelokacije.php</b> - upiti nad bazom koji nam služe za vraćanje dostavnih lokacija,mjesta primanja i unos istih u bazu.<br>
<b>kreiranjepaketa.php</b> - unosi u potrebne tablice prilikom kreiranja paketa.<br>
<b>log.php</b> - funkcije za unos radnji i prijava u bazu podataka, te vraćanja virtualnog vremena.<br>
<b>lostpw.php</b> - služi za slanje emaila korisniku koji je zaboravio lozinku kako bismo mu je mogli na njegovu potvrdu generirati.<br>
<b>modd.php</b> - slanje notifikacijskog emaila dotičnim korisnicima.<br>
<b>odjava.php</b> - zapis u bazu podataka i odjava s sustava.<br>
<b>opis_paket.php</b> - unosi vezani uz paket prilikom preuzimanja.<br>
<b>otkljucaj.php</b> - otključavanje i zaključavanje korisničkog računa.<br>
<b>pocetna.php</b> - služi za formatiranje ispisa stranice i validacije registracije sa strane servera.<br>
<b>prijava.php</b> - autentikacija na sustav, kreiranje cookie-a i sessiona.<br>
<b>provjera_kor_ime.php</b> - provjera zauzetosti korisničkog imena i emaila prilikom registracije.<br>
<b>recaptchalib.php</b> - vanjska datoteka za responzivnu recaptchu.<br>
<b>resetpw.php</b> - skripta koja dodijeluje novu lozinku korisnicima.<br>
<b>rute_dod.php</b> - unosi u bazu podataka prilikom kreiranja rute.<br>
<b>sorttable.php</b> - skripta koja služi za sortiranje svih tabličnih prikaza i vraćanje podataka o istima ajaxu koji ih prikazuje.<br>
<b>user.php</b> - skripta koja generira izbornike i podizbornike ovisno i ovlasti prijavljenog korisnika.<br>
<b>htkorisnici.php</b> - skirpta za generiranje i tablični prikaz htaccess korisnika.<br>
<b>index.php</b> - služi za preusmjerenje na pocetna.php.<br>

<h4>Smarty template:</h4>

<b>greske.tpl</b> - prikazuje sadržaj greške.<br>
<b>user.tpl</b> - prikazuje korisničko sučelje.<br>



<h4>Popis i opis korištenih tehnologija i alata</h4>

<b>Programski jezici i tehnologije:</b> HTML5, CSS3, JavaScript(jQuery), PHP i Smarty. <br>
<b>Formati datoteka:</b> JSON. <br>
<b>Alati:</b> Netbeans IDE 7.4, MySQL Workbench 6.0 CE, Opera, Chrome, notepad++, WinSCP. <br>


<h4>Popis i vanjskih (tuđih) modula/biblioteka i njihovo korištenje u skriptama i sl.</h4>    
<b>Bootstrap</b> - dizajn čitavog projekta je napravljen prema bootstrap klasama i js. Korišten je Landing page s hxxp://startbootstrap.com/landing-page stranice uz male vlastite modifikacije <br>
<b>jquery</b> - koristio sam jquery biblioteku. <br>
<b>Highcharts</b> - javascript API za grafove. <br>
<b>DateTimePicker</b> - jquery plugin za odabir datum,vremena. <br>
<b>Datatable</b> - plugin za tablice. <br>
<b>DatatableTabletools</b> - plugin za tablice. <br>
<b>Smarty</b> - php template engine. <br>
<b>Responsive recaptcha</b> - plugin za responzivnu google recaptchu s hxxp://jaicab.github.io/responsive-reCAPTCHA/. <br>


<h3>Opis završenosti projekta</h3>

Projekt sadrži sve funkcionalnosti, uz naglasak da Smarty nije upotpunosti korišten (većina php skripti je neovisna o Smarty-u) zbog toga
jer sam nastojao da aplikacija (stranica) bude što je više moguće dinamična (eng. single page). Print dialozi i generiranje PDF dokumenata kod statistika se mogu kreirati uz uključene module
te stoga nisam samostalno radio funkciju za te funkcionalnosti.


    </article>
        ';




$smarty->assign('DODAJ', $tablica);
$smarty->display('../Smarty/templates/user.tpl');