-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Customer` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(255) NOT NULL,
  `Segment` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Order` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `OrderPriority` VARCHAR(45) NOT NULL,
  `Customer_CustomerID` INT NOT NULL,
  `Product_ProductID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Order_Customer1_idx` (`Customer_CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`Customer_CustomerID`)
    REFERENCES `mydb`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Ship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Ship` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Ship` (
  `ShipDate` DATETIME NOT NULL,
  `ShipMode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ShipDate`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Address` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `City` VARCHAR(255) NOT NULL,
  `State` VARCHAR(45) NULL,
  PRIMARY KEY (`City`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Geo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Geo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Geo` (
  `Market` VARCHAR(20) NOT NULL,
  `Region` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Market`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Product` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Product` (
  `ProductID` VARCHAR(20) NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `SubCategory` VARCHAR(45) NOT NULL,
  `ProductName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Sales` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Sales` (
  `Sales` DECIMAL(2) NOT NULL,
  `Quantity` INT NOT NULL,
  `Address_City` VARCHAR(255) NOT NULL,
  `Product_ProductID` VARCHAR(20) NOT NULL,
  `Order_OrderID` INT NOT NULL,
  PRIMARY KEY (`Sales`),
  INDEX `fk_Sales_Address1_idx` (`Address_City` ASC) VISIBLE,
  INDEX `fk_Sales_Product1_idx` (`Product_ProductID` ASC) VISIBLE,
  INDEX `fk_Sales_Order1_idx` (`Order_OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_Sales_Address1`
    FOREIGN KEY (`Address_City`)
    REFERENCES `mydb`.`Address` (`City`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_Product1`
    FOREIGN KEY (`Product_ProductID`)
    REFERENCES `mydb`.`Product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_Order1`
    FOREIGN KEY (`Order_OrderID`)
    REFERENCES `mydb`.`Order` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
