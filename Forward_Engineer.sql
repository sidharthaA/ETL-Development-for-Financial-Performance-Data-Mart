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
DROP SCHEMA IF EXISTS `dw-2211-team2_salesorders` ;

-- -----------------------------------------------------
-- Schema dw-2211-team2_salesorders
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dw-2211-team2_salesorders` ;
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
-- Table `DW-2211-Team2_SalesOrders`.`Customer_Intermedeate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Customer_Intermedeate` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Customer_Intermedeate` (
  `Customer_ID(NK)` INT NOT NULL,
  `Customer_Type` VARCHAR(45) NULL DEFAULT NULL,
  `Customer_Name` VARCHAR(45) NULL DEFAULT NULL,
  `Addr1` VARCHAR(45) NULL DEFAULT NULL,
  `Addr2` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(45) NULL DEFAULT NULL,
  `Zip` INT NULL DEFAULT NULL,
  `Company` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customer_ID(NK)`, `Company`))
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
-- Table `DW-2211-Team2_SalesOrders`.`Financial_Analysis_Fact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Financial_Analysis_Fact` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Financial_Analysis_Fact` (
  `Customer_SK` INT NOT NULL,
  `Product_SK` INT NOT NULL,
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
  PRIMARY KEY (`Customer_SK`, `Product_SK`, `Supplier_SK`, `Sales_Date_SK`, `Invoice_ID(DD)`, `Order_Date_SK`),
  INDEX `Product_SK_idx` (`Product_SK` ASC) VISIBLE,
  INDEX `Supplier_SK_idx` (`Supplier_SK` ASC) VISIBLE,
  INDEX `Sales_Date_SK_idx` (`Sales_Date_SK` ASC) VISIBLE,
  INDEX `Options_Junk_SK_idx` (`Options_Junk_SK` ASC) VISIBLE,
  INDEX `Order_Date_SK_idx` (`Order_Date_SK` ASC) VISIBLE,
  CONSTRAINT `Customer_SK`
    FOREIGN KEY (`Customer_SK`)
    REFERENCES `DW-2211-Team2_SalesOrders`.`Customer_Dim` (`Customer_SK`),
  CONSTRAINT `Options_Junk_SK`
    FOREIGN KEY (`Options_Junk_SK`)
    REFERENCES `DW-2211-Team2_SalesOrders`.`Options_Junk` (`Options_SK`),
  CONSTRAINT `Order_Date_SK`
    FOREIGN KEY (`Order_Date_SK`)
    REFERENCES `DW-2211-Team2_SalesOrders`.`Order_Date_Dim` (`Order_Date_SK`),
  CONSTRAINT `Product_SK`
    FOREIGN KEY (`Product_SK`)
    REFERENCES `DW-2211-Team2_SalesOrders`.`Product_Dim` (`Product_SK`),
  CONSTRAINT `Sales_Date_SK`
    FOREIGN KEY (`Sales_Date_SK`)
    REFERENCES `DW-2211-Team2_SalesOrders`.`Sales_Date_Dim` (`Sales_Date_SK`),
  CONSTRAINT `Supplier_SK`
    FOREIGN KEY (`Supplier_SK`)
    REFERENCES `DW-2211-Team2_SalesOrders`.`Supplier_Dim` (`Supplier_SK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Financial_Analysis_Intermediary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Financial_Analysis_Intermediary` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Financial_Analysis_Intermediary` (
  `Customer_SK` INT NOT NULL,
  `Product_SK` INT NOT NULL,
  `Supplier_SK` INT NOT NULL,
  `Order_Date_SK` INT NULL DEFAULT NULL,
  `Sales_Date_SK` INT NOT NULL,
  `Quantity` DECIMAL(8,2) NULL DEFAULT NULL,
  `Cost` DECIMAL(10,2) NULL DEFAULT NULL,
  `Profit` DECIMAL(10,2) NULL DEFAULT NULL,
  `Transportation_Cost` DECIMAL(10,2) NULL DEFAULT NULL,
  `Sales` DECIMAL(10,2) NULL DEFAULT NULL,
  `Discounted` TINYINT NULL DEFAULT NULL,
  `Options_Junk_SK` INT NULL DEFAULT NULL,
  `Invoice_ID(DD)` INT NULL DEFAULT NULL,
  `Unit_Cost` DECIMAL(10,2) NULL DEFAULT NULL,
  `Price1` DECIMAL(10,2) NULL DEFAULT NULL,
  `Price2` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`Customer_SK`, `Supplier_SK`, `Product_SK`, `Sales_Date_SK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Invoice_Intermediate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Invoice_Intermediate` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Invoice_Intermediate` (
  `InvoiceId` INT NULL DEFAULT NULL,
  `CustID` INT NULL DEFAULT NULL,
  `SalesDate` DATETIME NULL DEFAULT NULL,
  `Year` INT NULL DEFAULT NULL,
  `Month` INT NULL DEFAULT NULL,
  `ProdId` INT NULL DEFAULT NULL,
  `Amt` INT NULL DEFAULT NULL,
  `Qty` INT NULL DEFAULT NULL,
  `ShipMethod` VARCHAR(45) NULL DEFAULT NULL,
  `ShipCost` DECIMAL(10,2) NULL DEFAULT NULL,
  `PaymentMethod` VARCHAR(45) NULL DEFAULT NULL,
  `OrderMethod` VARCHAR(45) NULL DEFAULT NULL,
  `OrderDate` DATETIME NULL DEFAULT NULL,
  `Discounted` TINYINT(1) NULL DEFAULT NULL,
  `Invoice_SK` INT NOT NULL,
  PRIMARY KEY (`Invoice_SK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Manufacturing_Costs_Intermediate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Manufacturing_Costs_Intermediate` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Manufacturing_Costs_Intermediate` (
  `Year` INT NOT NULL,
  `Month` INT NOT NULL,
  `ProdID` INT NOT NULL,
  `Manufacturing_Costs` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Year`, `Month`, `ProdID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Product_Intermedeary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Product_Intermedeary` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Product_Intermedeary` (
  `Product_ID(NK)` INT NULL DEFAULT NULL,
  `Company` VARCHAR(45) NULL DEFAULT NULL,
  `Product_Type_Description` VARCHAR(45) NULL DEFAULT NULL,
  `Product_Description` VARCHAR(45) NULL DEFAULT NULL,
  `Business_Name` VARCHAR(45) NULL DEFAULT NULL,
  `Business_Abbrev` VARCHAR(45) NULL DEFAULT NULL,
  `Price1` DECIMAL(10,2) NULL DEFAULT NULL,
  `Price2` DECIMAL(10,2) NULL DEFAULT NULL,
  `Unit_Cost` DECIMAL(10,2) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Product_Intermedeary_PEC`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Product_Intermedeary_PEC` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Product_Intermedeary_PEC` (
  `Product_ID(NK)` INT NOT NULL,
  `Product_Type_Description` VARCHAR(45) NULL DEFAULT NULL,
  `Product_Description` VARCHAR(45) NULL DEFAULT NULL,
  `Business_Name` VARCHAR(45) NULL DEFAULT NULL,
  `Business_Abbrev` VARCHAR(45) NULL DEFAULT NULL,
  `Price1` DECIMAL(10,2) NULL DEFAULT NULL,
  `Price2` DECIMAL(10,2) NULL DEFAULT NULL,
  `Unit_Cost` DECIMAL(10,2) NULL DEFAULT NULL,
  `Supplier_Name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Product_ID(NK)`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Sales_Date_Intermedate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Sales_Date_Intermedate` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Sales_Date_Intermedate` (
  `Fiscal_Year` INT NULL DEFAULT NULL,
  `Fiscal_Quarter` INT NULL DEFAULT NULL,
  `Fiscal_Month` INT NULL DEFAULT NULL,
  `Fiscal_Week` INT NULL DEFAULT NULL,
  `Fiscal_Day` INT NULL DEFAULT NULL,
  `Calendar_Year` INT NULL DEFAULT NULL,
  `Calendar_Quarter` VARCHAR(45) NULL DEFAULT NULL,
  `Calendar_Month` INT NULL DEFAULT NULL,
  `Calendar_Week` INT NULL DEFAULT NULL,
  `Calendar_Day` INT NULL DEFAULT NULL,
  `Sales_Date` DATETIME NULL DEFAULT NULL,
  `Company` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `DW-2211-Team2_SalesOrders`.`Supplier_Intermediate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DW-2211-Team2_SalesOrders`.`Supplier_Intermediate` ;

CREATE TABLE IF NOT EXISTS `DW-2211-Team2_SalesOrders`.`Supplier_Intermediate` (
  `Supplier_ID(NK)` INT NOT NULL,
  `Supplier_Name` VARCHAR(45) NULL DEFAULT NULL,
  `Addr1` VARCHAR(45) NULL DEFAULT NULL,
  `Addr2` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(45) NULL DEFAULT NULL,
  `Zip` INT NULL DEFAULT NULL,
  `Company` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Supplier_ID(NK)`, `Company`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `dw-2211-team2_salesorders` ;
USE `dw-2211-team2_salesorders` ;

-- -----------------------------------------------------
-- Placeholder table for view `dw-2211-team2_salesorders`.`total_cost_per_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw-2211-team2_salesorders`.`total_cost_per_product` (`year` INT, `month` INT, `prodid` INT, `Total_Cost` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dw-2211-team2_salesorders`.`total_qty_per_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw-2211-team2_salesorders`.`total_qty_per_product` (`year` INT, `month` INT, `prodid` INT, `Total_Qty` INT);

-- -----------------------------------------------------
-- View `dw-2211-team2_salesorders`.`total_cost_per_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dw-2211-team2_salesorders`.`total_cost_per_product`;
DROP VIEW IF EXISTS `dw-2211-team2_salesorders`.`total_cost_per_product` ;
USE `dw-2211-team2_salesorders`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dw-2211-team2_salesorders`.`total_cost_per_product` AS select `I`.`Year` AS `year`,`I`.`Month` AS `month`,`I`.`ProdID` AS `prodid`,sum(`I`.`Manufacturing_Costs`) AS `Total_Cost` from `dw-2211-team2_salesorders`.`manufacturing_costs_intermediate` `I` group by `I`.`Year`,`I`.`Month`,`I`.`ProdID` order by `I`.`Year`,`I`.`Month`,`I`.`ProdID`;

-- -----------------------------------------------------
-- View `dw-2211-team2_salesorders`.`total_qty_per_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dw-2211-team2_salesorders`.`total_qty_per_product`;
DROP VIEW IF EXISTS `dw-2211-team2_salesorders`.`total_qty_per_product` ;
USE `dw-2211-team2_salesorders`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dw-2211-team2_salesorders`.`total_qty_per_product` AS select `I`.`Year` AS `year`,`I`.`Month` AS `month`,`I`.`ProdId` AS `prodid`,sum(`I`.`Qty`) AS `Total_Qty` from `dw-2211-team2_salesorders`.`invoice_intermediate` `I` group by `I`.`Year`,`I`.`Month`,`I`.`ProdId` order by `I`.`Year`,`I`.`Month`,`I`.`ProdId`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
