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




SELECT RELEASE_YEAR, COUNT(*) AS movie_count
FROM {{ ref('movie_release_date') }}
GROUP BY RELEASE_YEAR
ORDER BY RELEASE_YEAR;