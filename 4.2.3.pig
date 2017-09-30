 data = load 'newa.csv' using PigStorage(',') as (state:chararray,year:int,typecode:chararray,type:chararray,gender:chararray,age:chararray,total:int);
filtertypecode = filter data by typecode == 'Professional_Profile;
gendertypetotal= foreach filtertypecode generate gender,type,total;
groupgendertype = group gendertypetotal by (type,gender);
outputs = foreach groupgendertype generate flatten(group) as (gender,type),SUM(gendertypetotal.total);
orderoutputs = order outputs by gender,type;
dump orderoutputs;

