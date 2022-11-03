-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema DW-2211-Team2_SalesOrders
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `DW-2211-Team2_SalesOrders` ;

-- -----------------------------------------------------
-- Schema DW-2211-Team2_SalesOrders
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DW-2211-Team2_SalesOrders` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema dw-2211-team2_salesorders
-- -----------------------------------------------------
USE `DW-2211-Team2_SalesOrders` ;

-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Customer_Dim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Customer_Dim` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Customer_Dim` (
  `Customer_SK` INT NOT NULL,
  `Customer_ID(NK)` INT NULL DEFAULT NULL,
  `Customer_Type` VARCHAR(45) NULL DEFAULT NULL,
  `Customer_Name` VARCHAR(45) NULL DEFAULT NULL,
  `Addr1` VARCHAR(45) NULL DEFAULT NULL,
  `Addr2` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` CHAR(2) NULL DEFAULT NULL,
  `Zip` CHAR(5) NULL DEFAULT NULL,
  `Company` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Customer_SK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Options_Junk`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Options_Junk` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Options_Junk` (
  `Options_SK` INT NOT NULL,
  `Transport_Method` VARCHAR(45) NULL DEFAULT NULL,
  `Payment_Method` VARCHAR(45) NULL DEFAULT NULL,
  `Ordering_Method` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Options_SK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Order_Date_Dim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Order_Date_Dim` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Order_Date_Dim` (
  `Order_Date_SK` INT NOT NULL,
  `Fiscal_Year` INT NULL DEFAULT NULL,
  `Fiscal_Quarter` INT NULL DEFAULT NULL,
  `Fiscal_Month` INT NULL DEFAULT NULL,
  `Fiscal_Week` INT NULL DEFAULT NULL,
  `Fiscal_Day` INT NULL DEFAULT NULL,
  `Calendar_Year` INT NULL DEFAULT NULL,
  `Calendar_Quarter` INT NULL DEFAULT NULL,
  `Calendar_Month` INT NULL DEFAULT NULL,
  `Calendar_Week` INT NULL DEFAULT NULL,
  `Calendar_Day` INT NULL DEFAULT NULL,
  `Order_Date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`Order_Date_SK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Sales_Date_Dim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Sales_Date_Dim` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Sales_Date_Dim` (
  `Sales_Date_SK` INT NOT NULL,
  `Fiscal_Year` INT NULL DEFAULT NULL,
  `Fiscal_Quarter` INT NULL DEFAULT NULL,
  `Fiscal_Month` INT NULL DEFAULT NULL,
  `Fiscal_Week` INT NULL DEFAULT NULL,
  `Fiscal_Day` INT NULL DEFAULT NULL,
  `Calendar_Year` INT NULL DEFAULT NULL,
  `Calendar_Quarter` INT NULL DEFAULT NULL,
  `Calendar_Month` INT NULL DEFAULT NULL,
  `Calendar_Week` INT NULL DEFAULT NULL,
  `Calendar_Day` INT NULL DEFAULT NULL,
  `Sales_Date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`Sales_Date_SK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Supplier_Dim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Supplier_Dim` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Supplier_Dim` (
  `Supplier_SK` INT NOT NULL,
  `Supplier_ID(NK)` INT NULL DEFAULT NULL,
  `Supplier_Name` VARCHAR(45) NULL DEFAULT NULL,
  `Addr1` VARCHAR(45) NULL DEFAULT NULL,
  `Addr2` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` CHAR(2) NULL DEFAULT NULL,
  `Zip` CHAR(5) NULL DEFAULT NULL,
  `Company` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Supplier_SK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Product_Dim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Product_Dim` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Product_Dim` (
  `Product_SK` INT NOT NULL,
  `Product_ID(NK)` INT NULL DEFAULT NULL,
  `Product_Type_Description` VARCHAR(45) NULL DEFAULT NULL,
  `Product_Description` VARCHAR(45) NULL DEFAULT NULL,
  `Business_Name` VARCHAR(45) NULL DEFAULT NULL,
  `Business_Abbrev` VARCHAR(45) NULL DEFAULT NULL,
  `Price1` DECIMAL(10,2) NULL DEFAULT NULL,
  `Price2` DECIMAL(10,2) NULL DEFAULT NULL,
  `Unit_Cost` DECIMAL(10,2) NULL DEFAULT NULL,
  `Company` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Product_SK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Look_Up`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Look_Up` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Look_Up` (
  `Look_Up_SK` INT NOT NULL,
  `Product_SK` INT NOT NULL,
  `Customer_SK` INT NOT NULL,
  PRIMARY KEY (`Look_Up_SK`, `Product_SK`, `Customer_SK`),
  INDEX `Customer_SK_idx` (`Customer_SK` ASC) VISIBLE,
  INDEX `Product_SK_idx` (`Product_SK` ASC) VISIBLE,
  CONSTRAINT `Customer_SK`
    FOREIGN KEY (`Customer_SK`)
    REFERENCES `DW-2211-Team2_SalesOrders`.`Customer_Dim` (`Customer_SK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Product_SK`
    FOREIGN KEY (`Product_SK`)
    REFERENCES `DW-2211-Team2_SalesOrders`.`Product_Dim` (`Product_SK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Financial_Analysis_Fact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Financial_Analysis_Fact` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Financial_Analysis_Fact` (
  `Supplier_SK` INT NOT NULL,
  `Sales_Date_SK` INT NOT NULL,
  `Invoice_ID(DD)` INT NOT NULL,
  `Order_Date_SK` INT NOT NULL,
  `Options_Junk_SK` INT NULL DEFAULT NULL,
  `Quantity` DECIMAL(8,2) NULL DEFAULT NULL,
  `Cost` DECIMAL(10,2) NULL DEFAULT NULL,
  `Profit` DECIMAL(10,2) NULL DEFAULT NULL,
  `Transportation_Cost` DECIMAL(10,2) NULL DEFAULT NULL,
  `Sales` DECIMAL(10,2) NULL DEFAULT NULL,
  `Discounted` TINYINT NULL DEFAULT NULL,
  `Look_Up_SK` INT NOT NULL,
  PRIMARY KEY (`Supplier_SK`, `Sales_Date_SK`, `Invoice_ID(DD)`, `Order_Date_SK`, `Look_Up_SK`),
  INDEX `Supplier_SK_idx` (`Supplier_SK` ASC) VISIBLE,
  INDEX `Sales_Date_SK_idx` (`Sales_Date_SK` ASC) VISIBLE,
  INDEX `Options_Junk_SK_idx` (`Options_Junk_SK` ASC) VISIBLE,
  INDEX `Order_Date_SK_idx` (`Order_Date_SK` ASC) VISIBLE,
  INDEX `fk_Financial_Analysis_Fact_Look_Up1_idx` (`Look_Up_SK` ASC) VISIBLE,
  CONSTRAINT `Options_Junk_SK`
    FOREIGN KEY (`Options_Junk_SK`)
    REFERENCES `DW-2211-Team2_SalesOrders`.`Options_Junk` (`Options_SK`),
  CONSTRAINT `Order_Date_SK`
    FOREIGN KEY (`Order_Date_SK`)
    REFERENCES `DW-2211-Team2_SalesOrders`.`Order_Date_Dim` (`Order_Date_SK`),
  CONSTRAINT `Sales_Date_SK`
    FOREIGN KEY (`Sales_Date_SK`)
    REFERENCES `DW-2211-Team2_SalesOrders`.`Sales_Date_Dim` (`Sales_Date_SK`),
  CONSTRAINT `Supplier_SK`
    FOREIGN KEY (`Supplier_SK`)
    REFERENCES `DW-2211-Team2_SalesOrders`.`Supplier_Dim` (`Supplier_SK`),
  CONSTRAINT `fk_Financial_Analysis_Fact_Look_Up1`
    FOREIGN KEY (`Look_Up_SK`)
    REFERENCES `DW-2211-Team2_SalesOrders`.`Look_Up` (`Look_Up_SK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
