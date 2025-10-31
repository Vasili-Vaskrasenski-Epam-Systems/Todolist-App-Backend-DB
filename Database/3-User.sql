-- Variables (you can parameterize these in your CI/CD later)
DECLARE @DatabaseName NVARCHAR(100) = N'MyProjectDB';
DECLARE @LoginName NVARCHAR(100) = N'MyWebApiLogin';
DECLARE @Password NVARCHAR(100) = N'StrongP@ssword123!';
DECLARE @UserName NVARCHAR(100) = N'MyWebApiUser';

DECLARE @createUser NVARCHAR(MAX);
SET @createUser = '
USE [' + @DatabaseName + '];
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N''' + @UserName + ''')
BEGIN
    CREATE USER [' + @UserName + '] FOR LOGIN [' + @LoginName + '];
    ALTER ROLE db_datareader ADD MEMBER [' + @UserName + '];
    ALTER ROLE db_datawriter ADD MEMBER [' + @UserName + '];
END';
EXEC (@createUser);

PRINT 'User has been created'