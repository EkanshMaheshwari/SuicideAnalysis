data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode = filter data by typecode=='Means_adopted';
stategendertotal = foreach filtertypecode generate state,gender,total;
groupstategender = group  stategendertotal by (gender,state);
outputs = foreach groupstategender generate group.gender,group.state,SUM(stategendertotal.total);
orderoutputs = order outputs by state;
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE orderoutputs INTO 'output/pig2.2 ' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');


