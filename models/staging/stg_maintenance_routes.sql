{{ config(materialized='view') }}

SELECT DISTINCT

    type,

    properties_id,
    "properties_previousId",

    NULLIF(TRIM("properties_sendingTime"), '')::timestamptz
        AS properties_sending_time,

    NULLIF(TRIM("properties_startTime"), '')::timestamptz
        AS properties_start_time,

    NULLIF(TRIM("properties_endTime"), '')::timestamptz
        AS properties_end_time,

    NULLIF(TRIM(properties_created), '')::timestamptz
        AS properties_created,

    properties_tasks,
    properties_direction,
    properties_domain,
    properties_source,

    geometry_type,
    geometry_coordinates

FROM {{ source('raw_tms', 'cleaned_maintenance_routes') }}