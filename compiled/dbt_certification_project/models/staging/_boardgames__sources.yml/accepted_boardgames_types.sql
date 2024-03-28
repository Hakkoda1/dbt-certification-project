
    
    

with all_values as (

    select
        type as value_field,
        count(*) as n_records

    from boardgame.raw.boardgames
    group by type

)

select *
from all_values
where value_field not in (
    'bgsleeve','boardgame','boardgameaccessory','boardgameexpansion','boardgameissue','puzzle','rpgissue','rpgitem','videogame','videogamecompilation','videogameexpansion','videogamehardware'
)


