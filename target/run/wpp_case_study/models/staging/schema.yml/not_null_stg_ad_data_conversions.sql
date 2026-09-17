
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select conversions
from `wpp-dev-test`.`original_data`.`stg_ad_data`
where conversions is null



  
  
      
    ) dbt_internal_test