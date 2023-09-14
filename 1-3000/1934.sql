SELECT DISTINCT s.user_id
	,round(sum(CASE 
				WHEN c.action = 'confirmed'
					THEN 1
				ELSE 0
				END) OVER (PARTITION BY user_id) / count(*) OVER (PARTITION BY user_id), 2) AS confirmation_rate
FROM Signups AS s
LEFT JOIN Confirmations AS c ON s.user_id = c.user_id
