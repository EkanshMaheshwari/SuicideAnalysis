data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
agetotal = foreach data generate age,total; 
groupage = group agetotal by age;
outputs = foreach groupage generate group,SUM(agetotal.total) as total;
orderoutputs = order outputs by group;
dump orderoutputs;
groupall= group orderoutputs all;
maxoutputs = foreach groupall generate MAX(orderoutputs.total) as t; 
result = filter orderoutputs by total == maxoutputs.t;
dump result;

