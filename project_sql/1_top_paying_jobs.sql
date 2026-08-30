/*
QUESTION : What are the top-paying data analyst jobs ?
- Identify the top ten highest-paying Data Analyst roles in New York City
- Focuses on job postings with specified salaries (removes nulls)
- Why ? Highlight the top-paying opportunities for Data Analysts, offering insights into employer preferences in NYC
*/

SELECT
    name AS company_name,
    job_title,
    salary_year_avg,
    job_location
FROM 
    job_postings_fact
LEFT JOIN company_dim AS companies
    ON job_postings_fact.company_id = companies.company_id
WHERE
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst' AND
    job_location = 'New York, NY'
ORDER BY
    salary_year_avg DESC
LIMIT 10;