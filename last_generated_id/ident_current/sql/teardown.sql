USE master
GO
IF EXISTS (
  SELECT name
   FROM sys.databases
   WHERE name = N'TestDb'
)
DROP DATABASE TestDb
GO
