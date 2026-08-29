-- Q.1484 Write an SQL query to find for each date, the number of distinct products sold and their names.
-- The sold-products names for each date should be sorted lexicographically.
-- Return the result table ordered by sell_date.

CREATE TABLE Activities (
    sell_date DATE,
    product VARCHAR(50)
);

INSERT INTO Activities (sell_date, product) VALUES
('2020-05-30', 'Headphone'),
('2020-06-01', 'Pencil'),
('2020-06-02', 'Mask'),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Bible'),
('2020-06-02', 'Mask'),
('2020-05-30', 'T-Shirt');

SELECT DISTINCT
    sell_date,
    COUNT(*) AS num_sold,
    GROUP_CONCAT(DISTINCT product
        ORDER BY product) AS products
FROM
    Activities
GROUP BY sell_date
ORDER BY 1;