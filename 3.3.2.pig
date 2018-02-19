data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode  = filter data by typecode == 'Means_adopted';
yeartypetotal= foreach filtertypecode generate year,type,total;
groupyeartype = group yeartypetotal by (year,type); 
outputs= foreach groupyeartype generate flatten(group) as (year,type),SUM(yeartypetotal.total);
orderoutputs = order outputs by year,type;
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE outputs INTO 'output/pig3.3.2' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');

