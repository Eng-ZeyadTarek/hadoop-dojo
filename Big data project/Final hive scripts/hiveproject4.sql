USE employeedata;


--Replace The name of the department with its ID 
INSERT OVERWRITE TABLE EmployeeDataHive SELECT E.Name, E.JobTitles, D.DeptID, E.FullOrPartTime, E.SalaryOrHourly, E.TypicalHours, E.AnnualSalary, E.HourlyRate 
FROM EmployeeDataHive E 
join DepartmentDataHive D
ON E.Department = D.depart_name;

SELECT * FROM EmployeeDataHive LIMIT 20;




