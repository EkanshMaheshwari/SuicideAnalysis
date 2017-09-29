data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
stategendertotal = foreach data generate state,gender,total;
groupstategender = group  stategendertotal by (gender,state);
outputs = foreach groupstategender generate group.gender,group.state,SUM(stategendertotal.total);
orderoutputs = order outputs by state;
dump orderoutputs;
