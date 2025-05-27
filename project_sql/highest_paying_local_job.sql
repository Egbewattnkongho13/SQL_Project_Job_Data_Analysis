/*
Identifying jobs in my local area cameroon that are available. */

WITH top_paying_local_job AS(
SELECT
    DISTINCT job_location,
    job_id,
    job_title_short,
    company_id
FROM job_postings_fact
WHERE job_location LIKE '%Cameroon'
)
SELECT 
    top_paying_local_job.company_id,
    top_paying_local_job.job_id,
    company_dim.name AS company_name,
    top_paying_local_job.job_location,
    top_paying_local_job.job_title_short,
    company_dim.link_google AS company_link
FROM company_dim
INNER JOIN top_paying_local_job
ON
    company_dim.company_id = top_paying_local_job.company_id;
