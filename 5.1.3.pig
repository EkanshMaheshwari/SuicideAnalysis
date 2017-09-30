 data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);

filtertypecode= filter data by typecode =='Professional_Profile';  
agetypetotal= foreach filtertypecode generate age,type,total;
groupagetype= group agetypetotal by (age,type);
outputs= foreach groupagetype generate flatten(group) as (type,age),SUM(agetypetotal.total) as total;
orderoutputs = order outputs by type,age;
dump orderoutputs
