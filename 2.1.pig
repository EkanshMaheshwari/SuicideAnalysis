data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
stateyeartotal = foreach data generate state,year,total;
groupstatetotal= group stateyeartotal by (state,year);
results = foreach groupstatetotal generate group.state,group.year,SUM(stateyeartotal.total) as total;
orderstate = order results by state,year;
dump orderstate ;
