CREATE TABLE [adf].[StagingAfas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DestinationSchema] [nvarchar](100) NOT NULL,
	[DestinationTable] [nvarchar](100) NOT NULL,
	[SourceEntity] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Recreate] [bit] NOT NULL,
	[PreCopyScript]  AS (case when [Recreate]=(1) then (('drop table if exists '+[DestinationSchema])+'.')+[DestinationTable] else (((((('if (OBJECT_ID('''+[DestinationSchema])+'.')+[DestinationTable])+''', ''U'') is not null) truncate table ')+[DestinationSchema])+'.')+[DestinationTable] end),
	[Connector]  AS ('ProfitRestServices/connectors/'+[SourceEntity]),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [STG_AFAS_CONSTR] UNIQUE NONCLUSTERED 
(
	[DestinationSchema] ASC,
	[DestinationTable] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
