 data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
statetotal = foreach data generate state,total;
groupstate = group statetotal by state;  
describe groupstate; 
outputs = foreach groupstate generate group,SUM(statetotal.total) as total;
dump outputs;
groupall =  group outputs all; 
maximum = foreach groupall generate MAX(outputs.total) as totals;
total = group maximum all;
result = filter outputs  by total == maximum.totals;
dump result;

