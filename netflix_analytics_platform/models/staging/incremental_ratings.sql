{{
  config(
    materialized = 'incremental',
    on_schema_change='fail',
    schema='staging',
    alias='inc_ratings',
  )
}}

WITH src_ratings AS (
  SELECT * FROM {{ ref('ratings') }}
)

SELECT
  userid,
  movieid,
  rating,
  TIMESTAMP
FROM src_ratings
WHERE rating IS NOT NULL

{% if is_incremental() %}
  AND TIMESTAMP > (SELECT MAX(TIMESTAMP) FROM {{ this }})
{% endif %}