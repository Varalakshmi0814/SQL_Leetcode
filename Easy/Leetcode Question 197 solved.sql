-- Q.197 Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).
-- Return the result table in any order.

	CREATE TABLE Weather (
	    id INT PRIMARY KEY,
	    recordDate DATE,
	    Temperature INT
	);
    
INSERT INTO Weather (id, recordDate, Temperature) VALUES (1, '2015-01-01', 10);	
INSERT INTO Weather (id, recordDate, Temperature) VALUES (2, '2015-01-02', 25);	
INSERT INTO Weather (id, recordDate, Temperature) VALUES (3, '2015-01-03', 20);	
INSERT INTO Weather (id, recordDate, Temperature) VALUES (4, '2015-01-04', 30);	

select * from weather;

SELECT 
    C.id
FROM
    weather P
        JOIN
    weather C ON DATEDIFF(c.recorddate, p.recorddate) = 1
        AND C.temperature > P.temperature;

select x.id from (select *,lag(temperature) over(order by recorddate) as prev_day_temp from weather) x
where x.temperature > x.prev_day_temp;
