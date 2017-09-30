 data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
gendertotalage = foreach data generate gender,age,total;
 groupgenderage = group gendertotalage by (gender,age);
outputs = foreach groupgenderage generate flatten(group) as (gender,age) ,SUM(gendertotalage.total) as total; 
orderoutputs = order outputs by age,gender;
dump orderoutputs;
