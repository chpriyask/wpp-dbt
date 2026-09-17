
    
    

with all_values as (

    select
        platform as value_field,
        count(*) as n_records

    from `wpp-dev-test`.`gmail_rawdata`.`staging_data`
    group by platform

)

select *
from all_values
where value_field not in (
    'google ads','meta ads','tiktok ads'
)


