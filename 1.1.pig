data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
yeartotal = foreach data generate year,total;
groupyear =group yeartotal by year;
outputs = foreach groupyear generate group,SUM(yeartotal.total);
dump outputs;
