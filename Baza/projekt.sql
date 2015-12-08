SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `Korisnik`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Korisnik` ;

CREATE TABLE IF NOT EXISTS `Korisnik` (
  `email` VARCHAR(25) NOT NULL,
  `ime` VARCHAR(25) NOT NULL,
  `prezime` VARCHAR(35) NOT NULL,
  `adresa` VARCHAR(45) NOT NULL,
  `grad` VARCHAR(20) NOT NULL,
  `kor_ime` VARCHAR(20) NOT NULL,
  `lozinka` VARCHAR(20) NOT NULL,
  `broj` VARCHAR(12) NULL,
  `datum_rod` DATE NOT NULL,
  `spol` VARCHAR(10) NOT NULL,
  `obavijesti` INT NOT NULL,
  `status` INT NOT NULL DEFAULT 0,
  `slika` VARCHAR(30) NULL,
  `akt_kod` VARCHAR(45) NOT NULL,
  `datum_reg` DATETIME NOT NULL,
  `broj_neusp` INT NULL,
  PRIMARY KEY (`email`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `kor_ime_UNIQUE` (`kor_ime` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Prijave`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Prijave` ;

CREATE TABLE IF NOT EXISTS `Prijave` (
  `id_pok` INT NOT NULL AUTO_INCREMENT,
  `id_kor` VARCHAR(25) NOT NULL,
  `datum_prijave` DATETIME NULL,
  `datum_odjave` DATETIME NULL,
  PRIMARY KEY (`id_pok`, `id_kor`),
  UNIQUE INDEX `id_pok_UNIQUE` (`id_pok` ASC),
  INDEX `fk_Prijave_Korisnik_idx` (`id_kor` ASC),
  CONSTRAINT `fk_Prijave_Korisnik`
    FOREIGN KEY (`id_kor`)
    REFERENCES `Korisnik` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Radnje_baza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Radnje_baza` ;

