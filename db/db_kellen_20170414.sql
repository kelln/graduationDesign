-- MySQL Script generated by MySQL Workbench
-- 04/14/17 17:31:16
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_tuqi
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_kellen
-- -----------------------------------------------------
-- travlDB

-- -----------------------------------------------------
-- Schema db_kellen
--
-- travlDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_kellen` DEFAULT CHARACTER SET utf8 ;
USE `db_kellen` ;

-- -----------------------------------------------------
-- Table `db_kellen`.`user_identify`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_kellen`.`user_identify` (
  `identify_id` INT NOT NULL AUTO_INCREMENT COMMENT '身份编号',
  `identify_name` VARCHAR(45) NOT NULL COMMENT '身份名称',
  PRIMARY KEY (`identify_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_kellen`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_kellen`.`user` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `user_name` VARCHAR(45) NOT NULL COMMENT '用户名',
  `password` VARCHAR(60) NULL COMMENT '用户密码',
  `nick_name` VARCHAR(45) NULL COMMENT '昵称',
  `user_gender` CHAR(5) NULL COMMENT '性别',
  `user_identify_id` INT NOT NULL COMMENT '用户身份编号',
  PRIMARY KEY (`user_id`),
  INDEX `fk_user_user_identify_idx` (`user_identify_id` ASC),
  CONSTRAINT `fk_user_user_identify`
    FOREIGN KEY (`user_identify_id`)
    REFERENCES `db_kellen`.`user_identify` (`identify_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_kellen`.`recommend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_kellen`.`recommend` (
  `recom_id` INT NOT NULL AUTO_INCREMENT COMMENT '编号',
  `recom_title` VARCHAR(45) NOT NULL COMMENT '标题',
  `rocom_content` TEXT NULL COMMENT '内容',
  `recom_user_id` BIGINT NOT NULL COMMENT '所属用户',
  PRIMARY KEY (`recom_id`),
  INDEX `fk_recommend_user1_idx` (`recom_user_id` ASC),
  CONSTRAINT `fk_recommend_user1`
    FOREIGN KEY (`recom_user_id`)
    REFERENCES `db_kellen`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
