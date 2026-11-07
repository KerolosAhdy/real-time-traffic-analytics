
{{ config(materialized='view') }}

SELECT DISTINCT
    id,
    name,
    short_name,
    unit,
    direction,
    accuracy,
    description

FROM {{ source('raw_tms', 'tms_sensors') }}
