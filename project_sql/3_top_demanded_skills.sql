/*
QUESTION : What are the most in-demand skills for data analysts ?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst
- Focus on all job postings
- Why ? Retrieves the top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job seekers
*/

SELECT
    skills,
    COUNT(skills_to_jobs.job_id) as mentions
FROM job_postings_fact
INNER JOIN skills_job_dim AS skills_to_jobs ON job_postings_fact.job_id = skills_to_jobs.job_id
INNER JOIN skills_dim AS skills ON skills_to_jobs.skill_id = skills.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'New York, NY'
GROUP BY
    skills
ORDER BY
    mentions DESC
LIMIT 5;