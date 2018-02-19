data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode = filter data by typecode=='Means_adopted';
stateyeartotal = foreach  filtertypecode generate state,year,total;
groupstatetotal= group stateyeartotal by (state,year);
results = foreach groupstatetotal generate group.state as state ,group.year as year,SUM(stateyeartotal.total) as total;
orderstate = order results by state,year;	
dump orderstate ;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE orderstate INTO 'output/pig2.1 ' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');

