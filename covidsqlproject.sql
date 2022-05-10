select * 
from portfolio_1..coviddeaths;

select * 
from portfolio_1..coviddeaths
order by   
	3,4;

select * 
from portfolio_1..covidvaccination;

-- portfolio_1..coviddeaths
-- portfolio_1..covidvaccination

 -- AGGRETRATE function for portfolio_1..coviddeaths

--eg1
select * 
from portfolio_1..coviddeaths ;

select count(population)
from portfolio_1..coviddeaths;

select max(population)
from portfolio_1..coviddeaths;

select min(population)
from portfolio_1..coviddeaths;

select avg(population)
from portfolio_1..coviddeaths;

select sum(population)
from portfolio_1..coviddeaths;

select *
from portfolio_1..coviddeaths;

-- eg2
select location,
	date,
	total_cases,
	total_deaths,
	new_cases,
	total_deaths,
	population
from portfolio_1..coviddeaths
order by
	1,2;

-- looking at total cases vs total deaths

-- eg3
select location,
	date,
	total_cases,
	total_deaths,
	(total_deaths/total_cases)*100 as death_to_cases_percen
from portfolio_1..coviddeaths
order by
	1,2;

-- eg4
select location,
	date,
	total_cases,
	total_deaths,
	(total_deaths/total_cases)*100 as death_to_cases_percen
from 
	portfolio_1..coviddeaths
where 
	location like '%states%'
order by
	1,2;


-- eg5
select location,
	date,
	month(date) as month,
	(date) as week,
	total_cases,
	total_deaths,
	(total_deaths/total_cases)*100 as death_to_cases_percen
from 
	portfolio_1..coviddeaths
where 
	location like '%states%'
order by
	1,2;


-- population vs total cases

-- eg6
select location,
	date,
	month(date) as month,
	population
	total_cases,
	(total_cases/population)*100 as percen_of_pop_covid
from 
	portfolio_1..coviddeaths
where 
	location='india'
order by
	1,2;

-- eg7
select location,
	date,
	month(date) as month,
	population,
	total_cases,
	(total_cases/population)*100 as percen_of_pop_covid
from 
	portfolio_1..coviddeaths
where 
	location='india' and
	date between '2022-01-01' and '2022-03-18'
order by
	1,2;


 -- eg8
select location,
	date,
	month(date) as month,
	population,
	total_cases,
	(total_cases/population)*100 as percen_of_pop_covid
from 
	portfolio_1..coviddeaths
where 
	date between '2022-01-01' and '2022-03-18'
order by
	1,2;


-- eg9
select location,
	sum(population),
	sum(total_cases),
	(sum(total_cases)/sum(population))*100 as percen_of_pop_covid
from 
	portfolio_1..coviddeaths
where 
	date between '2022-01-01' and '2022-03-18'
group by
	location
order by
	1;


-- eg10
select iso_code,
	sum(population) as total_population,
	sum(total_cases) as total_cases,
	(sum(total_cases)/sum(population))*100 as percen_of_pop_covid
from 
	portfolio_1..coviddeaths
where 
	date between '2022-01-01' and '2022-03-18'
group by
	iso_code
order by
	1;

-- looking at countries with highest infection rate compared  to population 

-- eg11
-- 1st way
select location,
	population,
	max(total_cases) as highest_infection_count,
	max((total_cases/population))*100 as max_percentage
from 
	portfolio_1..coviddeaths
where 
	date between '2022-01-01' and '2022-03-18'  -- arbitary value
group by
	location,population
order by
	1;

-- 2nd way
select location,
	population,
	max(total_cases) as highest_infection_count,
	(max(total_cases)/population)*100 as highest_ratio
from 
	portfolio_1..coviddeaths
where 
	date between '2022-01-01' and '2022-03-18'  --arbitary value
group by
	location,population  
order by
	1;


-- eg12
select location,
	population,
	max(total_cases) as highest_infection_count,
	max((total_cases/population))*100 as max_percentage
