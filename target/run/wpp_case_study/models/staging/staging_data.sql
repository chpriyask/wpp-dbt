

  create or replace view `wpp-dev-test`.`gmail_rawdata`.`staging_data`
  OPTIONS()
  as --loading the rawfile(wpp shared in gmail) from bigquery
WITH originalraw_data AS (
    SELECT * 
    FROM `wpp-dev-test`.`gmail_rawdata`.`adv_table`
),

-- adjusting the unstructed data
cleaned_data AS (
    SELECT 
        ad_id,
        CAST(date AS DATE) AS ad_date,
        LOWER(platform) AS platform,
        LOWER(campaign_name) AS campaign_name,
        
        spend,
        impressions,
        clicks,
        
        CAST(COALESCE(conversions, 0) AS INT64) AS conversions

    FROM originalraw_data
)
SELECT * 
FROM cleaned_data
--not to have duplicate values
QUALIFY ROW_NUMBER() OVER (PARTITION BY ad_id ORDER BY ad_date DESC) = 1;

