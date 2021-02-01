create database aforoApp;

use aforoApp;

drop database aforoApp;

CREATE TABLE `aforoapp`.`establecimiento` (
  `id_establecimiento` INT NOT NULL AUTO_INCREMENT,
  `nombre_establecimiento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_establecimiento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

INSERT INTO `aforoapp`.`establecimiento` (`id_establecimiento`, `nombre_establecimiento`) VALUES ('1', 'Tottus');
INSERT INTO `aforoapp`.`establecimiento` (`id_establecimiento`, `nombre_establecimiento`) VALUES ('2', 'Plaza Vea');
INSERT INTO `aforoapp`.`establecimiento` (`id_establecimiento`, `nombre_establecimiento`) VALUES ('3', 'Metro');
INSERT INTO `aforoapp`.`establecimiento` (`id_establecimiento`, `nombre_establecimiento`) VALUES ('4', 'Wong');
INSERT INTO `aforoapp`.`establecimiento` (`id_establecimiento`, `nombre_establecimiento`) VALUES ('5', 'Vivanda');

CREATE TABLE `aforoapp`.`sede` (
  `id_sede` INT NOT NULL AUTO_INCREMENT,
  `nombre_sede` VARCHAR(45) NOT NULL,
  `dirección_sede` VARCHAR(100) NOT NULL,
  `aforo_disponible` INT NOT NULL,
  `id_establecimiento` INT NOT NULL,
  PRIMARY KEY (`id_sede`),
  INDEX `fk_sede_establecimiento_id_idx` (`id_establecimiento` ASC) VISIBLE,
  CONSTRAINT `fk_sede_establecimiento_id`
    FOREIGN KEY (`id_establecimiento`)
    REFERENCES `aforoapp`.`establecimiento` (`id_establecimiento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('1', 'Tottus Lima Centro', ' Av. Tacna 665, Lima', '130', '1');
INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('2', 'Tottus Santa Anita', ' Carretera Central 135, Mall Aventura, Santa Anita', '110', '1');
INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('3', 'Tottus Jockey P.', 'Av. Javier Prado Este Nro. 4010 Urb. Fundo Monterrico Chico, Jockey P.', '100', '1');
INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('4', 'Tottus la Fontana', 'Av. La Fontana 790 Urb. La Riviera de Monterrico II Etapa, La Fontana', '120', '1');

INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('5', 'Plaza Vea Centro Cívico', 'Av. Inca Garcilazo De La Vega N°1383, 15046 LIMA', '100', '2');
INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('6', 'Plaza Vea La Victoria', 'Av. Bausate y Mesa 332-333, LIMA', '110', '2');
INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('7', 'Plaza Vea Ate', 'Av. Nicolas Ayllon Sector B. Mz B Lte.4 Zona A - Baja Esq. Con Av. La Mar., Ate', '150', '2');

INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('8', 'Metro Arenales', 'Av. General Arenales 1737, Lince', '80', '3');
INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('9', 'Metro Garzon', 'Gral. Garzón 1337, Jesús María', '90', '3');
INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('10', 'Metro San Felipe', 'C.C. San Felipe s/n Int. 67C Res. San Felipe, Jesús María', '50', '3');

INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('11', 'Wong San Borja', 'Calle Ucello No. 162, San Borja', '120', '4');
INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('12', 'Wong Dos De Mayo', 'Av. Dos de Mayo 1099 - San Isidro', '110', '4');
INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('13', 'Wong Ovalo Gutierrez', 'Av. Santa Cruz 771 - Miraflores', '100', '4');

INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('14', 'Tienda Vivanda Javier Prado', 'Av. Javier Prado Oeste 999', '90', '5');
INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('15', 'Tienda Vivanda Pezet', 'Av. Juan Antonio Pezet 1340, Lima', '105', '5');
INSERT INTO `aforoapp`.`sede` (`id_sede`, `nombre_sede`, `dirección_sede`, `aforo_disponible`, `id_establecimiento`) VALUES ('16', 'Tienda Vivanda Monterrico', 'Av. La Encalada cuadra 5 esquina con av. Angamos Este cuadra 15', '130', '5');








