CREATE TABLE [adf].[StagingAfasMapping](
	[schema_name] [nvarchar](max) NULL,
	[table_name] [nvarchar](max) NULL,
	[source_column] [nvarchar](max) NULL,
	[target_column] [nvarchar](max) NULL,
	[target_column_type] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]