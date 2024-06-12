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



--PILOTOS
INSERT INTO PILOTO(numeroPiloto, nombre, hsVuelo, licencia)
VALUES
(6, 'Romina Muniz', 1100, 23);
INSERT INTO PILOTO(numeroPiloto, nombre, hsVuelo, licencia)
VALUES
(2, 'Municia Romin', 1200, 24);
INSERT INTO PILOTO(numeroPiloto, nombre, hsVuelo, licencia)
VALUES
(3, 'Rodrigo Muniz', 3000, 25);
INSERT INTO PILOTO(numeroPiloto, nombre, hsVuelo, licencia)
VALUES
(5, 'Piloto Pilates', 15000, 26);
INSERT INTO PILOTO(numeroPiloto, nombre, hsVuelo, licencia)
VALUES
(4, 'Juan Elgatto', 15000, 27);
INSERT INTO PILOTO(numeroPiloto, nombre, hsVuelo, licencia)
VALUES
(1, 'Amelia Earhart', 99999, 1);





--AEROLINEAS
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(112354975138, 11111111, 'Bryanair', 'razon 1', 'Irlanda', 'Internacional');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(151795238796, 22222222, 'Golazo', 'razon 2', 'Brasil', 'Local');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(197749449449, 33333333, 'Pluma', 'razon 3', 'Uruguay', 'Ambas');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(310191797749, 55555555, 'EurAiropa', 'razon 4', 'Francia', 'Internacional');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(740926799855, 44444444, 'Capo', 'razon 5', 'Chile', 'Local');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(749479749744, 77777777, 'Aerolentas Argentinas', 'razon 7', 'Argentina', 'Local');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(798497716161, 88888888, 'Lamat', 'razon 8', 'Colombia', 'Internacional');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(947849401990, 44444444, 'British Erreways', 'razon 6', 'Reino Unido', 'Ambas');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(980790979844, 99999999, 'I Barria', 'razon 9', 'Espania', 'Internacional');
INSERT INTO AEROLINEA(rutAerolinea, telefono, nombre, razonSocial, pais, tipoVuelo)
VALUES
(999999999999, 18181818, 'Konsthansa', 'razon 0', 'Alemania', 'Internacional');




