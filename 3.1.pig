data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
meansadopted = filter data by typecode=='Means_adopted';
genderyeartotal= foreach meansadopted generate gender,year,total;
groupgenderyear = group genderyeartotal by (gender,year) ;
outputs = foreach groupgenderyear generate flatten(group) as (gender,year) ,SUM(genderyeartotal.total);
orderoutputs = order outputs by year,gender;
dump orderoutputs;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE outputs INTO 'output/pig1.5.2' using org.apache.pig.piggybank.storage.CSVExcelStorage(',');


