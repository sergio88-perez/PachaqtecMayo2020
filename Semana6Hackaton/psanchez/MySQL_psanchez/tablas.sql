-- MySQL Script generated by MySQL Workbench
-- Mon Jul  6 14:44:00 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hackathons6
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hackathons6` ;

-- -----------------------------------------------------
-- Schema hackathons6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hackathons6` DEFAULT CHARACTER SET utf8 ;
USE `hackathons6` ;

-- -----------------------------------------------------
-- Table `hackathons6`.`clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hackathons6`.`clientes` ;

CREATE TABLE IF NOT EXISTS `hackathons6`.`clientes` (
  `idclientes` INT NOT NULL AUTO_INCREMENT,
  `nombrecliente` VARCHAR(45) NOT NULL,
  `nroidentificacioncliente` VARCHAR(45) NOT NULL,
  `direccioncliente` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hackathons6`.`empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hackathons6`.`empresa` ;

CREATE TABLE IF NOT EXISTS `hackathons6`.`empresa` (
  `idempresa` INT NOT NULL,
  `rucempresa` VARCHAR(45) NOT NULL,
  `nombreempresa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idempresa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hackathons6`.`tipodepago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hackathons6`.`tipodepago` ;

CREATE TABLE IF NOT EXISTS `hackathons6`.`tipodepago` (
  `idtipodepago` INT NOT NULL,
  `desctipopago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipodepago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hackathons6`.`faccabecera`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hackathons6`.`faccabecera` ;

CREATE TABLE IF NOT EXISTS `hackathons6`.`faccabecera` (
  `idfaccabecera` INT NOT NULL,
  `idempresa` INT NOT NULL,
  `idcliente` INT NOT NULL,
  `fechafaccabecera` DATETIME NOT NULL,
  `igvfaccabecera` DECIMAL(18,2) NOT NULL,
  `subtotalfaccabecera` DECIMAL(18,2) NOT NULL,
  `totalfaccabecera` DECIMAL(18,2) NOT NULL,
  `estadofactura` CHAR(1) NOT NULL,
  `tipodpgo` INT NOT NULL,
  PRIMARY KEY (`idfaccabecera`),
  INDEX `fk_faccabecera_clientes1_idx` (`idcliente` ASC) VISIBLE,
  INDEX `fk_facCabecera_tipoPago1_idx` (`tipodpgo` ASC) VISIBLE,
  CONSTRAINT `fk_faccabecera_clientes1`
    FOREIGN KEY (`idcliente`)
    REFERENCES `hackathons6`.`clientes` (`idclientes`),
  CONSTRAINT `fk_faccabecera_empresa1_idx`
    FOREIGN KEY (`idfaccabecera`)
    REFERENCES `hackathons6`.`empresa` (`idempresa`),
  CONSTRAINT `fk_facCabecera_tipoPago1`
    FOREIGN KEY (`tipodpgo`)
    REFERENCES `hackathons6`.`tipodepago` (`idtipodepago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hackathons6`.`productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hackathons6`.`productos` ;

CREATE TABLE IF NOT EXISTS `hackathons6`.`productos` (
  `idproductos` INT NOT NULL,
  `nombreproducto` VARCHAR(45) NOT NULL,
  `valorproducto` DECIMAL(18,2) NOT NULL,
  `igvproducto` TINYINT NOT NULL,
  PRIMARY KEY (`idproductos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hackathons6`.`facdetalle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hackathons6`.`facdetalle` ;

CREATE TABLE IF NOT EXISTS `hackathons6`.`facdetalle` (
  `idfacdetalle` INT NOT NULL,
  `idfaccabecera` INT NOT NULL,
  `idproducto` INT NOT NULL,
  `cantfacdetalle` INT NOT NULL,
  `valorfacdetalle` DECIMAL(18,2) NOT NULL,
  PRIMARY KEY (`idfacdetalle`),
  INDEX `fk_facdetalle_productos1_idx` (`idproducto` ASC) VISIBLE,
  INDEX `fk_facdetalle_faccabecera_idx` (`idfaccabecera` ASC) VISIBLE,
  CONSTRAINT `fk_facdetalle_faccabecera`
    FOREIGN KEY (`idfaccabecera`)
    REFERENCES `hackathons6`.`faccabecera` (`idfaccabecera`),
  CONSTRAINT `fk_facdetalle_productos1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `hackathons6`.`productos` (`idproductos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;