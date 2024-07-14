SELECT * FROM layoffs


--- etat en pourcentages des licencement
select max(percentage_laid_off ) ,min(percentage_laid_off )

from layoffs

---	les industries qui ont licencie tous les employes

select company, percentage_laid_off ,funds_raised_millions
	
from layoffs
	
where percentage_laid_off=1
-- etat financier des industries qui licencie de plus 
select company, percentage_laid_off ,funds_raised_millions
	
from layoffs
	
where percentage_laid_off=1 and funds_raised_millions is not null
	
order by funds_raised_millions desc

---par industrie
select company , sum(total_laid_off) as total_laid_off

from layoffs
	
where total_laid_off is not null
	
group by company

order by total_laid_off desc

---par emplacement 
select location , sum(total_laid_off) as total_laid_off

from layoffs
	
where total_laid_off is not null
	
group by location

order by total_laid_off desc

--par les dernier annees

SELECT EXTRACT(YEAR FROM TO_DATE(date, 'MM/DD/YYYY')) AS year, SUM(total_laid_off) as total_laid_off
	
FROM layoffs
	
WHERE TO_DATE(date, 'MM/DD/YYYY') IS NOT NULL
	
GROUP BY year
	
ORDER BY year ;

---par pays

select country , sum(total_laid_off) as total_laid_off

from layoffs
	
where total_laid_off is not null
	
group by country

order by total_laid_off desc


---par stage 
select stage , sum(total_laid_off) as total_laid_off

from layoffs
	
where total_laid_off is not null
	
group by stage

order by total_laid_off desc
