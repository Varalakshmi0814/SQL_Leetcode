-- Q.603 Can you help to query all the consecutive available seats order by the seat_id using the following cinema table?
-- The seat_id is an auto increment int, and free is bool (‘1’ means free, and ‘0’ means occupied.). 
-- Consecutive available seats are more than 2(inclusive) seats consecutively available.

CREATE TABLE seats (
    seat_id INT PRIMARY KEY,
    free INT
);

INSERT INTO seats (seat_id, free) VALUES
(1, 1),
(2, 0),
(3, 1),
(4, 1),
(5, 1),
(6,0),
(7,1),
(8,1),
(9,0),
(10,1),
(11,1),
(12,0),
(13,0),
(14,0),
(15,0);

select * from seats;

SELECT DISTINCT
    t1.seat_id
FROM
    seats t1
        JOIN
    seats t2 ON ABS(t1.seat_id - t2.seat_id) = 1
WHERE
    t1.free = 1 AND t2.free = 1
ORDER BY 1;

with t1 as 
         (select *,row_number() over (order by seat_id) as rn,
		               seat_id - row_number() over (order by seat_id) as diff from seats WHERE free <> 0),
	  t2 as
	      (select *,count(*) over (partition by diff)  as count_records from t1
		  )
select seat_id,diff,count_records from t2 where count_records >1;