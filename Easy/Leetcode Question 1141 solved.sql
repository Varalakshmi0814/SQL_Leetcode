-- Q.1141 Write an SQL query to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
-- A user was active on some day if he/she made at least one activity on that day.

CREATE TABLE user_activity (
    user_id INT,
    session_id INT,
    activity_date DATE,
    activity_type VARCHAR(20)
);

INSERT INTO user_activity (user_id, session_id, activity_date, activity_type) VALUES
(1, 1, '2019-07-20', 'open_session'),
(1, 1, '2019-07-20', 'scroll_down'),
(1, 1, '2019-07-20', 'end_session'),
(2, 4, '2019-07-20', 'open_session'),
(2, 4, '2019-07-21', 'send_message'),
(2, 4, '2019-07-21', 'end_session'),
(3, 2, '2019-07-21', 'open_session'),
(3, 2, '2019-07-21', 'send_message'),
(3, 2, '2019-07-21', 'end_session'),
(4, 3, '2019-06-25', 'open_session'),
(4, 3, '2019-06-25', 'end_session');

select * from user_Activity;

SELECT 
    activity_date, COUNT(DISTINCT user_id) AS active_user_count
FROM
    user_activity
WHERE activity_Date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date;
