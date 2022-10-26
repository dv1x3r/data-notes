-- Create Admin
--CREATE USER [user@user.com] FROM EXTERNAL PROVIDER;
--EXEC sp_addrolemember N'db_owner', N'user@user.com'

-- Check if user has access
--EXECUTE AS USER = 'user@user.com';
--select CURRENT_USER as ExecutingAs
--select * from stg_D365ce.dbo_account
--select * from stg_D365ce.dq_account
--REVERT select CURRENT_USER as ExecutingAs

-- SQL Roles (Global)
select M.[name], R.[name]
from sys.database_role_members DRM
join sys.database_principals AS M on DRM.member_principal_id = M.principal_id
join sys.database_principals AS R on DRM.role_principal_id = R.principal_id

 
-- SQL Permissions (DB/Object)
select
	pr.principal_id, pr.name, pr.type_desc, pr.authentication_type_desc, pe.state_desc, pe.permission_name, pe.class_desc,
	'revoke ' + pe.permission_name + ' on ' + isnull(schema_name(o.uid)+'.','') + OBJECT_NAME(major_id) + ' from [' + USER_NAME(grantee_principal_id) + ']' as revokeStatement,
    'grant ' + permission_name + ' on ' + isnull(schema_name(o.uid)+'.','') + OBJECT_NAME(major_id) + ' to ' + '[' + USER_NAME(grantee_principal_id) + ']' as grantStatement
FROM sys.database_principals AS pr
JOIN sys.database_permissions AS pe ON pe.grantee_principal_id = pr.principal_id
LEFT OUTER JOIN sysobjects o ON o.id = pe.major_id
where pr.name <> 'public'
order by 1,7,8
