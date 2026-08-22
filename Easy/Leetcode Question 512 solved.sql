-- Q.512 Write a SQL query that reports the device that is first logged in for each player.

select device_id, min(event_date) from playeractivity
group by device_id
order by 1;