from 
	portfolio_1..coviddeaths
group by
	location,population
order by
	1;

-- eg13 #particular country
select location,
	population,
	max(total_cases) as highest_infection_count,
	max((total_cases/population))*100 as max_percentage
from 
	portfolio_1..coviddeaths
where
	location like '%states%'  
group by
	location,population
order by
	1;


--select * from portfolio_1..coviddeaths;

-- eg14 
select location,
	population,
	max(total_cases) as highest_infection_count,
	max((total_cases/population))*100 as max_percentage
from 
	portfolio_1..coviddeaths
where
	 location like '%states%'  or continent='asia'
group by
	location,population
order by
	1;


-- eg15 
select location,
	population,
	max(total_cases) as highest_infection_count,
	max((total_cases/population))*100 as max_percentage
from 
	portfolio_1..coviddeaths
where
	not (location like '%states%'  or continent='asia')
group by
	location,population
order by
	1;




-- eg16 
select location,
	population,
	max(total_cases) as highest_infection_count,
	max((total_cases/population))*100 as max_percentage
from 
	portfolio_1..coviddeaths
where
	 (location like '%states%'  or continent='asia') and population >=141856697
group by
	location,population
order by
	1;

select * from portfolio_1..coviddeaths;

--- looking at countries with highest death rate compared  to population 

-- eg17
select * 
from
	portfolio_1..coviddeaths
where continent is not null 
order by 3,4;

--eg 18
-- since total_deaths is nvarchar  ,we need to convert it into integer  


select location,
	population,
	max(cast(total_deaths as int)) as highest_deaths_count
from 
	portfolio_1..coviddeaths
group by
	location,population
order by
	highest_deaths_count;

--eg 19

select location,
	population,
	max(cast(total_deaths as int)) as highest_deaths_count
from 
	portfolio_1..coviddeaths
where
	continent is not null 
group by
	location,population
order by
	highest_deaths_count;


-- eg20
select location,
	population,
	max(cast(total_deaths as int)) as highest_deaths_count,
	max(cast(total_deaths as int)/population)*100 as highest_death_count
from 
	portfolio_1..coviddeaths
where
	continent is not null 
group by
	location,population
order by
	highest_deaths_count;

-- eg21

select continent,
	max(cast(total_deaths as int)) as highest_deaths_count
from 
	portfolio_1..coviddeaths
where
	continent is not null 
group by
	continent
order by
	highest_deaths_count desc;

-- eg22

select location,
	max(cast(total_deaths as int)) as highest_deaths_count
from 
	portfolio_1..coviddeaths
where
	continent is  null 
group by
	location
order by
	highest_deaths_count desc;

-- showing continents with  the highest death count per population 

-- eg 23
select continent,
	max(cast(total_deaths as int)) as highest_deaths_count
from 
	portfolio_1..coviddeaths
where
	continent is not null 
group by
	continent
order by
	highest_deaths_count desc;


-- eg24 

select date,	
	sum(new_cases)
	--total_deaths,
	--(total_deaths/total_cases)*100 as death_to_cases_percen
from 
	portfolio_1..coviddeaths
where 
	continent is not null
group by 
	date
order by
	1,2;


-- eg25 

select date,	
	sum(new_cases) as new_cases,
	sum(cast(new_deaths as int)) as new_deaths
from 
	portfolio_1..coviddeaths
where 
	continent is not null
group by 
	date
order by
	1,2;

-- eg26

select date,	
	sum(new_cases) as total_cases_new,
	sum(cast(new_deaths as int)) as total_deaths_cases,
	sum(cast(new_deaths as int))/sum(new_cases)*100  as death_ratio_percen
from 
	portfolio_1..coviddeaths
where 
	continent is not null
group by 
	date
order by
	1,2;

-- eg27

select *
from 
	portfolio_1..covidvaccination;

--- joining both tables 


