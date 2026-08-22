-- Q.595 Write a SQL solution to output big countries' name, population and area.
-- A country is big if it has an area of bigger than 3 million square km or a population of more than 25 million.

CREATE TABLE Countries (	
    name VARCHAR(50) PRIMARY KEY,	
    continent VARCHAR(50),	
    area INT,	
    population INT,	
    gdp BIGINT	
);	
	
INSERT INTO Countries (name, continent, area, population, gdp) VALUES ('Afghanistan', 'Asia', 652230, 25500100, 20343000);	
INSERT INTO Countries (name, continent, area, population, gdp) VALUES ('Albania', 'Europe', 28748, 2831741, 12960000);	
INSERT INTO Countries (name, continent, area, population, gdp) VALUES ('Algeria', 'Africa', 2381741, 37100000, 188681000);	
INSERT INTO Countries (name, continent, area, population, gdp) VALUES ('Andorra', 'Europe', 468, 78115, 3712000);	
INSERT INTO Countries (name, continent, area, population, gdp) VALUES ('Angola', 'Africa', 1246700, 20609294, 100990000);	
	
select * from Countries;	
    
SELECT 
    name, population, area
FROM
    countries
WHERE
    area >= 3000000 OR population > 25000000;