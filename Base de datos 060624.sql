DROP TABLE VIAJE;
DROP TABLE PASAJERO;
DROP TABLE PILOTO;
DROP TABLE DESTINO;
DROP TABLE AVION;
DROP TABLE AEROLINEA;
 
CREATE TABLE AEROLINEA (
    rutAerolinea VARCHAR(255) NOT NULL PRIMARY KEY,
	telefono VARCHAR(50),
    nombre VARCHAR(255),
    razonSocial VARCHAR(255) NOT NULL UNIQUE,
    pais VARCHAR(255),
    tipoVuelo VARCHAR(50) CHECK (tipoVuelo IN ('Internacional', 'Local', 'Ambas'))
);
 
CREATE TABLE AVION (
    idAvion INT PRIMARY KEY,
    matricula VARCHAR(50) UNIQUE,
    rutAerolinea VARCHAR(255),
    modelo VARCHAR(50)CHECK (modelo IN ('Boeing', 'Airbus', 'Embraer')),
    FOREIGN KEY (rutAerolinea) REFERENCES AEROLINEA(rutAerolinea)
);
 
CREATE TABLE DESTINO (
    pais VARCHAR(255) NOT NULL,
    ciudad VARCHAR(255) NOT NULL,
    cantidadHabitantes INT,
    PRIMARY KEY (pais, ciudad)
);
 
CREATE TABLE PASAJERO (
    pais VARCHAR(255) NOT NULL,
    nroDoc NUMERIC(10) NOT NULL,
    tipoDoc VARCHAR(255) NOT NULL,
    nombreCompleto VARCHAR(255),
    fechaNacimiento DATE,
    PRIMARY KEY (pais, nroDoc, tipoDoc)
);
 
CREATE TABLE PILOTO (
    numeroPiloto INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    hsVuelo INT,
    licencia VARCHAR(255) UNIQUE
);

CREATE TABLE VIAJE (
    numeroPiloto INT NOT NULL,
    idAvion INT NOT NULL,
    paisPasajero VARCHAR(255) NOT NULL,
    nroDocPasajero NUMERIC(10) NOT NULL,
    tipoDocPasajero VARCHAR(255) NOT NULL,
    paisDestino VARCHAR(255) NOT NULL,
    ciudadDestino VARCHAR(255) NOT NULL,
    fechaViaje DATE NOT NULL,
    importe DECIMAL(10, 2)NOT NULL,
    metodoPago VARCHAR (255) NOT NULL,
    PRIMARY KEY (idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje),
    FOREIGN KEY (idAvion) REFERENCES AVION(idAvion),
    FOREIGN KEY (paisPasajero, nroDocPasajero, tipoDocPasajero) REFERENCES PASAJERO(pais, nroDoc, tipoDoc),
    FOREIGN KEY (paisDestino, ciudadDestino) REFERENCES DESTINO(pais, ciudad),
    FOREIGN KEY (numeroPiloto) REFERENCES PILOTO(numeroPiloto),
    CONSTRAINT metodo_pago_check CHECK (metodoPago IN ('Efectivo', 'Tarjeta', 'Transferencia'))
);



INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(1000, 099999999, 'Ibernia', 'razon 1', 'España', 'Internacional');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(2000, 088888888, 'Golazo', 'razon 2', 'Brasil', 'Internacional');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(3000, 077777777, 'Pluma', 'razon 3', 'Uruguay', 'Local');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(4000, 066666666, 'Jamaican', 'razon 4', 'Jamaica', 'Internacional');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(5000, 055555555, 'AeroLiniers', 'razon 5', 'Argentina', 'Ambas');




INSERT INTO PILOTO(numeroPiloto, nombre, hsVuelo, licencia)
VALUES
(1, 'Piloto Perez', 500, 5001);
INSERT INTO PILOTO(numeroPiloto, nombre, hsVuelo, licencia)
VALUES
(2, 'Piloto Gomez', 3500, 2001);




INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(100, 'B100', 1000, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(101, 'A101', 1000, 'Airbus');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(102, 'E102', 1000, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(103, 'B103', 2000, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(104, 'A104', 2000, 'Airbus');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(105, 'E105', 2000, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(106, 'B106', 3000, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(107, 'A107', 4000, 'Airbus');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(108, 'E108', 5000, 'Embraer');



INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Francia', 'Paris', 2240621);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Australia', 'Sidney', 5450496);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Australia', 'Melbourne', 5207145);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Brasil', 'Rio de Janeiro', 6211223);


INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais1', 1, 'pasaporte', 'nom 1', '14/06/2000');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais2', 2, 'pasaporte', 'nom 2', '14/06/2004');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais3', 3, 'pasaporte', 'nom 3', '14/06/1994');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais4', 4, 'pasaporte', 'nom 4', '14/06/2005');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais5', 5, 'pasaporte', 'nom 5', '14/06/2006');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais6', 6, 'pasaporte', 'nom 6', '14/06/2007');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais7', 7, 'pasaporte', 'nom 7', '14/06/2008');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais8', 8, 'pasaporte', 'nom 8', '14/06/2009');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais9', 9, 'pasaporte', 'nom 9', '14/06/2005');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais10', 10, 'pasaporte', 'nom 10', '14/06/1993');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais1', 31, 'pasaporte', 'nom 31', '14/06/2000');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais2', 32, 'pasaporte', 'nom 32', '14/06/2004');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais3', 33, 'pasaporte', 'nom 33', '14/06/1994');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais4', 34, 'pasaporte', 'nom 34', '14/06/2005');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais5', 35, 'pasaporte', 'nom 35', '14/06/2006');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais6', 36, 'pasaporte', 'nom 36', '14/06/2007');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais7', 37, 'pasaporte', 'nom 37', '14/06/2008');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais8', 38, 'pasaporte', 'nom 38', '14/06/2009');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais9', 39, 'pasaporte', 'nom 39', '14/06/2005');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais10', 30, 'pasaporte', 'nom 30', '14/06/1993');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais1', 400, 'pasaporte', 'Nombre 400', '14/06/2000');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais1', 401, 'pasaporte', 'Nombre 401', '14/06/2004');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais1', 402, 'pasaporte', 'Nombre 402', '14/06/1994');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais1', 403, 'pasaporte', 'Nombre 403', '14/06/2005');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais1', 404, 'pasaporte', 'Nombre 404', '14/06/2006');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais1', 405, 'pasaporte', 'Nombre 405', '14/06/2007');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais1', 406, 'pasaporte', 'Nombre 406', '14/06/2008');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais1', 407, 'pasaporte', 'Nombre 407', '14/06/2009');




INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 1, 'pasaporte', 'Francia', 'Paris', '23/12/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 104, 'pais2', 2, 'pasaporte', 'Francia', 'Paris', '23/12/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais3', 3, 'pasaporte', 'Francia', 'Paris', '23/12/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 105, 'pais4', 4, 'pasaporte', 'Francia', 'Paris', '23/12/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais5', 5, 'pasaporte', 'Francia', 'Paris', '23/12/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais5', 5, 'pasaporte', 'Francia', 'Paris', '23/12/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 104, 'pais6', 6, 'pasaporte', 'Francia', 'Paris', '23/12/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 105, 'pais6', 6, 'pasaporte', 'Francia', 'Paris', '23/12/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 100, 'pais7', 7, 'pasaporte', 'Francia', 'Paris', '23/12/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 103, 'pais8', 8, 'pasaporte', 'Francia', 'Paris', '23/12/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 1, 'pasaporte', 'Australia', 'Sidney', '01/07/2020', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais2', 2, 'pasaporte', 'Australia', 'Sidney', '01/07/2020', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais3', 3, 'pasaporte', 'Australia', 'Sidney', '01/07/2020', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais3', 3, 'pasaporte', 'Australia', 'Melbourne', '01/07/2020', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais4', 4, 'pasaporte', 'Australia', 'Melbourne', '01/07/2020', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais5', 5, 'pasaporte', 'Australia', 'Sidney', '01/07/2021', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais5', 5, 'pasaporte', 'Australia', 'Sidney', '01/07/2021', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 1, 'pasaporte', 'Australia', 'Melbourne', '01/07/2021', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais2', 2, 'pasaporte', 'Australia', 'Melbourne', '01/07/2021', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais6', 6, 'pasaporte', 'Australia', 'Melbourne', '01/07/2021', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais7', 7, 'pasaporte', 'Australia', 'Sidney', '01/07/2022', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais8', 8, 'pasaporte', 'Australia', 'Melbourne', '01/07/2022', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 1, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais2', 2, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais3', 3, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais4', 4, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais5', 5, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais6', 6, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais7', 7, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais8', 8, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais9', 9, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais10', 10, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais1', 1, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais2', 2, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais3', 3, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais4', 4, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais5', 5, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 102, 'pais6', 6, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 100, 'pais1', 31, 'pasaporte', 'Brasil', 'Rio de Janeiro', '01/04/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais2', 32, 'pasaporte', 'Brasil', 'Rio de Janeiro', '01/05/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 100, 'pais9', 39, 'pasaporte', 'Brasil', 'Rio de Janeiro', '01/06/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais10', 30, 'pasaporte', 'Brasil', 'Rio de Janeiro', '30/06/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 100, 'pais3', 33, 'pasaporte', 'Brasil', 'Rio de Janeiro', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais4', 34, 'pasaporte', 'Brasil', 'Rio de Janeiro', '01/05/2022', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 100, 'pais9', 39, 'pasaporte', 'Brasil', 'Rio de Janeiro', '31/03/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais10', 30, 'pasaporte', 'Brasil', 'Rio de Janeiro', '01/04/2024', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 100, 'pais5', 35, 'pasaporte', 'Australia', 'Sidney', '01/04/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais6', 36, 'pasaporte', 'Australia', 'Sidney', '01/05/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 100, 'pais9', 39, 'pasaporte', 'Australia', 'Sidney', '01/06/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais10', 30, 'pasaporte', 'Australia', 'Sidney', '30/06/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 100, 'pais7', 37, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais8', 38, 'pasaporte', 'Australia', 'Sidney', '01/05/2022', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 100, 'pais9', 39, 'pasaporte', 'Australia', 'Sidney', '31/03/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais10', 30, 'pasaporte', 'Australia', 'Sidney', '01/04/2024', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 101, 'pais1', 400, 'pasaporte', 'Francia', 'Paris', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 101, 'pais1', 400, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 101, 'pais1', 400, 'pasaporte', 'Australia', 'Melbourne', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 101, 'pais1', 400, 'pasaporte', 'Brasil', 'Rio de Janeiro', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 101, 'pais1', 401, 'pasaporte', 'Francia', 'Paris', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 101, 'pais1', 402, 'pasaporte', 'Francia', 'Paris', '01/07/2023', 2000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 101, 'pais1', 402, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 101, 'pais1', 402, 'pasaporte', 'Australia', 'Melbourne', '01/07/2023', 2000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 101, 'pais1', 402, 'pasaporte', 'Brasil', 'Rio de Janeiro', '01/07/2023', 2000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 101, 'pais1', 403, 'pasaporte', 'Francia', 'Paris', '01/07/2023', 2000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 404, 'pasaporte', 'Francia', 'Paris', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 404, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 404, 'pasaporte', 'Australia', 'Melbourne', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 404, 'pasaporte', 'Brasil', 'Rio de Janeiro', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 405, 'pasaporte', 'Francia', 'Paris', '01/07/2023', 2000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 406, 'pasaporte', 'Francia', 'Paris', '01/07/2023', 2000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 406, 'pasaporte', 'Australia', 'Sidney', '01/07/2023', 2000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 406, 'pasaporte', 'Australia', 'Melbourne', '01/07/2023', 2000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 406, 'pasaporte', 'Brasil', 'Rio de Janeiro', '01/07/2023', 2000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 101, 'pais1', 407, 'pasaporte', 'Francia', 'Paris', '01/07/2023', 2000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 103, 'pais1', 407, 'pasaporte', 'Francia', 'Paris', '01/07/2023', 1800, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 106, 'pais1', 407, 'pasaporte', 'Francia', 'Paris', '01/07/2023', 1500, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 107, 'pais1', 407, 'pasaporte', 'Francia', 'Paris', '01/07/2023', 1500, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 108, 'pais1', 407, 'pasaporte', 'Francia', 'Paris', '01/07/2023', 1800, 'Transferencia');




