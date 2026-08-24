-- Q.1068 Write an SQL query that reports all product names of the products in the Sales table along with their selling year and price.
-- Note that the price is per unit.

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    year INT,
    quantity INT,
    price DECIMAL(10, 2)
);

drop table if exists Product;
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255)
);

INSERT INTO Sales (sale_id, product_id, year, quantity, price)
VALUES
(1, 100, 2008, 10, 5000.00),
(2, 100, 2009, 12, 5000.00),
(7, 200, 2011, 15, 9000.00);

INSERT INTO Product (product_id, product_name)
VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');

select * from Sales;
select * from Product;

SELECT 
    p.product_name, s.year, s.price
FROM
    sales s
        JOIN
    product p ON s.product_id = p.product_id;