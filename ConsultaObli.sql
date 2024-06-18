SELECT DISTINCT r.nombre, r.tipovuelo, v.paisdestino, to_char(v.fechaviaje, 'YYYY"Q"Q') as trimestre
    FROM AEROLINEA r, VIAJE v, AVION a
    WHERE v.idavion = a.idavion
    AND a.rutaerolinea = r.rutaerolinea
    

WITH pilotos AS (
    SELECT DISTINCT r.nombre, r.tipovuelo, v.paisdestino, v.numeropiloto, v.ciudaddestino, v.fechaviaje, v.idavion
    FROM AEROLINEA r, VIAJE v, AVION a
    WHERE v.idavion = a.idavion
    AND a.rutaerolinea = r.rutaerolinea
)
SELECT pi.nombre, pi.tipovuelo, v.paisdestino, to_char(v.fechaviaje, 'YYYY"Q"Q') as trimestre, count (*) as cantpilotos
FROM pilotos pi, VIAJE v
WHERE pi.paisdestino = v.paisdestino
    AND pi.ciudaddestino = v.paisdestino
    AND v.fechaviaje = pi.fechaviaje
    AND v.idavion = pi.idavion
    AND v.numeropiloto = pi.numeropiloto
GROUP B















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