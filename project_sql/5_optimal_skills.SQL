/*
QUESTION : What are the most optimal skills to learn (AKA it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates positions in New York City with specified salaries
- Why ? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career developments in data analysis
*/

SELECT
    skills,
    COUNT(job_postings_fact.job_id) AS mentions,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim AS skills_to_jobs ON job_postings_fact.job_id = skills_to_jobs.job_id
INNER JOIN skills_dim AS skills ON skills_to_jobs.skill_id = skills.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_location = 'New York, NY'
GROUP BY
    skills
HAVING
    COUNT(job_postings_fact.job_id) > 10
ORDER BY
    mentions DESC,
    average_salary DESC;