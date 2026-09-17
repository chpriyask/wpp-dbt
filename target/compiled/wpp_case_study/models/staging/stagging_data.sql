-- Step 1: Grab the raw data from BigQuery
WITH original_data AS (
    SELECT * 
    FROM `wpp-dev-test`.`original_data`.`original_table1`
),

-- Step 2: Clean the data
cleaned_data AS (
    SELECT 
        ad_id,
        
        -- Fix the date format from DD-MM-YY to a standard SQL Date
        CAST(date AS DATE) AS ad_date,
        
        -- Force all platform and campaign names to be lowercase so they match perfectly
        LOWER(platform) AS platform,
        LOWER(campaign_name) AS campaign_name,
        
        -- Keep the financial and visual numbers as they are
        spend,
        impressions,
        clicks,
        
        -- Fix the empty conversion fields: If it is NULL, make it a 0.
        CAST(COALESCE(conversions, 0) AS INT64) AS conversions

    FROM original_data
)

-- Step 3: Remove duplicates (This handles your second file)
SELECT * 
FROM cleaned_data
-- This rule says: "Look at the ad_id. If you see the same ad_id more than once, only keep the row number 1."
QUALIFY ROW_NUMBER() OVER (PARTITION BY ad_id ORDER BY ad_date DESC) = 1