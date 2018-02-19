data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode = filter data by typecode == 'Causes';
typeyear= foreach filtertypecode generate type,year,total;
grouptypeyear= group typeyear by (type,year);
outputs = foreach grouptypeyear generate flatten(group) as (type,year),SUM(typeyear.total) as total;
orderoutputs = order outputs by type,year;
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE outputs INTO 'output/pig3.3.1' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');
