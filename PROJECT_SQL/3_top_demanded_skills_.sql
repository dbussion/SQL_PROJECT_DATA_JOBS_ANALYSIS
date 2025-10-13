/*
Question: What are the most in-demand skills for data jobs in Spain 2023?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for data jobs
- Focus on all data job postings
- Why? Retrieves the top 10 skills with the highest demand in the data job market,
providing insights into the skills that are most sought after by employers.
*/

SELECT
    skills,
    COUNT(skills_job_dim.skill_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim USING (job_id)
INNER JOIN skills_dim USING (skill_id)
WHERE 
    job_title ILIKE '%data%' AND
    job_country = 'Spain'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 10;

/*
"skills","demand_count"
"python","11196"
"sql","10252"
"aws","4767"
"azure","4334"
"spark","4190"
"r","3204"
"power bi","2705"
"tableau","2552"
"scala","2362"
"excel","2076"
*/
-- Query ran on: 08-OCT-2025