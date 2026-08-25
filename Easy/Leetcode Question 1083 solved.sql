-- Q.1083 Write an SQL query that reports the buyers who have bought S8 but not iPhone. Note that S8 and iPhone are products present in the Product table.

SELECT DISTINCT
    s.buyer_id
FROM
    sales1 s
        LEFT JOIN
    product1 p ON s.product_id = p.product_id
WHERE
    p.product_name = 'S8'
        AND s.buyer_id NOT IN (SELECT DISTINCT
									s.buyer_id
								FROM
									sales1 s
										JOIN
									product1 p ON s.product_id = p.product_id
								WHERE
									p.product_name = 'iphone');