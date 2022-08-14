-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
 
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`dueno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dueno` (
  `dni` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`perro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`perro` (
  `id_perro` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha_nac` DATE NOT NULL,
  `sexo` ENUM('h', 'm') NOT NULL,
  `dueno_dni` INT NOT NULL,
  PRIMARY KEY (`id_perro`, `dueno_dni`),
  INDEX `fk_perro_dueno_idx` (`dueno_dni` ASC) VISIBLE,
  UNIQUE INDEX `dueno_dni_UNIQUE` (`dueno_dni` ASC) VISIBLE,
  UNIQUE INDEX `id_perro_UNIQUE` (`id_perro` ASC) VISIBLE,
  CONSTRAINT `fk_perro_dueno`
    FOREIGN KEY (`dueno_dni`)
    REFERENCES `mydb`.`dueno` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`historial` (
  `id_historial` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `monto` DECIMAL NOT NULL,
  `perro_id_perro` INT NOT NULL,
  `perro_dueno_dni` INT NOT NULL,
  PRIMARY KEY (`id_historial`, `perro_id_perro`, `perro_dueno_dni`),
  INDEX `fk_historial_perro1_idx` (`perro_id_perro` ASC, `perro_dueno_dni` ASC) VISIBLE,
  UNIQUE INDEX `id_historial_UNIQUE` (`id_historial` ASC) VISIBLE,
  CONSTRAINT `fk_historial_perro1`
    FOREIGN KEY (`perro_id_perro` , `perro_dueno_dni`)
    REFERENCES `mydb`.`perro` (`id_perro` , `dueno_dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
