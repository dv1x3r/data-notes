CREATE TABLE [adf].[StagingBlobCsv] (
    [ID]                     INT            IDENTITY (1, 1) NOT NULL,
    [DestinationSchema]      NVARCHAR (100) NOT NULL,
    [DestinationTable]       NVARCHAR (100) NOT NULL,
    [SourceContainer]        NVARCHAR (100) NOT NULL,
    [SourceDirectory]        NVARCHAR (100) NOT NULL,
    [SourceFile]             NVARCHAR (100) NOT NULL,
    [SourceDelimiter]        NVARCHAR (1)   NOT NULL,
    [SourceFirstRowAsHeader] BIT            NOT NULL,
    [SourceSkipLineCount]    INT            NOT NULL,
    [IsActive]               BIT            NOT NULL,
    [Recreate]               BIT            NOT NULL,
    [PreCopyScript]          AS             (case when [Recreate]=(1) then (('drop table if exists '+[DestinationSchema])+'.')+[DestinationTable] else (((((('if (OBJECT_ID('''+[DestinationSchema])+'.')+[DestinationTable])+''', ''U'') is not null) truncate table ')+[DestinationSchema])+'.')+[DestinationTable] end),
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [STG_BLOB_CSV_CONSTR] UNIQUE NONCLUSTERED ([DestinationSchema] ASC, [DestinationTable] ASC)
);

