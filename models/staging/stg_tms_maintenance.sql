
{{ config(materialized='view') }}

WITH source_data AS (

    SELECT DISTINCT
        task_id,
        task_time,
        created_time,
        tasks,
        direction,
        domain,
        source,
        coordinates

    FROM {{ source('raw_tms', 'tms_maintenance') }}

)

SELECT
    task_id,

    NULLIF(TRIM(task_time), '')::timestamptz AS task_time,

    NULLIF(TRIM(created_time), '')::timestamptz AS created_time,

    tasks,
    direction,
    domain,
    source,
    coordinates

FROM source_data
