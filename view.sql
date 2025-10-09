use AdventureWorksDW2019;
--tabeli tblEmployee muutmine
alter table tblEmployee Add DepartmentId int

alter table tblEmployee add Constraint tblEmployee_tblDepartment
    Foreign key (DepartmentId)
    REFERENCES tblDepartment (deptId);

select * from tblEmployee

--tabeli tblDepartment loomine
create table tblDepartment(
deptId int Primary Key,
DeptName nvarchar(20))

insert into tblDepartment values (1, 'IT')
insert into tblDepartment values (2, 'Payroll')
insert into tblDepartment values (3, 'HR')
insert into tblDepartment values (4, 'Admin')

update tblEmployee set DepartmentId = 1
where Id = 1

--kahe tabeli ühendamine JOIN abil
select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.deptId

--JOIN-iga andmeid kuvav vaade
create view vWEmployeesByDepartment
as
select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.deptId

select * from vWEmployeesByDepartment

--IT-osakonnas töötajaid kuvav vaade
create view vWITDEpartment_Employees
as
select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.deptId
where tblDepartment.DeptName = 'IT'

select * from vWITDepartment_Employees

--ilma palgata töötajaid kuvav vaade
create view vWEmployeesNonConfidentialData
as 
select Id, Name, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.deptId

select * from vWEmployeesNonConfidentialData

--iga osakonna töötajate arvu kuvav vaade
create view vWEmployeesCountByDepartment
as
select DeptName, COUNT(Id) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.deptId
group by DeptName

select * from vWEmployeesCountByDepartment