CREATE TABLE Buses (
    bus_id INT,
    arrival_time INT
);

CREATE TABLE Passengers (
    passenger_id INT,
    arrival_time INT
);

INSERT INTO Buses (bus_id, arrival_time) VALUES
(1, 2),
(2, 4),
(3, 7);

INSERT INTO Passengers (passenger_id, arrival_time) VALUES
(11, 1),
(12, 5),
(13, 6),
(14, 7);


WITH CTE AS(SELECT p.passenger_id, p.arrival_time, MIN(b.arrival_time) AS bus_arrival_time
FROM Passengers p
INNER JOIN Buses b
ON p.arrival_time <= b.arrival_time
GROUP BY p.passenger_id, p.arrival_time
) 
SELECT b.bus_id, COUNT(CTE.bus_arrival_time) AS 'passenger_count'
FROM Buses b
LEFT JOIN CTE
ON b.arrival_time = CTE.bus_arrival_time
GROUP BY b.bus_id;
