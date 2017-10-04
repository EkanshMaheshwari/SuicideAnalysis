data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
typecodetotal= foreach data generate typecode,total,year;
groupyeartypecode = group typecodetotal by(typecode,year);
outputs = foreach groupyeartypecode generate group.year,group.typecode,SUM(typecodetotal.total) as total;
orderoutputs = order outputs by year,typecode;
dump orderoutputs;
