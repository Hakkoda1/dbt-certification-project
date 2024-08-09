-- back compat for old kwarg name
  
  begin;
    
        
            
            
        
    

    

    merge into BOARDGAME.dbt_prod.dim_rankings as DBT_INTERNAL_DEST
        using BOARDGAME.dbt_prod.dim_rankings__dbt_tmp as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.ranking_key = DBT_INTERNAL_DEST.ranking_key
            )

    
    when matched then update set
        valid_to = DBT_INTERNAL_SOURCE.valid_to,is_current = DBT_INTERNAL_SOURCE.is_current
    

    when not matched then insert
        ("RANKING_KEY", "BOARDGAME_KEY", "BOARDGAME_RANK", "BOARDGAME_TOTAL_REVIEWS", "BOARDGAME_URL", "BOARDGAME_THUMBNAIL", "UPDATED_AT", "VALID_FROM", "VALID_TO", "IS_CURRENT")
    values
        ("RANKING_KEY", "BOARDGAME_KEY", "BOARDGAME_RANK", "BOARDGAME_TOTAL_REVIEWS", "BOARDGAME_URL", "BOARDGAME_THUMBNAIL", "UPDATED_AT", "VALID_FROM", "VALID_TO", "IS_CURRENT")

;
    commit;