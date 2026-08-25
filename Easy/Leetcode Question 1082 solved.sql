-- Q.1082 Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all.

CREATE TABLE Product1 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    unit_price DECIMAL(10, 2)
);

drop table if exists Sales1;

CREATE TABLE Sales1 (
    seller_id INT,
    product_id INT,
    buyer_id INT,
    sale_date DATE,
    quantity INT,
    price DECIMAL(10, 2)
 );

INSERT INTO Product1 (product_id, product_name, unit_price)
VALUES
(1, 'S8', 1000.00),
(2, 'G4', 800.00),
(3, 'iPhone', 1400.00);


INSERT INTO Sales1 (seller_id, product_id, buyer_id, sale_date, quantity, price)
VALUES
(1, 1, 1, '2019-01-21', 2, 2000.00),
(1, 2, 2, '2019-02-17', 1, 800.00),
(2, 2, 3, '2019-06-02', 1, 800.00),
(3, 3, 4, '2019-05-13', 2, 2800.00);

INSERT INTO Sales1 (seller_id, product_id, buyer_id, sale_date, quantity, price)
VALUES (2, 1, 4, '2019-10-22', 1, 1000.00);


 select * from Product1;
 select * from Sales1;

SELECT 
    seller_id
FROM
    sales1
GROUP BY seller_id
HAVING SUM(price) = (SELECT 
						SUM(price)
						FROM
							sales1
						GROUP BY seller_id
						ORDER BY 1 DESC
						LIMIT 1);