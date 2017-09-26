 data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
gendertotal = foreach data generate gender,total;
groupgender = group gendertotal by gender;
outputs = foreach groupgender generate group, SUM(gendertotal.total) as total;
dump outputs;
groupall  = group outputs all;
describe groupall;
 maxtotal = foreach groupall generate MAX(outputs.total) as t;
result = filter outputs by total == maxtotal.t;
dump result;

