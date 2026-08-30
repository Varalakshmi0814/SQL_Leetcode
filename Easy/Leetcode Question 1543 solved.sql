-- Q.1543 Write an SQL query to report
-- product_name in lowercase without leading or trailing white spaces.
-- sale_date in the format ('YYYY-MM')
-- total the number of times the product was sold in this month.
-- Return the result table ordered by product_name in ascending order, in case of a tie order it by sale_date in ascending order.

drop table if exists Sales;
CREATE TABLE Sales2 (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    sale_date DATE
);

INSERT INTO Sales2 (sale_id, product_name, sale_date) VALUES
(1, '      LCPHONE     ', '2000-01-16'),
(2, '    LCPhone       ', '2000-01-17'),
(3, '     LcPhOnE      ', '2000-02-18'),
(4, '      LCKeyCHAiN  ', '2000-02-19'),
(5, '   LCKeyChain     ', '2000-02-28'),
(6, ' Matryoshka       ', '2000-03-31');

select trim(lower(product_name)) as product_name, date_format(sale_date, '%Y-%m') as sale_date, count(trim(lower(product_name))) as total from  sales2
group by trim(lower(product_name)),date_format(sale_date, '%Y-%m')
order by 1 asc, 2 asc;