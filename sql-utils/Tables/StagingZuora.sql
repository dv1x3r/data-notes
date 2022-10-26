CREATE TABLE [adf].[StagingZuora] (
    [ID]                INT             IDENTITY (1, 1) NOT NULL,
    [DestinationSchema] NVARCHAR (100)  NOT NULL,
    [DestinationTable]  NVARCHAR (100)  NOT NULL,
    [SourceQuery]       NVARCHAR (1024) NOT NULL,
    [IsActive]          BIT             NOT NULL,
    [Recreate]          BIT             NOT NULL,
    [PreCopyScript]     AS              (case when [Recreate]=(1) then (('drop table if exists '+[DestinationSchema])+'.')+[DestinationTable] else (((((('if (OBJECT_ID('''+[DestinationSchema])+'.')+[DestinationTable])+''', ''U'') is not null) truncate table ')+[DestinationSchema])+'.')+[DestinationTable] end),
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [STG_ZUORA_CONSTR] UNIQUE NONCLUSTERED ([DestinationSchema] ASC, [DestinationTable] ASC)
);

