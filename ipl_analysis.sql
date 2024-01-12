--How many matches played in ipl history?
select season, count(matchnumber) as total_matches
from matches
group by 1
order by 1 asc

select count(matchnumber) as total_matches
from matches

--What is the distribution of matches across different cities?
select city, count(matchnumber) as total_matches
from matches
group by 1
order by 2 desc

--Which season has the highest number of matches?
select season, count(matchnumber) as total_matches
from matches
group by 1
order by 2 desc

--How many matches ended in a tie or without a result?
select city, count(winningteam) as tie_noresult
from matches
where winningteam='NA'
group by city

--What is the most common toss decision (batting or bowling) among teams?
select tosswinner, count(matchnumber) as total
from matches
where tossdecision='bat'
group by 1
order by 2 desc

select tosswinner, count(matchnumber) as total
from matches
where tossdecision='field'
group by 1
order by 2 desc

--Which team won the most matches?
select winningteam, count(matchnumber) as total_win
from matches
group by 1
order by 2 desc

--In how many matches did the team that won the toss also win the match?
select winningteam, count(*) as total_win
from matches
where winningteam=tosswinner
group by 1
order by 2 desc

--How many matches had a Super Over?
select count(superover) as total_superover
from matches
where superover='Y'

--What is the average margin of victory in runs and by wickets?
--runs
select winningteam, avg(margin) as winby_avg_runs
from matches
where wonby='Runs'
group by 1
order by 2 desc
--wickets
select winningteam, avg(margin) as winby_avg_runs
from matches
where wonby='Wickets'
group by 1
order by 2 desc

--How many unique players have participated as batters?
select count(distinct batter) as unique_bater
from innings

--Who is the highest run-scorer?
select batter, sum(batsman_run) as total_run
from innings
group by 1
order by 2 desc

--Which bowler has taken the most wickets?
select bowler, sum(iswicketdelivery) as total_wicket
from innings
group by 1
order by 2 desc

--How many overs have been bowled on average every season?
select m.season, avg(i.overs) as avg_over
from matches as m
join innings as i
on i.id=m.id
group by 1

--What is the distribution of total runs scored in innings?
select m.matchnumber, m.season, sum(i.total_run) as total
from matches as m
join innings as i
on i.id=m.id
group by 1,2
order by 1 asc

--what is the total runs scored in Final matches in each season
select m.season, m.matchnumber,m.team1, m.team2, sum(i.total_run) as runs
from matches as m
join innings as i
on i.id=m.id
group by 1,2,3,4
having m.matchnumber='Final'
order by 1 asc

--In how many innings did a non-boundary contribute to the total runs?
select m.season, m.matchnumber, count(i.non_boundary)
from matches as m
join innings as i
on i.id=m.id
where i.non_boundary=1
group by 1,2
order by 1 asc

--How many wickets were taken per inning?
select i.id, i.innings, sum(i.iswicketdelivery)
from innings as i
group by 1,2
order by id desc

--In how many matches did a player receive the "Player of the Match" award?
select distinct player_of_match, count(player_of_match) as total
from matches
group by 1
order by 2 desc

--Which umpires officiated in matches where the winning margin was less than 10 runs or more than 50 runs?
select season,umpire1, umpire2, team1,team2, winningteam, margin
from matches
where margin<10 or margin>50
group by 1,2,3,4,5,6,7
order by 7 desc


--What is the total number of runs scored by each team in a specific season?
select distinct m.team1, m.season,  sum(i.total_run) as runs
from matches as m
join innings as i
on i.id=m.id
group by 1,2
order by 2 asc, 3 desc

--











