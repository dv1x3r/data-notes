CREATE PROCEDURE [adf].[StagingD365FoProdUpdate]
as begin

with src ([DestinationSchema], [DestinationTable], [SourceEntity], [SourceCrossCompany], [SourceQuery], [IsActive]) as (
          (select 'stg_D365Fo', 'dbo_AddressStates',								'AddressStates', 1, null, 0)
)
merge [adf].[StagingD365FoProd] trg using src on src.[DestinationSchema] = trg.[DestinationSchema] and src.[DestinationTable] = trg.[DestinationTable]
when matched then update set
	trg.[SourceEntity] = src.[SourceEntity],
	trg.[SourceCrossCompany] = src.[SourceCrossCompany],
	trg.[SourceQuery] = src.[SourceQuery],
	trg.[IsActive] = src.[IsActive],
    trg.[Recreate] = 1
when not matched then insert ([DestinationSchema], [DestinationTable], [SourceEntity], [SourceCrossCompany], [SourceQuery], [IsActive], [Recreate])
	values (src.[DestinationSchema], src.[DestinationTable], src.[SourceEntity], src.[SourceCrossCompany], src.[SourceQuery], src.[IsActive], 1)
when not matched by source then delete;

end