with

artists as (

    select * from boardgame.raw.artists

),

final as (

    select
        game_id as boardgame_id,
        case
            when artists = '0' then 'Unknown'
            else artists
        end as artist_name

    from artists

)

select * from final