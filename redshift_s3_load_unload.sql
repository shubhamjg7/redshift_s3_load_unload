drop table customers;
Create table customers (
CUSTOMERID Integer,
CUSTOMERNAME Varchar(30),
EMAIL  Varchar(100),
CITY  Varchar(30),
COUNTRY  Varchar(30),
TERRITORY  Varchar(30),
CONTACTFIRSTNAME Varchar(30),
CONTACTLASTNAME Varchar(100)
);

copy customers (CUSTOMERID,CONTACTFIRSTNAME,CONTACTLASTNAME,CUSTOMERNAME,EMAIL,CITY,COUNTRY,TERRITORY) from 's3://redshift-demo-123456/customers.csv' iam_role 'arn:aws:iam::361676774081:role/redshifr-s3-role'
delimiter ',';

select distinct customerid, customername from customers;

unload ('select distinct customerid, customername from customers')   
to 's3://redshift-demo-123456/op.csv' 
iam_role 'arn:aws:iam::361676774081:role/redshifr-s3-role';

select * from stl_load_errors ;