select *
from 
	portfolio_1..coviddeaths as d
	join 
	portfolio_1..covidvaccination as v 
		on  d.location =v.location
		and d.date =v.date;

--- eg28

--looking at populations vs vaccination

select d.continent,
	d.location,
	d.date,
	d.population,
	v.new_vaccinations
from 
	portfolio_1..coviddeaths as d
	join 
	portfolio_1..covidvaccination as v 
		on  d.location =v.location
		and d.date =v.date
where 
	d.continent is not null
order by
	2,3;
	


--- using WINDOW FUNCTION AND TEMPORARY TABLE

-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopulationVaccinated
-- eg29


Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)


-- inserting values
Insert into #PercentPopulationVaccinated
select d.continent,
	d.location,
	d.date,
	d.population,
	v.new_vaccinations,
	SUM(CONVERT(bigint,v.new_vaccinations)) OVER (Partition by d.Location) as RollingPeopleVaccinated
from 
	portfolio_1..coviddeaths as d
	join 
	portfolio_1..covidvaccination as v 
		on  d.location =v.location
		and d.date =v.date
where 
	d.continent is not null
order by
	2,3;

select * from #PercentPopulationVaccinated;

-- eg30
-- creating table

Create Table #PercentPopulationVaccinated_2
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)


Insert into #PercentPopulationVaccinated_2
select d.continent,
	d.location,
	d.date,
	d.population,
	v.new_vaccinations,
	SUM(CONVERT(bigint,v.new_vaccinations)) OVER (Partition by d.Location order by d.location, d.Date) as RollingPeopleVaccinated
from 
	portfolio_1..coviddeaths as d
	join 
	portfolio_1..covidvaccination as v 
		on  d.location =v.location
		and d.date =v.date
where 
	d.continent is not null
order by
	2,3;

select * from #PercentPopulationVaccinated_2;

-- eg31

-- over function


select d.continent,
	d.location,
	d.date,
	d.population,
	v.new_vaccinations,
	SUM(CONVERT(bigint,v.new_vaccinations)) OVER (partition by d.continent) as RollingPeopleVaccinated
from 
	portfolio_1..coviddeaths as d
	join 
	portfolio_1..covidvaccination as v 
		on  d.location =v.location
		and d.date =v.date
where 
	d.continent is not null
order by
	2,3;
	

-- eg32

select * from portfolio_1..coviddeaths;

select continent,
	location,
	sum(total_cases) over () as total_cases1,
	sum(total_cases) over (partition by location) as total_cases2
from 
	portfolio_1..coviddeaths
where 
	continent is not null
order by 
	1;

select sum(total_cases) from portfolio_1..coviddeaths;

-- eg33
-- over function on total_deaths

select continent,
	location,
	sum(total_cases) over () as total_cases,
	sum(total_cases) over (partition by location) as total_cases_by_location,
	sum(convert(bigint,total_deaths)) over (partition by location) as total_deaths_by_location
from 
	portfolio_1..coviddeaths
where 
	continent is not null
order by 
	1;

-- eg34

select continent,
	location,
	sum(population) over() as total_population,
	sum(total_cases) over () as total_cases,

	sum(population) over(partition by location) as total_population_by_location,
	sum(total_cases) over (partition by location) as total_cases_by_location,
	sum(convert(bigint,total_deaths)) over (partition by location) as total_deaths_by_location

from 
	portfolio_1..coviddeaths
where 
	continent is not null
order by 
	1;



-- eg35


select location,
	total_deaths,

	row_number() over(order by total_deaths) as 'row_number' ,
	rank() over(order by total_deaths) as 'rank'
	
from 
	portfolio_1..coviddeaths
where 
	continent is not null ;


-- eg36

select location,
	total_deaths,

	row_number() over(order by total_deaths) as 'row_number' ,
	rank() over(order by total_deaths) as 'rank',
	dense_rank() over(order by total_deaths) as 'dense_rank'
from 
	portfolio_1..coviddeaths
where 
	continent is not null ;

-- eg37

