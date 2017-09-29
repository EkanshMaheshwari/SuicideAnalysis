data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode = filter data by typecode == 'Professional_Profile'; 
statetypetotal= foreach filtertypecode generate type,state,total;
describe statetypetotal;
groupstatetype =  group statetypetotal by (state,type);
outputs = foreach groupstatetype generate flatten(group) as (state,type) ,SUM(statetypetotal.total) as total;
orderoutputs = order outputs by state,type;
dump orderoutputs;

