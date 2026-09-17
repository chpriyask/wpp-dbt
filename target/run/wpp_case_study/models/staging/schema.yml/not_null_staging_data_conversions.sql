
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select conversions
from `wpp-dev-test`.`gmail_rawdata`.`staging_data`
where conversions is null



  
  
      
    ) dbt_internal_test