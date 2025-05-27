/*
Question: What are the most in-demannd skills for data Engineer?
- join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for data engineer.
- focus on all job postings.
- Why? Retrieves the top 5 skills with the highestt demand in the job market,
    providing insights into the valuable skills for jobb seekers.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON  job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Engineer' AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
