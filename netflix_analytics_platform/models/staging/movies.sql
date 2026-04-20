{{ config(
    materialized='table',
    schema='staging',
    alias='movies',
) }}

SELECT *
FROM {{ source('RAW', 'raw_movies') }}