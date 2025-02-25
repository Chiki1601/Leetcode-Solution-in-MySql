# Write your MySQL query statement below
select * 
from products 
where description regexp 'SN[0-9]{4}-[0-9]{4}[^0-9]+'
or description regexp 'SN[0-9]{4}-[0-9]{4}$'
order by 1;
