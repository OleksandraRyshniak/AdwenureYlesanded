use AdventureWorksDW2019
select * from DimCustomer where YearlyIncome>50000
and YearlyIncome<80000
 
 --üldise tulu indeksi loomine
 create Index IX_tblDimCustomer_YearlyIncome
 on DimCustomer (YearlyIncome ASC)

 --vaadata indeksit
 execute sp_helptext DimCustomer

--kustutada indeksit
 drop index DimCustomer.IX_tblDimCustomer_Salary

--36
--tabeli tblEmployee loomine
 create table tblEmployee(
 Id int Primary Key,
 Name nvarchar(50),
 Salary int,
 Gender nvarchar(10),
 City nvarchar(50))

insert into tblEmployee Values(3, 'John', 4500, 'Male', 'New York')
insert into tblEmployee Values(1, 'Sam', 2500, 'Male', 'London')
insert into tblEmployee Values(4, 'Sara', 5500, 'Female', 'Tokyo')
insert into tblEmployee Values(5, 'Todd', 3100, 'Male', 'Toronto')
insert into tblEmployee Values(2, 'Pam', 6500, 'Female', 'Sydney')

select * from tblEmployee

--indeksi loomine
create clustered Index IX_tblEmployee_Name
on tblEmployee(Name)

--indeksi kustutamine
Drop index tblEmployee.IX_tblEmployee_Name

--indeksi loomine veergudele gender ja salary
Create Clustered Index IX_tblEmployee_Gender_Salary
on tblEmployee(Gender DESC, Salary ASC)

--indeksi loomine nime jaoks
create NonClustered Index IX_tblEmployee_Name
on tblEmployee(Name)

--clustered index -- PK (ainult üks)
--nonclustered index -- hulk

--37
--indeksi loomine veeru Id jaoks
create clustered Index IX_tblEmployee_Id
on tblEmployee(Id)

--esmase võtme kontroll
execute sp_helpindex tblEmployee;

--veeru Id indeksi kustutamine
drop index tblEmployee.IX_tblEmployee_Id

--unikaalne indeks, mis tagab, et veerus Name 
--ei esineks korduvaid andmeid
create unique NonClustered Index UIX_tblEmployee_Name
on tblEmployee(Name)

--unikaalse piirangu lisamine veerule City
alter table tblEmployee
add constraint UQ_tblEmployee_City
Unique NonClustered (City)

--indeksi kontroll
execute sp_helpconstraint tblEmployee;

--indeks, mis ei luba veerus korduvaid andmeid
Create unique Index IX_tblEmployee_City
On tblEmployee(City)
with ignore_dup_key