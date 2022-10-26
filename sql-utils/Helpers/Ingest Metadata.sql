select
     s.[name] as SchemaName
    ,t.[name] as TableName
    ,t.[create_date] as TableCreateDate
    ,t.[modify_date] as TableModifyDate
    ,c.[name] as ColumnName
    ,st.[name] as ColumnTypeSys
    ,ut.[name] as ColumnTypeUsr
    ,cast(iif(c.[column_id] = ic.[column_id], 1, 0) as bit) as ColumnIsIdentity
    ,c.[is_nullable] as ColumnIsNullable
    ,c.[max_length] as ColumnMaxLength
    ,c.[precision] as ColumnPrecision
    ,c.[scale] as ColumnScale
from sys.tables t
join sys.schemas s on s.schema_id = t.schema_id
join sys.columns c on c.object_id = t.object_id
join sys.types st on st.user_type_id = c.system_type_id -- yes, this is correct
join sys.types ut on ut.user_type_id = c.user_type_id -- this is also correct
left join (
    select distinct ic.object_id, ic.column_id
    from sys.index_columns ic
    join sys.indexes i on i.object_id = ic.object_id
    where i.is_primary_key = 1
) ic on ic.object_id = t.object_id and ic.column_id = c.column_id
where t.[type] = 'U'