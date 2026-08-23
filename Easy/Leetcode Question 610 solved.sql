-- Q.610 write a query to judge whether the three sides can form a triangle, assuming table triangle holds the length of the three sides x, y and z.

	CREATE TABLE my_table (
	    x INT,
	    y INT,
	    z INT
	);
	
	INSERT INTO my_table (x, y, z)
	VALUES 
	(13, 15, 30),
	(10, 20, 15);
    
    select * from my_table;
    
select x,y,z,
case
	when x + y > z and x + z > y and y + z > x then "Yes" 
	else "no"
end as triangle
from my_table;