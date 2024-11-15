MODEL (
  name imdb.netflix,
  kind SEED (
    path '../seeds/netflix.csv',
    csv_settings (delimiter = ',', quotechar = '"', encoding = 'utf-8')
  ),
  columns (
    title STRING,
    type STRING,
    genres STRING,
    releaseYear INT,
    imdbId STRING,
    imdbAverageRating FLOAT,
    imdbNumVotes INT,
    availableCountries STRING
  ),
  grain imdbId
);