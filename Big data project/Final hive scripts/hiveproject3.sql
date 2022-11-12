USE employeedata;

DROP TABLE IF EXISTS DepartmentDataHive;

CREATE TABLE DepartmentDataHive 
(depart_name STRING,
 DeptID INT
 ) 
ROW format delimited fields terminated BY ',' 
lines terminated BY '\n' 
tblproperties("skip.header.line.count"="1");

LOAD data local inpath '/home/osboxes/project/Department.csv' OVERWRITE INTO TABLE DepartmentDataHive;

SELECT * FROM DepartmentDataHive LIMIT 20 ;
