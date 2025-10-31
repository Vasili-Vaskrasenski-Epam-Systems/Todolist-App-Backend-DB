PRINT 'Creating Users table'
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
BEGIN
    CREATE TABLE [MyProjectDB].[dbo].[Users]
    (
        [UserId] INT IDENTITY(1,1) PRIMARY KEY,
        [Email] NVARCHAR(255) NOT NULL UNIQUE,
        [Name] NVARCHAR(100) NOT NULL,
        [LastName] NVARCHAR(100) NOT NULL,
        [CreationDate] DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
    CREATE INDEX IX_User_Email ON [MyProjectDB].[dbo].[Users](Email);
END;

PRINT 'Users table has been created'