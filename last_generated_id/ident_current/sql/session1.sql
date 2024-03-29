USE TestDb

INSERT INTO dbo.City (Name, Population)
VALUES ('City1', 23.2), ('Cit2', 19.5)

SELECT GETDATE()
BEGIN
    WAITFOR DELAY '00:00:10'
    SELECT GETDATE() AS [TIME], SCOPE_IDENTITY() AS [SESSION 1: Scope_Identity Returns]
    SELECT GETDATE() AS [TIME], @@IDENTITY AS [SESSION 1: IDENTITY Returns]
    SELECT GETDATE() AS [TIME], IDENT_CURRENT('dbo.City') AS [SESSION 1: IDENT_CURRENT Returns]
END
