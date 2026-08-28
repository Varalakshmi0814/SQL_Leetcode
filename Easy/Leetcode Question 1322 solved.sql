-- Q.1322 Write an SQL query to find the ctr of each Ad.
-- Round ctr to 2 decimal points. Order the result table by ctr in descending order and by ad_id in ascending order in case of a tie.

CREATE TABLE Ads (
    ad_id INT,
    user_id INT,
    action VARCHAR(10)
);

INSERT INTO Ads (ad_id, user_id, action) VALUES
(1, 1, 'Clicked'),
(2, 2, 'Clicked'),
(3, 3, 'Viewed'),
(5, 5, 'Ignored'),
(1, 7, 'Ignored'),
(2, 7, 'Viewed'),
(3, 5, 'Clicked'),
(1, 4, 'Viewed'),
(2, 11, 'Viewed'),
(1, 2, 'Clicked');

Select * from Ads order by ad_id;

select distinct a.ad_id, round(ifnull((x.total_clicks/(x.total_clicks+y.total_views)),0)*100,2) as ctr from ads a 
left join 
(select ad_id, count(action) as total_clicks from ads where action  = 'Clicked' group by ad_id) x on a.ad_id = x.ad_id
left join
(select ad_id, count(action) as total_views from ads where action  = 'Viewed' group by ad_id) y
on a.ad_id = y.ad_id
order by ctr desc ,ad_id;

with T1 as(
select ad_id,
	sum(case when action =  'Clicked' then 1 else 0 end) as clicks,
    sum(case when action = 'Viewed' then 1 else 0 end) as views
from ads
group by ad_id
)
select ad_id, 
case
	when clicks+views = 0 then 0 else round(ifnull((clicks/(clicks+views)),0)*100,2) 
end as ctr
from T1
order by ctr desc, ad_id;
