data = load 'res.txt' using PigStorage(',') as (uid:int,mid:int,rating:int);
t_data = load 'movie_titles.txt' using PigStorage(',') as (mid:int,year:int,name:chararray);

a = group data by mid;
b = foreach a generate $0 as mid,AVG($1.rating) as rating;
c = order b by rating;

j_data = JOIN c by mid,t_data by mid;
d = foreach j_data generate name,$1 as rating;
e = order d by rating DESC;
f = limit e 3;

store f into 'high_rated_res' using PigStorage(',');
