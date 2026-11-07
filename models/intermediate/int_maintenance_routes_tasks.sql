
{{ config(materialized='view') }}

WITH route_tasks AS (

    SELECT
        routes.*,
        task.value AS route_task

    FROM {{ ref('stg_maintenance_routes') }} AS routes

    CROSS JOIN LATERAL jsonb_array_elements_text(
        routes.properties_tasks[1]::jsonb
    ) AS task(value)

),

normalized_routes AS (

    SELECT
        *,

        TRIM(
            REGEXP_REPLACE(
                REGEXP_REPLACE(
                    REGEXP_REPLACE(
                        LOWER(REPLACE(route_task, '_', ' ')),
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

    FROM route_tasks

),

normalized_dictionary AS (

    SELECT
        id AS task_id,
        task_name,

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
    routes.type,
    routes.properties_id,
    routes."properties_previousId",
    routes.properties_sending_time,
    routes.properties_start_time,
    routes.properties_end_time,
    routes.properties_created,
    routes.properties_direction,
    routes.properties_domain,
    routes.properties_source,
    routes.geometry_type,
    routes.geometry_coordinates,

    routes.route_task,

    dictionary.task_id,
    dictionary.task_name

FROM normalized_routes AS routes

LEFT JOIN normalized_dictionary AS dictionary
    ON routes.normalized_task = dictionary.normalized_task
