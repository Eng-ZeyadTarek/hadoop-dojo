--CREATE employeedata DATABASE IF NOT EXISTS
CREATE DATABASE IF NOT EXISTS employeedata;


USE employeedata;
--USE it
DROP TABLE IF EXISTS EmployeeDataHive;
CREATE TABLE EmployeeDataHive 
(Name STRING,
 JobTitles STRING,
 Department STRING,
 FullOrPartTime STRING,
 SalaryOrHourly STRING,
 TypicalHours INT,
 AnnualSalary INT,
 HourlyRate FLOAT 
 ) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
tblproperties("skip.header.line.count"="1");

LOAD data local inpath '/home/osboxes/project/employee-data.csv' OVERWRITE INTO TABLE EmployeeDataHive;

SELECT * FROM EmployeeDataHive LIMIT 20;
