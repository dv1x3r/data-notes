CREATE PROCEDURE [adf].[StagingSqlUpdate]
as begin

with src ([DestinationSchema], [DestinationTable], [SourceSecret], [SourceSchema], [SourceTable], [IsActive], [ExcludeTypes], [UpsertKeys], [WhereStatement], [DeleteStatement]) as (
          (select 'stg_AX5', 'ADDRESS',                               'ax5-connection-string', 'dbo', 'ADDRESS',                            0, null, null, null, null)
)
merge [adf].[StagingSql] trg using src on src.[DestinationSchema] = trg.[DestinationSchema] and src.[DestinationTable] = trg.[DestinationTable]
when matched then update set
    trg.[SourceSecret] = src.[SourceSecret],
    trg.[SourceSchema] = src.[SourceSchema],
    trg.[SourceTable] = src.[SourceTable],
    trg.[IsActive] = src.[IsActive],
    trg.[ExcludeTypes] = src.[ExcludeTypes],
    trg.[UpsertKeys] = src.[UpsertKeys],
    trg.[WhereStatement] = src.[WhereStatement],
    trg.[DeleteStatement] = src.[DeleteStatement]
when not matched then insert ([DestinationSchema], [DestinationTable],
    [SourceSecret], [SourceSchema], [SourceTable], [IsActive], [ExcludeTypes], [UpsertKeys], [WhereStatement], [DeleteStatement])
    values (src.[DestinationSchema], src.[DestinationTable],
        src.[SourceSecret], src.[SourceSchema], src.[SourceTable], src.[IsActive], src.[ExcludeTypes], src.[UpsertKeys], src.[WhereStatement], src.[DeleteStatement])
when not matched by source then delete;

end