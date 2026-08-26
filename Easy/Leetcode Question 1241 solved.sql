-- Q.1241 Write an SQL query to find number of comments per each post.
-- Result table should contain post_id and its corresponding number_of_comments, and must be sorted by post_id in ascending order.
-- Submissions may contain duplicate comments. You should count the number of unique comments per post.
-- Submissions may contain duplicate posts. You should treat them as one post.

CREATE TABLE Submissions (
    sub_id INT,
    parent_id INT
);

INSERT INTO Submissions (sub_id, parent_id) VALUES
(1, NULL),
(2, NULL),
(1, NULL),
(12, NULL),
(3, 1),
(5, 2),
(3, 1),
(4, 1),
(9, 1),
(10, 2),
(6, 7);

SELECT 
    p.sub_id AS post_id,
    COUNT(DISTINCT c.sub_id) AS no_of_comments
FROM
    submissions p
        LEFT JOIN
    submissions c ON p.sub_id = c.parent_id
WHERE
    p.parent_id IS NULL
GROUP BY p.sub_id;
