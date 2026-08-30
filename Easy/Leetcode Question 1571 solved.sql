-- Q.1571 Write an SQL query to report, How much cubic feet of volume does the inventory occupy in each warehouse.
-- warehouse_name
-- volume
-- Return the result table in any order.

CREATE TABLE Warehouse (
    name VARCHAR(50),
    product_id INT,
    units INT,
    PRIMARY KEY (name, product_id)
);

drop table if exists Products3;
CREATE TABLE Products3 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    Width INT,
    Length INT,
    Height INT
);

INSERT INTO Warehouse (name, product_id, units) VALUES
('LCHouse1', 1, 1),
('LCHouse1', 2, 10),
('LCHouse1', 3, 5),
('LCHouse2', 1, 2),
('LCHouse2', 2, 2),
('LCHouse3', 4, 1);


INSERT INTO Products3 (product_id, product_name, Width, Length, Height) VALUES
(1, 'LC-TV', 5, 50, 40),
(2, 'LC-KeyChain', 5, 5, 5),
(3, 'LC-Phone', 2, 10, 10),
(4, 'LC-T-Shirt', 4, 10, 20);

with warehouse_volume as (
select p.product_id, p.product_name, w.name, w.units, (width*length*height) as prod_vol from products3 p
join warehouse w on w.product_id = p.product_id
)
select name, sum(prod_vol*units) as volume from warehouse_volume 
group by name
;