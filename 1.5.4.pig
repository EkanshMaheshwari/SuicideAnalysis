data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode = filter data by typecode == 'Social_Status';
typetotal = foreach filtertypecode generate type,total;
grouptype = group typetotal by type;
outputs = foreach grouptype generate group,SUM(typetotal.total) as total;
orderoutputs = order outputs by group;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE outputs INTO 'output/pig1.5.4' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');
dump orderoutputs;
groupall = group orderoutputs all;
maxresults = foreach groupall generate MAX(orderoutputs.total) as t;
results = filter outputs by total == maxresults.t;
dump results;

