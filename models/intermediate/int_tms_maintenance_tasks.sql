
{{ config(materialized='view') }}

WITH expanded_tasks AS (
    SELECT
        maintenance.task_id,
        maintenance.task_time,
        maintenance.created_time,
        TRIM(task.task_name) AS task_name,
        maintenance.direction,
        maintenance.domain,
        maintenance.source,
        maintenance.coordinates
    FROM {{ ref('stg_tms_maintenance') }} AS maintenance
    CROSS JOIN LATERAL UNNEST(
        STRING_TO_ARRAY(maintenance.tasks, ',')
    ) AS task(task_name)
),

normalized_tasks AS (
    SELECT
        *,
        TRIM(
            REGEXP_REPLACE(
                REGEXP_REPLACE(
                    REGEXP_REPLACE(
                        LOWER(REPLACE(task_name, '_', ' ')),
                        '[^a-z0-9]+',
                        ' ',
                        'g'
                    ),
                    '\mthe\M',
                    '',
                    'g'
                ),
                '\s+',
                ' ',
                'g'
            )
        ) AS normalized_task
    FROM expanded_tasks
),

normalized_dictionary AS (
    SELECT
        id AS task_dictionary_id,
        task_name AS dictionary_task_name,
        TRIM(
            REGEXP_REPLACE(
                REGEXP_REPLACE(
                    REGEXP_REPLACE(
                        LOWER(task_name),
                        '[^a-z0-9]+',
                        ' ',
                        'g'
                    ),
                    '\mthe\M',
                    '',
                    'g'
                ),
                '\s+',
                ' ',
                'g'
            )
        ) AS normalized_task
    FROM {{ ref('stg_maintenance_tracking_tasks') }}
)

SELECT
    tasks.task_id,
    tasks.task_time,
    tasks.created_time,
    tasks.task_name,
    dictionary.task_dictionary_id,
    dictionary.dictionary_task_name,
    tasks.direction,
    tasks.domain,
    tasks.source,
    tasks.coordinates
FROM normalized_tasks AS tasks
LEFT JOIN normalized_dictionary AS dictionary
    ON tasks.normalized_task = dictionary.normalized_task
