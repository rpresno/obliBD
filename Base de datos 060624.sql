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


INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Francia', 'Paris', 2240621);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Australia', 'Sidney', 5450496);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Australia', 'Melbourne', 5207145);


INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais1', 1, 'pasaporte', 'nom 1', '1/1/1900');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais2', 2, 'pasaporte', 'nom 2', '1/1/1900');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais3', 3, 'pasaporte', 'nom 3', '1/1/1900');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais4', 4, 'pasaporte', 'nom 4', '1/1/1900');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais5', 5, 'pasaporte', 'nom 5', '1/1/1900');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais6', 6, 'pasaporte', 'nom 6', '1/1/1900');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais7', 7, 'pasaporte', 'nom 7', '1/1/1900');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais8', 8, 'pasaporte', 'nom 8', '1/1/1900');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais9', 9, 'pasaporte', 'nom 9', '1/1/1900');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('pais10', 10, 'pasaporte', 'nom 10', '1/1/1900');


INSERT INTO PILOTO(numeroPiloto, nombre, hsVuelo, licencia)
VALUES
(1, 'Piloto Perez', 500, 5001);


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
