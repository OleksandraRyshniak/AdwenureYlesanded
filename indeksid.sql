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
Drop index tblEmployee.PK_tblEmplo_3214EC070A9D95DB

--indeksi loomine veergudele gender ja salary
Create Clustered Index IX_tblEmployee_Gender_Salary
on tblEmployee(Gender DESC, Salary ASC)

--indeksi loomine nime jaoks
create NonClustered Index IX_tblEmployee_Name
on tblEmployee(Name)

--clustered index -- PK (ainult üks)
--nonclustered index -- hulk
