# Please write a DELETE statement and DO NOT write a SELECT statement.
# Write your MySQL query statement below
DELETE p FROM Person p INNER JOIN Person p2 ON  p.Email = p2.Email AND  p.Id > p2.Id;
