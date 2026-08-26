-- Q.1179 Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

CREATE TABLE Department (
    id INT,
    revenue INT,
    month ENUM(
        'Jan', 'Feb', 'Mar', 'Apr',
        'May', 'Jun', 'Jul', 'Aug',
        'Sep', 'Oct', 'Nov', 'Dec'
    ),
    PRIMARY KEY (id, month)
);

INSERT INTO Department (id, revenue, month) VALUES
(1, 8000, 'Jan'),
(2, 9000, 'Jan'),
(3, 10000, 'Feb'),
(1, 7000, 'Feb'),
(1, 6000, 'Mar');


select * from department;

select id, 
SUM(IF(month='Jan', revenue, NULL)) AS Jan_Revenue,
SUM(IF(month='Feb', revenue, NULL)) AS Feb_Revenue,
SUM(IF(month='Mar', revenue, NULL)) AS Mar_Revenue,
SUM(IF(month='Apr', revenue, NULL)) AS Apr_Revenue,
SUM(IF(month='May', revenue, NULL)) AS May_Revenue,
SUM(IF(month='Jun', revenue, NULL)) AS Jun_Revenue,
SUM(IF(month='Jul', revenue, NULL)) AS Jul_Revenue,
SUM(IF(month='Aug', revenue, NULL)) AS Aug_Revenue,
SUM(IF(month='Sep', revenue, NULL)) AS Sep_Revenue,
SUM(IF(month='Oct', revenue, NULL)) AS Oct_Revenue,
SUM(IF(month='Nov', revenue, NULL)) AS Nov_Revenue,
SUM(IF(month='Dec', revenue, NULL)) AS Dec_Revenue
from department
group by id;

select id, 
sum(case when month = 'Jan' then revenue end) as jan_revenue,
sum(case when month = 'Feb' then revenue end) as feb_revenue,
sum(case when month = 'Mar' then revenue end) as mar_revenue,
sum(case when month = 'Apr' then revenue end) as apr_revenue,
sum(case when month = 'May' then revenue end) as may_revenue,
sum(case when month = 'Jun' then revenue end) as jun_revenue,
sum(case when month = 'Jul' then revenue end) as jul_revenue,
sum(case when month = 'aug' then revenue end) as aug_revenue,
sum(case when month = 'sep' then revenue end) as sep_revenue,
sum(case when month = 'oct' then revenue end) as oct_revenue,
sum(case when month = 'nov' then revenue end) as nov_revenue,
sum(case when month = 'dec' then revenue end) as dec_revenue
from department
group by id;