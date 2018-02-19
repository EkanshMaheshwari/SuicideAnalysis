 data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode = filter data by typecode == 'Means_adopted';
gendertotal = foreach filtertypecode generate gender,total;
groupgender = group gendertotal by gender;
outputs = foreach groupgender generate group, SUM(gendertotal.total) as total;
orderoutputs = order outputs by group;
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE orderoutputs INTO 'output/pig1.3 ' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');
groupall  = group orderoutputs all;
maxtotal = foreach groupall generate MAX(orderoutputs.total) as t;
result = filter outputs by total == maxtotal.t;
dump result;


