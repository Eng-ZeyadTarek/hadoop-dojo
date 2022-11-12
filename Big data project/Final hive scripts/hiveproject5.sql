USE employeedata;

DROP TABLE IF EXISTS OldEmployeeDataHive;
ALTER TABLE EmployeeDataHive RENAME TO OldEmployeeDataHive;

--Replace old Table with ORC Table with the same data
DROP TABLE IF EXISTS EmployeeDataHive;
CREATE  TABLE EmployeeDataHive 
(name STRING,
 JobTitles STRING,
 Department STRING,
 FullOrPartTime STRING,
 SalaryOrHourly STRING,
 TypicalHours INT,
 AnnualSalary INT,
 HourlyRate FLOAT 
 )  
CLUSTERED BY (JobTitles) into 3 buckets 
STORED AS orc TBLPROPERTIES ('transactional'='true');

--INSERT the data of the old table from the old table to the new ORC Table
INSERT INTO  EmployeeDataHive SELECT * FROM OldEmployeeDataHive;
DROP TABLE IF EXISTS OldEmployeeDataHive;


UPDATE EmployeeDataHive SET AnnualSalary = TypicalHours*HourlyRate*52 WHERE AnnualSalary IS NULL; --UPDATE clause to update AnnualSalary values
SELECT * FROM EmployeeDataHive LIMIT 100;


