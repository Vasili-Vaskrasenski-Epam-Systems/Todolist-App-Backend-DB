PRINT 'Creating Projects table'
-- Projects Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Projects')
BEGIN
    CREATE TABLE [MyProjectDB].[dbo].[Projects]
    (
        [ProjectId] INT IDENTITY(1,1) PRIMARY KEY,
        [UserId] INT NOT NULL,
        [ProjectName] NVARCHAR(200) NOT NULL,
        [Description] NVARCHAR(MAX) NULL,
        [IsActive] BIT NOT NULL DEFAULT 1,
        [ProjectOrder] INT NULL,
        CONSTRAINT FK_Projects_User FOREIGN KEY (UserId) REFERENCES [MyProjectDB].[dbo].[Users](UserId)
    );
    CREATE INDEX IX_Projects_UserId ON [MyProjectDB].[dbo].[Projects](UserId);
    CREATE INDEX IX_Projects_ProjectId ON [MyProjectDB].[dbo].[Projects](ProjectId);
END;
PRINT 'Projects table has been created'