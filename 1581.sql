# Write your MySQL query statement below
select Visits.customer_id as customer_id, count(customer_id) as count_no_trans from Visits where Visits.visit_id not in (select visit_id from Transactions) group by Visits.customer_id





