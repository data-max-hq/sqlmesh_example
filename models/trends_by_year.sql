MODEL (
  name imdb.trends_by_year,
  cron '@daily',
  kind FULL,
  description 'Trending genres over time',
  audits(
    assert_not_null_genre
  )
);

WITH netflix(genre, releaseYear) AS (
  SELECT
    EXPLODE(SPLIT(CAST(genres AS STRING), ', ')) AS genre,
    releaseYear::INT,
  FROM imdb.netflix
)
SELECT
  COUNT(*) AS counter,
  *
FROM netflix
WHERE
  genre IS NOT NULL
GROUP BY genre, releaseYear
ORDER BY counter DESC, genre