SELECT DISTINCT a.*
FROM VIAJE v
INNER JOIN AVION av
ON av.idavion = v.idavion
INNER JOIN AEROLINEA a
ON a.rutaerolinea = av.rutaerolinea
WHERE NOT EXISTS (
    SELECT v2.*
    FROM VIAJE v2
    WHERE v2.importe < v.importe
)
AND UPPER(a.tipovuelo) = 'INTERNACIONAL'
