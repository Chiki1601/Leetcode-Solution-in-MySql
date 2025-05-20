# Write your MySQL query statement below
with purchased_categories as (
    select distinct pp.user_id as 'user_id', pi.category as 'category'
    from ProductPurchases pp
    left join ProductInfo pi
    on pp.product_id = pi.product_id
    group by pp.user_id, pi.category
),
...
