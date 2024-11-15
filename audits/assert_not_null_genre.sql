AUDIT (
  name assert_not_null_genre
);

SELECT
  *
FROM @this_model
WHERE
  genre IS NULL