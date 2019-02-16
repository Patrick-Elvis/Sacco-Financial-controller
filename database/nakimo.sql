-- MySQL Script generated by MySQL Workbench
-- Sat Jan 19 11:41:35 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Nakimo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Nakimo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Nakimo` DEFAULT CHARACTER SET utf8 ;
USE `Nakimo` ;

-- -----------------------------------------------------
-- Table `Nakimo`.`Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Nakimo`.`Account` (
  `Account_ID` VARCHAR(20) NOT NULL,
  `First_Name` VARCHAR(50) NULL,
  `Last_Name` VARCHAR(50) NULL,
  `Surname_Name` VARCHAR(50) NULL,
  `National_ID` VARCHAR(15) NULL,
  `Gender` VARCHAR(20) NULL,
  `D.O.B` DATETIME NULL,
  PRIMARY KEY (`Account_ID`),
  UNIQUE INDEX `Account_ID_UNIQUE` (`Account_ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nakimo`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Nakimo`.`Employee` (
  `Employee_ID` VARCHAR(100) NOT NULL,
  `First_Name` VARCHAR(45) NULL,
  `Last_Name` VARCHAR(45) NULL,
  `Email` VARCHAR(100) NULL,
  `Password` VARCHAR(50) NULL,
  `Occupation` VARCHAR(45) NULL,
  `Admin` BOOLEAN NOT NULL,
  PRIMARY KEY (`Employee_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nakimo`.`Transcations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Nakimo`.`Transcations` (
  `id` INT NOT NULL,
  `Employee_Employee_ID` VARCHAR(100) NOT NULL,
  `Account_Account_ID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`, `Employee_Employee_ID`, `Account_Account_ID`),
  INDEX `fk_Transcations_Employee_idx` (`Employee_Employee_ID` ASC),
  INDEX `fk_Transcations_Account1_idx` (`Account_Account_ID` ASC),
  CONSTRAINT `fk_Transcations_Employee`
    FOREIGN KEY (`Employee_Employee_ID`)
    REFERENCES `Nakimo`.`Employee` (`Employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transcations_Account1`
    FOREIGN KEY (`Account_Account_ID`)
    REFERENCES `Nakimo`.`Account` (`Account_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nakimo`.`Loans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Nakimo`.`Loans` (
  `Loan_ID` VARCHAR(100) NOT NULL,
  `Amount` INT NOT NULL,
  `Date_Issued` DATETIME NULL,
  `rate` DOUBLE NULL,
  `Account_Account_ID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Loan_ID`, `Account_Account_ID`),
  INDEX `fk_Loans_Account1_idx` (`Account_Account_ID` ASC),
  CONSTRAINT `fk_Loans_Account1`
    FOREIGN KEY (`Account_Account_ID`)
    REFERENCES `Nakimo`.`Account` (`Account_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
