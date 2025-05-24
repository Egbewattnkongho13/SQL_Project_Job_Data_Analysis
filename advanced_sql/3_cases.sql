SELECT
    COUNT(job_id),
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'Buea, Cameroon' THEN 'local'
        ELSE 'Onsite'
    END AS location_catergory
FROM job_postings_fact
GROUP BY 
    location_catergory;

