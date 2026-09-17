
    
    

with dbt_test__target as (

  select ad_id as unique_field
  from `wpp-dev-test`.`gmail_rawdata`.`staging_data`
  where ad_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


