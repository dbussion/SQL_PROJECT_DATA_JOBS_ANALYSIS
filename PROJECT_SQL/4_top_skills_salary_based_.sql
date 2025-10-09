/*Question: What are the 25 top skills based on salary in Spain?
- Look at the average salary associated with each skill for data jobs
- Focuses on roles with specified salaries
- Why? It reveals how different skills impact salary levels for data job professionals, 
helping identify high-value skills in the data job market
*/


SELECT
    skills,
    ROUND(AVG(salary_year_avg)) AS average_salary,
    COUNT(skills) AS skill_count
FROM job_postings_fact
INNER JOIN skills_job_dim USING (job_id)
INNER JOIN skills_dim USING (skill_id)
WHERE 
    job_title ILIKE '%data%' AND
    job_country = 'Spain' AND
    salary_year_avg IS NOT NULL
GROUP BY skills
HAVING COUNT(skills) > 4
ORDER BY average_salary DESC
LIMIT 25;

/* In Spain’s 2023 data job market, the highest salaries are concentrated
among professionals skilled in cloud and big data technologies such as
PySpark, Azure, Snowflake, and Databricks, reflecting a premium on 
scalable, data-engineering expertise. While Python and SQL remain 
foundational and widely required, they offer moderate pay due to their
ubiquity. Tools for data orchestration (Airflow, Kafka) and BI platforms
(Power BI, Tableau, Looker) continue to hold solid value but trail 
cloud-native and big data skills in compensation. Overall, employers 
reward hybrid profiles that integrate advanced data engineering, analytics,
and cloud infrastructure capabilities—skills critical for managing modern,
large-scale data ecosystems.*/
