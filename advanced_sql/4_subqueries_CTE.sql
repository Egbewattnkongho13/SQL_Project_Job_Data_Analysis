-- Subqueries
SELECT 
    *
FROM (SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;


SELECT 
    company_id,
    name as company_name
FROM  
    company_dim
WHERE company_id IN(
    SELECT 
            company_id
        FROM job_postings_fact
        WHERE job_no_degree_mention = 'TRUE');


-- CTE-Common Table Expression

with company_job_count AS(
    SELECT company_id, COUNT(job_id) AS total_jobs
    FROM 
        job_postings_fact 
    GROUP BY 
        company_id 
)
SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim 
LEFT JOIN company_job_count 
ON 
    company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC;


-- Exercise_One
/* - Identify the top five skills 
that are most frequently mentioned in job postings.*/

WITH top_five_skills AS (
    SELECT 
        skill_id, 
        COUNT(*) as skill_count
    FROM skills_job_dim
    GROUP BY
        skill_id
)
SELECT 
    skills_dim.skill_id,
    skills_dim.skills, 
    top_five_skills.skill_count
FROM skills_dim
LEFT JOIN top_five_skills
ON
    top_five_skills.skill_id = skills_dim.skill_id ;


-- Exercise_Two
/* - Determine the size category(Small, Medium, Large) of each company by their job postings
   - Large companies are from 50 job postings and above
   - medium companies are between 10 and 50 job postings
   - Small companies are below 10 job postings*/


WITH size_category AS (
    SELECT 
        company_id,
        COUNT(job_id) AS job_count
    FROM job_postings_fact 
    GROUP BY company_id
    
)
SELECT 
    company_dim.name AS company_name,
    size_category.job_count,
    CASE
        WHEN job_count <= 10 THEN 'Small'
        WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS category_of_company
FROM company_dim
LEFT JOIN size_category
ON 
    size_category.company_id = company_dim.company_id
ORDER BY
    job_count DESC;


-- Exercise_Three

/* -The count of the number of remote job postings per skill*/

WITH remote_job_skills AS (
SELECT 
    skill_id,
    COUNT(*) AS skill_count
FROM skills_job_dim
INNER JOIN job_postings_fact
ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE job_postings_fact.job_work_from_home = True AND
job_postings_fact.job_title_short = 'Data Engineer'
GROUP BY skill_id
)
SELECT 
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    remote_job_skills.skill_count
FROM skills_dim
INNER JOIN remote_job_skills
ON remote_job_skills.skill_id = skills_dim.skill_id
ORDER BY  remote_job_skills.skill_count DESC
LIMIT 5;