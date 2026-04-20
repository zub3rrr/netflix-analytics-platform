{{ config(
    materialized='table',
    schema='staging',
    alias='users',
) }}

WITH ratings AS (
    SELECT DISTINCT USERID AS user_id
    FROM {{ source('RAW', 'raw_ratings') }}
),
tags AS (
    SELECT DISTINCT USERID AS user_id
    FROM {{ source('RAW', 'raw_tags') }}
)

SELECT DISTINCT user_id
FROM 
(
    SELECT * FROM ratings
    UNION
    SELECT * FROM tags
)