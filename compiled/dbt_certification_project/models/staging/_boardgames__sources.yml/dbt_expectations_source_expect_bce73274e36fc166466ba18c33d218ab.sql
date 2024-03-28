with relation_columns as (

        
        select
            cast('_LINE' as TEXT) as relation_column,
            cast('NUMBER' as TEXT) as relation_column_type
        union all
        
        select
            cast('GAME_ID' as TEXT) as relation_column,
            cast('NUMBER' as TEXT) as relation_column_type
        union all
        
        select
            cast('ARTISTS' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('_FIVETRAN_SYNCED' as TEXT) as relation_column,
            cast('TIMESTAMP_TZ' as TEXT) as relation_column_type
        
        
    ),
    test_data as (

        select
            *
        from
            relation_columns
        where
            relation_column = 'GAME_ID'
            and
            relation_column_type not in ('NUMBER')

    )
    select *
    from test_data