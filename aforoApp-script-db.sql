CREATE TABLE marcas (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  imagen VARCHAR(200) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

INSERT INTO marcas (id, nombre, imagen) VALUES ('1', 'Tottus', '');
INSERT INTO marcas (id, nombre, imagen) VALUES ('2', 'Plaza Vea', '');
INSERT INTO marcas (id, nombre, imagen) VALUES ('3', 'Metro', '');
INSERT INTO marcas (id, nombre, imagen) VALUES ('4', 'Wong', '');
INSERT INTO marcas (id, nombre, imagen) VALUES ('5', 'Vivanda', '');

CREATE TABLE sedes (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  aforo INT NOT NULL,
  latitud FLOAT NOT NULL,
  longitud FLOAT NOT NULL,
  id_marca INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_sedes_establecimiento_id
    FOREIGN KEY (id_marca)
    REFERENCES marcas (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('1', 'Tottus Lima Centro', ' Av. Tacna 665, Lima', '130', '0' , '0', '1');
INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('2', 'Tottus Santa Anita', ' Carretera Central 135, Mall Aventura, Santa Anita', '110', '0' , '0', '1');
INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('3', 'Tottus Jockey P.', 'Av. Javier Prado Este Nro. 4010 Urb. Fundo Monterrico Chico, Jockey P.', '100', '0' , '0', '1');
INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('4', 'Tottus la Fontana', 'Av. La Fontana 790 Urb. La Riviera de Monterrico II Etapa, La Fontana', '120', '0' , '0', '1');

INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('5', 'Plaza Vea Centro Cívico', 'Av. Inca Garcilazo De La Vega N°1383, 15046 LIMA', '100', '0' , '0', '2');
INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('6', 'Plaza Vea La Victoria', 'Av. Bausate y Mesa 332-333, LIMA', '110', '0' , '0', '2');
INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('7', 'Plaza Vea Ate', 'Av. Nicolas Ayllon Sector B. Mz B Lte.4 Zona A - Baja Esq. Con Av. La Mar., Ate', '150', '0' , '0', '2');

INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('8', 'Metro Arenales', 'Av. General Arenales 1737, Lince', '80', '0' , '0', '3');
INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('9', 'Metro Garzon', 'Gral. Garzón 1337, Jesús María', '90', '0' , '0', '3');
INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('10', 'Metro San Felipe', 'C.C. San Felipe s/n Int. 67C Res. San Felipe, Jesús María', '50', '0' , '0', '3');

INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('11', 'Wong San Borja', 'Calle Ucello No. 162, San Borja', '120', '0' , '0', '4');
INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('12', 'Wong Dos De Mayo', 'Av. Dos de Mayo 1099 - San Isidro', '110', '0' , '0', '4');
INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('13', 'Wong Ovalo Gutierrez', 'Av. Santa Cruz 771 - Miraflores', '100', '0' , '0', '4');

INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('14', 'Tienda Vivanda Javier Prado', 'Av. Javier Prado Oeste 999', '90', '0' , '0', '5');
INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('15', 'Tienda Vivanda Pezet', 'Av. Juan Antonio Pezet 1340, Lima', '105', '0' , '0', '5');
INSERT INTO sedes (id, nombre, direccion, aforo, latitud, longitud, id_marca) VALUES ('16', 'Tienda Vivanda Monterrico', 'Av. La Encalada cuadra 5 esquina con av. Angamos Este cuadra 15', '130', '0' , '0', '5');

CREATE TABLE afororegistros (
  idmarca INT NOT NULL,
  idsede INT NOT NULL,
  aforo INT NOT NULL,
  periodo INT NOT NULL,
  mes INT NOT NULL,
  dia INT NOT NULL,
  fecha DATETIME NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE aforoestadisticas (
  idmarca INT NOT NULL,
  idsede INT NOT NULL,
  promedio INT NOT NULL,
  periodo INT NOT NULL,
  mes INT NOT NULL,
  dia INT NOT NULL,
  hora INT NOT NULL,
  tipo INT NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE usuarios (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(200) NOT NULL,
  email VARCHAR(45) NOT NULL,
  usuario VARCHAR(45) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

INSERT INTO usuarios (id, nombre, email, usuario) VALUES ('1', 'Administrador', 'admin@aforoperu.pe','admin001');