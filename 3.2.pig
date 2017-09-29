data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
ageyeartotal= foreach data generate age,total,year; 
groupageyear = group ageyeartotal by (age,year);
outputs= foreach groupageyear generate flatten(group) as (age,year),SUM(ageyeartotal.total) as total;
orderoutputs= order outputs by year,age;
dump orderoutputs;



