data = load 'res.txt' using PigStorage(',') as (uid:int,mid:int,rating:int);

a = group data by rating;
b = foreach a generate $0 as rating,COUNT($1) as count;

store b into 'rating_dist_res' using PigStorage(',');
