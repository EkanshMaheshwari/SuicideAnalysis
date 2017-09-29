9data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int)
filtertypecode= filter data by typecode == 'Education_Status';
typetotal = foreach filtertypecode generate type,total;
grouptype = group typetotal by type;
outputs  = foreach grouptype generate group,SUM(typetotal.total) as total;
orderoutputs = order outputs by group;
dump orderoutputs;
groupall = group orderoutputs all;
maxoutputs = foreach groupall generate MAX(orderoutputs.total) as t;
result =filter outputs by total == maxoutputs.t;
dump result;
