-- Q.1173 Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal places.
-- If the preferred delivery date of the customer is the same as the order date then the order is called immediate otherwise it's called scheduled.

CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);

INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES
(1, 1, '2019-08-01', '2019-08-02'),
(2, 5, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-11'),
(4, 3, '2019-08-24', '2019-08-26'),
(5, 4, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13');

select * from Delivery;

Select distinct round(((SELECT count(delivery_id) AS same_day_delivery_count
				FROM
			delivery
			WHERE
			order_date = customer_pref_delivery_date)/ (select count(delivery_id) from delivery))* 100,2) as immediate_delivery from delivery;

SELECT
ROUND(SUM(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE 0 END)/count(1)*100, 2) immediate_percentage
FROM Delivery;
