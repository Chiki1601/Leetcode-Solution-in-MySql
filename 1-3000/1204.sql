# Write your MySQL query statement below
SELECT person_name FROM Queue
WHERE turn = (
    SELECT MAX(turn) as turn FROM
    (
        SELECT q1.turn
        FROM Queue q1 JOIN QUEUE q2 
        ON q1.turn >= q2.turn
        GROUP BY q1.turn
        HAVING SUM(q2.weight) <= 1000
    ) as table1
);
