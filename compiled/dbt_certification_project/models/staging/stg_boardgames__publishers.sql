with

publishers as (

    select * from boardgame.raw.publishers

),

final as (

    select
        game_id as boardgame_id,
        case
            when publishers = '0' then 'Unknown'
            else publishers
        end as publisher_name

    from publishers

)

select * from final