{{ config(
    materialized='table',
    schema='silver',
    alias='movie_release_dates',
    description='This table contains the release dates of movies, sourced from the seed data. It is used to enrich the movies table with release date information for analysis and reporting purposes.'
) }}
SELECT m.movieid,
       m.title,
       CASE 
              WHEN release_date IS NOT NULL THEN YEAR(t.release_date)
              WHEN release_date IS NULL THEN CAST(REGEXP_SUBSTR(title, '\\(([0-9]{4})\\)', 1, 1, 'e', 1) AS INT)
              ELSE NULL
         END AS release_year
FROM {{ ref('movies') }} AS m
LEFT JOIN {{ ref('seed_movie_release_dates') }} AS t
ON trim(m.movieid) = trim(t.movie_id)


