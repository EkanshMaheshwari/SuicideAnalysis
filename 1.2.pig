 data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
statetotal = foreach data generate state,total;
groupstate = group statetotal by state;  
describe groupstate; 
outputs = foreach groupstate generate group,SUM(statetotal.total);
dump outputs;

