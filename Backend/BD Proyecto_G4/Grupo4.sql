-- MySQL Script generated by MySQL Workbench
-- 08/08/18 10:31:56
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema grupo4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema grupo4
-- -----------------------------------------------------
Drop database if exists grupo4;
CREATE SCHEMA IF NOT EXISTS `grupo4` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `grupo4` ;

-- -----------------------------------------------------
-- Table `grupo4`.`Padre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo4`.`Padre` (
  `idPadre` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Nombre` VARCHAR(45) NULL COMMENT '',
  `Apellido` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idPadre`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo4`.`Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo4`.`Estudiante` (
  `idEstudiante` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Nombre` VARCHAR(45) NULL COMMENT '',
  `Apellido` VARCHAR(45) NULL COMMENT '',
  `idPadre` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idEstudiante`)  COMMENT '',
  INDEX `fk_Estudiante_Padre_idx` (`idPadre` ASC)  COMMENT '',
  CONSTRAINT `fk_Estudiante_Padre`
    FOREIGN KEY (`idPadre`)
    REFERENCES `grupo4`.`Padre` (`idPadre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo4`.`Catedratico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo4`.`Catedratico` (
  `idCatedratico` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Nombre` VARCHAR(45) NULL COMMENT '',
  `Apellido` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idCatedratico`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo4`.`Detalle_Pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo4`.`Detalle_Pago` (
  `idDetalle_Pago` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `fecha` INT NULL COMMENT '',
  `Pagado` INT NULL COMMENT '',
  `idPadre` INT NOT NULL COMMENT '',
  `Monto` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idDetalle_Pago`)  COMMENT '',
  INDEX `fk_Detalle_Pago_Padre1_idx` (`idPadre` ASC)  COMMENT '',
  CONSTRAINT `fk_Detalle_Pago_Padre1`
    FOREIGN KEY (`idPadre`)
    REFERENCES `grupo4`.`Padre` (`idPadre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo4`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo4`.`Curso` (
  `idCurso` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Nombre` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idCurso`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo4`.`Asignacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo4`.`Asignacion` (
  `idAsignacion` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `anio` INT NULL COMMENT '',
  `idCurso` INT NOT NULL COMMENT '',
  `idEstudiante` INT NOT NULL COMMENT '',
  `idCatedratico` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idAsignacion`)  COMMENT '',
  INDEX `fk_Asignacion_Curso1_idx` (`idCurso` ASC)  COMMENT '',
  INDEX `fk_Asignacion_Estudiante1_idx` (`idEstudiante` ASC)  COMMENT '',
  INDEX `fk_Asignacion_Catedratico1_idx` (`idCatedratico` ASC)  COMMENT '',
  CONSTRAINT `fk_Asignacion_Curso1`
    FOREIGN KEY (`idCurso`)
    REFERENCES `grupo4`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asignacion_Estudiante1`
    FOREIGN KEY (`idEstudiante`)
    REFERENCES `grupo4`.`Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asignacion_Catedratico1`
    FOREIGN KEY (`idCatedratico`)
    REFERENCES `grupo4`.`Catedratico` (`idCatedratico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo4`.`Nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo4`.`Nota` (
  `idNota` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Nota` INT NULL COMMENT '',
  `Periodo` INT NULL COMMENT '',
  `idAsignacion` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idNota`)  COMMENT '',
  INDEX `fk_Nota_Asignacion1_idx` (`idAsignacion` ASC)  COMMENT '',
  CONSTRAINT `fk_Nota_Asignacion1`
    FOREIGN KEY (`idAsignacion`)
    REFERENCES `grupo4`.`Asignacion` (`idAsignacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo4`.`Asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo4`.`Asistencia` (
  `idAsistencia` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Fecha` DATE NULL COMMENT '',
  `Presente` INT NULL COMMENT '',
  `idEstudiante` INT NOT NULL COMMENT '',
  `idCurso` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idAsistencia`)  COMMENT '',
  INDEX `fk_Asistencia_Estudiante1_idx` (`idEstudiante` ASC)  COMMENT '',
  INDEX `fk_Asistencia_Curso1_idx` (`idCurso` ASC)  COMMENT '',
  CONSTRAINT `fk_Asistencia_Estudiante1`
    FOREIGN KEY (`idEstudiante`)
    REFERENCES `grupo4`.`Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asistencia_Curso1`
    FOREIGN KEY (`idCurso`)
    REFERENCES `grupo4`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo4`.`Planificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo4`.`Planificacion` (
  `idPlanificacion` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Anio` INT NULL COMMENT '',
  `idCatedratico` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idPlanificacion`)  COMMENT '',
  INDEX `fk_Planificacion_Catedratico1_idx` (`idCatedratico` ASC)  COMMENT '',
  CONSTRAINT `fk_Planificacion_Catedratico1`
    FOREIGN KEY (`idCatedratico`)
    REFERENCES `grupo4`.`Catedratico` (`idCatedratico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO Padre(Nombre, Apellido) VALUES ("Padre1", "Apellido");
INSERT INTO Padre(Nombre, Apellido) VALUES ("Padre2", "Apellido");
INSERT INTO Padre(Nombre, Apellido) VALUES ("Padre3", "Apellido");
INSERT INTO Padre(Nombre, Apellido) VALUES ("Padre4", "Apellido");
INSERT INTO Padre(Nombre, Apellido) VALUES ("Padre5", "Apellido");
INSERT INTO Padre(Nombre, Apellido) VALUES ("Padre6", "Apellido");
INSERT INTO Padre(Nombre, Apellido) VALUES ("Padre7", "Apellido");
INSERT INTO Padre(Nombre, Apellido) VALUES ("Padre8", "Apellido");
INSERT INTO Padre(Nombre, Apellido) VALUES ("Padre9", "Apellido");
INSERT INTO Padre(Nombre, Apellido) VALUES ("Padre10", "Apellido");

INSERT INTO Catedratico(Nombre, Apellido) VALUES ("Catedratico1", "Apellido");
INSERT INTO Catedratico(Nombre, Apellido) VALUES ("Catedratico2", "Apellido");
INSERT INTO Catedratico(Nombre, Apellido) VALUES ("Catedratico3", "Apellido");
INSERT INTO Catedratico(Nombre, Apellido) VALUES ("Catedratico4", "Apellido");
INSERT INTO Catedratico(Nombre, Apellido) VALUES ("Catedratico5", "Apellido");
INSERT INTO Catedratico(Nombre, Apellido) VALUES ("Catedratico6", "Apellido");
INSERT INTO Catedratico(Nombre, Apellido) VALUES ("Catedratico7", "Apellido");
INSERT INTO Catedratico(Nombre, Apellido) VALUES ("Catedratico8", "Apellido");
INSERT INTO Catedratico(Nombre, Apellido) VALUES ("Catedratico9", "Apellido");
INSERT INTO Catedratico(Nombre, Apellido) VALUES ("Catedratico10", "Apellido");

INSERT INTO Curso(Nombre) VALUES ("Curso1");
INSERT INTO Curso(Nombre) VALUES ("Curso2");
INSERT INTO Curso(Nombre) VALUES ("Curso3");
INSERT INTO Curso(Nombre) VALUES ("Curso4");
INSERT INTO Curso(Nombre) VALUES ("Curso5");
INSERT INTO Curso(Nombre) VALUES ("Curso6");
INSERT INTO Curso(Nombre) VALUES ("Curso7");
INSERT INTO Curso(Nombre) VALUES ("Curso8");
INSERT INTO Curso(Nombre) VALUES ("Curso9");
INSERT INTO Curso(Nombre) VALUES ("Curso10");

INSERT INTO Estudiante(Nombre, Apellido, idPadre) VALUES ("Estudiante1", "Apellido", 1);
INSERT INTO Estudiante(Nombre, Apellido, idPadre) VALUES ("Estudiante2", "Apellido", 2);
INSERT INTO Estudiante(Nombre, Apellido, idPadre) VALUES ("Estudiante3", "Apellido", 3);
INSERT INTO Estudiante(Nombre, Apellido, idPadre) VALUES ("Estudiante4", "Apellido", 4);
INSERT INTO Estudiante(Nombre, Apellido, idPadre) VALUES ("Estudiante5", "Apellido", 5);
INSERT INTO Estudiante(Nombre, Apellido, idPadre) VALUES ("Estudiante6", "Apellido", 6);
INSERT INTO Estudiante(Nombre, Apellido, idPadre) VALUES ("Estudiante7", "Apellido", 7);
INSERT INTO Estudiante(Nombre, Apellido, idPadre) VALUES ("Estudiante8", "Apellido", 8);
INSERT INTO Estudiante(Nombre, Apellido, idPadre) VALUES ("Estudiante9", "Apellido", 9);
INSERT INTO Estudiante(Nombre, Apellido, idPadre) VALUES ("Estudiante10", "Apellido", 10);
INSERT INTO Estudiante(Nombre, Apellido, idPadre) VALUES ("Estudiante10", "Apellido", 10);

INSERT INTO Detalle_Pago(fecha, Pagado, idPadre, Monto) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 1 , 1, 100);
INSERT INTO Detalle_Pago(fecha, Pagado, idPadre, Monto) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 1 , 2, 100);
INSERT INTO Detalle_Pago(fecha, Pagado, idPadre, Monto) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 1 , 3, 100);
INSERT INTO Detalle_Pago(fecha, Pagado, idPadre, Monto) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 1 , 4, 100);
INSERT INTO Detalle_Pago(fecha, Pagado, idPadre, Monto) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 1 , 5, 100);
INSERT INTO Detalle_Pago(fecha, Pagado, idPadre, Monto) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 0 , 6, 200);
INSERT INTO Detalle_Pago(fecha, Pagado, idPadre, Monto) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 0 , 7, 200);
INSERT INTO Detalle_Pago(fecha, Pagado, idPadre, Monto) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 0 , 8, 200);
INSERT INTO Detalle_Pago(fecha, Pagado, idPadre, Monto) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 1 , 9, 300);
INSERT INTO Detalle_Pago(fecha, Pagado, idPadre, Monto) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 0 , 10, 300);
INSERT INTO Detalle_Pago(fecha, Pagado, idPadre, Monto) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 1 , 10, 00);

INSERT INTO Asistencia(fecha, Presente, idEstudiante, idCurso) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 1 , 1, 1);
INSERT INTO Asistencia(fecha, Presente, idEstudiante, idCurso) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 1 , 2, 2);
INSERT INTO Asistencia(fecha, Presente, idEstudiante, idCurso) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 1 , 3, 3);
INSERT INTO Asistencia(fecha, Presente, idEstudiante, idCurso) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 1 , 4, 4);
INSERT INTO Asistencia(fecha, Presente, idEstudiante, idCurso) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 1 , 5, 5);
INSERT INTO Asistencia(fecha, Presente, idEstudiante, idCurso) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 0 , 6, 6);
INSERT INTO Asistencia(fecha, Presente, idEstudiante, idCurso) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 0 , 7, 7);
INSERT INTO Asistencia(fecha, Presente, idEstudiante, idCurso) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 0 , 8, 8);
INSERT INTO Asistencia(fecha, Presente, idEstudiante, idCurso) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 1 , 9, 9);
INSERT INTO Asistencia(fecha, Presente, idEstudiante, idCurso) VALUES (STR_TO_DATE( '08-08-2018', '%d-%m-%Y' ), 0 , 10, 10);

INSERT INTO Planificacion(anio, idCatedratico) VALUES (2018, 1);
INSERT INTO Planificacion(anio, idCatedratico) VALUES (2018, 2);
INSERT INTO Planificacion(anio, idCatedratico) VALUES (2018, 3);
INSERT INTO Planificacion(anio, idCatedratico) VALUES (2018, 4);
INSERT INTO Planificacion(anio, idCatedratico) VALUES (2018, 5);
INSERT INTO Planificacion(anio, idCatedratico) VALUES (2018, 6);
INSERT INTO Planificacion(anio, idCatedratico) VALUES (2018, 7);
INSERT INTO Planificacion(anio, idCatedratico) VALUES (2018, 8);
INSERT INTO Planificacion(anio, idCatedratico) VALUES (2018, 9);
INSERT INTO Planificacion(anio, idCatedratico) VALUES (2018, 10);

INSERT INTO Asignacion(anio, idCurso, idEstudiante, idCatedratico) VALUES (2018, 1, 1, 1);
INSERT INTO Asignacion(anio, idCurso, idEstudiante, idCatedratico) VALUES (2018, 2, 2, 2);
INSERT INTO Asignacion(anio, idCurso, idEstudiante, idCatedratico) VALUES (2018, 3, 3, 3);
INSERT INTO Asignacion(anio, idCurso, idEstudiante, idCatedratico) VALUES (2018, 4, 4, 4);
INSERT INTO Asignacion(anio, idCurso, idEstudiante, idCatedratico) VALUES (2018, 5, 5, 5);
INSERT INTO Asignacion(anio, idCurso, idEstudiante, idCatedratico) VALUES (2018, 6, 6, 6);
INSERT INTO Asignacion(anio, idCurso, idEstudiante, idCatedratico) VALUES (2018, 7, 7, 7);
INSERT INTO Asignacion(anio, idCurso, idEstudiante, idCatedratico) VALUES (2018, 8, 8, 8);
INSERT INTO Asignacion(anio, idCurso, idEstudiante, idCatedratico) VALUES (2018, 9, 9, 9);
INSERT INTO Asignacion(anio, idCurso, idEstudiante, idCatedratico) VALUES (2018, 10, 10, 10);

INSERT INTO Nota(Nota, Periodo, idAsignacion) VALUES (100, 1, 1);
INSERT INTO Nota(Nota, Periodo, idAsignacion) VALUES (100, 2, 2);
INSERT INTO Nota(Nota, Periodo, idAsignacion) VALUES (100, 3, 3);
INSERT INTO Nota(Nota, Periodo, idAsignacion) VALUES (100, 4, 4);
INSERT INTO Nota(Nota, Periodo, idAsignacion) VALUES (100, 5, 5);
INSERT INTO Nota(Nota, Periodo, idAsignacion) VALUES (100, 6, 6);
INSERT INTO Nota(Nota, Periodo, idAsignacion) VALUES (100, 7, 7);
INSERT INTO Nota(Nota, Periodo, idAsignacion) VALUES (100, 8, 8);
INSERT INTO Nota(Nota, Periodo, idAsignacion) VALUES (100, 9, 9);
INSERT INTO Nota(Nota, Periodo, idAsignacion) VALUES (100, 10, 10);