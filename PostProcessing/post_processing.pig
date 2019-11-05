data = load 'op_rlg' using PigStorage('\t') as (uid:int,res:chararray);
t_data = load 'titles' using PigStorage(',') as (mid:chararray,year:int,name:chararray);

a = foreach data generate uid,FLATTEN(STRSPLIT(res,'\\:',2)) as mid;
b = foreach a generate uid,mid;


j_data = JOIN b by mid,t_data by mid;
d = foreach j_data generate $0,$4;

store d into 'res1' using PigStorage('\t');