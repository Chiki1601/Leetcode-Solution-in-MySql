# Write your MySQL query statement below
select Product.product_id, product_name
from Product left join Sales
on Product.product_id = Sales.product_id
group by product_id
having min(sale_date) >= '2019-01-01' and max(sale_date) <= '2019-03-31';

