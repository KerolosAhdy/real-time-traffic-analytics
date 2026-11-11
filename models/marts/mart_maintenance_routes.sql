
WITH source AS (

    SELECT *
    FROM {{ ref('int_maintenance_routes_tasks') }}

),

final AS (

    SELECT
        properties_id,
        task_id,

        COALESCE(
            task_name,
            'UNKNOWN'
        ) AS task_name,

        CASE
            WHEN task_id IS NULL THEN TRUE
            ELSE FALSE
        END AS is_task_type_unknown,

        type,
        route_task,

        properties_sending_time,
        properties_start_time,
        properties_end_time,
        properties_created,

        properties_direction,
        properties_domain,
        properties_source,

        geometry_type,
        geometry_coordinates

    FROM source

)

SELECT *
FROM final
