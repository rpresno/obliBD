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


INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Francia', 1, 'Pasaporte', 'nombre 1', '01/01/2000');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Mexico', 2, 'Pasaporte', 'nombre 2', '01/01/2000');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Egipto', 3, 'Pasaporte', 'nombre 3', '01/01/2000');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Uruguay', 4, 'Pasaporte', 'nombre 4', '01/01/2000');


INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(1000, 09001711, 'Aero A', 'razon A', 'Uruguay', 'Internacional');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(2000, 1122, 'Aero B', 'razon B', 'Brasil', 'Local');


INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(100, 'B100', 1000, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(101, 'A101', 1000, 'Airbus');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(102, 'E102', 2000, 'Embraer');


INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Francia', 'Paris', 1000000);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Brasil', 'Rio de Janeiro', 1000000);


INSERT INTO PILOTO(numeroPiloto, nombre, hsVuelo, licencia)
VALUES
(100, 'Piloto Perez', 1000, 1);
INSERT INTO PILOTO(numeroPiloto, nombre, hsVuelo, licencia)
VALUES
(101, 'Piloto Gomez', 1000, 2);
INSERT INTO PILOTO(numeroPiloto, nombre, hsVuelo, licencia)
VALUES
(102, 'Piloto Muniz', 1000, 3);
INSERT INTO PILOTO(numeroPiloto, nombre, hsVuelo, licencia)
VALUES
(103, 'Piloto Pilatez', 1000, 4);


INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(100, 100, 'Francia', 1, 'Pasaporte', 'Francia', 'Paris', '01/01/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(100, 102, 'Mexico', 2, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '01/07/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(100, 102, 'Egipto', 3, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '01/07/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(100, 100, 'Uruguay', 4, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '01/07/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(100, 102, 'Francia', 1, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '01/10/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(100, 100, 'Mexico', 2, 'Pasaporte', 'Francia', 'Paris', '02/10/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(100, 102, 'Egipto', 3, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '03/10/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(100, 100, 'Uruguay', 4, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '04/10/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(100, 102, 'Francia', 1, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '05/10/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(100, 100, 'Mexico', 2, 'Pasaporte', 'Francia', 'Paris', '01/12/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(101, 102, 'Egipto', 3, 'Pasaporte', 'Francia', 'Paris', '01/12/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(101, 100, 'Uruguay', 4, 'Pasaporte', 'Francia', 'Paris', '01/12/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(101, 102, 'Francia', 1, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '01/12/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(101, 100, 'Mexico', 2, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '01/12/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(101, 102, 'Egipto', 3, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '01/12/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(101, 100, 'Uruguay', 4, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '03/12/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(102, 102, 'Francia', 1, 'Pasaporte', 'Francia', 'Paris', '02/12/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(102, 100, 'Mexico', 2, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '02/12/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(102, 102, 'Egipto', 3, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '02/12/2023', 100, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(103, 100, 'Uruguay', 4, 'Pasaporte', 'Brasil', 'Rio de Janeiro', '02/12/2023', 100, 'Efectivo');