select continent,
	location,
	total_deaths,

	rank() over(order by total_deaths) as 'rank',
	dense_rank() over(order by total_deaths) as 'dense_rank'

from 
	portfolio_1..coviddeaths
where 
	continent is not null;


-- eg38



select continent,
	location,
	total_cases,

	rank() over(order by total_cases ) as 'rank',
	dense_rank() over(order by total_cases) as 'dense_rank'

from 
	portfolio_1..coviddeaths
where 
	continent is not null;

-- eg39

select continent,
	location,
	sum(convert(bigint ,total_deaths))/sum(total_cases)*100 as death_ratio_by_total_cases,


	rank() over(order by sum(convert(bigint ,total_deaths))/sum(total_cases)*100) as 'rank',
	dense_rank() over(order by  sum(convert(bigint ,total_deaths))/sum(total_cases)*100) as 'dense_rank'

from 
	portfolio_1..coviddeaths
where 
	continent is not null
group by
	continent,
	location;


-- eg40

select continent,
	location,

	sum(convert(bigint ,people_fully_vaccinated)) over () as total_vaccinated ,
	sum(convert(bigint ,people_fully_vaccinated)) over (partition by location) as fully_vaccinated_by_location

from portfolio_1..covidvaccination;


-- eg41

select d.continent,
	d.location,
	
	sum(convert(bigint ,v.people_fully_vaccinated))/sum(d.population) as vaccination_ratio,

	rank() over ( order by sum(convert(bigint ,v.people_fully_vaccinated))/sum(d.population)) as 'rank',
	dense_rank() over (order by sum(convert(bigint ,v.people_fully_vaccinated))/sum(d.population)) as 'dense_rank'
from
	portfolio_1..coviddeaths as d
	join 
	portfolio_1..covidvaccination as v 
		on  d.location =v.location
		and d.date =v.date
where 
	d.continent is not null
group by
	d.continent,
	d.location;


---Stored Procedure

-- eg41

Create  procedure coviddeaths
As
begin
select * 
from
	portfolio_1..coviddeaths
end

EXEC coviddeaths;

-- eg42

Create  procedure covidvaccination
As
begin
select * 
from
	portfolio_1..covidvaccination
end

EXEC covidvaccination;

-- eg43

Create  procedure death_total_cases_ratio
As
begin
select location,
	date,
	total_cases,
	total_deaths,
	(total_deaths/total_cases)*100 as death_to_cases_percen
from portfolio_1..coviddeaths
order by
	1,2;
end

EXEC death_total_cases_ratio;


--eg44
 -- stored_procedure with input parameter

Create  procedure death_total_cases_ratio_particular_country
@n varchar(20)
As
begin
select location,
	date,
	total_cases,
	total_deaths,
	(total_deaths/total_cases)*100 as death_to_cases_percen
from 
	portfolio_1..coviddeaths
where 
	location =@n
	
order by
	1,2
end

EXEC death_total_cases_ratio_particular_country india

--eg45
 -- stored_procedure with input parameter

 Create  procedure vaccination_details_partition_continent_location
@loc varchar(20)

As
begin

 select d.continent,
	d.location,
	d.date,

	d.population,
	v.new_vaccinations,
	SUM(CONVERT(bigint,v.new_vaccinations)) OVER (partition by d.continent) as RollingPeopleVaccinated

from 

	portfolio_1..coviddeaths as d
	join 
	portfolio_1..covidvaccination as v 
		on  d.location =v.location
		and d.date =v.date
where 
	d.continent is not null
	and d.location =@loc
order by
	2,3

end


 EXEC vaccination_details_partition_continent_location india


 --eg46
 -- stored_procedure with input parameter


 Create  procedure vaccination_rank_population
@con varchar(20),
@loc varchar(20)

