--funksioonid
select * from DimEmployee

--Tabelisisev‰‰rtusega funktsioon e Inline Table Valued function (ILTVF)
Create Function fn_ILTVF_GetEmployees()
returns Table
as
return (Select EmployeeKey, FirstName, Cast(BirthDate as Date) as DOB
from dbo.DimEmployee)

--k‰ivita funksiooni
select * from fn_ILTVF_GetEmployees();