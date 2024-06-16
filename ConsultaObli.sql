/*SELECT p.nrodoc
	FROM PASAJERO p, VIAJE v, PILOTO pi
	WHERE p.nrodoc = v.nrodocpasajero
    	AND p.pais = v.paispasajero
    	AND p.tipodoc = v.tipodocpasajero
    	AND pi.numeropiloto = v.numeropiloto
    	AND pi.hsvuelo > 3000
    	AND UPPER(v.metodopago) = 'EFECTIVO'
	GROUP BY p.nrodoc
	HAVING COUNT ( DISTINCT p.nrodoc, v.paisdestino, v.ciudaddestino
        SELECT v.paisdestino, v.ciudaddestino, COUNT (DISTINCT v.paisdestino, v.ciudaddestino)
        FROM PASAJERO p, VIAJE v
        GROUP BY p.nrodoc, v.paisdestino, v.ciudaddestino
        )*/
 /*       
SELECT p.nrodoc
	FROM PASAJERO p, VIAJE v, PILOTO pi
	WHERE p.nrodoc = v.nrodocpasajero
    	AND p.pais = v.paispasajero
    	AND p.tipodoc = v.tipodocpasajero
    	AND pi.numeropiloto = v.numeropiloto
    	AND pi.hsvuelo > 3000
    	AND UPPER(v.metodopago) = 'EFECTIVO'
        AND NOT EXISTS (
            SELECT d2.*
            FROM DESTINO d2
            WHERE d2.ciudad NOT IN (
                SELECT v2.*
                FROM VIAJE v2, PASAJERO p2
                WHERE p2.nrodoc = v2.nrodocpasajero
                    AND p2.pais = v2.paispasajero
                    AND p2.tipodoc = v2.tipodocpasajero
                GROUP BY v2.ciudaddestino
            )
        )
	GROUP BY p.nrodoc*/
    
SELECT v2.*
FROM VIAJE v2, PASAJERO p2
WHERE p2.nrodoc = v2.nrodocpasajero
    AND p2.pais = v2.paispasajero
    AND p2.tipodoc = v2.tipodocpasajero
GROUP BY v2.ciudaddestino
    