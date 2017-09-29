data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode= filter data by typecode =='Professional_Profile';
totaltypeyear = foreach filtertypecode generate total,type,year;
grouptypeyear = group totaltypeyear by (type,year);
outputs = foreach grouptypeyear generate flatten(group) as (year,type),SUM(totaltypeyear.total) as total;
orderoutputs = order outputs by year,type;
dump orderoutputs;

