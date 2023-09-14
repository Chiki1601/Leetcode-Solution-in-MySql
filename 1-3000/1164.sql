# Write your MySQL query statement below
WITH cte AS (
  SELECT *, 
  RANK() OVER(
    PARTITION BY product_id 
    ORDER BY change_Date DESC
  ) price_priority 
  FROM Products 
  WHERE change_date <= '2019-08-16'
)

SELECT product_id, new_price AS price 
FROM cte
WHERE price_priority = 1

UNION

SELECT product_id, 10 AS price 
FROM Products
WHERE product_id NOT in (
  SELECT product_id
  FROM cte
)
