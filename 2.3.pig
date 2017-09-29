data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
agetotalstate= foreach data generate age,total,state;
groupstateage = group agetotalstate  by (age,state);
outputs= foreach groupstateage generate group.age,group.state,SUM(agetotalstate.total) as total;
orderoutput = order outputs by state,age;
dump orderoutput;


