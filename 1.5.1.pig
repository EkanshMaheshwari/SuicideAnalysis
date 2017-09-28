 data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode = filter data by typecode =='Causes';
typetotal = foreach filtertypecode generate type,total;
grouptypecode = group typetotal by type;
outputs = foreach grouptypecode generate group,SUM(typetotal.total) as total;
orderoutputs = order outputs by group;
dump orderoutputs;
groupall = group orderoutputs all;
maxoutput = foreach groupall generate MAX(orderoutputs.total) as t;
result = filter  outputs by total == maxoutput.t;
dump result;
