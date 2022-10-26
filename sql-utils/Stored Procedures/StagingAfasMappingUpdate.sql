CREATE PROCEDURE [adf].[StagingAfasMappingUpdate]
as begin

with src ([schema_name], [table_name], [source_column], [target_column], [target_column_type] ) as (
	(select 'stg_afas', 'HRAnalyticsEmployeesBasic', 'Medewerker', 'EmployeeId', 'String')
)
merge [adf].[StagingAfasMapping] trg using src on src.[schema_name] = trg.[schema_name] and src.[table_name] = trg.[table_name] 
and src.[source_column] = trg.[source_column] and src.[target_column] = trg.[target_column] 
when matched then update set
	trg.[schema_name] = src.[schema_name],
	trg.[table_name] = src.[table_name],
	trg.[source_column] = src.[source_column],
	trg.[target_column] = src.[target_column],
	trg.[target_column_type] = src.[target_column_type]
when not matched then insert ([schema_name], [table_name], [source_column], [target_column], [target_column_type])
	values (src.[schema_name], src.[table_name], src.[source_column], src.[target_column], src.[target_column_type])
when not matched by source then delete;

end