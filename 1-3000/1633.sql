# Write your MySQL query statement below
with total_users as (
  select distinct count(user_id) as user_count from users
)

select r.contest_id,round(100*count(r.user_id)/(select user_count from total_users),2) as percentage
from Register r left join Users u on r.user_id = u.user_id
group by 1
order by 2 desc, 1 asc
