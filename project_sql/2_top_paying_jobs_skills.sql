/*
QUESTION : What skills are required for the top-paying data analyst jobs ?
- Use tbe top 10 highest-paying Data Analyst jobs from the first query
- Add the specific skills required for these roles
- Why ? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        name AS company_name,
        job_title,
        salary_year_avg,
        job_location,
        job_posted_date,
        job_schedule_type
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
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim AS skills_to_jobs
    ON top_paying_jobs.job_id = skills_to_jobs.job_id
INNER JOIN skills_dim AS skills
    ON skills_to_jobs.skill_id = skills.skill_id
ORDER BY
    salary_year_avg DESC