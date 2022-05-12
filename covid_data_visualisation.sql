/*
Queries used for Tableau Project
*/


-- 1. 

Select 
	SUM(new_cases) as total_cases,
	SUM(cast(new_deaths as int)) as total_deaths,
	SUM(cast(new_deaths as int))/SUM(d.New_Cases)*100 as Death_Percentage
from 
	portfolio_1..coviddeaths as d

where 
	d.continent is not null 
	



-- 2. 


Select location,
	SUM(cast(new_deaths as int)) as TotalDeathCount
From 
	portfolio_1..CovidDeaths
Where 
	continent is null 
and 
	location not in ('World', 'European Union', 'International','high income','Lower middle income','Upper middle income','Low income')
Group by 
	location
order 
	by TotalDeathCount desc


-- 3.

Select Location, 
	Population, 
	MAX(total_cases) as HighestInfectionCount,
	Max((total_cases/population))*100 as PercentPopulationInfected
From
	portfolio_1..CovidDeaths

where
	continent is not null
	and location not in ('timor','Micronesia (country)')
Group by 
	Location, Population
order by 
	 PercentPopulationInfected desc


-- 4.
Select d.date,
	SUM(d.new_cases) as total_cases,
	SUM(cast(d.new_deaths as int)) as total_deaths,
	SUM(cast(d.new_deaths as int))/SUM(d.New_Cases)*100 as Death_Percentage,
	SUM(cast(v.people_vaccinated as bigint)) as partially_vaccinated,
	SUM(cast(v.people_fully_vaccinated as bigint)) as fully_vaccinated
	
from 
	portfolio_1..coviddeaths as d
	join 
	portfolio_1..covidvaccination as v 
		on  d.location =v.location
		and d.date =v.date

where 
	d.continent is not null 
	and d.date >='2021-01-01'
group by 
	d.date
order by 1,2

	
	##
	
	Select 
	SUM(cast(v.people_fully_vaccinated as bigint))/SUM(d.population)*100
	
from 
	portfolio_1..coviddeaths as d
	join 
	portfolio_1..covidvaccination as v 
		on  d.location =v.location
		and d.date =v.date
where 
	d.continent is not null 
	and d.date >='2021-01-01'

