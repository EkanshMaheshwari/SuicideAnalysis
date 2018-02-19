data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filterdata= filter data by typecode=='Social_Status';
agetypetotal= foreach filterdata generate age,type,total;
groupagetype = group agetypetotal by (type,age); 
outputs = foreach groupagetype generate flatten(group) as (type,age),SUM(agetypetotal.total) as total; 
orderoutputs = order outputs by type,age;
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE orderoutputs INTO 'output/pig5.1.4 ' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');


