use AdventureWorksDW2019
--Local tabeli loomine
create table #PersonDetails(Id int, Name nvarchar(20))
insert into #PersonDetails values(1, 'Mike')
insert into #PersonDetails values (2, 'John')
insert into #PersonDetails values (3, 'Todd')
select * from #PersonDetails

--Käsk tabeli kohalikkuse näitamiseks
Select name from tempdb..sysobjects
where name like '#PersonDetails%'

--tabeli kustutamine
drop table #PersonDetails

--protseduuri loomine kohaliku tabeli loomiseks
Create procedure spCreateLocalTempTable
as
begin
Create table #PersonDetails(Id int, Name nvarchar(20))
insert into #PersonDetails values(1, 'Mike')
insert into #PersonDetails values (2, 'John')
insert into #PersonDetails values (3, 'Todd')
select * from #PersonDetails
end

--globaalse ajutise tabeli loomine
create table ##EmployeeDetails (Id int, Name nvarchar(20))
