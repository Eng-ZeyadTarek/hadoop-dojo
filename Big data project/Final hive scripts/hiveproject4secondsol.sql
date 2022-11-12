USE employeedata;


--insert overwite table EmployeeDataHive
--select
DROP TABLE IF EXISTS OldEmployeeDataHive;
ALTER TABLE EmployeeDataHive RENAME TO OldEmployeeDataHive;

CREATE TABLE EmployeeDataHive AS

SELECT E.Name, E.JobTitles, D.DeptID, E.FullOrPartTime, E.SalaryOrHourly, E.TypicalHours, E.AnnualSalary, E.HourlyRate 
FROM OldEmployeeDataHive E 
join DepartmentDataHive D

ON E.Department = D.depart_name;

SELECT * FROM EmployeeDataHive LIMIT 20;

DROP TABLE IF EXISTS OldEmployeeDataHive ;


