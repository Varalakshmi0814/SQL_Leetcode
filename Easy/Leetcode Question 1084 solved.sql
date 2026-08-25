-- Q.1084 Reports the products that were ONLY sold in spring 2019. That is, between 2019-01-01 and 2019-03-31 inclusive. 
-- Select the product that were only sold in spring 2019.

select distinct p.product_id, p.product_name from product1 p 
join sales1 s on s.product_id = p.product_id
where s.sale_date between "2019-01-01" and "2019-03-31"
and not exists (
select distinct p.product_id, p.product_name from product1 p 
join sales1 s on s.product_id = p.product_id
where s.sale_date < "2019-01-01" and s.sale_date > "2019-03-31");