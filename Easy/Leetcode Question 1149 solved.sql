-- Q.1149 Write an SQL query to find all the people who viewed more than one article on the same date, sorted in ascending order by their id.

INSERT INTO article_views (article_id, author_id, viewer_id, view_date) VALUES (3, 4, 5, '2019-08-01');

SELECT DISTINCT
    a1.viewer_id
FROM
    article_views a1
        JOIN
    article_views a2 ON a1.view_date = a2.view_date
        AND a1.author_id <> a2.viewer_id
GROUP BY a1.viewer_id
HAVING COUNT(distinct a1.article_id) > 1
ORDER BY 1;