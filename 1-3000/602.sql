# Write your MySQL query statement below
WITH friends AS (SELECT requester_id id
FROM RequestAccepted
UNION ALL
SELECT accepter_id
FROM RequestAccepted)

SELECT id, COUNT(id) num
FROM friends
GROUP BY id
ORDER BY num DESC
LIMIT 1
