with

country_codes_users_ref as (

    select * from BOARDGAME.SEEDS.country_codes_users_ref

),

final as (

    select
        country_code,
        country_name

    from country_codes_users_ref

)

select * from final