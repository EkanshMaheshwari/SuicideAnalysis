  data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode= filter data by typecode == 'Causes';
agetypetotal = foreach filtertypecode generate age,type,total;
 groupagetype = group agetypetotal by (age,type);
outputs = foreach groupagetype generate flatten(group) as (age,type),SUM(agetypetotal.total);
 orderoutputs = order outputs by type,age;
dump orderoutputs;

