CREATE TABLE [adf].[StagingIndexes] (
    [ID] int IDENTITY(1,1) PRIMARY KEY,
    [IndexScript] nvarchar(1024) NOT NULL,
    [IsActive] bit NOT NULL
)