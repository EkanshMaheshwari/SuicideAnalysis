data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
meansadopted = filter data by typecode=='Means_adopted';
ageyeartotal= foreach meansadopted generate age,total,year; 
groupageyear = group ageyeartotal by (age,year);
outputs= foreach groupageyear generate flatten(group) as (age,year),SUM(ageyeartotal.total) as total;
orderoutputs= order outputs by year,age;
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE outputs INTO 'output/pig3.2' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');



