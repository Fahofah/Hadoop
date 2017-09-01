
--how many number submitted for each rating score for all ratings --
select rating, count(*) from ratings group by rating order by rating desc;