As
begin
 
	select d.continent,
	d.location,
	
	sum(convert(bigint ,v.people_fully_vaccinated))/sum(d.population) as vaccination_ratio,

	rank() over ( order by sum(convert(bigint ,v.people_fully_vaccinated))/sum(d.population)) as 'rank',
	dense_rank() over (order by sum(convert(bigint ,v.people_fully_vaccinated))/sum(d.population)) as 'dense_rank'
from
	portfolio_1..coviddeaths as d
	join 
	portfolio_1..covidvaccination as v 
		on  d.location =v.location
		and d.date =v.date
where 
	d.continent =@con
	or
	d.location=@loc
group by
	d.continent,
	d.location;

end


 EXEC vaccination_rank_population 'europe','sweden';


 --eg47
 -- stored_procedure with output parameter

Create  procedure sum_total_deaths 
@sum bigint output 
As
begin

select @sum = sum(convert(bigint,total_deaths)) from portfolio_1..coviddeaths;

end

--to call output parameter

declare @total_deaths bigint
execute  sum_total_deaths @total_deaths out
print @total_deaths


-- eg48
 -- stored_procedure with output parameter

Create  procedure ratio_deaths_cases_total
@ratio decimal(10,8) output 
As
begin

select @ratio = sum(convert(bigint,total_deaths))/sum(total_cases) from portfolio_1..coviddeaths;

end

--to call output parameter

declare @r decimal(10,8)
execute  ratio_deaths_cases_total @r out
print @r


--eg49
 -- stored_procedure with input and output parameter

 Create  procedure max_cases_population
@n  varchar(15) ,
@r  decimal(10,8) output 

As
begin

select @r = max((total_cases/population))*100  
from  
	portfolio_1..coviddeaths
where 
	continent =@n

end


declare @r decimal(10,2)
execute  max_cases_population   'asia',@r out
print  @r 

-- eg50

-- if we dont mention out keyword it will give as null 

declare @r decimal(10,2)
execute  max_cases_population   'asia',@r

if(@r is null)
	print '@r is null'
else
	print '@r is not null'


print @r

-- eg51
sp_help max_cases_population  -- to retrieve information about stored procedure  

sp_helptext max_cases_population -- to view the text of stored procedure

sp_depends max_cases_population --  view the dependices of stored procedure


-- eg52


 -- stored_procedure with return keyword

Create  procedure total_data
As
begin
return  (select count(*) from portfolio_1..covidvaccination)
end

declare @total int
execute  @total = total_data  
print @total

-- note= return keyword returns only an integer status variable and only one value



-- eg53 

-- Functions

create function vaccination_detail(@loc varchar(20))
returns table
as 
return 
(select *
from 
	portfolio_1..covidvaccination
where 
	location=@loc)

-- calling  the function

select * from vaccination_detail('india');




-- eg54

--temporary table and CASE STATEMENT

select location,
	sum(total_cases),
	sum(convert(bigint ,total_deaths)),
	(sum(convert(bigint ,total_deaths))/sum(total_cases))*100 as death_to_cases_percen
from 
	portfolio_1..coviddeaths
group by	
	location
order by
	1,2; 
	

-- temporary table

Create Table #death_ratio_cases
(
Location nvarchar(255),
total_cases bigint,
total_deaths bigint,
ratio_death_cases decimal(10,3)
)

insert into #death_ratio_cases
select location,
	sum(total_cases),
	sum(convert(bigint ,total_deaths)),
	(sum(convert(bigint ,total_deaths))/sum(total_cases))*100 as death_to_cases_percen
from 
	portfolio_1..coviddeaths
group by	
	location
order by
	1,2; 
	
select * from #death_ratio_cases

-- function
select location,
	ratio_death_cases,

case 
 when ratio_death_cases  between 0 and 2 then
	 'A'

when  ratio_death_cases between 2 and 3 then
	 'B'

when  ratio_death_cases between 3 and 4 then
	 'C'

when  ratio_death_cases between 3 and 4 then
	 'D'

when  ratio_death_cases > 4 then
	 'E'

else 'NA'
end 
as covid_death_stage

from 
	#death_ratio_cases




