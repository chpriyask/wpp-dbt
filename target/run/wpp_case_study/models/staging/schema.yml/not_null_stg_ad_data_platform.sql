
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select platform
from `wpp-dev-test`.`raw_data`.`stg_ad_data`
where platform is null



  
  
      
    ) dbt_internal_test