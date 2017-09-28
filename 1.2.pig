data = load 'newa.csv' using PigStorage(',') as(state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
statetotal = foreach data generate state,total;
groupstate = group statetotal by state;  
outputs = foreach groupstate generate group,SUM(statetotal.total) as total;
orderoutputs = order outputs by group;
dump orderoutputs;
groupall =  group orderoutputs all; 
maximum = foreach groupall generate MAX(orderoutputs.total) as totals;
total = group maximum all;
result = filter outputs  by total == maximum.totals;
dump result;

