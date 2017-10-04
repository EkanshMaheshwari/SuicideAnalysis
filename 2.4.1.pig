data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode = filter data by typecode== 'Causes' ;
statetypetotal = foreach filtertypecode generate state,type,total;
groupstatetype = group statetypetotal by (state,type);
describe groupstatetype;
outputs = foreach groupstatetype generate flatten(group) as (state,type),SUM(statetypetotal.total) as total; 
orderoutputs = order outputs by state,type;
dump orderoutputs;
STORE orderoutputs into z;
