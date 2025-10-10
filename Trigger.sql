--92
--trigger k�ivitab vastuseks CREATE_TABLE 
Create trigger trMyFirstTrigger
on database
for CREATE_TABLE
as
begin
print 'New table created'
end

create Table Test (Id int)

alter trigger trMyFirstTrigger
on database
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
Begin
print 'A table has just been created, modified or deleted'
end

alter trigger trMyFirstTrigger
on Database
For CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
Begin
Rollback
print 'You cannot create, alter or drop a table'
end

disable trigger trMyFirstTrigger on Database

drop trigger trMyFirstTrigger on Database

create Trigger trRenameTable
on Database
for rename
as
begin
print 'You just renames something'
end


--93
--Server Scoped DDL trigger
create trigger tr_DatabaseScopeTrigger
on database
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
rollback
print 'You cannot create, alter or drop a table in the current database'
end

--All Server
create trigger tr_ServerScopeTrigger
on all server
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
rollback
print 'You cannot create, alter or drop a table in any database on the server'
end

--�ldserveri DDL-p��stiku sulgemine
disable trigger tr_ServerScopeTrigger on all server

--�ldserveri DDL-p��stiku avamine
enable trigger tr_ServerScopeTrigger on all server

--kustutamine
drop trigger tr_ServerScopeTrigger on all server

