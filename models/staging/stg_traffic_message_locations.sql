
{{ config(materialized='view') }}

SELECT DISTINCT
    id,
    type,
    locationcode,
    subtypecode,
    roadjunction,
    roadname,
    firstname,
    secondname,
    arearef,
    linearref,
    negoffset,
    posoffset,
    urban,
    geocode,
    orderofpoint,
    NULLIF(TRIM(dataupdatedtime), '')::timestamptz
        AS dataupdatedtime,
    locationversion,
    coordinatesetrs89,
    geometry_type,
    geometry_coordinates
FROM {{ source('raw_tms', 'traffic_message_locations_english_only') }}
