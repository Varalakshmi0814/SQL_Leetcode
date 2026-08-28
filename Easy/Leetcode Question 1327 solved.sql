-- Q.1327 Write an SQL query to get the names of products with greater than or equal to 100 units ordered in February 2020 and their amount.
-- Return result table in any order.

drop table if exists Products;
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    product_category VARCHAR(20)
);

drop table if exists Orders3;
CREATE TABLE Orders3 (
    product_id INT,
    order_date DATE,
    unit INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_id, product_name, product_category) VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');

INSERT INTO Orders3 (product_id, order_date, unit) VALUES
(1, '2020-02-05', 60),
(1, '2020-02-10', 70),
(2, '2020-01-18', 30),
(2, '2020-02-11', 80),
(3, '2020-02-17', 2),
(3, '2020-02-24', 3),
(4, '2020-03-01', 20),
(4, '2020-03-04', 30),
(4, '2020-03-04', 60),
(5, '2020-02-25', 50),
(5, '2020-02-27', 50),
(5, '2020-03-01', 50);

Select * from Products;
Select * from Orders3;

select product_name, sum(unit) as Order_Quantity from orders3 o
join products p on o.product_id = p.product_id
where order_date between '2020-02-01' and '2020-02-29'
group by p.product_id
having sum(unit) >= 100;