-- Q.1435 Write an SQL query to report the (bin, total) in any order.
-- You want to know how long a user visits your application. 
-- You decided to create bins of "[0-5>", "[5-10>", "[10-15>" and "15 minutes or more" and count the number of sessions on it.

CREATE TABLE Sessions (
    session_id INT PRIMARY KEY,
    duration INT
);

INSERT INTO Sessions (session_id, duration) VALUES
(1, 30),
(2, 299),
(3, 340),
(4, 580),
(5, 1000);

with bin as (
select *,
case
	when Floor(duration/60) >= 0 and Floor(duration/60) < 5 then "[0-5>"
    when Floor(duration/60) >= 5 and Floor(duration/60) < 10 then "[5-10>"
    when Floor(duration/60) >= 10 and Floor(duration/60) < 15 then "[10-15>"
    when Floor(duration/60) >= 15 and Floor(duration/60) < 20 then "15 or more"
    else 0
end as bins
from sessions
)
select bins, ifnull(count(*),0) as total from bin
group by bins ;

(SELECT '[0-5>' AS bin,
 SUM(CASE WHEN duration/60 < 5 THEN 1 ELSE 0 END) AS total FROM Sessions)
 UNION
(SELECT '[5-10>' AS bin,
 SUM(CASE WHEN ((duration/60 >= 5) AND (duration/60 < 10)) THEN 1 ELSE 0 END) AS total FROM Sessions)
 UNION
(SELECT '[10-15>' AS bin,
 SUM(CASE WHEN ((duration/60 >= 10) AND (duration/60 < 15)) THEN 1 ELSE 0 END) AS total FROM Sessions)
 UNION
(SELECT '15 or more' AS bin,
 SUM(CASE WHEN duration/60 >= 15 THEN 1 ELSE 0 END) AS total FROM Sessions);