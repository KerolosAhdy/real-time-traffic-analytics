{{ config(materialized='view') }}

SELECT DISTINCT

    id,
    task_name,
    NULLIF(TRIM(dataupdatedtime), '')::timestamptz
        AS dataupdatedtime

FROM {{ source('raw_tms', 'maintenance_tracking_tasks_english_only') }}