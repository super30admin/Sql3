WITH bus_time_passenger AS (
    SELECT
        p.passenger_id,
        MIN(b.arrival_time) AS bus_time
    FROM
        Passengers p
    LEFT JOIN
        Buses b
        ON p.arrival_time <= b.arrival_time
    GROUP BY
        p.passenger_id
)

SELECT
    b.bus_id,
    COUNT(bp.bus_time) AS passengers_cnt
FROM
    Buses b
LEFT JOIN
    bus_time_passenger bp
    ON bp.bus_time = b.arrival_time
GROUP BY
    b.bus_id
ORDER BY
    b.bus_id;