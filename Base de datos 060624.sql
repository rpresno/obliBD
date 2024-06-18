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



-- Datos para AEROLINEA
INSERT INTO AEROLINEA (rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo) VALUES
('A001', '123456789', 'Airline A', 'Airline A S.A.', 'Argentina', 'Internacional');
INSERT INTO AEROLINEA (rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo) VALUES
('A002', '987654321', 'Airline B', 'Airline B S.A.', 'Brasil', 'Internacional');

-- Datos para AVION
INSERT INTO AVION (idAvion, matricula, rutAerolinea, modelo) VALUES
(1, 'ABC123', 'A001', 'Boeing 737');
INSERT INTO AVION (idAvion, matricula, rutAerolinea, modelo) VALUES
(2, 'DEF456', 'A001', 'Airbus A320');
INSERT INTO AVION (idAvion, matricula, rutAerolinea, modelo) VALUES
(3, 'GHI789', 'A002', 'Embraer 190');

-- Datos para DESTINO
INSERT INTO DESTINO (pais, ciudad, cantidadHabitantes) VALUES
('Argentina', 'Buenos Aires', 15000000);
INSERT INTO DESTINO (pais, ciudad, cantidadHabitantes) VALUES
('Brasil', 'Rio de Janeiro', 6000000);
INSERT INTO DESTINO (pais, ciudad, cantidadHabitantes) VALUES
('Uruguay', 'Montevideo', 1300000);

-- Datos para PASAJERO
INSERT INTO PASAJERO (pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento) VALUES
('Argentina', '12345678', 'DNI', 'Juan Perez', '1980-01-01');
INSERT INTO PASAJERO (pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento) VALUES
('Brasil', '87654321', 'DNI', 'Maria Silva', '1990-02-02');
INSERT INTO PASAJERO (pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento) VALUES
('Uruguay', '11223344', 'DNI', 'Carlos Rodriguez', '1985-03-03');

-- Datos para PILOTO
INSERT INTO PILOTO (numeroPiloto, licencia, hsVuelo) VALUES
(1, 'LIC001', 5000);
INSERT INTO PILOTO (numeroPiloto, licencia, hsVuelo) VALUES
(2, 'LIC002', 4000);

-- Datos para VIAJE (menos utilizados en los últimos 3 meses)
INSERT INTO VIAJE (numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fecha, importe, metodoPago) VALUES
(1, 1, 'Argentina', '12345678', 'DNI', 'Argentina', 'Buenos Aires', '01/04/2024', 150.00, 'Tarjeta');
INSERT INTO VIAJE (numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fecha, importe, metodoPago) VALUES
(1, 2, 'Argentina', '12345678', 'DNI', 'Argentina', 'Buenos Aires', '02/04/2024', 200.00, 'Tarjeta');
INSERT INTO VIAJE (numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fecha, importe, metodoPago) VALUES
(2, 3, 'Brasil', '87654321', 'DNI', 'Brasil', 'Rio de Janeiro', '03/04/2024', 300.00, 'Tarjeta');
INSERT INTO VIAJE (numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fecha, importe, metodoPago) VALUES
(2, 1, 'Uruguay', '11223344', 'DNI', 'Uruguay', 'Montevideo', '04/04/2024', 100.00, 'Tarjeta');