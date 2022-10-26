CREATE TABLE [adf].[Log] (
    [LogID]             INT             IDENTITY (1, 1) NOT NULL,
    [ParentLogID]       INT             NOT NULL,
    [StartTimeUTC]      DATETIME        NOT NULL,
    [EndTimeUTC]        DATETIME        NULL,
    [StartTimeCET]      AS              (CONVERT([datetime],switchoffset([StartTimeUTC],datepart(tzoffset,(getutcdate() AT TIME ZONE 'Central Europe Standard Time'))))),
    [EndTimeCET]        AS              (CONVERT([datetime],switchoffset([EndTimeUTC],datepart(tzoffset,(getutcdate() AT TIME ZONE 'Central Europe Standard Time'))))),
    [CurrentTimeCET]    AS              (CONVERT([datetime],switchoffset(getutcdate(),datepart(tzoffset,(getutcdate() AT TIME ZONE 'Central Europe Standard Time'))))),
    [Duration]          AS              (CONVERT([time](0),isnull([EndTimeUTC],getutcdate())-[StartTimeUTC])),
    [DurationMinutes]   AS              (((60)*datepart(hour,CONVERT([time](0),isnull([EndTimeUTC],getutcdate())-[StartTimeUTC]))+datepart(minute,CONVERT([time](0),isnull([EndTimeUTC],getutcdate())-[StartTimeUTC])))+datepart(second,CONVERT([time](0),isnull([EndTimeUTC],getutcdate())-[StartTimeUTC]))/(60.0)),
    [Status]            INT             NOT NULL,
    [StatusDescription] AS              (case [Status] when (0) then 'In Progress' when (1) then 'Succeeded' when (2) then 'Failed' else 'Timeout' end),
    [RunID]             NVARCHAR (37)   NOT NULL,
    [Pipeline]          NVARCHAR (128)  NOT NULL,
    [Type]              INT             NOT NULL,
    [TypeDescription]   AS              (case [Type] when (0) then 'Pipeline' when (1) then 'Copy Data' when (2) then 'Tabular' when (3) then 'Scale' when (4) then 'Data Flow' when (5) then 'Function' else 'Unknown' end),
    [Object]            NVARCHAR (128)  NULL,
    [Rows]              INT             NULL,
    [DataSizeMb]        FLOAT (53)      NULL,
    [IndexSizeMb]       FLOAT (53)      NULL,
    [TotalSizeMb]       AS              ([DataSizeMb]+[IndexSizeMb]),
    [TotalSizeGb]       AS              (([DataSizeMb]+[IndexSizeMb])/(1024.0)),
    [Error]             NVARCHAR (2048) NULL,
    [Environment]       AS              (case right(@@servername,(1)) when 'd' then 'Development' when 't' then 'Test UAT' when 'p' then 'Production'  end),
    PRIMARY KEY CLUSTERED ([LogID] ASC)
);



GO

CREATE NONCLUSTERED INDEX [IX_Log] ON [adf].[Log] ([ParentLogID]) INCLUDE ([DataSizeMb], [EndTimeUTC], [Error], [IndexSizeMb], [Pipeline], [Rows], [StartTimeUTC], [Status]) WITH (ONLINE = ON)
GO
CREATE NONCLUSTERED INDEX [IX_Log_2] ON [adf].[Log] ([Object], [Pipeline], [Status]) INCLUDE ([StartTimeUTC]) WITH (ONLINE = ON)