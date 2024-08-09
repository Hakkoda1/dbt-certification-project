
    
    

with child as (
    select boardgame_key as from_field
    from BOARDGAME.dbt_prod.dim_publishers
    where boardgame_key is not null
),

parent as (
    select boardgame_key as to_field
    from BOARDGAME.dbt_prod.dim_boardgames
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


