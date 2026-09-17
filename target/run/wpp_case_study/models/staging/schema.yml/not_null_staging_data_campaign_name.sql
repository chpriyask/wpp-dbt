
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select campaign_name
from `wpp-dev-test`.`gmail_rawdata`.`staging_data`
where campaign_name is null



  
  
      
    ) dbt_internal_test