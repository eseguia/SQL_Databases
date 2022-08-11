Select *
From CovidDeaths
Where continent is not null 
order by 3,4

-- Altering dtypes for columns in CovidDeaths Table
ALTER TABLE CovidDeaths
ALTER COLUMN date datetime;

ALTER TABLE CovidDeaths
ALTER COLUMN total_cases float;

ALTER TABLE CovidDeaths
ALTER COLUMN total_deaths float;

ALTER TABLE CovidDeaths
ALTER COLUMN population float;

ALTER TABLE CovidDeaths
ALTER COLUMN new_deaths float;

ALTER TABLE CovidDeaths
ALTER COLUMN new_cases float;



-- Select Data that we are going to be starting with

Select Location, date, total_cases, new_cases, total_deaths, population
From CovidDeaths
Where continent is not null 
order by 1,2


-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

Select location, date, total_cases,total_deaths, 
(total_deaths/total_cases)*100 AS 'DeathPercentage'
From CovidDeaths
Where continent is not null AND total_cases <> 0
order by 1,2


-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

Select location, date, population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
From CovidDeaths
Where population <> 0 -- and location like '%argentina%'
order by 1,2


-- Countries with Highest Infection Rate compared to Population

Select location, population, MAX(total_cases) as HighestInfectionCount,  Max(total_cases/population)*100 as PercentPopulationInfected
From CovidDeaths
WHERE population <> 0 
Group by location, population
order by PercentPopulationInfected desc


-- Countries with Highest Death Count per Population

Select Location, MAX(Total_deaths) as TotalDeathCount
From CovidDeaths
Where continent is not null 
Group by Location
order by TotalDeathCount desc


-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population

Select continent, MAX(Total_deaths) as TotalDeathCount
From CovidDeaths
Where continent is not null 
Group by continent
order by TotalDeathCount desc



-- GLOBAL NUMBERS and also for each country

Select location, MAX(population) as total_population, SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
From CovidDeaths
where continent is not null and new_cases <>0 -- avoiding dividing by 0 when there are no new cases
Group By location
order by 1,2

-----------------------------------

-- Altering dtypes for columns in CovidVaccinations Table
ALTER TABLE CovidVaccinations
ALTER COLUMN date datetime;

ALTER TABLE CovidVaccinations
ALTER COLUMN population float;

ALTER TABLE CovidVaccinations
ALTER COLUMN new_tests float;

ALTER TABLE CovidVaccinations
ALTER COLUMN new_vaccinations float;

ALTER TABLE CovidVaccinations
ALTER COLUMN total_tests float;

ALTER TABLE CovidVaccinations
ALTER COLUMN total_vaccinations float;

-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as PeopleVaccinated
From CovidDeaths dea
Join CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3

-- Using CTE to perform Calculation on Partition By in previous query

With PopulationVsVaccinations (Continent, Location, Date, population, New_Vaccinations, PeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as PeopleVaccinated
From CovidDeaths dea
Join CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null and dea.population <> 0
)
Select *, (PeopleVaccinated/population)*100 as Percentage_Vaccinated
From PopulationVsVaccinations


-- Creating View to store data
Create View PercentPopulationVaccinated as 
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as PeopleVaccinated
--, (PeopleVaccinated/population)*100
From CovidDeaths dea
Join CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 


-- Using Temp Table to perform Calculation on Partition By in previous query

--DROP Table if exists #PercentPopulationVaccinated
--Create Table #PercentPopulationVaccinated
--(
--Continent nvarchar(255),
--Location nvarchar(255),
--Date datetime,
--Population numeric,
--New_vaccinations numeric,
--PeopleVaccinated numeric
--)

--Insert into #PercentPopulationVaccinated
--Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
--, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as PeopleVaccinated
----, (PeopleVaccinated/population)*100
--From CovidDeaths dea
--Join CovidVaccinations vac
--	On dea.location = vac.location
--	and dea.date = vac.date 
--	and dea.population <> 0
----where dea.continent is not null 
----order by 2,3

--Select *, (PeopleVaccinated/Population)*100
--From #PercentPopulationVaccinated

