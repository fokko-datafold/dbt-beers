{{ config(
    materialized="table"
) }}

SELECT
  *,
  1 as one
FROM {{ ref('beers') }} beers
JOIN {{ ref('breweries') }} breweries USING (brewery_id)
