select * from tblEmployee

create table tblEmployee1(
 Id int Primary Key,
 Name nvarchar(50),
 Salary int,
 Gender nvarchar(10),
 City nvarchar(50))

insert into tblEmployee1 Values(6, 'John', 4500, 'Male', 'New York')
insert into tblEmployee1 Values(7, 'Stats', 2500, 'Male', 'London')
insert into tblEmployee1 Values(8, 'Steve', 5500, 'Female', 'Tokyo')
insert into tblEmployee1 Values(9, 'Rebeka', 3100, 'Male', 'Toronto')
insert into tblEmployee1 Values(10, 'Pam', 6500, 'Female', 'Sydney')

--kaks tabelit eristav
select Id, Name, Gender
from tblEmployee
Except
select Id, Name, Gender
from tblEmployee1

--töötajate sorteerimine palga järgi
select Id, Name, Gender, Salary
from tblEmployee
Where Salary >=5000
Except
Select Id, Name, Gender, Salary
from tblEmployee
where Salary >=6000
order By Name