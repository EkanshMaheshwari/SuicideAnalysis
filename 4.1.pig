data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode= filter data by typecode =='Means_adopted';
gendertotalage = foreach filtertypecode generate gender,age,total;
 groupgenderage = group gendertotalage by (gender,age);
outputs = foreach groupgenderage generate flatten(group) as (gender,age) ,SUM(gendertotalage.total) as total; 
orderoutputs = order outputs by age,gender;
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE outputs INTO 'output/pig4.1' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');