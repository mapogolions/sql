USE TestDb
BEGIN
    WAITFOR DELAY '00:00:04'
    SELECT GETDATE() AS [TIME], SCOPE_IDENTITY() AS [SESSION 2: Scope_Identity Returns]
    SELECT GETDATE() AS [TIME], @@IDENTITY AS [SESSION 2: IDENTITY Returns]
    SELECT GETDATE() AS [TIME], IDENT_CURRENT('dbo.City') AS [SESSION 2: IDENT_CURRENT Returns]
END

INSERT INTO dbo.City (Name, Population) VALUES ('City2', 22.5)
