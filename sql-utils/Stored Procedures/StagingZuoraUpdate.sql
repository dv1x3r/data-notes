CREATE PROCEDURE [adf].[StagingZuoraUpdate]
as begin

with src ([DestinationSchema], [DestinationTable], [SourceQuery], [IsActive]) as (
          (select 'stg_Zuora', 'dbo_Account',                     'select * from Account', 0)
)
merge [adf].[StagingZuora] trg using src on src.[DestinationSchema] = trg.[DestinationSchema] and src.[DestinationTable] = trg.[DestinationTable]
when matched then update set
	trg.[SourceQuery] = src.[SourceQuery],
	trg.[IsActive] = src.[IsActive],
    trg.[Recreate] = 1
when not matched then insert ([DestinationSchema], [DestinationTable], [SourceQuery], [IsActive], [Recreate])
	values (src.[DestinationSchema], src.[DestinationTable], src.[SourceQuery], src.[IsActive], 1)
when not matched by source then delete;

end