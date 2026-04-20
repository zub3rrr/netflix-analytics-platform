{{ config(
    materialized='table',
    schema='staging',
    alias='ratings',
) }}

SELECT *
FROM {{ source('RAW', 'raw_ratings') }}