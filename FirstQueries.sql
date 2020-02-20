#line_item

#1
SELECT *
FROM line_item;

#1.1
SELECT *
FROM line_item
LIMIT 10;

#1.2
SELECT sku,
	unit_price,
	date
FROM line_item
LIMIT 10;

#2
SELECT COUNT(*)
FROM line_item;

#2.1
SELECT COUNT(DISTINCT sku)
FROM line_item;

#3
SELECT sku, 
	AVG(unit_price)
FROM line_item
GROUP BY sku
LIMIT 10;

#3.1
SELECT sku, 
	AVG(unit_price) AS avg_price
FROM line_item
GROUP BY sku
ORDER BY avg_price DESC
LIMIT 10;

#4
SELECT sku,
	product_quantity
FROM line_item
ORDER BY product_quantity DESC
LIMIT 100;

#orders

#for reference
SELECT *
FROM orders
LIMIT 10;

#5
SELECT COUNT(*)
FROM orders;

#6
SELECT state, 
	COUNT(*)
FROM orders
GROUP BY state
LIMIT 10;

#7
SELECT *
FROM orders
WHERE created_date LIKE "2017-01%";

#8
SELECT COUNT(*)
FROM orders
WHERE created_date LIKE "2017-01%";

#9
SELECT COUNT(*)
FROM orders
WHERE created_date LIKE "2017-01-04%"
AND state = "Cancelled";

#10
SELECT MONTH(created_date), COUNT(*)
FROM orders
GROUP BY MONTH(created_date);

#11
SELECT SUM(total_paid)
FROM orders;

#12
SELECT AVG(total_paid)
FROM orders;

#12.1
SELECT ROUND(AVG(total_paid), 2)
FROM orders;

#13
SELECT created_date
FROM orders
GROUP BY created_date DESC
LIMIT 1;

#13.1
SELECT created_date
FROM orders
GROUP BY created_date ASC
LIMIT 1;

#14
SELECT DATE(created_date), COUNT(*)
FROM orders
WHERE state = "Completed"
GROUP BY DATE(created_date)
ORDER BY COUNT(*) DESC
LIMIT 1;

#15
SELECT DATE(created_date), SUM(total_paid)
FROM orders
WHERE state = "Completed"
GROUP BY DATE(created_date)
ORDER BY SUM(total_paid) DESC
LIMIT 1;

#products

#for reference
SELECT *
FROM PRODUCTS
LIMIT 10;

#16
SELECT COUNT(DISTINCT ProductId)
FROM products;

#17
SELECT COUNT(DISTINCT brand) 
FROM products;

#18
SELECT COUNT(DISTINCT manual_categories)
FROM products;

#19
SELECT brand, COUNT(DISTINCT ProductId)
FROM products
GROUP BY brand;

#19.1
SELECT manual_categories, COUNT(DISTINCT ProductId)
FROM products
GROUP BY manual_categories;

#20
SELECT brand, AVG(price)
FROM products
GROUP BY brand;

#20.1
SELECT manual_categories, AVG(price)
FROM products
GROUP BY manual_categories;

#21
SELECT name_en, short_desc_en
FROM products a
INNER JOIN (
	SELECT brand, MAX(price) AS price
	FROM products
	GROUP BY brand ) b
	ON a.brand = b.brand AND a.price = b.price;
	
#21.1
SELECT name_en, short_desc_en
FROM products a
INNER JOIN (
	SELECT manual_categories, MAX(price) AS price
	FROM products
	GROUP BY manual_categories ) b
	ON a.manual_categories = b.manual_categories AND a.price = b.price;