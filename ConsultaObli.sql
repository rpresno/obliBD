WITH VIAJES_FILTRADOS as (SELECT v.*
	FROM VIAJE v
	WHERE UPPER(v.paisdestino) = 'URUGUAY' 
    OR UPPER(v.paisdestino) = 'ARGENTINA'  
    OR UPPER(v.paisdestino) = 'BRASIL'  
    OR UPPER(v.paisdestino) = 'PARAGUAY' 
    AND v.fechaviaje BETWEEN '01/01/2023' AND '31/12/2023'
), VIAJES_CONSIDERADOS AS (
    SELECT v.*, r.rutaerolinea, r.tipovuelo
    FROM VIAJES_FILTRADOS v
    INNER JOIN AVION a on a.idavion = v.idavion
    INNER JOIN AEROLINEA r ON r.rutaerolinea = a.rutaerolinea
),
VUELOS_POR_PILOTO AS (
    SELECT v.rutaerolinea, v.tipovuelo, v.paisdestino, v.numeropiloto, to_char(v.fechaviaje, 'YYYY"Q"Q') AS trimestre, COUNT(*)
    FROM VIAJES_CONSIDERADOS v
    GROUP BY v.rutaerolinea, v.tipovuelo, v.paisdestino, v.numeropiloto, to_char(v.fechaviaje, 'YYYY"Q"Q')
), PILOTOS_DISTINTOS AS (
    SELECT vp.rutaerolinea, vp.tipovuelo, vp.paisdestino, trimestre, COUNT(*) AS pilotos_distintos
    FROM VUELOS_POR_PILOTO vp
    GROUP BY vp.rutaerolinea, vp.tipovuelo, vp.paisdestino, trimestre
),
VUELOS_DISTINTOS AS (
    SELECT v.rutaerolinea, v.tipovuelo, v.numeropiloto, v.idavion, v.paisdestino, v.ciudaddestino, v.fechaviaje, COUNT(*)
    FROM VIAJES_CONSIDERADOS v
    GROUP BY v.rutaerolinea, v.tipovuelo, v.numeropiloto, v.idavion, v.paisdestino, v.ciudaddestino, v.fechaviaje
),
VUELOS_DIST_POR_TRIM AS (
    SELECT v.rutaerolinea, v.tipovuelo, v.paisdestino, to_char(v.fechaviaje, 'YYYY"Q"Q') AS trimestre, COUNT(*) as vuelos_dist_por_trimestre
    FROM VUELOS_DISTINTOS v
    GROUP BY v.rutaerolinea, v.tipovuelo, v.paisdestino, to_char(v.fechaviaje, 'YYYY"Q"Q')
),
PASAJEROS_DIST_POR_TRIMESTRE AS (
    SELECT DISTINCT v.rutaerolinea, v.tipovuelo, v.idavion, v.paisdestino, to_char(v.fechaviaje, 'YYYY"Q"Q') as trimestre, v.nrodocpasajero, v.paispasajero, v.tipodocpasajero
    FROM VIAJES_CONSIDERADOS v
),
CANT_PAS_TRIM AS (
    SELECT pad.rutaerolinea, pad.tipovuelo, pad.idavion, pad.paisdestino, pad.trimestre, COUNT(*) as cantpas
    FROM PASAJEROS_DIST_POR_TRIMESTRE pad
    GROUP BY pad.rutaerolinea, pad.tipovuelo, pad.idavion, pad.paisdestino, pad.trimestre
),
VIAJES_PAS_POR_SEMESTRE AS (
    SELECT v.rutaerolinea, v.tipovuelo, v.paisdestino, to_char(v.fechaviaje, 'YYYY"Q"Q') AS trimestre, v.nrodocpasajero, v.paispasajero, v.tipodocpasajero, COUNT(*) as viajes_sem
    FROM VIAJES_CONSIDERADOS v
    GROUP BY v.rutaerolinea, v.tipovuelo, v.paisdestino, to_char(v.fechaviaje, 'YYYY"Q"Q'), v.nrodocpasajero, v.paispasajero, v.tipodocpasajero
),
PASAJERO_MAS_VIAJES AS (
    SELECT v.rutaerolinea, v.tipovuelo, v.paisdestino,
    v.trimestre, p.nombrecompleto as pasajero
    FROM VIAJES_PAS_POR_SEMESTRE v
    INNER JOIN PASAJERO p
    ON p.nrodoc = v.nrodocpasajero
        AND p.pais = v.paispasajero
        AND p.tipodoc = v.tipodocpasajero
    WHERE NOT EXISTS (
        SELECT v2.*
        FROM VIAJES_PAS_POR_SEMESTRE v2
        WHERE v2.viajes_sem > v.viajes_sem
    )
)
SELECT v.*, pd.pilotos_distintos, pas.cantpas, pmv.pasajero
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
INNER JOIN PASAJERO_MAS_VIAJES pmv ON 
    pd.rutaerolinea = pmv.rutaerolinea
    AND pd.tipovuelo = pmv.tipovuelo
    AND pd.paisdestino = pmv.paisdestino
    AND pd.trimestre = pmv.trimestre