data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filterdata= filter data by typecode=='Education_Status';
agetypetotal= foreach filterdata generate age,type,total;
groupagetype = group agetypetotal by (type,age); 
outputs = foreach groupagetype generate flatten(group) as (type,age),SUM(agetypetotal.total) as total; 
orderoutputs = order outputs by type,age;
dump orderoutputs;

