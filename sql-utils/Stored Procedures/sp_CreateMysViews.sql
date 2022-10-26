CREATE PROCEDURE dbo.sp_CreateMysViews AS
BEGIN

-- FILL METADATA TABLE

DROP TABLE IF EXISTS [dbo].[MysMetadata]

CREATE TABLE [dbo].[MysMetadata] (
    [TABLE_CATALOG] NVARCHAR (100) NOT NULL,
    [TABLE_SCHEMA] NVARCHAR (100) NOT NULL,
    [TABLE_NAME] NVARCHAR (100) NOT NULL,
    [COLUMN_NAME] NVARCHAR (100) NOT NULL,
    [IS_PRIMARY_KEY] BIT NOT NULL,
)

insert into [dbo].[MysMetadata]
select
    c.TABLE_CATALOG
    ,c.TABLE_SCHEMA
    ,c.TABLE_NAME
    ,c.COLUMN_NAME
    ,cast(iif(pk.COLUMN_NAME is null, 0, 1) as bit) as IS_PRIMARY_KEY
from INFORMATION_SCHEMA.TABLES t
left join INFORMATION_SCHEMA.COLUMNS c on c.TABLE_CATALOG = t.TABLE_CATALOG and c.TABLE_SCHEMA = t.TABLE_SCHEMA and c.TABLE_NAME = t.TABLE_NAME
left join (
    select kcu.TABLE_CATALOG, kcu.TABLE_SCHEMA, kcu.TABLE_NAME, kcu.COLUMN_NAME
    from INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
    join INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu on kcu.CONSTRAINT_CATALOG = tc.CONSTRAINT_CATALOG and kcu.CONSTRAINT_SCHEMA = tc.CONSTRAINT_SCHEMA and kcu.CONSTRAINT_NAME = tc.CONSTRAINT_NAME
    where tc.CONSTRAINT_TYPE = 'PRIMARY KEY'
) pk on pk.TABLE_CATALOG = t.TABLE_CATALOG and pk.TABLE_SCHEMA = t.TABLE_SCHEMA and pk.TABLE_NAME = t.TABLE_NAME and pk.COLUMN_NAME = c.COLUMN_NAME
where t.[TABLE_TYPE] = 'BASE TABLE'

-- GENERATE VIEWS

DECLARE @NormalizedName nvarchar(max)
DECLARE @SelectSql nvarchar(max)
DECLARE @DropViewSQL nvarchar(max)
DECLARE @CreateViewSQL nvarchar(max)

DECLARE CV_CURS CURSOR FOR
with mys as (
    select *
        ,min([mapping_order]) over (partition by [normalized_name]) as [base_order]
        ,min([mapping_alias]) over (partition by [normalized_name]) as [base_alias]
        ,dense_rank() over (partition by [normalized_name] order by [mapping_order]) as [table_order]
        ,row_number() over (partition by [normalized_name], [column_name] order by [mapping_order]) as [column_priority]
    from (
        select
             concat(quotename(m.[TABLE_CATALOG]), '.', quotename(m.[TABLE_SCHEMA]), '.', quotename(m.[TABLE_NAME])) as [source_name]
            ,iif(map.[guid] is null,
                concat(quotename(m.[TABLE_SCHEMA]), '.', quotename(m.[TABLE_NAME])),
                concat(quotename(m.[TABLE_SCHEMA]), '.', quotename(left(m.[TABLE_NAME], len(m.[TABLE_NAME]) - 37)))) as [normalized_name]
            ,quotename(m.COLUMN_NAME) as [column_name]
            ,m.[is_primary_key]
            ,iif(map.[guid] is null, 1, map.[mapping_order]) as [mapping_order]
            ,iif(map.[guid] is null, 'A', map.[mapping_alias]) as [mapping_alias]
        from [dbo].[MysMetadata] m
        left join (
            select
                1 as [mapping_order]
                ,'A' as [mapping_alias]
                ,'437dbf0e-84ff-417a-965d-ed2bb9650972' as [guid]
                ,'MSD Dynamics - Core' as [description]
            union select 2, 'B', 'fbde9280-e9cb-4319-aed9-3eefd22d4868', 'MYS Extension - General'
            union select 3, 'C', '467feee9-4779-4242-8eb2-01bbf9de67d6', 'MYS Extension - Application'
            union select 4, 'D', '77889ad3-1296-4344-a858-cdaf674ec7d9', 'MYS Extension - Planning'
            union select 5, 'E', 'e3c63f87-259a-478a-947b-3427e64454a3', 'MYS Extension - Salary'
            union select 6, 'F', 'c4550276-2577-4fea-a571-e73a4e6b2cf2', 'MYS Extension - System'
            union select 7, 'G', 'f6a5b458-9e12-4273-b262-fa1791cb69e2', 'MYS Extension - Web'
        ) map on m.[TABLE_NAME] like '%' + map.[guid]
    ) src
)
,mys_select as (
    select [normalized_name]
        ,'SELECT' + char(10) +
         string_agg(cast(concat(char(9), [mapping_alias], '.', [column_name]) as nvarchar(max)), ',' + char(10))
         within group (order by [table_order], [column_name]) as [select_columns]
    from mys
    where [column_priority] = 1
    group by [normalized_name]
)
,mys_from as (
    select [normalized_name]
        ,string_agg(cast([table_from] as nvarchar(max)), ' ')
         within group (order by [table_order]) as [full_from]
    from (
        select distinct
            m.[source_name],
            m.[normalized_name],
            m.[table_order],
            m.[mapping_alias],
            iif(m.[table_order] = 1,
                concat('FROM ', m.[source_name], ' as ', m.[mapping_alias]),
                concat(char(10), 'LEFT JOIN ', m.[source_name], ' as ', m.[mapping_alias], ' on ', mjo.[join_on])
            ) as [table_from]
        from mys m
        left join (
            select [source_name]
                ,string_agg(cast(concat([mapping_alias], '.', [column_name], ' = ', [base_alias], '.', [column_name]) as nvarchar(max)), ' and ') as [join_on]
            from mys where [table_order] > 1 and [is_primary_key] = 1
            group by [source_name]
        ) mjo on mjo.[source_name] = m.[source_name]
    ) t1
    group by [normalized_name]
)

select
    s.normalized_name
    ,concat(s.select_columns, ' ', f.full_from) as SelectSQL
    ,concat('DROP VIEW IF EXISTS ', s.normalized_name) as DropViewSQL
    ,concat('CREATE VIEW ', s.normalized_name, ' as ', char(10), s.select_columns, char(10), f.full_from) as CreateViewSQL
from mys_select s join mys_from f on f.normalized_name = s.normalized_name

OPEN CV_CURS
FETCH NEXT FROM CV_CURS INTO @NormalizedName, @SelectSQL, @DropViewSQL, @CreateViewSQL
WHILE @@FETCH_STATUS = 0
BEGIN
        print @DropViewSQL
        print @CreateViewSQL
        print char(10)
        --exec sp_executesql @DropViewSQL
        --exec sp_executesql @CreateViewSQL
FETCH NEXT FROM CV_CURS INTO @NormalizedName, @SelectSQL, @DropViewSQL, @CreateViewSQL
END

CLOSE CV_CURS
DEALLOCATE CV_CURS

END
