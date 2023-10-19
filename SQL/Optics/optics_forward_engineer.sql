-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Optics
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Optics
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Optics` DEFAULT CHARACTER SET utf8 ;
USE `Optics` ;

-- -----------------------------------------------------
-- Table `Optics`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optics`.`suppliers` (
  `supplier_id` INT NOT NULL AUTO_INCREMENT,
  `supplier_name` VARCHAR(45) NOT NULL,
  `supplier_address_number` INT NOT NULL,
  `supplier_address_street` VARCHAR(45) NOT NULL,
  `supplier_address_floor` INT NOT NULL,
  `supplier_address_door` INT NOT NULL,
  `supplier_city` VARCHAR(45) NOT NULL,
  `supplier_country` VARCHAR(45) NOT NULL,
  `supplier_telephone` INT NOT NULL,
  `supplier_fax` INT NULL,
  `supplier_nif` INT NOT NULL,
  PRIMARY KEY (`supplier_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optics`.`brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optics`.`brands` (
  `brand_id` INT NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(45) NOT NULL,
  `suppliers_supplier_id` INT NOT NULL,
  PRIMARY KEY (`brand_id`),
  INDEX `fk_brands_suppliers1_idx` (`suppliers_supplier_id` ASC) VISIBLE,
  CONSTRAINT `fk_brands_suppliers1`
    FOREIGN KEY (`suppliers_supplier_id`)
    REFERENCES `Optics`.`suppliers` (`supplier_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optics`.`glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optics`.`glasses` (
  `glass_id` INT NOT NULL AUTO_INCREMENT,
  `graduation_left` INT NOT NULL,
  `graduation_right` INT NOT NULL,
  `frame_type` VARCHAR(45) NOT NULL,
  `frame_color` VARCHAR(45) NOT NULL,
  `glass_color` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `stock` INT NOT NULL,
  `brands_brand_id` INT NOT NULL,
  PRIMARY KEY (`glass_id`),
  INDEX `fk_glasses_brands1_idx` (`brands_brand_id` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_brands1`
    FOREIGN KEY (`brands_brand_id`)
    REFERENCES `Optics`.`brands` (`brand_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optics`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optics`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_postal_address` VARCHAR(45) NOT NULL,
  `customer_telephone` INT NOT NULL,
  `customer_email` VARCHAR(45) NOT NULL,
  `customer_registration_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_recommended_by` VARCHAR(45) NULL,
  `customers_customer_id` INT NOT NULL,
  `customers_customer_postal_address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`, `customer_postal_address`),
  INDEX `fk_customers_customers1_idx` (`customers_customer_id` ASC, `customers_customer_postal_address` ASC) VISIBLE,
  CONSTRAINT `fk_customers_customers1`
    FOREIGN KEY (`customers_customer_id` , `customers_customer_postal_address`)
    REFERENCES `Optics`.`customers` (`customer_id` , `customer_postal_address`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optics`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optics`.`employees` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `employee_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optics`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optics`.`sales` (
  `sale_id` INT NOT NULL AUTO_INCREMENT,
  `sale_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customers_customer_id` INT NOT NULL,
  `customers_customer_postal_address` VARCHAR(45) NOT NULL,
  `glasses_glass_id` INT NOT NULL,
  `employees_employee_id` INT NOT NULL,
  PRIMARY KEY (`sale_id`),
  INDEX `fk_sales_customers1_idx` (`customers_customer_id` ASC, `customers_customer_postal_address` ASC) VISIBLE,
  INDEX `fk_sales_glasses1_idx` (`glasses_glass_id` ASC) VISIBLE,
  INDEX `fk_sales_employees1_idx` (`employees_employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_sales_customers1`
    FOREIGN KEY (`customers_customer_id` , `customers_customer_postal_address`)
    REFERENCES `Optics`.`customers` (`customer_id` , `customer_postal_address`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sales_glasses1`
    FOREIGN KEY (`glasses_glass_id`)
    REFERENCES `Optics`.`glasses` (`glass_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sales_employees1`
    FOREIGN KEY (`employees_employee_id`)
    REFERENCES `Optics`.`employees` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
