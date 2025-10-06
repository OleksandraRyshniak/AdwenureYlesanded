--funksioonid
use AdventureWorksDW2019
select * from DimEmployee

--Tabelisiseväärtusega funktsioon e Inline Table Valued function (ILTVF)
Create Function fn_ILTVF_GetEmployees()
returns Table
as
return (Select EmployeeKey, FirstName, Cast(BirthDate as Date) as DOB
from dbo.DimEmployee)

--käivita funksiooni
select * from fn_ILTVF_GetEmployees();

--Mitme avaldisega tabeliväärtusega funktsioonid e
--multi-statement table valued function (MSTVF)
create function fn_MSTVF_GetEmployees()
returns @Table Table (EmployeeKey int, FirstName nvarchar(20), DOB Date)
as
Begin
insert into @Table
select EmployeeKey, FirstName, Cast(BirthDate as Date)
from dbo.DimEmployee
return 
end
select * from  fn_MSTVF_GetEmployees();

--Skaleeritav funktsioon ilma krüpteerimata
create Function fn_GetEmployeeNameById(@EmployeeKey int)
returns nvarchar(20)
as
begin
return (Select FirstName from DimEmployee where EmployeeKey=@EmployeeKey)
end

select dbo.fn_GetEmployeeNameById(3)

--Nüüd muudame funktsiooni ja krüpteerime selle ära
alter Function fn_GetEmployeeNameById(@EmployeeKey int)
returns nvarchar(20)
With Encryption
as
begin
return (Select FirstName from DimEmployee where EmployeeKey=@EmployeeKey)
end

select dbo.fn_GetEmployeeNameById(3)

--Nüüd ei ole võimalik tabelit kustutada ega muuta.
alter Function fn_GetEmployeeNameById(@EmployeeKey int)
returns nvarchar(20)
With SchemaBinding
as
begin
return (Select FirstName from dbo.DimEmployee where EmployeeKey=@EmployeeKey)
end

drop table dbo.DimEmployee



