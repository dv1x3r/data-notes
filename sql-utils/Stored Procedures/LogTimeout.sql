create procedure [adf].[LogTimeout]
as begin
	update [adf].[Log]
	set [EndTimeUTC] = getutcdate(), [Status] = 3
	where [Status] = 0 and datediff(day, StartTimeUTC, getutcdate()) > 0
	select @@ROWCOUNT as [TimeoutRows]
end