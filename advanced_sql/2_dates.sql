SELECT '2025-05-21'::DATE,
        '123'::INTEGER,
        'true'::BOOLEAN,
        '3.14'::REAl;


SELECT 
    job_title_short,
    job_location,
    job_posted_date::DATE as posted_date
FROM job_postings_fact;

SELECT 
    job_title_short,
    job_location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'
FROM job_postings_fact;

SELECT 
    job_title_short,
    job_location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST',
    EXTRACT(MONTH FROM job_postings_fact.job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_postings_fact.job_posted_date) AS date_year
FROM job_postings_fact
LIMIT 10;

SELECT 
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    COUNT(job_id) AS number_of_jobs
FROM job_postings_fact
WHERE job_title_short = 'Data Scientist'
GROUP BY 
    date_month
ORDER BY 
    number_of_jobs DESC;

CREATE TABLE AS january_jobs AS 
    select * FROM job_postings_fact WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE AS february_jobs AS 
    SELECT * FROM job_postings_fact WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE AS march_jobs AS 
    SELECT * FROM job_postings_fact WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

