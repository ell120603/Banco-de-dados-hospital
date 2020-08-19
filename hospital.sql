-- MySQL Script generated by MySQL Workbench
-- Wed Aug 19 17:14:27 2020
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paciente` (
  `idpaciante` INT NOT NULL AUTO_INCREMENT,
  `nomedopaciante` VARCHAR(45) NOT NULL,
  `sexodopaciente` VARCHAR(45) NOT NULL,
  `datanascimentopaciente` INT NOT NULL,
  `convenio` VARCHAR(45) NOT NULL,
  `rgpaciente` VARCHAR(45) NOT NULL,
  `endereçopaciente` VARCHAR(45) NOT NULL,
  `telefonedopaciente` INT NOT NULL,
  PRIMARY KEY (`idpaciante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medico` (
  `idmedico(crm)` INT NOT NULL,
  `formaçãonmedico` VARCHAR(45) NOT NULL,
  `mediconome` VARCHAR(45) NOT NULL,
  `medicodatadenascimento` VARCHAR(45) NOT NULL,
  `medicotelefone` INT NOT NULL,
  `medicoendereço` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmedico(crm)`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`consultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`consultas` (
  `idconsultas` INT NOT NULL AUTO_INCREMENT,
  `dataconsulta` VARCHAR(45) NOT NULL,
  `diagnostico` VARCHAR(45) NOT NULL,
  `paciente_idpaciante` INT NOT NULL,
  `medico_idmedico(crm)` INT NOT NULL,
  `medico_idmedico(crm)1` INT NOT NULL,
  `medico_paciente_idpaciante` INT NOT NULL,
  `paciente_idpaciante1` INT NOT NULL,
  PRIMARY KEY (`idconsultas`, `paciente_idpaciante`, `medico_idmedico(crm)`),
  INDEX `fk_consultas_medico1_idx` (`medico_idmedico(crm)1` ASC, `medico_paciente_idpaciante` ASC) VISIBLE,
  INDEX `fk_consultas_paciente1_idx` (`paciente_idpaciante1` ASC) VISIBLE,
  CONSTRAINT `fk_consultas_medico1`
    FOREIGN KEY (`medico_idmedico(crm)1`)
    REFERENCES `mydb`.`medico` (`idmedico(crm)`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consultas_paciente1`
    FOREIGN KEY (`paciente_idpaciante1`)
    REFERENCES `mydb`.`paciente` (`idpaciante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`exame` (
  `idexame` INT NOT NULL AUTO_INCREMENT,
  `diagnostico` VARCHAR(45) NOT NULL,
  `data` INT NOT NULL,
  `consultas_idconsultas` INT NOT NULL,
  `consultas_paciente_idpaciante` INT NOT NULL,
  `consultas_medico_idmedico(crm)` INT NOT NULL,
  `paciente_idpaciante` INT NOT NULL,
  PRIMARY KEY (`idexame`),
  INDEX `fk_exame_consultas1_idx` (`consultas_idconsultas` ASC, `consultas_paciente_idpaciante` ASC, `consultas_medico_idmedico(crm)` ASC) VISIBLE,
  INDEX `fk_exame_paciente1_idx` (`paciente_idpaciante` ASC) VISIBLE,
  CONSTRAINT `fk_exame_consultas1`
    FOREIGN KEY (`consultas_idconsultas` , `consultas_paciente_idpaciante` , `consultas_medico_idmedico(crm)`)
    REFERENCES `mydb`.`consultas` (`idconsultas` , `paciente_idpaciante` , `medico_idmedico(crm)`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exame_paciente1`
    FOREIGN KEY (`paciente_idpaciante`)
    REFERENCES `mydb`.`paciente` (`idpaciante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
