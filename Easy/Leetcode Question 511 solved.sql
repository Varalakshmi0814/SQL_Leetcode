-- Q.511 Write an SQL query that reports the first login date for each player.

CREATE TABLE PlayerActivity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, device_id, event_date)
);

INSERT INTO PlayerActivity (player_id, device_id, event_date, games_played) VALUES (1, 2, '2016-03-01', 5);	
INSERT INTO PlayerActivity (player_id, device_id, event_date, games_played) VALUES (1, 2, '2016-05-02', 6);	
INSERT INTO PlayerActivity (player_id, device_id, event_date, games_played) VALUES (2, 3, '2017-06-25', 1);	
INSERT INTO PlayerActivity (player_id, device_id, event_date, games_played) VALUES (3, 1, '2016-03-02', 0);	
INSERT INTO PlayerActivity (player_id, device_id, event_date, games_played) VALUES (3, 4, '2018-07-03', 5);	

select * from playeractivity;

select x.player_id, x.event_date as first_date from (select *, row_number() over(partition by player_id order by event_date) as rn from playeractivity) x
where x.rn = 1;

select player_id, min(event_date) as first_date from playeractivity
group by player_id;

select it.player_id,it.event_date from (select player_id,event_date,
rank() over (partition by player_id order by event_date) as ranking
from PlayerActivity)it where it.ranking =1;