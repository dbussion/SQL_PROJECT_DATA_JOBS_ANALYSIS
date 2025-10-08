/*
Question: What are the top-paying data jobs in Spain in 2023?
- Identify the top 10 highest-paying Data job postings.
- Focus on jobs postings with specified salaries (removing nulls).
- Why? Highlight the top-paying opportunities in the Data field in Spain.
*/

SELECT
    job_id,
    job_title,
    name AS company_name,
    job_location,
    job_country,
    job_schedule_type,
    salary_year_avg
FROM
    job_postings_fact
LEFT JOIN
    company_dim USING (company_id)
WHERE
    job_title ILIKE '%data%' AND
    job_country = 'Spain' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;



