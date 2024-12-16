# {"headers": ["PASSENGER_ID", "ARRIVAL_TIME", "BUS_ARRIVAL"], "values": [[11, 1, 2], [12, 5, 7], [13, 6, 7], [14, 7, 7]]}


WITH CTE AS(
    SELECT P.PASSENGER_ID, P.ARRIVAL_TIME, MIN(B.ARRIVAL_TIME) AS BUS_ARRIVAL
    FROM PASSENGERS P LEFT JOIN BUSES B
    ON P.ARRIVAL_TIME <= B.ARRIVAL_TIME
    GROUP BY P.PASSENGER_ID # we need the minimum time for every passenger, thats why we used group by clause.
)

SELECT B.BUS_ID AS BUS_ID, COUNT(CTE.BUS_ARRIVAL) AS PASSENGERS_CNT 
FROM BUSES B LEFT JOIN CTE
ON B.arrival_time = CTE.BUS_ARRIVAL
GROUP BY B.BUS_ID # we need the count for every bus_id, thats why we used group by clause
ORDER BY B.BUS_ID ASC;