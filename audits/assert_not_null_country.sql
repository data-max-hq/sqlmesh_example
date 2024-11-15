AUDIT (
  name assert_not_null_country
);

SELECT
  *
FROM @this_model
WHERE
  country IS NULL