CREATE TABLE IF NOT EXISTS `Radnje_baza` (
  `id_baza` INT NOT NULL AUTO_INCREMENT,
  `id_kor` VARCHAR(25) NOT NULL,
  `datum_rada` DATETIME NOT NULL,
  `opis` LONGTEXT NOT NULL,
  PRIMARY KEY (`id_baza`, `id_kor`),
  UNIQUE INDEX `id_baza_UNIQUE` (`id_baza` ASC),
  INDEX `fk_Rad_baza_Korisnik1_idx` (`id_kor` ASC),
  CONSTRAINT `fk_Rad_baza_Korisnik1`
    FOREIGN KEY (`id_kor`)
    REFERENCES `Korisnik` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kur_sluzba`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kur_sluzba` ;

CREATE TABLE IF NOT EXISTS `Kur_sluzba` (
  `id_kur` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(20) NOT NULL,
  `ziro_racun` VARCHAR(25) NULL,
  `oib` VARCHAR(12) NULL,
  `status` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_kur`),
  UNIQUE INDEX `id_kur_UNIQUE` (`id_kur` ASC),
  UNIQUE INDEX `ziro_racun_UNIQUE` (`ziro_racun` ASC),
  UNIQUE INDEX `oib_UNIQUE` (`oib` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tip_dostave`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tip_dostave` ;

CREATE TABLE IF NOT EXISTS `Tip_dostave` (
  `id_tip` INT NOT NULL AUTO_INCREMENT,
  `vrsta` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_tip`),
  UNIQUE INDEX `id_tip_UNIQUE` (`id_tip` ASC),
  UNIQUE INDEX `vrsta_UNIQUE` (`vrsta` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ruta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ruta` ;

CREATE TABLE IF NOT EXISTS `Ruta` (
  `id_ruta` INT NOT NULL AUTO_INCREMENT,
  `id_kurs` INT NOT NULL,
  `naziv` VARCHAR(45) NOT NULL,
  `vrim_traj` TIME NOT NULL,
  `kilometraza` INT NOT NULL,
  `status` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_ruta`, `id_kurs`),
  UNIQUE INDEX `id_ruta_UNIQUE` (`id_ruta` ASC),
  INDEX `fk_Ruta_Kur_sluzba1_idx` (`id_kurs` ASC),
  CONSTRAINT `fk_Ruta_Kur_sluzba1`
    FOREIGN KEY (`id_kurs`)
    REFERENCES `Kur_sluzba` (`id_kur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cjenik`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cjenik` ;

CREATE TABLE IF NOT EXISTS `Cjenik` (
  `id_tipd` INT NOT NULL,
  `id_rutaa` INT NOT NULL,
  `id_kurs` INT NOT NULL,
  `cijena` FLOAT NOT NULL,
  PRIMARY KEY (`id_tipd`, `id_rutaa`, `id_kurs`),
  INDEX `fk_Cjenik_Tip_dostave1_idx` (`id_tipd` ASC),
  INDEX `fk_Cjenik_Ruta1_idx` (`id_rutaa` ASC, `id_kurs` ASC),
  CONSTRAINT `fk_Cjenik_Tip_dostave1`
    FOREIGN KEY (`id_tipd`)
    REFERENCES `Tip_dostave` (`id_tip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cjenik_Ruta1`
    FOREIGN KEY (`id_rutaa` , `id_kurs`)
    REFERENCES `Ruta` (`id_ruta` , `id_kurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Djelatinici`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Djelatinici` ;

CREATE TABLE IF NOT EXISTS `Djelatinici` (
  `id_kurs` INT NOT NULL,
  `id_kor` VARCHAR(25) NOT NULL,
  `status` INT NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_kurs`, `id_kor`),
  INDEX `fk_Djelatinici_Korisnik1_idx` (`id_kor` ASC),
  CONSTRAINT `fk_Djelatinici_Kur_sluzba1`
    FOREIGN KEY (`id_kurs`)
    REFERENCES `Kur_sluzba` (`id_kur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Djelatinici_Korisnik1`
    FOREIGN KEY (`id_kor`)
    REFERENCES `Korisnik` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gal_slik`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Gal_slik` ;

CREATE TABLE IF NOT EXISTS `Gal_slik` (
  `id_gal` INT NOT NULL,
  `slika1` VARCHAR(45) NOT NULL,
  `slika2` VARCHAR(45) NOT NULL,
  `slika3` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_gal`),
  UNIQUE INDEX `id_gal_UNIQUE` (`id_gal` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Paket` ;

CREATE TABLE IF NOT EXISTS `Paket` (
  `id_paket` INT NOT NULL AUTO_INCREMENT,
  `id_kurs` INT NOT NULL,
  `id_tipd` INT NOT NULL,
  `naziv` VARCHAR(30) NOT NULL,
  `tezina` FLOAT NULL,
  `visina` FLOAT NULL,
  `sirina` FLOAT NULL,
  `duzina` FLOAT NULL,
  `adresa_prim` VARCHAR(45) NOT NULL,
  `grad_prim` VARCHAR(20) NOT NULL,
  `adresa_pos` VARCHAR(45) NULL,
  `grad_pos` VARCHAR(20) NULL,
  `gal_slik` INT NULL,
  PRIMARY KEY (`id_paket`, `id_kurs`, `id_tipd`),
  UNIQUE INDEX `id_paket_UNIQUE` (`id_paket` ASC),
  INDEX `fk_Paket_Tip_dostave1_idx` (`id_tipd` ASC),
  INDEX `fk_Paket_Kur_sluzba1_idx` (`id_kurs` ASC),
  INDEX `fk_Paket_Gal_slik1_idx` (`gal_slik` ASC),
  UNIQUE INDEX `gal_slik_UNIQUE` (`gal_slik` ASC),
  CONSTRAINT `fk_Paket_Tip_dostave1`
    FOREIGN KEY (`id_tipd`)
    REFERENCES `Tip_dostave` (`id_tip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paket_Kur_sluzba1`
    FOREIGN KEY (`id_kurs`)
    REFERENCES `Kur_sluzba` (`id_kur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paket_Gal_slik1`
    FOREIGN KEY (`gal_slik`)
    REFERENCES `Gal_slik` (`id_gal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sudionici`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sudionici` ;

CREATE TABLE IF NOT EXISTS `Sudionici` (
  `id_kors` VARCHAR(25) NOT NULL,
  `id_paketa` INT NOT NULL,
  `status_s` INT NOT NULL,
  PRIMARY KEY (`id_kors`, `id_paketa`),
  INDEX `fk_Sudionici_Korisnik1_idx` (`id_kors` ASC),
  CONSTRAINT `fk_Sudionici_Paket1`
    FOREIGN KEY (`id_paketa`)
    REFERENCES `Paket` (`id_paket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sudionici_Korisnik1`
    FOREIGN KEY (`id_kors`)
    REFERENCES `Korisnik` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mjesto_primanja`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mjesto_primanja` ;

CREATE TABLE IF NOT EXISTS `Mjesto_primanja` (
  `id_mprim` INT NOT NULL AUTO_INCREMENT,
  `grad` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_mprim`),
  UNIQUE INDEX `id_mprim_UNIQUE` (`id_mprim` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dostavne_lok`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Dostavne_lok` ;

CREATE TABLE IF NOT EXISTS `Dostavne_lok` (
  `id_kurs` INT NOT NULL,
  `id_mprima` INT NOT NULL,
  `status` INT NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_kurs`, `id_mprima`),
  INDEX `fk_Dostavne_lok_Mjesto_primanja1_idx` (`id_mprima` ASC),
  CONSTRAINT `fk_Dostavne_lok_Kur_sluzba1`
    FOREIGN KEY (`id_kurs`)
    REFERENCES `Kur_sluzba` (`id_kur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dostavne_lok_Mjesto_primanja1`
    FOREIGN KEY (`id_mprima`)
    REFERENCES `Mjesto_primanja` (`id_mprim`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dio_rute`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Dio_rute` ;

CREATE TABLE IF NOT EXISTS `Dio_rute` (
  `id_diorute` INT NOT NULL AUTO_INCREMENT,
  `id_rute` INT NOT NULL,
  `id_kurs` INT NOT NULL,
  `id_dostavnog` INT NOT NULL,
  `oznaka` INT NOT NULL,
  PRIMARY KEY (`id_diorute`, `id_rute`, `id_kurs`, `id_dostavnog`),
  UNIQUE INDEX `id_dru_UNIQUE` (`id_diorute` ASC),
  INDEX `fk_Dio_rute_Ruta1_idx` (`id_rute` ASC, `id_kurs` ASC),
  INDEX `fk_Dio_rute_Dostavne_lok1_idx` (`id_dostavnog` ASC),
  CONSTRAINT `fk_Dio_rute_Ruta1`
    FOREIGN KEY (`id_rute` , `id_kurs`)
    REFERENCES `Ruta` (`id_ruta` , `id_kurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dio_rute_Dostavne_lok1`
    FOREIGN KEY (`id_dostavnog`)
    REFERENCES `Dostavne_lok` (`id_mprima`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dostava`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Dostava` ;

CREATE TABLE IF NOT EXISTS `Dostava` (
  `id_dostave` INT NOT NULL AUTO_INCREMENT,
  `id_kor` VARCHAR(25) NOT NULL,
  `id_rute` INT NOT NULL,
  `id_kurs` INT NOT NULL,
  `status` INT NULL DEFAULT 0,
  PRIMARY KEY (`id_dostave`, `id_kor`, `id_rute`, `id_kurs`),
  INDEX `fk_Dostava_Ruta1_idx` (`id_rute` ASC, `id_kurs` ASC),
  UNIQUE INDEX `id_dostave_UNIQUE` (`id_dostave` ASC),
  CONSTRAINT `fk_Dostava_Korisnik1`
    FOREIGN KEY (`id_kor`)
    REFERENCES `Korisnik` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dostava_Ruta1`
    FOREIGN KEY (`id_rute` , `id_kurs`)
    REFERENCES `Ruta` (`id_ruta` , `id_kurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dio_rute_tocke`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Dio_rute_tocke` ;

CREATE TABLE IF NOT EXISTS `Dio_rute_tocke` (
  `Dostava_id_dostave` INT NOT NULL,
  `Dostava_id_kor` VARCHAR(25) NOT NULL,
  `id_drutt` INT NOT NULL,
  `status` INT NOT NULL DEFAULT 0,
  `vrijeme` DATETIME NOT NULL,
  INDEX `fk_Dio_rute_tocke_Dio_rute1_idx` (`id_drutt` ASC),
  PRIMARY KEY (`Dostava_id_dostave`, `Dostava_id_kor`),
  CONSTRAINT `fk_Dio_rute_tocke_Dio_rute1`
    FOREIGN KEY (`id_drutt`)
    REFERENCES `Dio_rute` (`id_diorute`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dio_rute_tocke_Dostava1`
    FOREIGN KEY (`Dostava_id_dostave` , `Dostava_id_kor`)
    REFERENCES `Dostava` (`id_dostave` , `id_kor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paketi_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Paketi_status` ;

CREATE TABLE IF NOT EXISTS `Paketi_status` (
  `Dostava_id_dostave` INT NOT NULL,
  `Paket_id_paket` INT NOT NULL,
  `datum_postavljanja` DATETIME NULL,
  `datum_preuzimanja` DATETIME NULL,
  `datum_dostave` DATETIME NULL,
  `status` INT NOT NULL DEFAULT 0,
  INDEX `fk_Paketi_status_Dostava1_idx` (`Dostava_id_dostave` ASC),
  PRIMARY KEY (`Paket_id_paket`),
  UNIQUE INDEX `Paket_id_paket_UNIQUE` (`Paket_id_paket` ASC),
  CONSTRAINT `fk_Paketi_status_Dostava1`
    FOREIGN KEY (`Dostava_id_dostave`)
    REFERENCES `Dostava` (`id_dostave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paketi_status_Paket1`
    FOREIGN KEY (`Paket_id_paket`)
    REFERENCES `Paket` (`id_paket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
