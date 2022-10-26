CREATE TABLE [adf].[StagingSqlMetadata] (
    [SecretName]       NVARCHAR (100)  NOT NULL,
    [SchemaName]       NVARCHAR (100)  NOT NULL,
    [TableName]        NVARCHAR (100)  NOT NULL,
    [TableCreateDate]  DATETIME NOT NULL,
    [TableModifyDate]  DATETIME NOT NULL,
    [ColumnName]       NVARCHAR (100)  NOT NULL,
    [ColumnTypeSys]    NVARCHAR (100)  NOT NULL,
    [ColumnTypeUsr]    NVARCHAR (100)  NOT NULL,
    [ColumnIsIdentity] BIT      NOT NULL,
    [ColumnIsNullable] BIT      NOT NULL,
    [ColumnMaxLength]  SMALLINT NOT NULL,
    [ColumnPrecision]  TINYINT  NOT NULL,
    [ColumnScale]      TINYINT  NOT NULL,
    [LogID]            INT      NOT NULL,
);

GO
CREATE NONCLUSTERED INDEX [IX_StagingSqlMetadata_1] ON [adf].[StagingSqlMetadata] ([TableName]) INCLUDE ([SchemaName],[ColumnName],[ColumnIsIdentity])
GO
