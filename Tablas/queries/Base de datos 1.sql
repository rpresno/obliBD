SELECT EXTRACT (YEAR FROM v.fechaviaje) AS a�o,
    v.ciudaddestino AS ciudad,
    COUNT(*) as cantpasajeros
FROM VIAJE v
JOIN DESTINO d
    ON v.paisdestino = d.pais AND v.ciudaddestino = d.ciudad
WHERE d.pais = 'Australia'
GROUP BY EXTRACT (YEAR FROM v.fechaviaje),
    v.ciudaddestino
HAVING COUNT(*) in min(COUNT(*))
/*HAVING count(*) <= 15 and COUNT(*) = (
                    SELECT MIN(COUNT(*)), v2.ciudaddestino,
                    COUNT(*) as cantpasajeros
                    FROM VIAJE v2
                    JOIN DESTINO d2
                    ON v2.paisdestino = d2.pais AND v2.ciudaddestino = d2.ciudad
                    WHERE d2.pais = 'Australia'
                    GROUP BY EXTRACT (YEAR FROM v2.fechaviaje),
                        v2.ciudaddestino
                    )*/
ORDER BY a�o,
    cantpasajeros ASC;