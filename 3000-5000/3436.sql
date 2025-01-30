SELECT * FROM Users
WHERE email  REGEXP '^[A-Za-z0-9\_]+@{1}[A-Za-z]+\.com$'
ORDER BY user_id
