CREATE PROCEDURE [adf].[StagingIndexesUpdate]
as begin

truncate table [adf].[StagingIndexes];

with src ([IndexScript]) as (
          (select 'select 1 as placeholder')
          --(select 'IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = ''BI_ENUMS_IX001'') CREATE NONCLUSTERED INDEX [BI_ENUMS_IX001] on [stg_ax5].[BI_ENUMS] ( ENUMNAME ASC, ENUMVALUE ASC, DATAAREAID ASC) INCLUDE (ENUMVALUEDESC)')
)
insert into [adf].[StagingIndexes] ([IndexScript], [IsActive])
select src.[IndexScript], 1 from src

end