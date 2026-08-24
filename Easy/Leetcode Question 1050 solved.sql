-- Q.1050 Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor have cooperated with the director at least 3 times.

CREATE TABLE ActorDirector (
    actor_id INT,
    director_id INT,
    timestamp INT
);


INSERT INTO ActorDirector (actor_id, director_id, timestamp)
VALUES
(1, 1, 0),
(1, 1, 1),
(1, 1, 2),
(1, 2, 3),
(1, 2, 4),
(2, 1, 5),
(2, 1, 6);


select * from ActorDirector;

select actor_id, director_id from actordirector
group by actor_id, director_id
having count(1)>=3;
