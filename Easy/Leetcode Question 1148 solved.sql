-- Q.1148 Write an SQL query to find all the authors that viewed at least one of their own articles, sorted in ascending order by their id.
-- Note that equal author_id and viewer_id indicate the same person.

CREATE TABLE article_views (
    article_id INT,
    author_id INT,
    viewer_id INT,
    view_date DATE
);

INSERT INTO article_views (article_id, author_id, viewer_id, view_date) VALUES
(1, 3, 5, '2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2, 7, 7, '2019-08-01'),
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),
(3, 4, 4, '2019-07-21');

select * from article_views;

SELECT DISTINCT
    author_id
FROM
    article_views
WHERE
    author_id = viewer_id
ORDER BY 1 ASC;
