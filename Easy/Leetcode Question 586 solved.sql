-- Q.586 Query the customer_number from the orders table for the customer who has placed the largest number of orders.
-- It is guaranteed that exactly one customer will have placed more orders than any other customer.

	CREATE TABLE Orders1 (
    order_number INT PRIMARY KEY,
    customer_number INT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    status VARCHAR(50),
    comment TEXT
);		
			
			
INSERT INTO Orders1 (order_number, customer_number, order_date, required_date, shipped_date, status, comment) VALUES (1, 1, '2017-04-09', '2017-04-13', '2017-04-12', 'Closed', NULL);		
INSERT INTO Orders1 (order_number, customer_number, order_date, required_date, shipped_date, status, comment) VALUES (2, 2, '2017-04-15', '2017-04-20', '2017-04-18', 'Closed', NULL);		
INSERT INTO Orders1 (order_number, customer_number, order_date, required_date, shipped_date, status, comment) VALUES (3, 3, '2017-04-16', '2017-04-25', '2017-04-20', 'Closed', NULL);		
INSERT INTO Orders1 (order_number, customer_number, order_date, required_date, shipped_date, status, comment) VALUES (4, 3, '2017-04-18', '2017-04-28', '2017-04-25', 'Closed', NULL);	
	
SELECT 
    *
FROM
    orders1;
    
SELECT 
    customer_number
FROM
    orders1
GROUP BY customer_number
HAVING COUNT(*) > 1;

SELECT 
    customer_number
FROM
    orders1
GROUP BY customer_number
ORDER BY COUNT(1) DESC
LIMIT 1;
