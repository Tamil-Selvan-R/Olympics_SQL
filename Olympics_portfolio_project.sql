-- Team with maximum gold medals over the years.

SELECT a.team,COUNT(a.team) as no_of_gold
from 
	athletes a JOIN athlete_events b  ON a.id = b.athlete_id
	where b.medal = 'Gold' and a.team = 'united states/france'
	group by a.team
	order by no_of_gold desc
	


--total silver medals of each team and year in which they won maximum silver medal
with cte as(SELECT a.team,COUNT(a.team) as no_of_silver
from 
	athletes a JOIN athlete_events b  ON a.id = b.athlete_id
	where b.medal = 'Silver' 
	group by a.team
	),

cte1 as
(select *
from (select team,no_of_silver1,year,ROW_NUMBER() over (partition by team 
		order by no_of_silver1 desc) match
from (select team,COUNT(c.team) as no_of_silver1,year
from 
	athletes c JOIN athlete_events d  ON c.id = d.athlete_id
	where d.medal = 'Silver' 
	group by c.team,year
	) a) b
where match = 1)


select a.team,a.no_of_silver,b.year
from cte a join cte1 b on a.team = b.team
order by a.no_of_silver desc





--player who won maximum gold medals  amongst the players 
--which have won only gold medal (never won silver or bronze) over the years

select top 2 a.name,COUNT(b.medal) no_of_gold
from athletes a join athlete_events b on a.id = b.athlete_id
where b.medal = 'Gold'
group by a.name
having a.name not in (select a.name from athletes a join athlete_events b on a.id = b.athlete_id where b.medal = 'silver'  group by a.name) and  a.name not in (select a.name  from athletes a join athlete_events b on a.id = b.athlete_id where b.medal = 'bronze' group by a.name)
order by no_of_gold desc




--4 in each year which player has won maximum gold medal . Write a query to print year,player name 
--and no of golds won in that year . In case of a tie print comma separated player names.
with cte as
(select year,name as player_name,count(b.medal) no_of_gold
from athletes a join athlete_events b on a.id = b.athlete_id
where b.medal = 'Gold'
group by year,name)

select year,STRING_AGG(player_name,',') as player_name,no_of_gold
from(select year,player_name,no_of_gold
from (select *,rank() over (partition by year order by no_of_gold desc) rn
from cte) a
where rn = 1) b
group by year,no_of_gold
order by year

--India has won its first gold medal,first silver medal and first bronze medal

with medal as(select team,medal,min(year) year,sport,ROW_NUMBER() over 
	(partition by medal order by min(year)) rn
from athletes a join athlete_events b on a.id = b.athlete_id
where team = 'india' 
group by medal,sport,team)

select YEAR,medal,Sport
from medal
where rn = 1 and medal not in ('na')
order by sport




--players who won gold medal in summer and winter olympics both.

select name
from athletes a join athlete_events b on a.id = b.athlete_id
where medal = 'gold' and season in ('summer' ,  'winter')
group by name
HAVING COUNT(DISTINCT season) = 2;







--players who won gold, silver and bronze medal in a single olympics. print player name 
--along with year.

select b.year,a.name
from athletes a join athlete_events b on a.id = b.athlete_id
where medal not in ('NA') and b.medal in ('Gold','Silver','Bronze') and b.medal IS NOT NULL
group by year,name
having COUNT(distinct medal) = 3 
order by year






--find players who have won gold medals in consecutive 3 summer olympics in the same event . Consider only olympics 2000 onwards. 
--Assume summer olympics happens every 4 year starting 2000. print player name and event name.






with cte as
(SELECT name,
		event,lag(b.year,1) OVER (PARTITION BY a.name, b.event ORDER BY b.year) as previous_year,
		year as present_year,
		lead(b.year,1) OVER (PARTITION BY a.name, b.event ORDER BY b.year)as following_year
from athletes a join athlete_events b on a.id = b.athlete_id
where   medal = 'Gold' and 
		season = 'Summer' and
		b.year >= '2000'
		)
		


select *
from cte
where previous_year = present_year - 4 and following_year = present_year + 4


    

	
