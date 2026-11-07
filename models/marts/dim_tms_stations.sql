{{ config(materialized='table') }}

SELECT

    id AS station_id,

    tms_number,

    station_name,

    bearing,

    collection_status,

    state,

    last_updated,

    coordinates

FROM {{ ref('stg_tms_stations') }}