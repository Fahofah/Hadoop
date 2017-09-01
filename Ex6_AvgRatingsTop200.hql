## average ratings top 200 movies ##
create view TsAndRs as select id, title, rating from movies20m join ratings on(movies20m.id=ratings.movieId);

select title,avg(rating) as a from TsAndRs group by title order by a  desc limit 200 ;