USE employeedata;

DROP TABLE IF EXISTS DepartmentDataHive;

CREATE TABLE DepartmentDataHive 
AS
SELECT DISTINCT(Department) FROM EmployeeDataHive;

SELECT * FROM DepartmentDataHive;
