-------------------------------------------------------
-- 01_CreateDatabase.sql
-------------------------------------------------------
-- Variables (you can parameterize these in your CI/CD later)
DECLARE @DatabaseName NVARCHAR(100) = N'MyProjectDB';
DECLARE @LoginName NVARCHAR(100) = N'MyWebApiLogin';
DECLARE @Password NVARCHAR(100) = N'StrongP@ssword123!';
DECLARE @UserName NVARCHAR(100) = N'MyWebApiUser';

-------------------------------------------------------
-- 1. Create database if it doesn’t exist
-------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = @DatabaseName)
BEGIN
    PRINT 'Creating database...';
    DECLARE @sql NVARCHAR(MAX) = 'CREATE DATABASE [' + @DatabaseName + ']';
    EXEC (@sql);
	PRINT 'Database has been created'
END
ELSE
    PRINT 'Database already exists.';