
    
    

select
    "Rank" as unique_field,
    count(*) as n_records

from boardgame.raw.rankings
where "Rank" is not null
group by "Rank"
having count(*) > 1


