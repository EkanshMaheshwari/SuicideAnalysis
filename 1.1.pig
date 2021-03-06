data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
yeartypecodetotal = foreach data generate year,typecode,total;
filtertypecode= filter yeartypecodetotal by typecode=='Means_adopted';
yeartotal = foreach filtertypecode generate year,total;
groupyear = group yeartotal by year;
outputs = foreach groupyear generate group,SUM(yeartotal.total);
orderoutputs = order outputs by group;
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE orderoutputs INTO 'output/pig1.1 ' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');
groupall= group orderoutputs all;
maxoutputs = foreach groupall generate MAX(orderoutputs.total) as t;
result = filter orderoutputs by total == maxoutputs.t;
dump result;