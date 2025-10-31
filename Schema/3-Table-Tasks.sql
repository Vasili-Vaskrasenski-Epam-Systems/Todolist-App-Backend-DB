PRINT 'Creating Tasks table'
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Tasks')
BEGIN
    CREATE TABLE [MyProjectDB].[dbo].[Tasks]
    (
        [TaskId] INT IDENTITY(1,1) PRIMARY KEY,
        [Name] NVARCHAR(200) NOT NULL,
        [Description] NVARCHAR(MAX) NULL,
        [IsDone] BIT NOT NULL DEFAULT 0,
        [DueDate] DATETIME2 NULL,
        [ParentTaskId] INT NULL,
        CONSTRAINT FK_Tasks_Parent FOREIGN KEY (ParentTaskId) REFERENCES [MyProjectDB].[dbo].[Tasks](TaskId)
    );
    CREATE INDEX IX_Tasks_TaskId ON [MyProjectDB].[dbo].[Tasks](TaskId);
END;
PRINT 'Tasks table has been created'