USE employeedata;

DROP TABLE IF EXISTS OldEmployeeDataHive;

ALTER TABLE EmployeeDataHive RENAME TO OldEmployeeDataHive;
 
CREATE TABLE EmployeeDataHive AS 

SELECT Name, JobTitles, DeptID, FullOrPartTime,
    SalaryOrHourly, TypicalHours, HourlyRate ,

    CASE WHEN (AnnualSalary = '') 
    THEN   TypicalHours*HourlyRate*52
    ELSE AnnualSalary  
    END AS AnnualSalary

FROM OldEmployeeDataHive;

SELECT * FROM EmployeeDataHive LIMIT 20;


DROP TABLE IF EXISTS OldEmployeeDataHive;


    

