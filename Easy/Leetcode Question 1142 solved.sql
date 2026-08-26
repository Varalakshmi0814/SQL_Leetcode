-- q. 1142 Write an SQL query to find the average number of sessions per user for a period of 30 days ending 2019-07-27 inclusively, rounded to 2 decimal places.
--  The sessions we want to count for a user are those with at least one activity in that time period.

SELECT 
    IFNULL(ROUND(AVG(session_count), 2), 0) AS average_sessions_per_user
FROM
    (SELECT 
        user_id, COUNT(DISTINCT session_id) session_count
    FROM
        user_activity
    WHERE
        activity_Date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
    GROUP BY user_id) a;
