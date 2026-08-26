-- Q.1251 Write an SQL query to find the average selling price for each product.
-- average_price should be rounded to 2 decimal places.
-- Average selling price = Total Price of Product / Number of products sold.
-- Average selling price for product 1 = ((100 * 5) + (15 * 20)) / 115 = 6.96

CREATE TABLE Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price DECIMAL(10, 2)
);

 
CREATE TABLE UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);


INSERT INTO Prices (product_id, start_date, end_date, price) VALUES
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);


INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);
 
select * from Prices;
select * from UnitsSold;


SELECT 
    p.product_id,
    ROUND(SUM(u.units * p.price) / SUM(u.units), 2) AS average_product_price
FROM
    prices p
        LEFT JOIN
    unitssold u ON p.product_id = u.product_id
        AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;