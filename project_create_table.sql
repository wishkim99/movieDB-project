-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8 ;
USE `project` ;

-- -----------------------------------------------------
-- Table `project`.`Producer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`Producer` (
  `Pname` VARCHAR(15) NOT NULL,
  `Pssn` VARCHAR(45) NOT NULL,
  `Page` INT NULL,
  `Psex` VARCHAR(15) NULL,
  PRIMARY KEY (`Pssn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`Director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`Director` (
  `Dname` VARCHAR(15) NOT NULL,
  `Dssn` VARCHAR(45) NOT NULL,
  `Dage` INT NOT NULL,
  `Dsex` VARCHAR(15) NULL,
  PRIMARY KEY (`Dssn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`Actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`Actor` (
  `Aname` VARCHAR(15) NOT NULL,
  `Assn` VARCHAR(45) NOT NULL,
  `Age` INT NOT NULL,
  `Asex` VARCHAR(15) NULL,
  `Producer_Pssn(FK)` VARCHAR(45) NULL,
  `Director_Dssn(FK)` VARCHAR(45) NULL,
  PRIMARY KEY (`Assn`),
  INDEX `fk_Actor_Producer1_idx` (`Producer_Pssn(FK)` ASC) VISIBLE,
  INDEX `fk_Actor_Director1_idx` (`Director_Dssn(FK)` ASC) VISIBLE,
  CONSTRAINT `fk_Actor_Producer1`
    FOREIGN KEY (`Producer_Pssn(FK)`)
    REFERENCES `project`.`Producer` (`Pssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actor_Director1`
    FOREIGN KEY (`Director_Dssn(FK)`)
    REFERENCES `project`.`Director` (`Dssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`Movie` (
  `Mname` VARCHAR(45) NOT NULL,
  `Mssn` VARCHAR(45) NOT NULL,
  `Date` VARCHAR(45) NOT NULL,
  `Lead_actor_num` INT NOT NULL,
  `Pro_num` INT NOT NULL,
  `Direct_num` INT NOT NULL,
  `Actor_Assn` VARCHAR(45) NOT NULL,
  `Director_Dssn` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Mssn`),
  INDEX `fk_Movie_Actor1_idx` (`Actor_Assn` ASC) VISIBLE,
  INDEX `fk_Movie_Director1_idx` (`Director_Dssn` ASC) VISIBLE,
  CONSTRAINT `fk_Movie_Actor1`
    FOREIGN KEY (`Actor_Assn`)
    REFERENCES `project`.`Actor` (`Assn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_Director1`
    FOREIGN KEY (`Director_Dssn`)
    REFERENCES `project`.`Director` (`Dssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`Producer_has_Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`Producer_has_Movie` (
  `Producer_Pssn` VARCHAR(45) NOT NULL,
  `Movie_Mssn` VARCHAR(45) NOT NULL,
  INDEX `fk_Producer_has_Movie_Movie1_idx` (`Movie_Mssn` ASC) VISIBLE,
  INDEX `fk_Producer_has_Movie_Producer1_idx` (`Producer_Pssn` ASC) VISIBLE,
  CONSTRAINT `fk_Producer_has_Movie_Producer1`
    FOREIGN KEY (`Producer_Pssn`)
    REFERENCES `project`.`Producer` (`Pssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producer_has_Movie_Movie1`
    FOREIGN KEY (`Movie_Mssn`)
    REFERENCES `project`.`Movie` (`Mssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`Actor_has_Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`Actor_has_Movie` (
  `Actor_Assn` VARCHAR(45) NOT NULL,
  `Movie_Mssn` VARCHAR(45) NOT NULL,
  INDEX `fk_Actor_has_Movie_Movie1_idx` (`Movie_Mssn` ASC) VISIBLE,
  INDEX `fk_Actor_has_Movie_Actor1_idx` (`Actor_Assn` ASC) VISIBLE,
  CONSTRAINT `fk_Actor_has_Movie_Actor1`
    FOREIGN KEY (`Actor_Assn`)
    REFERENCES `project`.`Actor` (`Assn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actor_has_Movie_Movie1`
    FOREIGN KEY (`Movie_Mssn`)
    REFERENCES `project`.`Movie` (`Mssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
