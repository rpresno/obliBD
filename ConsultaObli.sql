/*8) Listar los destinos más visitados del 1º de enero del 2024 hasta la fecha de hoy y el importe
total de vuelos, donde dicho importe haya sido mayor al importe promedio para ese país en
el mismo período*/
/*SELECT v.ciudaddestino, v.paisdestino, SUM(v.importe)
FROM VIAJE v
INNER JOIN PASAJERO p ON v.nrodocpasajero = p.nrodoc
    AND v.tipodocpasajero = p.tipodoc
    AND v.paispasajero = p.pais
/*WHERE (v.importe =  (SELECT AVG(v2.importe)
                    FROM VIAJE v2
                    INNER JOIN PASAJERO p2 ON v.nrodocpasajero = p2.nrodoc
                        AND v2.tipodocpasajero = p2.tipodoc
                        AND v2.paispasajero = p2.pais
                        AND v.paisdestino = v2.paisdestino
                    GROUP BY v2.paisdestino
                    )
    )
GROUP BY v.ciudaddestino, v.paisdestino
HAVING (v.importe =  (SELECT AVG(v2.importe)
                    FROM VIAJE v2
                    INNER JOIN PASAJERO p2 ON v.nrodocpasajero = p2.nrodoc
                        AND v2.tipodocpasajero = p2.tipodoc
                        AND v2.paispasajero = p2.pais
                        AND v.paisdestino = v2.paisdestino
                    GROUP BY v2.paisdestino
                    ))
    AND COUNT(*) = (
    SELECT MAX(COUNT(*))
    FROM viaje v
    INNER JOIN PASAJERO p ON v.nrodocpasajero = p.nrodoc
        AND v.tipodocpasajero = p.tipodoc
        AND v.paispasajero = p.pais
    GROUP BY v.ciudaddestino, v.paisdestino
    )
    */
   
SELECT v.paisdestino, v.ciudaddestino, SUM(v.importe) AS importeTotal
FROM VIAJE v
WHERE v.fechaviaje BETWEEN '01/01/2024' AND SYSDATE 
	AND (v.importe > (
            SELECT AVG(v2.importe)
            FROM VIAJE v2
            WHERE v2.paisDestino = v.paisDestino
            AND v2.fechaviaje BETWEEN '01/01/2024' AND SYSDATE 
            )
        )
GROUP BY v.paisDestino,  v.ciudadDestino
 