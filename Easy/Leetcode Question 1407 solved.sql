-- Q.1407 Write an SQL query to report the distance travelled by each user.
-- Return the result table ordered by travelled_distance in descending order, if two or more users travelled the same distance, order them by their name in ascending order.

drop table if exists Users1;
CREATE TABLE Users1 (
    id INT PRIMARY KEY,
    User_name VARCHAR(50)
);

CREATE TABLE Rides (
    id INT PRIMARY KEY,
    user_id INT,
    distance INT,
    FOREIGN KEY (user_id) REFERENCES Users1(id)
);

INSERT INTO Users1 (id, user_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Alex'),
(4, 'Donald'),
(7, 'Lee'),
(13, 'Jonathan'),
(19, 'Elvis');

INSERT INTO Rides (id, user_id, distance) VALUES
(1, 1, 120),
(2, 2, 317),
(3, 3, 222),
(4, 7, 100),
(5, 13, 312),
(6, 19, 50),
(7, 7, 120),
(8, 19, 400),
(9, 7, 230);

Select * from Users1;
Select * from Rides;

SELECT DISTINCT
    u.user_name,
    IFNULL(SUM(r.distance), 0) AS travelled_distance
FROM
    users1 u
        LEFT JOIN
    rides r ON u.id = r.user_id
GROUP BY u.id
ORDER BY 2 DESC , u.user_name ASC;