--AVIONES
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(1794, 4557, 112354975138, 'Airbus');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(8485, 92851, 947849401990, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(8091, 51002, 151795238796, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(8576, 49523, 947849401990, 'Airbus');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(76, 60296, 740926799855, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(7767, 41159, 151795238796, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(8349, 15365, 740926799855, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(1243, 294, 947849401990, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(1789, 39782, 151795238796, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(9434, 5217, 740926799855, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(9627, 3299, 112354975138, 'Airbus');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(8798, 95061, 740926799855, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(7784, 51682, 798497716161, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(6335, 92998, 798497716161, 'Airbus');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(2460, 3095, 798497716161, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(6924, 98964, 980790979844, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(6470, 30552, 999999999999, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(4443, 45827, 980790979844, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(5641, 85761, 151795238796, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(6327, 84870, 112354975138, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(9836, 74333, 197749449449, 'Airbus');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(706, 87608, 197749449449, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(6330, 83924, 749479749744, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(6219, 57660, 749479749744, 'Airbus');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(4131, 58020, 197749449449, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(2682, 23715, 112354975138, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(3655, 7900, 740926799855, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(5349, 46417, 197749449449, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(8433, 16744, 151795238796, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(3694, 70657, 197749449449, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(2399, 99051, 197749449449, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(6899, 8258, 798497716161, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(4796, 90046, 112354975138, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(1969, 55485, 112354975138, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(6877, 38399, 151795238796, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(5231, 50669, 740926799855, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(4639, 92306, 151795238796, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(6101, 38222, 798497716161, 'Boeing');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(3612, 49636, 112354975138, 'Embraer');
INSERT INTO AVION(idAvion, matricula, rutAerolinea, modelo)
VALUES
(4869, 58709, 112354975138, 'Boeing');





--DESTINOS
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Uruguay', 'Montevideo', 2337433);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Uruguay', 'Maldonado', 1144909);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Brasil', 'Brasilia', 1059300);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Argentina', 'Buenos Aires', 2113665);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Argentina', 'Concordia', 165573);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Estados Unidos', 'Miami', 2594687);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Estados Unidos', 'Nueva York', 1727878);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Nueva Delhi', 'India', 1329030);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Espania', 'Barcelona', 8479447);
INSERT INTO DESTINO(pais, ciudad, cantidadHabitantes)
VALUES
('Espania', 'Madrid', 1779671);





--PASAJEROS
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Uruguay', 2713701, 'Cedula', 'Emmalynn Davidson', '09/04/1975');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Uruguay', 2762237, 'Cedula', 'Dante Pierce', '02/01/1984');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Brasil', 3717275, 'Pasaporte', 'Arabella Underwood', '18/04/1991');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Argentina', 3784198, 'Pasaporte', 'Reece Andrews', '23/10/1971');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Argentina', 2848945, 'Pasaporte', 'Payton Noble', '15/03/2007');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Estados Unidos', 3516598, 'Pasaporte', 'Idris Ortiz', '30/08/1999');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Estados Unidos', 2913732, 'Cedula', 'Anna Kirby', '13/07/1982');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Espania', 5554654, 'Pasaporte', 'Tony Riley', '08/02/1995');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Bolivia', 4217743, 'Pasaporte', 'Kayla Wall', '09/06/2001');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Peru', 3142150, 'Pasaporte', 'Issac Knox', '19/06/1997');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Argentina', 4598443, 'Cedula', 'Kallie Black', '17/02/1995');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Peru', 5227767, 'Pasaporte', 'Matteo Norton', '04/09/1991');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Uruguay', 6968667, 'Pasaporte', 'Kylee Silva', '08/06/2006');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Argentina', 6418799, 'Pasaporte', 'Luka Flynn', '10/06/1971');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Espania', 2700936, 'Pasaporte', 'Dorothy Norris', '06/03/2002');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Uruguay', 4293981, 'Pasaporte', 'Cairo Cameron', '06/06/1990');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Brasil', 6217203, 'Pasaporte', 'Julie Swanson', '17/08/1990');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Espania', 4536645, 'Cedula', 'Hugo Galvan', '14/05/1991');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Espania', 6209789, 'Pasaporte', 'Dallas Chan', '30/12/2007');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Nueva Delhi', 2409617, 'Pasaporte', 'Frank Phillips', '13/03/2006');
INSERT INTO PASAJERO(pais, nroDoc, tipoDoc, nombreCompleto, fechaNacimiento)
VALUES
('Uruguay', 11111111, 'Cedula', 'Lucas Rebellato', '20/03/2000');







--VIAJES
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 1794, 'Uruguay', 2713701, 'Cedula', 'Uruguay', 'Montevideo', '05/05/2024', 4000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 8485, 'Uruguay', 2762237, 'Cedula', 'Uruguay', 'Maldonado', '05/05/2024', 3000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(3, 8091, 'Brasil', 3717275, 'Pasaporte', 'Espania', 'Barcelona', '05/05/2023', 1000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(5, 8576, 'Argentina', 3784198, 'Pasaporte', 'Espania', 'Madrid', '05/05/2023', 7000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(4, 76, 'Argentina', 2848945, 'Pasaporte', 'Argentina', 'Concordia', '05/05/2023', 6000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(6, 7767, 'Estados Unidos', 3516598, 'Pasaporte', 'Estados Unidos', 'Miami', '10/05/2023', 1000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 8349, 'Estados Unidos', 2913732, 'Cedula', 'Estados Unidos', 'Nueva York', '10/05/2024', 6000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(5, 9434, 'Peru', 3142150, 'Pasaporte', 'Uruguay', 'Montevideo', '10/05/2024', 4000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(4, 1794, 'Argentina', 4598443, 'Cedula', 'Uruguay', 'Maldonado', '10/05/2024', 3000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(6, 8485, 'Peru', 5227767, 'Pasaporte', 'Brasil', 'Brasilia', '10/05/2024', 1000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 8091, 'Uruguay', 6968667, 'Pasaporte', 'Argentina', 'Buenos Aires', '10/05/2024', 9000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 8576, 'Argentina', 6418799, 'Pasaporte', 'Argentina', 'Concordia', '10/05/2024', 8000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(3, 2460, 'Espania', 2700936, 'Pasaporte', 'Espania', 'Barcelona', '10/05/2024', 8000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(5, 6924, 'Uruguay', 2713701, 'Cedula', 'Espania', 'Madrid', '10/05/2024', 7000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(4, 6470, 'Uruguay', 2762237, 'Cedula', 'Espania', 'Barcelona', '10/05/2024', 1000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(6, 4443, 'Brasil', 3717275, 'Pasaporte', 'Espania', 'Madrid', '10/05/2024', 5000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 5641, 'Argentina', 3784198, 'Pasaporte', 'Uruguay', 'Maldonado', '10/05/2024', 3000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 1794, 'Argentina', 2848945, 'Pasaporte', 'Brasil', 'Brasilia', '04/04/2024', 2000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(3, 8485, 'Estados Unidos', 3516598, 'Pasaporte', 'Argentina', 'Buenos Aires', '04/04/2024', 2000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(5, 8091, 'Estados Unidos', 2913732, 'Cedula', 'Argentina', 'Concordia', '04/04/2024', 6000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(4, 8576, 'Espania', 5554654, 'Pasaporte', 'Espania', 'Barcelona', '04/04/2024', 7000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(6, 6219, 'Bolivia', 4217743, 'Pasaporte', 'Espania', 'Madrid', '04/04/2024', 3000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(4, 4131, 'Uruguay', 2713701, 'Cedula', 'Brasil', 'Brasilia', '04/04/2024', 6000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(6, 2682, 'Uruguay', 2762237, 'Cedula', 'Argentina', 'Buenos Aires', '04/04/2024', 1000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(1, 3655, 'Brasil', 3717275, 'Pasaporte', 'Argentina', 'Concordia', '04/04/2024', 4000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 8485, 'Argentina', 3784198, 'Pasaporte', 'Estados Unidos', 'Miami', '04/04/2024', 8000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(3, 8091, 'Argentina', 2848945, 'Pasaporte', 'Estados Unidos', 'Nueva York', '04/04/2024', 3000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(5, 8576, 'Estados Unidos', 3516598, 'Pasaporte', 'Argentina', 'Buenos Aires', '04/04/2024', 6000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(4, 2460, 'Estados Unidos', 2913732, 'Cedula', 'Espania', 'Madrid', '04/04/2024', 6000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(6, 6899, 'Espania', 5554654, 'Pasaporte', 'Espania', 'Barcelona', '04/04/2024', 5000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(5, 1794, 'Bolivia', 4217743, 'Pasaporte', 'Espania', 'Madrid', '04/04/2024', 9000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(4, 8485, 'Peru', 3142150, 'Pasaporte', 'Uruguay', 'Montevideo', '04/04/2024', 1000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(6, 8091, 'Argentina', 4598443, 'Cedula', 'Uruguay', 'Maldonado', '04/04/2024', 1000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(2, 8576, 'Peru', 5227767, 'Pasaporte', 'Brasil', 'Brasilia', '04/04/2024', 9000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(3, 8485, 'Uruguay', 6968667, 'Pasaporte', 'Argentina', 'Buenos Aires', '04/04/2024', 1000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(5, 8091, 'Argentina', 6418799, 'Pasaporte', 'Espania', 'Barcelona', '04/04/2024', 4000, 'Tarjeta');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(4, 8576, 'Espania', 2700936, 'Pasaporte', 'Espania', 'Madrid', '04/04/2024', 5000, 'Transferencia');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(6, 2460, 'Uruguay', 4293981, 'Pasaporte', 'Estados Unidos', 'Nueva York', '04/04/2024', 8000, 'Efectivo');
INSERT INTO VIAJE(numeroPiloto, idAvion, paisPasajero, nroDocPasajero, tipoDocPasajero, paisDestino, ciudadDestino, fechaViaje, importe, metodoPago)
VALUES
(6, 2460, 'Uruguay', 11111111, 'Cedula', 'Estados Unidos', 'Nueva York', '04/04/2024', 8000, 'Efectivo');






