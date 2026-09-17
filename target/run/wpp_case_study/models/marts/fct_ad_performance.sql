
  
    

    create or replace table `wpp-dev-test`.`original_data`.`fct_ad_performance`
      
    
    

    
    OPTIONS()
    as (
      -- Step 1: Grab the clean data from your staging file
WITH clean_data AS (
    SELECT * 
    FROM `wpp-dev-test`.`original_data`.`stg_ad_data`
)

-- Step 2: Group the data and do the math
SELECT 
    -- We want to see the performance broken down by day, platform, and campaign
    ad_date,
    platform,
    campaign_name,
    
    -- Add up all the daily totals
    SUM(spend) AS total_spend,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(conversions) AS total_conversions,
    
    -- Calculate the Funnel Percentages (Using SAFE_DIVIDE so we don't get errors if dividing by zero)
    -- Click-Through Rate: Clicks divided by Impressions
    SAFE_DIVIDE(SUM(clicks), SUM(impressions)) AS click_through_rate,
    
    -- Conversion Rate: Conversions divided by Clicks
    SAFE_DIVIDE(SUM(conversions), SUM(clicks)) AS conversion_rate,
    
    -- Calculate the Cost Per Acquisition (CPA)
    -- CPA: Total Spend divided by Total Conversions
    SAFE_DIVIDE(SUM(spend), SUM(conversions)) AS cost_per_acquisition

FROM clean_data
-- We must group by the first 3 columns (date, platform, campaign) so BigQuery knows how to bundle the totals
GROUP BY 1, 2, 3
    );
  