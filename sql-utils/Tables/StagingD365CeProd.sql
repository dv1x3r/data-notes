CREATE TABLE [adf].[StagingD365CeProd] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [DestinationSchema] NVARCHAR (100) NOT NULL,
    [DestinationTable]  NVARCHAR (100) NOT NULL,
    [SourceEntity]      NVARCHAR (100) NOT NULL,
    [IsActive]          BIT            NOT NULL,
    [Recreate]          BIT            NOT NULL,
    [PreCopyScript]     AS             (case when [Recreate]=(1) then (('drop table if exists '+[DestinationSchema])+'.')+[DestinationTable] else (((((('if (OBJECT_ID('''+[DestinationSchema])+'.')+[DestinationTable])+''', ''U'') is not null) truncate table ')+[DestinationSchema])+'.')+[DestinationTable] end),
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [STG_D365CE_PROD_CONSTR] UNIQUE NONCLUSTERED ([DestinationSchema] ASC, [DestinationTable] ASC)
);

