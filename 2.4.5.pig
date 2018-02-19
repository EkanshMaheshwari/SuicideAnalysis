data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode = filter data by typecode == 'Education_Status';
statetypetotal = foreach filtertypecode generate state,type,total;
groupstatetype = group statetypetotal by (state,type); 
outputs = foreach groupstatetype generate flatten(group) as (state,type) ,SUM(statetypetotal.total) as total;
orderoutputs = order outputs by state,type;
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE orderoutputs INTO 'output/pig2.4.5 ' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');
