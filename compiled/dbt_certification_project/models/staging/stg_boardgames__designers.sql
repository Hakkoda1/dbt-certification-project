with

designers as (

    select * from boardgame.raw.designers

),

final as (

    select
        game_id as boardgame_id,
        case
            when designers = '0' then 'Unknown'
            else designers
        end as designer_name

    from designers

)

select * from final