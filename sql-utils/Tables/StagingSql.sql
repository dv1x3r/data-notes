CREATE TABLE [adf].[StagingSql] (
    [ID]                INT             IDENTITY (1, 1) NOT NULL,
    [DestinationSchema] NVARCHAR (100)  NOT NULL,
    [DestinationTable]  NVARCHAR (100)  NOT NULL,
    [SourceSecret]      NVARCHAR (100)  NOT NULL,
    [SourceSchema]      NVARCHAR (100)  NOT NULL,
    [SourceTable]       NVARCHAR (100)  NOT NULL,
    [IsActive]          BIT             NOT NULL,
    [ExcludeTypes]      NVARCHAR (MAX) NULL,
    [UpsertKeys]        NVARCHAR (MAX) NULL,
    [WhereStatement]    NVARCHAR (MAX) NULL,
    [DeleteStatement]   NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [STG_SQL_CONSTR] UNIQUE NONCLUSTERED ([DestinationSchema] ASC, [DestinationTable] ASC)
);
