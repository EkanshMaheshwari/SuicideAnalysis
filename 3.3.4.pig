data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode= filter data by typecode =='Social_Status';
totaltypeyear = foreach filtertypecode generate total,type,year;
grouptypeyear = group totaltypeyear by (type,year);
outputs = foreach grouptypeyear generate flatten(group) as (year,type),SUM(totaltypeyear.total) as total;
orderoutputs = order outputs by year,type;
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE outputs INTO 'output/pig3.3.4' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');

