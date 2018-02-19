data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode = filter data by typecode =='Causes';
totaltypegender = foreach filtertypecode generate total,type,gender;
grouptypegender = group totaltypegender by (type,gender);
outputs = foreach grouptypegender generate flatten(group) as (type,gender),SUM(totaltypegender.total) as total; 
orderoutputs= order outputs by type,gender;  
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE outputs INTO 'output/pig4.2' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');
