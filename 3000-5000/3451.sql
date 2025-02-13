# Write your MySQL query statement below
SELECT
  ip,
  COUNT(*) as invalid_count
FROM logs
WHERE ip NOT REGEXP '^(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(?:\\.(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])){3}$'
GROUP BY ip
ORDER BY invalid_count desc, ip desc
