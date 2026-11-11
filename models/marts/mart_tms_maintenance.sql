
WITH source AS (

    SELECT *
    FROM {{ ref('int_tms_maintenance_tasks') }}

),

final AS (

    SELECT
        task_id,
        task_dictionary_id,

        task_name,

        COALESCE(
            dictionary_task_name,
            'UNKNOWN'
        ) AS dictionary_task_name,

        CASE
            WHEN task_dictionary_id IS NULL THEN TRUE
            ELSE FALSE
        END AS is_task_type_unknown,

        task_time,
        created_time,

        direction,
        domain,
        source,
        coordinates

    FROM source

)

SELECT *
FROM final
