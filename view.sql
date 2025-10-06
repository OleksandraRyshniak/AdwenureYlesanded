use AdventureWorksDW2019;
alter table tblEmployee Add DepartmentId int

create table tblDepartment(
deptId int Primary Key,
DeptName nvarchar(20))