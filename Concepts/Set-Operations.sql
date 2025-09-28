--Find the busiest flight route (origin → destination) with the highest total ticket count.
  --If the trip is round (oneway_round = 'R'), then count tickets in both directions.
  --Note: DEL → BOM and BOM → DEL are treated as different routes.

--Sample table
CREATE TABLE tickets (
    airline_number VARCHAR(10),
    origin VARCHAR(3),
    destination VARCHAR(3),
    oneway_round CHAR(1),
    ticket_count INT );

INSERT INTO tickets (airline_number, origin, destination, oneway_round, ticket_count) VALUES
    ('DEF456', 'BOM', 'DEL', 'O', 150),
    ('GHI789', 'DEL', 'BOM', 'R', 50),
    ('JKL012', 'BOM', 'DEL', 'R', 75),
    ('MNO345', 'DEL', 'NYC', 'O', 200),
    ('PQR678', 'NYC', 'DEL', 'O', 180),
    ('STU901', 'NYC', 'DEL', 'R', 60),
    ('ABC123', 'DEL', 'BOM', 'O', 100),
    ('VWX234', 'DEL', 'NYC', 'R', 90);


--SOLUTION 
SELECT top 1 origin,destination, sum(ticket_count) AS ticket_cnt  FROM (
SELECT origin, destination, ticket_count FROM tickets
UNION ALL
SELECT  destination, origin, ticket_count FROM tickets
WHERE oneway_round='r') a
GROUP BY origin, destination
ORDER BY ticket_cnt DESC;
