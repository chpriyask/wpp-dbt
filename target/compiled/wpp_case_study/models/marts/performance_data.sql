-- Grab the clean data from your staging file
WITH clean_data AS (
    SELECT * 
    FROM `wpp-dev-test`.`gmail_rawdata`.`staging_data`
)

-- doing groupby aggregations and performing calculations for cpa,conversion rate,ctr
SELECT 

    ad_date,
    platform,
    campaign_name,
    
    SUM(spend) AS total_spend,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(conversions) AS total_conversions,
    
    -- Calculate the Funnel Percentages (Using SAFE_DIVIDE so we don't get errors if dividing by zero)
   
    SAFE_DIVIDE(SUM(clicks), SUM(impressions)) AS click_through_rate,
    
    -- Conversion Rate: Conversions divided by Clicks
    SAFE_DIVIDE(SUM(conversions), SUM(clicks)) AS conversion_rate,
    
    -- Calculate the Cost Per Acquisition (CPA)
    -- CPA: Total Spend divided by Total Conversions
    SAFE_DIVIDE(SUM(spend), SUM(conversions)) AS cost_per_acquisition

FROM clean_data
-- to perform aggregation if there are any similar advs on same date and same campaign name
GROUP BY ad_date,platform,campaign_name