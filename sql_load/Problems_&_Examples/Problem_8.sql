/*
Find job postings from the first quarter of 2023 that have a salary greater than $70K.
- Combine job posting tables frome the first quarter of 2023 (January, February, March).
- Get job postings wiht an average yearly salary > $70K.
*/

WITH q1_job_postings AS (
    SELECT
        job_title_short,
        job_location,
        job_country,
        salary_year_avg 
    FROM 
        january_jobs
    UNION ALL
    SELECT
        job_title_short,
        job_location,
        job_country,
        salary_year_avg 
    FROM 
    february_jobs
    UNION ALL
    SELECT
        job_title_short,
        job_location,
        job_country,
        salary_year_avg 
    FROM march_jobs
)
SELECT *
FROM q1_job_postings
WHERE salary_year_avg > 70000
ORDER BY salary_year_avg DESC;
