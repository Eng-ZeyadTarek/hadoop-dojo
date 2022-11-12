USE employeedata;

CREATE TABLE if NOT EXISTS employees_ptn(Name STRING, JobTitles STRING, FullOrPartTime STRING,SalaryOrHourly STRING,TypicalHours INT,AnnualSalary INT,HourlyRate FLOAT) 
PARTITIONED BY (department INT);

FROM EmployeeDataHive 
INSERT OVERWRITE TABLE employees_ptn
PARTITION (department = 1)
SELECT Name,JobTitles,FullOrPartTime,SalaryOrHourly,TypicalHours,AnnualSalary,HourlyRate WHERE EmployeeDataHive.Department = 1
INSERT OVERWRITE TABLE employees_ptn
PARTITION (department = 2)
SELECT Name,JobTitles,FullOrPartTime,SalaryOrHourly,TypicalHours,AnnualSalary,HourlyRate WHERE EmployeeDataHive.Department = 2
INSERT OVERWRITE TABLE employees_ptn
PARTITION (department = 3)
SELECT Name,JobTitles,FullOrPartTime,SalaryOrHourly,TypicalHours,AnnualSalary,HourlyRate WHERE EmployeeDataHive.Department = 3
INSERT OVERWRITE TABLE employees_ptn
PARTITION (department = 4)
SELECT Name,JobTitles,FullOrPartTime,SalaryOrHourly,TypicalHours,AnnualSalary,HourlyRate WHERE EmployeeDataHive.Department = 4
INSERT OVERWRITE TABLE employees_ptn
PARTITION (department = 5)
SELECT Name,JobTitles,FullOrPartTime,SalaryOrHourly,TypicalHours,AnnualSalary,HourlyRate WHERE EmployeeDataHive.Department = 5;

SHOW PARTITIONS employees_ptn;
DESCRIBE FORMATTED employees_ptn PARTITION(department=1);
DESCRIBE FORMATTED employees_ptn PARTITION(department=2);
DESCRIBE FORMATTED employees_ptn PARTITION(department=3);
DESCRIBE FORMATTED employees_ptn PARTITION(department=4);
DESCRIBE FORMATTED employees_ptn PARTITION(department=5);

