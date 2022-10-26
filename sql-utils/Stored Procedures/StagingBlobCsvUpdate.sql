CREATE PROCEDURE [adf].[StagingBlobCsvUpdate]
as begin

with src ([DestinationSchema], [DestinationTable], [SourceContainer], [SourceDirectory], [SourceFile], [SourceDelimiter], [SourceFirstRowAsHeader], [SourceSkipLineCount], [IsActive]) as (
          (select 'stg_tabular', 'TabularDescriptions', 'azuredevops', 'TabularMetadata', 'TabularDescriptions.csv', ';', 1, 0, 0)
    union (select 'stg_tabular', 'TabularMembers', 'azuredevops', 'TabularMetadata', 'TabularMembers.csv', ';', 1, 0, 0)
    union (select 'stg_tabular', 'TabularRLS', 'azuredevops', 'TabularMetadata', 'TabularRLS.csv', ';', 1, 0, 0)
)
merge [adf].[StagingBlobCsv] trg using src on src.[DestinationSchema] = trg.[DestinationSchema] and src.[DestinationTable] = trg.[DestinationTable]
when matched then update set
	trg.[SourceContainer] = src.[SourceContainer],
	trg.[SourceDirectory] = src.[SourceDirectory],
	trg.[SourceFile] = src.[SourceFile],
	trg.[SourceDelimiter] = src.[SourceDelimiter],
	trg.[SourceFirstRowAsHeader] = src.[SourceFirstRowAsHeader],
	trg.[SourceSkipLineCount] = src.[SourceSkipLineCount],
	trg.[IsActive] = src.[IsActive],
    trg.[Recreate] = 1
when not matched then insert ([DestinationSchema], [DestinationTable],
	[SourceContainer], [SourceDirectory], [SourceFile], [SourceDelimiter], [SourceFirstRowAsHeader], [SourceSkipLineCount], [IsActive], [Recreate])
	values (src.[DestinationSchema], src.[DestinationTable],
		src.[SourceContainer], src.[SourceDirectory], src.[SourceFile], src.[SourceDelimiter], src.[SourceFirstRowAsHeader], src.[SourceSkipLineCount], src.[IsActive], 1)
when not matched by source then delete;

end