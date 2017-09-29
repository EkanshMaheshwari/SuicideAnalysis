data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
 genderyeartotal= foreach data generate gender,year,total;
groupgenderyear = group genderyeartotal by (gender,year) ;
outputs = foreach groupgenderyear generate flatten(group) as (gender,year) ,SUM(genderyeartotal.total);
orderoutputs = order outputs by year,gender;
dump orderoutputs;



