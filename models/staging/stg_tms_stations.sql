
{{ config(materialized='view') }}

SELECT DISTINCT
    id,
    tms_number,
    station_name,
    bearing,
    collection_status,
    state,
    last_updated,
    coordinates

FROM {{ source('raw_tms', 'tms_stations') }}
