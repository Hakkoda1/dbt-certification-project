with

country_codes as (

    select * from BOARDGAME.SEEDS.country_codes

),

final as (

    select
        country_code,
        country_name

    from country_codes

)

select * from final