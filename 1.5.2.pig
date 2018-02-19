 data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
typecodetotaltype = foreach data generate typecode,total,type;
filtertypecode = filter typecodetotaltype by typecode == 'Means_adopted';
totaltype = foreach filtertypecode generate total,type;
grouptype = group totaltype by type;
describe grouptype;
outputs = foreach grouptype generate group,SUM(totaltype.total) as total;
orderoutputs = order outputs by group;
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE outputs INTO 'output/pig1.5.2' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');
groupall = group outputs all;
describe groupall;
maxtotal = foreach groupall generate  MAX(outputs.total) as t;
results = filter outputs by total==maxtotal.t;
dump results;


