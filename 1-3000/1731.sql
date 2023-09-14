/* Write your PL/SQL query statement below */

select 
em2.employee_id, 
em2.name,
count(*) as reports_count,
round(avg(em1.age)) as average_age
from 
employees em1
inner join
employees em2 
on em1.reports_to = em2.employee_id 
group by em2.employee_id, em2.name
order by em2.employee_id
