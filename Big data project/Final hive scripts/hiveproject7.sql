USE employeedata;
SELECT DepartmentDataHive.deptart_Name ,AVG(EmployeeDataHive.AnnualSalary) 
FROM EmployeeDataHive 
INNER JOIN DepartmentDataHive
ON EmployeeDataHive.Department = DepartmentDataHive.DeptID 
GROUP BY DepartmentDataHive.deptart_Name;

