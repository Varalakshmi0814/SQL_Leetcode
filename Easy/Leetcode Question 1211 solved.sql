-- Q.1211 Write an SQL query to find each query_name, the quality and poor_query_percentage.
-- Both quality and poor_query_percentage should be rounded to 2 decimal places.
-- QUALITY as: The average of the ratio between query rating and its position.
-- POOR QUERY PERCENTAGE as: The percentage of all queries with rating less than 3.
-- Ex : Dog queries quality is ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50
-- Ex : Dog queries poor_ query_percentage is (1 / 3) * 100 = 33.33


CREATE TABLE SearchResults (
    query_name VARCHAR(50),
    result VARCHAR(50),
    position INT,
    rating INT
);

INSERT INTO SearchResults (query_name, result, position, rating) VALUES
('Dog', 'Golden Retriever', 1, 5),
('Dog', 'German Shepherd', 2, 5),
('Dog', 'Mule', 200, 1),
('Cat', 'Shirazi', 5, 2),
('Cat', 'Siamese', 3, 3),
('Cat', 'Sphynx', 7, 4);

select * from SearchResults;

SELECT 
    query_name,
    ROUND(AVG(CAST(rating AS DECIMAL) / position),
            2) AS quality,
    ROUND(SUM(CASE
                WHEN rating < 3 THEN 1 ELSE 0
            END) / COUNT(1) * 100,
            2) AS poor_query_percentage
FROM
    searchresults
GROUP BY query_name;
