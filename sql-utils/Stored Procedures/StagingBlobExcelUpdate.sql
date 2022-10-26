CREATE PROCEDURE [adf].[StagingBlobExcelUpdate]
as begin

with src ([DestinationSchema], [DestinationTable], [SourceContainer], [SourceDirectory], [SourceFile], [SourceSheetName], [SourceFirstRowAsHeader], [IsActive]) as (
          (select 'stg_manual', 'blank', 'manualinput', '/', 'blank.xlsx', 'blank', 1, 0)
)
merge [adf].[StagingBlobExcel] trg using src on src.[DestinationSchema] = trg.[DestinationSchema] and src.[DestinationTable] = trg.[DestinationTable]
when matched then update set
	trg.[SourceContainer] = src.[SourceContainer],
	trg.[SourceDirectory] = src.[SourceDirectory],
	trg.[SourceFile] = src.[SourceFile],
	trg.[SourceSheetName] = src.[SourceSheetName],
	trg.[SourceFirstRowAsHeader] = src.[SourceFirstRowAsHeader],
	trg.[IsActive] = src.[IsActive],
    trg.[Recreate] = 1
when not matched then insert ([DestinationSchema], [DestinationTable],
	[SourceContainer], [SourceDirectory], [SourceFile], [SourceSheetName], [SourceFirstRowAsHeader], [IsActive], [Recreate])
	values (src.[DestinationSchema], src.[DestinationTable],
		src.[SourceContainer], src.[SourceDirectory], src.[SourceFile], src.[SourceSheetName], src.[SourceFirstRowAsHeader], src.[IsActive], 1)
when not matched by source then delete;

end