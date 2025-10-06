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
