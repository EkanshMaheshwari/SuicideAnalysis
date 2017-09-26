data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
typecodetotal = foreach data generate typecode,total;
grouptypecode = group typecodetotal by typecode;
outputs = foreach grouptypecode generate group,SUM(typecodetotal.total) as total;
dump outputs;
groupall = group outputs all;
maxresult = foreach groupall generate MAX(outputs.total) as t;
result = filter outputs by total == maxresult.t;
dump result;
