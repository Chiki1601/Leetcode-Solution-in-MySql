# Write your MySQL query statement below
with purchased_categories as (
    select distinct pp.user_id as 'user_id', pi.category as 'category'
    from ProductPurchases pp
    left join ProductInfo pi
    on pp.product_id = pi.product_id
    group by pp.user_id, pi.category
),
user_purchases as (
    select pc1.category as 'category1', pc2.category as 'category2', pc1.user_id as 'user_id1'
    from purchased_categories pc1
    left join purchased_categories pc2
    on pc1.user_id = pc2.user_id AND pc1.category < pc2.category
    where pc1.user_id IS NOT NULL
    and pc2.category IS NOT NULL
    group by pc1.category, pc2.category, pc1.user_id
),
category_pair_counts as (
    select up.category1, up.category2, count(*) as 'customer_count'
    from user_purchases up
    group by up.category1, up.category2
)
select category1, category2, customer_count
from category_pair_counts
where customer_count >= 3
order by customer_count desc, category1 asc, category2 asc;
