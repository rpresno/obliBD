/*4) Listar los datos de los pasajeros que hayan viajado a todos los destinos y que hayan pagado
en efectivo. Considerar los vuelos únicamente cuyo piloto tenga más de 3000 horas de
vuelo. Ordenar el resultado alfabéticamente por nombre del pasajero*/

SELECT p.*
FROM PASAJERO p
WHERE p.nrodoc IN (
    SELECT p.nrodoc
    FROM PASAJERO p, VIAJE v, PILOTO pi
    WHERE p.nrodoc = v.nrodocpasajero
        AND p.pais = v.paispasajero
        AND p.tipodoc = v.tipodocpasajero
        AND pi.numeropiloto = v.numeropiloto
        AND pi.hsvuelo > 3000
        AND UPPER(v.metodopago) = 'EFECTIVO'
    GROUP BY p.nrodoc
    HAVING COUNT(p.nrodoc) = (SELECT COUNT(*) FROM DESTINO)
)


