
create table movies20m(id int, title string, genre ARRAY<String>)

    row format delimited
    fields terminated by','
    collection items terminated by '|'
    lines terminated by '\n'
    ;   

load data local inpath '/home/cloudera/Desktop/ml-20m/movies.csv' into table movies20m;

dfs -mkdir /ratings;
dfs -put /home/cloudera/Desktop/ml-20m/ratings.csv /ratings;
create table ratingz(userId int ,movieId int ,rating int , time timestamp)
row format delimited
fields terminated by ','
lines terminated by '\n';

load data inpath '/ratings/rating.csv' into table ratings;

create view TsAndRs as select id, title, rating from movies20m join ratings on(movies20m.id=ratings.movieId);