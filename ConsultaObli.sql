WITH VIAJES_CONSIDERADOS as (SELECT v.*
	FROM VIAJE v
	WHERE UPPER(v.paisdestino) = 'URUGUAY' 
    OR UPPER(v.paisdestino) = 'ARGENTINA'  
    OR UPPER(v.paisdestino) = 'BRASIL'  
    OR UPPER(v.paisdestino) = 'PARAGUAY' 
    AND v.fechaviaje BETWEEN '01/01/2023' AND '31/12/2023'
),
VUELOS_POR_PILOTO AS (
    SELECT r.rutaerolinea, r.tipovuelo, v.paisdestino, v.numeropiloto, to_char(v.fechaviaje, 'YYYY"Q"Q') AS trimestre, COUNT(*)
    FROM VIAJES_CONSIDERADOS v
    INNER JOIN AVION a on a.idavion = v.idavion
    INNER JOIN AEROLINEA r ON r.rutaerolinea = a.rutaerolinea
    GROUP BY r.rutaerolinea, r.tipovuelo, v.paisdestino, v.numeropiloto, to_char(v.fechaviaje, 'YYYY"Q"Q')
), PILOTOS_DISTINTOS AS (
    SELECT vp.rutaerolinea, vp.tipovuelo, vp.paisdestino, trimestre, COUNT(*) AS pilotos_distintos
    FROM vuelos_por_piloto vp
    GROUP BY vp.rutaerolinea, vp.tipovuelo, vp.paisdestino, trimestre
),
VUELOS_DISTINTOS AS (
    SELECT v.numeropiloto, v.idavion, v.paisdestino, v.ciudaddestino, v.fechaviaje, COUNT(*)
    FROM VIAJES_CONSIDERADOS v
    GROUP BY v.numeropiloto, v.idavion, v.paisdestino, v.ciudaddestino, v.fechaviaje
),
VUELOS_DIST_POR_TRIM AS (
    SELECT r.rutaerolinea, r.tipovuelo, v.paisdestino, to_char(v.fechaviaje, 'YYYY"Q"Q') AS trimestre, COUNT(*) as vuelos_dist_por_trimestre
    FROM VUELOS_DISTINTOS v
    INNER JOIN AVION a on a.idavion = v.idavion
    INNER JOIN AEROLINEA r ON r.rutaerolinea = a.rutaerolinea
    GROUP BY r.rutaerolinea, r.tipovuelo, v.paisdestino, to_char(v.fechaviaje, 'YYYY"Q"Q')
),/*
SELECT v.*, pd.pilotos_distintos
FROM VUELOS_DIST_POR_TRIM v
INNER JOIN PILOTOS_DISTINTOS pd ON
    pd.rutaerolinea = v.rutaerolinea
    AND pd.tipovuelo = v.tipovuelo
    AND pd.paisdestino = v.paisdestino
    AND pd.trimestre = v.trimestre
*/
PASAJEROS_DIST_POR_TRIMESTRE AS (
    SELECT DISTINCT v.idavion, v.paisdestino, to_char(v.fechaviaje, 'YYYY"Q"Q') as trimestre, v.nrodocpasajero, v.paispasajero, v.tipodocpasajero
    FROM VIAJES_CONSIDERADOS v
),
CANT_PAS_TRIM AS (
    SELECT a.rutaerolinea, r.tipovuelo, pad.idavion, pad.paisdestino, pad.trimestre, COUNT(*) as cantpas
    FROM PASAJEROS_DIST_POR_TRIMESTRE pad
    INNER JOIN AVION a ON a.idavion = pad.idavion
    INNER JOIN AEROLINEA r ON a.rutaerolinea = r.rutaerolinea
    GROUP BY a.rutaerolinea, r.tipovuelo, pad.idavion, pad.paisdestino, pad.trimestre
)
SELECT v.*, pd.pilotos_distintos, pas.cantpas
FROM VUELOS_DIST_POR_TRIM v
INNER JOIN PILOTOS_DISTINTOS pd ON
    pd.rutaerolinea = v.rutaerolinea
    AND pd.tipovuelo = v.tipovuelo
    AND pd.paisdestino = v.paisdestino
    AND pd.trimestre = v.trimestre
INNER JOIN CANT_PAS_TRIM pas ON 
    pd.rutaerolinea = pas.rutaerolinea
    AND pd.tipovuelo = pas.tipovuelo
    AND pd.paisdestino = pas.paisdestino
    AND pd.trimestre = pas.trimestre









/*WITH vuelosConsiderados AS (
	SELECT v.*, r.tipovuelo, r.rutaerolinea, to_char(v.fechaviaje, 'YYYY"Q"Q') AS trimestre
	FROM VIAJE v
	JOIN AVION a ON a.idavion = v.idavion
	JOIN AEROLINEA r ON r.rutaerolinea = a.rutaerolinea
	WHERE UPPER(v.paisdestino) = 'URUGUAY' 
    OR UPPER(v.paisdestino) = 'ARGENTINA'  
    OR UPPER(v.paisdestino) = 'BRASIL'  
    OR UPPER(v.paisdestino) = 'PARAGUAY' 
    AND v.fechaviaje BETWEEN '01/01/2023' AND '31/12/2023'
),

cantidades AS (
	SELECT r.rutaerolinea, r.tipovuelo, vc.paisdestino,
    to_char(vc.fechaviaje, 'YYYY"Q"Q') as trimestre,
    COUNT(vc.numeroPiloto || vc.idAvion || vc.paisPasajero || vc.nroDocPasajero || vc.tipoDocPasajero || vc.paisDestino || vc.ciudadDestino || vc.fechaviaje) AS cantVuelos,    
    COUNT(DISTINCT vc.paisPasajero || vc.nroDocPasajero || vc.tipoDocPasajero) AS cantPasajeros
	FROM vuelosConsiderados vc
	JOIN AVION a ON vc.idavion = a.idavion
	JOIN AEROLINEA r ON a.rutaerolinea = r.rutaerolinea
	GROUP BY r.rutaerolinea, r.tipovuelo, vc.paisdestino, to_char(vc.fechaviaje, 'YYYY"Q"Q')
)
SELECT * 
FROM vuelosConsiderados vc
JOIN cantidades c ON vc.rutaerolinea = c.rutaerolinea 
AND vc.tipovuelo = c.tipovuelo 
AND vc.paisdestino = c.paisdestino 
AND vc.trimestre = c.trimestre*/
