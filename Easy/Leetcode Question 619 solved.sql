-- Q.619 Can you write a SQL query to find the biggest number, which only appears once.
--  Table number contains many numbers in column num including duplicated ones. 

CREATE TABLE numbers (
    num INT
);

INSERT INTO numbers (num)
VALUES 
(8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);

select * from numbers;

select ifnull((select num from numbers
group by num having count(num) = 1
order by 1 desc
limit 1), NULL) AS biggest_number;