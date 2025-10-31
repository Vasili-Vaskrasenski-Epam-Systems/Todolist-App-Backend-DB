-- Variables (you can parameterize these in your CI/CD later)
DECLARE @DatabaseName NVARCHAR(100) = N'MyProjectDB';
DECLARE @LoginName NVARCHAR(100) = N'MyWebApiLogin';
DECLARE @Password NVARCHAR(100) = N'StrongP@ssword123!';
DECLARE @UserName NVARCHAR(100) = N'MyWebApiUser';

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = @LoginName)
BEGIN
    PRINT 'Creating login...';
    DECLARE @createLogin NVARCHAR(MAX) = 
        'CREATE LOGIN [' + @LoginName + '] WITH PASSWORD = ''' + @Password + ''', CHECK_POLICY = OFF;';
    EXEC (@createLogin);
	PRINT 'LOGIN has been created'
END
ELSE
    PRINT 'Login already exists.';