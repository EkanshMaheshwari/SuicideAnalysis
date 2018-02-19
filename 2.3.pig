data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode = filter data by typecode==’Means_adopted’;
agetotalstate= foreach filtertypecode generate age,total,state;
groupstateage = group agetotalstate  by (age,state);
outputs= foreach groupstateage generate group.age as age,group.state as state,SUM(agetotalstate.total) as total;
orderoutput = order outputs by state,age;
dump orderoutput;
register /home/cloudera/Desktop/jars/piggybank-0.15.0.jar;
STORE orderoutputs INTO 'output/pig2.3 ' using org.apache.pig.piggybank.storage.CSVExcelStorage(',')

