create procedure [adf].[LogStart]
	@ParentLogID int,
	@RunID nvarchar(37), @Pipeline nvarchar(128),
	@Type int, @Object nvarchar(128)
as begin
	insert into [adf].[Log] (
		[ParentLogID], [StartTimeUTC],
		[Status], [RunID], [Pipeline],
		[Type], [Object]
	) values (
		@ParentLogID, getutcdate(),
		0, @RunID, @Pipeline,
		@Type, @Object
	)
	select
		cast(scope_identity() as int) as LogID,
		coalesce(
			(select max([StartTimeUTC]) from [adf].[Log] where [Pipeline] = @Pipeline and [Object] = @Object and [Status] = 1),
			(select max([StartTimeUTC]) from [adf].[Log] where [Pipeline] = @Pipeline and [Object] is null and [Status] = 1)
		) as [LastSucceededStartTime]
end