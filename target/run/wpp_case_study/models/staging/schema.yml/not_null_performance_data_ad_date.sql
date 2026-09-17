
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select ad_date
from `wpp-dev-test`.`gmail_rawdata`.`performance_data`
where ad_date is null



  
  
      
    ) dbt_internal_test