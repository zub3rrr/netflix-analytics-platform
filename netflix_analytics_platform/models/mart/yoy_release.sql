{{ config(
    materialized='table',
    schema='mart',
    alias='yoy_release',
) }}
WITH base_table AS (
SELECT RELEASE_YEAR, COUNT(*) AS movie_count
FROM {{ ref('movie_release_date') }}
GROUP BY RELEASE_YEAR
ORDER BY RELEASE_YEAR
)
SELECT * , movie_count - lag(movie_count) OVER(ORDER BY RELEASE_YEAR) as yoy_release_count
FROM base_table