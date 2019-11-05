data = load 'res.txt' using PigStorage(',') as (uid:int,mid:int,rating:int);
t_data = load 'movie_titles.txt' using PigStorage(',') as (mid:int,year:int,name:chararray);

a = group data by mid;
b = foreach a generate $0 as mid,COUNT($1) as count;
c = order b by count DESC;
d = limit c 3;

j_data = JOIN d by mid,t_data by mid;
e = foreach j_data generate name,count;
f = order e by count DESC;

store f into 'high_watched_res' using PigStorage(',');;
