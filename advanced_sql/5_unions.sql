-- UNION
SELECT job_title_short, company_id, job_location FROM january_jobs

UNION 

SELECT job_title_short, company_id, job_location FROM february_jobs

UNION

SELECT job_title_short, company_id, job_location FROM march_jobs;

-- UNION ALL
SELECT job_title_short, company_id, job_location FROM january_jobs

UNION ALL

SELECT job_title_short, company_id, job_location FROM february_jobs

UNION ALL

SELECT job_title_short, company_id, job_location FROM march_jobs;




SELECT    quarter1_job_postings.job_title_short,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_via,
    quarter1_job_postings.job_posted_date::DATE,
    quarter1_job_postings.salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT * 
    FROM february_jobs
    UNION ALL
    SELECT * 
    FROM march_jobs
) AS quarter1_job_postings
WHERE quarter1_job_postings.salary_year_avg > 70000 AND quarter1_job_postings.job_title_short = 'Data Engineer'
ORDER BY quarter1_job_postings.salary_year_avg DESC;