
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select ad_id
from `wpp-dev-test`.`gmail_rawdata`.`staging_data`
where ad_id is null



  
  
      
    ) dbt_internal_test