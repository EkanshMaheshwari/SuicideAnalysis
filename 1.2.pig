data = load 'newa.csv' using PigStorage(',') as(state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode = filter data by typecode == 'Means_adopted';
statetotal = foreach filtertypecode generate state,total;
groupstate = group statetotal by state;  
outputs = foreach groupstate generate group,SUM(statetotal.total) as total;
orderoutputs = order outputs by group;
dump orderoutputs;	
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE orderoutputs INTO 'output/pig1.2' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');
groupall =  group orderoutputs all; 
maximum = foreach groupall generate MAX(orderoutputs.total) as totals;
total = group maximum all;
result = filter outputs  by total == maximum.totals;
dump result;
	

