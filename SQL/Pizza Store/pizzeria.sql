-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_first_name` VARCHAR(45) NOT NULL,
  `customer_last_name` VARCHAR(45) NOT NULL,
  `customer_address` VARCHAR(45) NOT NULL,
  `customer_postal_code` VARCHAR(45) NOT NULL,
  `customer_city` VARCHAR(45) NOT NULL,
  `customer_province` VARCHAR(45) NOT NULL,
  `customer_telephone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`stores` (
  `stores_id` INT NOT NULL AUTO_INCREMENT,
  `stores_adress` VARCHAR(45) NOT NULL,
  `stores_postal_code` VARCHAR(45) NOT NULL,
  `stores_town` VARCHAR(45) NOT NULL,
  `stores_province` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`stores_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_date_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_delivery_or_pickup` VARCHAR(45) NOT NULL,
  `order_total_price` DECIMAL(15) NOT NULL,
  `customer_customer_id` INT NOT NULL,
  `stores_stores_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_customer_idx` (`customer_customer_id` ASC) VISIBLE,
  INDEX `fk_order_stores1_idx` (`stores_stores_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_customer`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `mydb`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_stores1`
    FOREIGN KEY (`stores_stores_id`)
    REFERENCES `mydb`.`stores` (`stores_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categories` (
  `categories_id` INT NOT NULL AUTO_INCREMENT,
  `categories_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categories_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `product_description` VARCHAR(45) NOT NULL,
  `product_image` VARCHAR(45) NOT NULL,
  `product_price` DECIMAL(15) NOT NULL,
  `product_type` ENUM('pizza', 'hamburguer', 'drink') NOT NULL,
  `categories_categories_id` INT NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_product_categories1_idx` (`categories_categories_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_categories1`
    FOREIGN KEY (`categories_categories_id`)
    REFERENCES `mydb`.`categories` (`categories_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `employee_first_name` VARCHAR(45) NOT NULL,
  `employee_last_name` VARCHAR(45) NOT NULL,
  `employee_nif` INT NOT NULL,
  `employee_telephone` INT NOT NULL,
  `employee_role` ENUM('cook', 'delivery_man') NOT NULL,
  `stores_stores_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_employee_stores1_idx` (`stores_stores_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_stores1`
    FOREIGN KEY (`stores_stores_id`)
    REFERENCES `mydb`.`stores` (`stores_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`delivery` (
  `delivery_id` INT NOT NULL AUTO_INCREMENT,
  `delivery_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_employee_id` INT NOT NULL,
  `order_order_id` INT NOT NULL,
  PRIMARY KEY (`delivery_id`),
  INDEX `fk_delivery_employee1_idx` (`employee_employee_id` ASC) VISIBLE,
  INDEX `fk_delivery_order1_idx` (`order_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_employee1`
    FOREIGN KEY (`employee_employee_id`)
    REFERENCES `mydb`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_delivery_order1`
    FOREIGN KEY (`order_order_id`)
    REFERENCES `mydb`.`order` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_has_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_has_product` (
  `order_order_id` INT NOT NULL,
  `product_product_id` INT NOT NULL,
  `order_has_product_quantity` INT NOT NULL,
  PRIMARY KEY (`order_order_id`, `product_product_id`),
  INDEX `fk_order_has_product_product1_idx` (`product_product_id` ASC) VISIBLE,
  INDEX `fk_order_has_product_order1_idx` (`order_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_has_product_order1`
    FOREIGN KEY (`order_order_id`)
    REFERENCES `mydb`.`order` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_has_product_product1`
    FOREIGN KEY (`product_product_id`)
    REFERENCES `mydb`.`product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
