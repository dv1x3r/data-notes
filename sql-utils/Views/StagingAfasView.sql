CREATE VIEW [adf].[StagingAfasView] as
select
     adf.DestinationSchema
    ,adf.DestinationTable
    ,adf.Connector
    ,adf.PreCopyScript
    ,map.Mapping
from adf.StagingAfas adf
left join (
    select
        table_name,
        '{"type": "TabularTranslator", "mappings": [' +
         string_agg('{"source":{"path":"[''' + [source_column] + ''']"},"sink":{"name":"' + [target_column] + '","type":"' + [target_column_type] + '"}}', ', ') +
        '], "collectionReference": "$[''rows'']"}' as Mapping
    FROM adf.StagingAfasMapping
    group by table_name
) map on map.table_name = adf.DestinationTable
where adf.[IsActive] = 1
