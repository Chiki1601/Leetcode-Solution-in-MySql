# Write your MySQL query statement below
SELECT Email from Person  /* Select the email address from table */
group by Email  /* Group about the Email addresses */
having count(*) > 1 /* Only show the Emails having more than one records associated with it */
