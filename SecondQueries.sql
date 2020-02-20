#for reference 
select *
from line_item;

select * 
from products;

select *
from orders;


#Query 1
select line.sku, 
	line.product_quantity, 
	line.date, 
	line.unit_price, 
	prod.name_en, prod.price, 
from line_item line
join products prod
on line.sku = prod.sku;

#Query 2
select line.sku, 
	line.product_quantity, 
	line.date, 
	line.unit_price, 
	prod.name_en, prod.price, 
	round(prod.price - line.unit_price) as price_diff
from line_item line
join products prod
on line.sku = prod.sku;

#Query 3
select prod.manual_categories, round(sum(prod.price - line.unit_price), 2) as price_diff
from line_item line
join products prod
on line.sku = prod.sku
group by prod.manual_categories;

#Query 4
select prod.brand, round(sum(prod.price - line.unit_price),2) as price_diff
from line_item line
join products prod
on line.sku = prod.sku
group by prod.brand;

#Query 5
select prod.brand, round(sum(prod.price - line.unit_price),2) as price_diff
from line_item line
join products prod
on line.sku = prod.sku
group by prod.brand
having price_diff > 50000
order by price_diff desc;

#Query 6
select line.sku, o.*
from line_item line
join orders o
on line.id_order = o.id_order;

#Query 7
select line.sku, o.*, prod.brand, prod.manual_categories
from line_item line
join orders o
on line.id_order = o.id_order
join products prod
on line.sku = prod.sku;

#Query 8
select count(*), prod.brand, prod.manual_categories
from line_item line
join orders o
on line.id_order = o.id_order
join products prod
on line.sku = prod.sku
where o.state = "Cancelled"
group by prod.brand, prod.manual_categories;

