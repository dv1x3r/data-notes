CREATE VIEW [adf].[StagingSqlView] AS
select
     adf.DestinationSchema
    ,adf.DestinationTable
    ,adf.SourceSecret
    ,adf.UpsertKeys
    ,concat(
        'select *',
        ' from ', coalesce(src.SourceSubquery, (concat(quotename(adf.SourceSchema), '.', quotename(adf.SourceTable)))),
        ' where ' + adf.WhereStatement) as SelectSQL
    ,iif(convert(varchar(32), hashbytes('MD5', src.SourceColumnsList), 2) = convert(varchar(32), hashbytes('MD5', trg.TargetColumnsList), 2)
        ,iif(adf.DeleteStatement is null,
            concat('truncate table ', quotename(adf.DestinationSchema), '.', quotename(adf.DestinationTable)),
            concat('delete from ', quotename(adf.DestinationSchema), '.', quotename(adf.DestinationTable), ' where ', adf.DeleteStatement))
        ,concat('drop table if exists ', quotename(adf.DestinationSchema), '.', quotename(adf.DestinationTable))) as PreCopySQL
from adf.StagingSql adf
left join (
    select
         src_sub.DestinationSchema
        ,src_sub.DestinationTable
        ,max(src_sub.SourceColumnsList) as SourceColumnsList
        ,'(' + string_agg(concat(
            'select ', src_sub.SourceColumnsQuery,
                ', ''', src_sub.TableName, ''' as [TableName]', -- extra columns
            ' from ', concat(quotename(src_sub.SchemaName), '.', quotename(src_sub.TableName))), ' union ') + ') src' as SourceSubquery
    from (
        select
            ss.DestinationSchema
            ,ss.DestinationTable
            ,ssm.SchemaName
            ,ssm.TableName
            ,string_agg(cast(quotename(ssm.ColumnName) as nvarchar(max)), ',') within group (order by ssm.ColumnName) as SourceColumnsList
            ,string_agg(cast(
                -- ADF Conversion Overflow bug: https://learn.microsoft.com/en-us/answers/questions/64539/azure-data-factory-conversion-overflow.html
                iif(ssm.ColumnTypeSys = 'decimal' and ssm.ColumnPrecision > 28,
                    concat('cast(',quotename(ssm.ColumnName), ' as decimal(28,8)) as ', quotename(ssm.ColumnName)),
                    quotename(ssm.ColumnName)
                ) as nvarchar(max)), ',') within group (order by ssm.ColumnName) as SourceColumnsQuery
        from adf.StagingSql ss 
        join adf.StagingSqlMetadata ssm
            on ssm.SecretName = ss.SourceSecret
            and ssm.SchemaName = ss.SourceSchema
            and ssm.TableName like ss.SourceTable
            and ssm.ColumnTypeSys not in (select value from string_split(ss.ExcludeTypes, ',')) 
        group by ss.DestinationSchema, ss.DestinationTable, ssm.SchemaName, ssm.TableName
    ) src_sub
    group by src_sub.DestinationSchema, src_sub.DestinationTable
) src on src.DestinationSchema = adf.DestinationSchema and src.DestinationTable = adf.DestinationTable
left join (
    select TABLE_SCHEMA as DestinationSchema, TABLE_NAME as DestinationTable
        ,string_agg(cast(quotename(COLUMN_NAME) as nvarchar(max)), ',') within group (order by COLUMN_NAME) as TargetColumnsList
    from INFORMATION_SCHEMA.COLUMNS
    where COLUMN_NAME not in ('LogID', 'TableName')
    group by TABLE_SCHEMA, TABLE_NAME
) trg on trg.DestinationSchema = adf.DestinationSchema and trg.DestinationTable = adf.DestinationTable
where adf.[IsActive] = 1
