# Write your MySQL query statement below
select 
b.book_id,
title,
author,
genre,
pages,
max(session_rating)-min(session_rating)  as rating_spread,
round(sum(if(session_rating>=4 or session_rating<=2,1,0))/count(*),2)  as polarization_score
from books b left join reading_sessions r on r.book_id=b.book_id
group by b.book_id
having sum(if(session_rating>=4,1,0))>=1 and sum(if(session_rating<=2,1,0))>=1 and polarization_score>=0.6 and count(*)>=5
order by polarization_score desc,title desc
