CREATE TABLE [adf].[StagingD365FoProd] (
    [ID]                 INT             IDENTITY (1, 1) NOT NULL,
    [DestinationSchema]  NVARCHAR (100)  NOT NULL,
    [DestinationTable]   NVARCHAR (100)  NOT NULL,
    [SourceEntity]       NVARCHAR (100)  NOT NULL,
    [SourceCrossCompany] BIT             NOT NULL,
    [SourceQuery]        NVARCHAR (1024) NULL,
    [IsActive]           BIT             NOT NULL,
    [Recreate]           BIT             NOT NULL,
    [PreCopyScript]      AS              (case when [Recreate]=(1) then (('drop table if exists '+[DestinationSchema])+'.')+[DestinationTable] else (((((('if (OBJECT_ID('''+[DestinationSchema])+'.')+[DestinationTable])+''', ''U'') is not null) truncate table ')+[DestinationSchema])+'.')+[DestinationTable] end),
    [SourcePath]         AS              (([SourceEntity]+case when [SourceCrossCompany]=(1) then '?cross-company=true' else '' end)+isnull([SourceQuery],'')),
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [STG_D365FO_PROD_CONSTR] UNIQUE NONCLUSTERED ([DestinationSchema] ASC, [DestinationTable] ASC)
);

