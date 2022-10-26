CREATE PROCEDURE [adf].[StagingD365CeProdUpdate]
as begin

with src ([DestinationSchema], [DestinationTable], [SourceEntity], [IsActive]) as (
    (select 'stg_D365Ce', 'dbo_contact', 'contact', 0)
)
merge [adf].[StagingD365CeProd] trg using src on src.[DestinationSchema] = trg.[DestinationSchema] and src.[DestinationTable] = trg.[DestinationTable]
when matched then update set
	trg.[SourceEntity] = src.[SourceEntity],
	trg.[IsActive] = src.[IsActive],
    trg.[Recreate] = 1
when not matched then insert ([DestinationSchema], [DestinationTable], [SourceEntity], [IsActive], [Recreate])
	values (src.[DestinationSchema], src.[DestinationTable], src.[SourceEntity], src.[IsActive], 1)
when not matched by source then delete;
end