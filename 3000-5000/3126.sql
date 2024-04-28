# Write your MySQL query statement below


WITH data AS (
SELECT *, RANK() OVER (PARTITION BY server_id ORDER BY status_time, session_status) AS r FROM Servers)


SELECT SUM(duration) DIV 86400 AS total_uptime_days FROM (SELECT TIMESTAMPDIFF(SECOND, a.status_time, b.status_time) AS duration FROM data a, data b WHERE a.server_id = b.server_id AND a.session_status = 'start' AND a.r = b.r - 1) t
