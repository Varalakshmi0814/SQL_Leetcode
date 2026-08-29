-- Q.1511 Write an SQL query to report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020.

drop table if exists Customers1;
CREATE TABLE Customers1 (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50)
);

drop table if exists Product2;
CREATE TABLE Product2 (
    product_id INT PRIMARY KEY,
    description VARCHAR(100),
    price DECIMAL(10, 2)
);

drop table if exists Orders4;
CREATE TABLE Orders4 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
    
);

INSERT INTO Customers1 (customer_id, name, country) VALUES
(1, 'Winston', 'USA'),
(2, 'Jonathan', 'Peru'),
(3, 'Moustafa', 'Egypt');

INSERT INTO Product2 (product_id, description, price) VALUES
(10, 'LC Phone', 300),
(20, 'LC T-Shirt', 10),
(30, 'LC Book', 45),
(40, 'LC Keychain', 2);


INSERT INTO Orders4 (order_id, customer_id, product_id, order_date, quantity) VALUES
(1, 1, 10, '2020-06-10', 1),
(2, 1, 20, '2020-07-01', 1),
(3, 1, 30, '2020-07-08', 2),
(4, 2, 10, '2020-06-15', 2),
(5, 2, 40, '2020-07-01', 10),
(6, 3, 20, '2020-06-24', 2),
(7, 3, 30, '2020-06-25', 2),
(9, 3, 30, '2020-05-08', 3);

Select * from Customers1;
Select * from Product2;
Select * from Orders4;

with t1 as (
select c.customer_id, c.name, month(o.order_date) as order_month, sum(o.quantity * p.price) as total_price  from customers1 c
join orders4 o on c.customer_id = o.customer_id
join product2 p on o.product_id = p.product_id
where month(o.order_date) in ('6','7')
group by c.customer_id, month(o.order_date)
)
select customer_id, name from t1
where total_price >= 100
group by customer_id
having count(order_month) = 2;

select it.customer_id,c.name from
(select c.customer_id,
sum(case when extract(month from o.order_date)= 6 THEN o.quantity*p.price ELSE 0 END ) as June,
sum(case when extract(month from o.order_date)= 7 THEN o.quantity*p.price ELSE 0 END ) as July
from customers c left join orders o on c.customer_id=o.customer_id 
left join Product p on p.product_id=o.product_id
group by c.customer_id)it
join Customers c  on c.customer_id=it.customer_id 
where june >=100 and july >=100;
