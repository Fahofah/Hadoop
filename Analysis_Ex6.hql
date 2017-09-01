dfs -put /home/cloudera/Desktop/ml-100k/u.item /movies;

create table moviesInfo (id int, title String, release_date sTRING, video_release sTRING, 
    imdb String, Unknown_genre int, action int, adventure int, animation int, children int, 
    comedy int, crime int, documentary int, drama int, fantasy int, film_noir int,horror int,
    musical int,mystery int, romance int, sci_fi int, thriller int, war int , western int)

    row format delimited
    fields terminated by'|'
    lines terminated by '\n'
    stored as textfile
    ;   

load data inpath '/movies/u.item' into table moviesInfo;

dfs -mkdir /ratings;
dfs -put /home/cloudera/Desktop/ml-20m/ratings.csv /ratings;
create table ratings(userId int ,movieId int ,rating int , time timestamp)
row format delimited
fields terminated by ','
lines terminated by '\n';

load data inpath '/ratings/rating.csv' into table ratings;

select title from moviesInfo join ratings on(moviesInfo.id=ratings.movieId) where ratings.rating =5;