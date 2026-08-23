-- Q.613 Write a query to find the shortest distance between two points in these points.
-- Table point holds the x coordinate of some points on x-axis in a plane, which are all integers. 

CREATE TABLE points(
    x INT
);

INSERT INTO points (x)
VALUES 
(-1),
(0),
(2);

select * from points;

select min(t2-t1) as shortest from
( select x as t1, lead(x) over(order by x) as t2 from points) p1;