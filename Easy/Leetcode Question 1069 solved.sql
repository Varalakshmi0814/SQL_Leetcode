-- Q.1069 Write an SQL query that reports the total quantity sold for every product id.

SELECT 
    p.product_id, SUM(s.quantity) AS total_quantity
FROM
    sales s
        JOIN
    product p ON s.product_id = p.product_id
GROUP BY product_id
ORDER BY 1;