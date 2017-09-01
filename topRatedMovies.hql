
create table movies20m(id int, title string, genre ARRAY<String>)

    row format delimited
    fields terminated by','
    collection items terminated by '|'
    lines terminated by '\n'
    ;   

load data local inpath '/home/cloudera/Desktop/ml-20m/movies.csv' into table movies20m;

dfs -mkdir /ratings;
dfs -put /home/cloudera/Desktop/ml-20m/ratings.csv /ratings;
create table ratings(userId int ,movieId int ,rating int , time timestamp)
row format delimited
fields terminated by ','
lines terminated by '\n';

load data inpath '/ratings/rating.csv' into table ratings;


## how many number submitted for each rating score for all ratings ##
select rating, count(*) from ratings group by rating order by rating desc;

## movies that received 5 point of rating in one submission##
select title from movies20m join ratings on(movies20m.id=ratings.movieId) where ratings.rating =5;

## 10 most frequently used words in movie titles ## 
SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(title)),1,10)) AS bigrams from movies20m;

## average ratings top 200 movies ##
create view TsAndRs as select id, title, rating from movies20m join ratings on(movies20m.id=ratings.movieId);

select title,avg(rating) as a from TsAndRs group by title order by a  desc limit 200 ;




