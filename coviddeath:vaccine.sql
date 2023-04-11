use portfolio_new;

-- Total Cases vs Total Deaths
-- Shows likelihood of dying in Iran

Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from coviddeaths_1
Where location like '%Iran%'
and continent is not null 
order by 1,2;

-- Total Cases vs Population
-- Shows what percentage of population of Iran infected with Covid

Select Location, date, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
from coviddeaths_1
Where location like '%Iran%'
order by 1,2;

-- Countries with Highest Infection Rate compared to Population
Select Location,max(total_cases) as HighestInfectionCount,  max((total_cases/population))*100 as PercentPopulationInfected
from coviddeaths_1
group by location, population
order by PercentPopulationInfected desc;

-- Countries with Highest Death Count per Population
Select Location, MAX(Total_deaths) as TotalDeathCount
From coviddeaths_1
Where continent is not null 
Group by location
order by TotalDeathCount desc;

-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population

Select Location, MAX(Total_deaths) as TotalDeathCount
From coviddeaths_1
Where continent is not null 
Group by continent
order by TotalDeathCount desc;

-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(New_Cases)*100 as DeathPercentage
From coviddeaths_1
-- Where location like '%states%'
where continent is not null 
-- Group By date
order by 1,2;

-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine
 select *
 from coviddeaths_1  dea
 join covidvaccinations_1 vac
 on dea.location = vac.location and dea.date = vac.date;
 

