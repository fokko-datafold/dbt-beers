
{{ config(
    materialized="table",
    pre_hook="""
        CREATE OR REPLACE TABLE {{ this.database }}.{{ this.schema }}.source_table
            AS SELECT
                19          AS foo,
                'Leden'     AS bar
            UNION ALL
                SELECT
                25          AS foo,
                'Yes'       AS bar
    """
) }}

SELECT
  id            AS beer_id,
  name          AS beer_name,
  style         AS beer_style,
  abv           AS abv,
  ibu           AS ibu,
  brewery_id    AS brewery_id,
  ounces        AS ounces
FROM
  {{ ref('seed_beers') }}
