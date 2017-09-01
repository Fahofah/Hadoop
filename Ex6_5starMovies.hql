-- movies that received 5 point of rating in one submission
select title from movies20m join ratings on(movies20m.id=ratings.movieId) where ratings.rating =5;