{{ config(materialized='view') }}

SELECT DISTINCT

    id,
    road_number,
    road_section_number,
    description,
    road_name_missing,
    is_bridge,
    length,
    carriageway,
    n_segments,
    seg_start_min,
    seg_end_max,
    n_links,
    link_ids,
    n_lines,
    n_points,
    lon_center,
    lat_center,
    geometry_valid,
    geometry_truncated,
    id_start_distance,
    id_carriageway_code,

    seg_0_start,
    seg_0_end,
    seg_0_carriageway,

    seg_1_start,
    seg_1_end,
    seg_1_carriageway,

    seg_2_start,
    seg_2_end,
    seg_2_carriageway,

    seg_3_start,
    seg_3_end,
    seg_3_carriageway,

    seg_4_start,
    seg_4_end,
    seg_4_carriageway,

    seg_5_start,
    seg_5_end,
    seg_5_carriageway,

    seg_6_start,
    seg_6_end,
    seg_6_carriageway,

    seg_7_start,
    seg_7_end,
    seg_7_carriageway,

    seg_8_start,
    seg_8_end,
    seg_8_carriageway,

    seg_9_start,
    seg_9_end,
    seg_9_carriageway,

    seg_10_start,
    seg_10_end,
    seg_10_carriageway,

    seg_11_start,
    seg_11_end,
    seg_11_carriageway,

    seg_12_start,
    seg_12_end,
    seg_12_carriageway,

    seg_13_start,
    seg_13_end,
    seg_13_carriageway,

    seg_14_start,
    seg_14_end,
    seg_14_carriageway,

    seg_15_start,
    seg_15_end,
    seg_15_carriageway,

    seg_16_start,
    seg_16_end,
    seg_16_carriageway,

    seg_17_start,
    seg_17_end,
    seg_17_carriageway,

    seg_18_start,
    seg_18_end,
    seg_18_carriageway,

    seg_19_start,
    seg_19_end,
    seg_19_carriageway,

    seg_20_start,
    seg_20_end,
    seg_20_carriageway,

    geometry_wkt

FROM {{ source('raw_weather', 'sections_wide') }}