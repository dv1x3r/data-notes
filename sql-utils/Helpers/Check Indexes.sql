select
	QUOTENAME(SCHEMA_NAME(t.[schema_id])) + '.' + QUOTENAME(t.[name]) + '.' + QUOTENAME(i.[name]) as IX
	,string_agg(c.[name], ', ') as IX_COLUMNS
from sys.indexes i
join sys.index_columns ic on ic.[object_id] = i.[object_id] and ic.[index_id] = i.[index_id]
join sys.columns c on c.[object_id] = ic.[object_id] and c.[column_id] = ic.[column_id]
join sys.tables t on t.[object_id] = i.[object_id]
where i.is_primary_key = 0 and i.index_id <> 0 and t.is_ms_shipped = 0
group by t.[schema_id], t.[name], i.[name]
order by 1