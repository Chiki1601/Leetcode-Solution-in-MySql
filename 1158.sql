# Write your MySQL query statement below
# Write your MySQL query statement below
select user_id buyer_id, join_date, ifnull(num,0) as orders_in_2019
from
    users
left join (
    select buyer_id, count(*) as num
    from orders
    where order_date between date('2019-01-01') and date('2019-12-31')
    group by buyer_id
) as t
on users.user_id=t.buyer_id
