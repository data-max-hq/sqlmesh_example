MODEL (
  name imdb.trends_by_country,
  cron '@daily',
  kind FULL,
  description 'Compare genre trends by country',
  audits(
    assert_not_null_country,
    assert_not_null_genre
  )
);

WITH netflix(genre, releaseYear, country) AS (
  SELECT
    genre::STRING,
    releaseYear::INT,
    country::STRING
  FROM (
     SELECT
        imdbId::STRING,
        EXPLODE(SPLIT(genres::STRING, ', ')) AS genre,
        releaseYear::INT,
    FROM imdb.netflix
  ) AS base_table
  JOIN (
    SELECT
        imdbId::STRING,
        EXPLODE(SPLIT(availableCountries::STRING, ', ')) AS country
    FROM imdb.netflix
  ) AS country_table
  ON base_table.imdbId = country_table.imdbId
)
SELECT
  COUNT(*) AS counter,
  genre,
  releaseYear,
  country
FROM netflix
GROUP BY genre, releaseYear, country