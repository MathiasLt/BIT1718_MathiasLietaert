-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Exercise9:Med_Gen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercise9:Med_Gen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercise9:Med_Gen` DEFAULT CHARACTER SET utf8 ;
USE `Exercise9:Med_Gen` ;

-- -----------------------------------------------------
-- Table `Exercise9:Med_Gen`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise9:Med_Gen`.`Syndrome` (
  `idSyndrome` INT NOT NULL,
  `Syndrome_Name` VARCHAR(45) NULL,
  `Syndrome_Description` VARCHAR(45) NULL,
  PRIMARY KEY (`idSyndrome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise9:Med_Gen`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise9:Med_Gen`.`Gene` (
  `idGene` INT NOT NULL,
  `Gene_name` VARCHAR(45) NULL,
  `Gene_description` VARCHAR(45) NULL,
  `start` INT UNSIGNED NULL,
  `end` INT UNSIGNED NULL,
  `Mutation` INT NULL,
  PRIMARY KEY (`idGene`),
  INDEX `fk_Mutation_idx` (`Mutation` ASC),
  CONSTRAINT `fk_Mutation`
    FOREIGN KEY (`Mutation`)
    REFERENCES `Exercise9:Med_Gen`.`Syndrome` (`idSyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise9:Med_Gen`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise9:Med_Gen`.`Patient` (
  `idPatient` INT NOT NULL,
  `Patient_Name` VARCHAR(45) NULL,
  `Patient_Gender` ENUM('M', 'F') NULL,
  `Patient_Age` INT(3) NULL,
  `Syndrome` INT NULL,
  PRIMARY KEY (`idPatient`),
  INDEX `fk_Syndrome_idx` (`Syndrome` ASC),
  CONSTRAINT `fk_Syndrome`
    FOREIGN KEY (`Syndrome`)
    REFERENCES `Exercise9:Med_Gen`.`Syndrome` (`idSyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
