  data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode= filter data by typecode == 'Causes';
agetypetotal = foreach filtertypecode generate age,type,total;
 groupagetype = group agetypetotal by (age,type);
outputs = foreach groupagetype generate flatten(group) as (age,type),SUM(agetypetotal.total);
 orderoutputs = order outputs by type,age;
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE orderoutputs INTO 'output/pig5.1.1 ' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');

