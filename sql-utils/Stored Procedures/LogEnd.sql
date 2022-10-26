create procedure [adf].[LogEnd]
	@LogID int, @Status int, @Error nvarchar(2048)
as begin
	update l set
		l.[EndTimeUTC] = getutcdate(),
		l.[Status] = @Status,
		l.[Error] = @Error,
		l.[Rows] = i.[Rows],
		l.[DataSizeMb] = i.[DataSizeKb] / 1024.0,
		l.[IndexSizeMb] = i.[IndexSizeKb] / 1024.0
	from [adf].[Log] l left join (
		select
			s.name + '_' + o.name as [Object],
			sum(case when (i.index_id < 2) then ps.row_count else 0 end) as [Rows], -- clustered index (1) or hash table (0)
			sum(case when (i.index_id < 2) then (ps.reserved_page_count * 8) else 0 end) as [DataSizeKb],
			sum(case when (i.index_id >= 2) then (ps.reserved_page_count * 8) else 0 end) as [IndexSizeKb]
		from sys.objects o
			join sys.schemas s on o.schema_id = s.schema_id
			join sys.indexes i on o.object_id = i.object_id 
			join sys.dm_db_partition_stats ps on i.object_id = ps.object_id and i.index_id = ps.index_id
		group by s.name, o.name
	) i on l.[Type] in (1, 4) and l.[Object] = i.[Object] -- Copy Data or Data Flow
	where l.LogID = @LogID
	select @LogID as LogID
end