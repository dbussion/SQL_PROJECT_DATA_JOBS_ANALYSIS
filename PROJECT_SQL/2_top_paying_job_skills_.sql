/*
Question: What skills are most in demand for high-paying data jobs in Spain?
- Use the top 10 highest paying data jobs in Spain.
- Add the specific skills required for these jobs.
- Why? It provides insights into the skills that can lead to better compensation in the data job market in Spain.
*/

WITH top_paying_data_jobs AS (
    SELECT
        job_id,
        job_title,
        name AS company_name,
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
    LIMIT 10
)

SELECT 
    top_paying_data_jobs.*,
    skills
FROM top_paying_data_jobs
INNER JOIN skills_job_dim USING (job_id)
INNER JOIN skills_dim USING (skill_id);

/*In Spain’s 2023 top-paying data roles, **Python**, **SQL**, and **cloud expertise** (notably **AWS** and **Azure**) emerged as the foundational skill set, reflecting strong demand for professionals who can manage end-to-end data workflows. 
**Machine learning frameworks** such as **PyTorch**, **TensorFlow**, and **Scikit-learn** signal high-value roles in AI development, while **Spark**, **Databricks**, and **PySpark** highlight the importance of big data engineering. 
**BI tools** like **Power BI**, **Tableau**, and **Qlik**, alongside **visualization libraries** such as **Plotly** and **Matplotlib**, underscore the premium placed on analytical storytelling and decision support. 
Overall, the data reveal that Spain’s best-paid data professionals combine **programming and analytics proficiency** with **cloud, machine learning, and visualization** capabilities—reflecting a market that rewards multidisciplinary expertise.
This skill combination not only meets the technical demands of modern data roles but also aligns with strategic business needs, positioning these professionals for top-tier compensation.

[
  {
    "job_id": 316669,
    "job_title": "Senior Data & AI Engineer",
    "company_name": "Capgemini",
    "salary_year_avg": "176500.0",
    "skills": "python"
  },
  {
    "job_id": 316669,
    "job_title": "Senior Data & AI Engineer",
    "company_name": "Capgemini",
    "salary_year_avg": "176500.0",
    "skills": "azure"
  },
  {
    "job_id": 316669,
    "job_title": "Senior Data & AI Engineer",
    "company_name": "Capgemini",
    "salary_year_avg": "176500.0",
    "skills": "aws"
  },
  {
    "job_id": 316669,
    "job_title": "Senior Data & AI Engineer",
    "company_name": "Capgemini",
    "salary_year_avg": "176500.0",
    "skills": "pandas"
  },
  {
    "job_id": 316669,
    "job_title": "Senior Data & AI Engineer",
    "company_name": "Capgemini",
    "salary_year_avg": "176500.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 316669,
    "job_title": "Senior Data & AI Engineer",
    "company_name": "Capgemini",
    "salary_year_avg": "176500.0",
    "skills": "keras"
  },
  {
    "job_id": 316669,
    "job_title": "Senior Data & AI Engineer",
    "company_name": "Capgemini",
    "salary_year_avg": "176500.0",
    "skills": "pytorch"
  },
  {
    "job_id": 147980,
    "job_title": "Sr Data Scientist - Partner Profitability Analytics",
    "company_name": "Expedia Group",
    "salary_year_avg": "170575.0",
    "skills": "sql"
  },
  {
    "job_id": 147980,
    "job_title": "Sr Data Scientist - Partner Profitability Analytics",
    "company_name": "Expedia Group",
    "salary_year_avg": "170575.0",
    "skills": "python"
  },
  {
    "job_id": 147980,
    "job_title": "Sr Data Scientist - Partner Profitability Analytics",
    "company_name": "Expedia Group",
    "salary_year_avg": "170575.0",
    "skills": "r"
  },
  {
    "job_id": 147980,
    "job_title": "Sr Data Scientist - Partner Profitability Analytics",
    "company_name": "Expedia Group",
    "salary_year_avg": "170575.0",
    "skills": "matplotlib"
  },
  {
    "job_id": 147980,
    "job_title": "Sr Data Scientist - Partner Profitability Analytics",
    "company_name": "Expedia Group",
    "salary_year_avg": "170575.0",
    "skills": "plotly"
  },
  {
    "job_id": 1195938,
    "job_title": "Azure Data Architect",
    "company_name": "SGS",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "job_id": 1195938,
    "job_title": "Azure Data Architect",
    "company_name": "SGS",
    "salary_year_avg": "165000.0",
    "skills": "azure"
  },
  {
    "job_id": 1195938,
    "job_title": "Azure Data Architect",
    "company_name": "SGS",
    "salary_year_avg": "165000.0",
    "skills": "power bi"
  },
  {
    "job_id": 428488,
    "job_title": "Data Scientist",
    "company_name": "Amadeus",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 428488,
    "job_title": "Data Scientist",
    "company_name": "Amadeus",
    "salary_year_avg": "165000.0",
    "skills": "scala"
  },
  {
    "job_id": 428488,
    "job_title": "Data Scientist",
    "company_name": "Amadeus",
    "salary_year_avg": "165000.0",
    "skills": "azure"
  },
  {
    "job_id": 428488,
    "job_title": "Data Scientist",
    "company_name": "Amadeus",
    "salary_year_avg": "165000.0",
    "skills": "spark"
  },
  {
    "job_id": 428488,
    "job_title": "Data Scientist",
    "company_name": "Amadeus",
    "salary_year_avg": "165000.0",
    "skills": "tableau"
  },
  {
    "job_id": 428488,
    "job_title": "Data Scientist",
    "company_name": "Amadeus",
    "salary_year_avg": "165000.0",
    "skills": "qlik"
  },
  {
    "job_id": 374824,
    "job_title": "Senior Principal Data Scientist",
    "company_name": "NielsenIQ",
    "salary_year_avg": "157500.0",
    "skills": "sql"
  },
  {
    "job_id": 374824,
    "job_title": "Senior Principal Data Scientist",
    "company_name": "NielsenIQ",
    "salary_year_avg": "157500.0",
    "skills": "python"
  },
  {
    "job_id": 374824,
    "job_title": "Senior Principal Data Scientist",
    "company_name": "NielsenIQ",
    "salary_year_avg": "157500.0",
    "skills": "pyspark"
  },
  {
    "job_id": 1316010,
    "job_title": "Senior Data Scientist (f/m/d) Spain",
    "company_name": "SIGNA Sports United",
    "salary_year_avg": "157500.0",
    "skills": "sql"
  },
  {
    "job_id": 1316010,
    "job_title": "Senior Data Scientist (f/m/d) Spain",
    "company_name": "SIGNA Sports United",
    "salary_year_avg": "157500.0",
    "skills": "python"
  },
  {
    "job_id": 1316010,
    "job_title": "Senior Data Scientist (f/m/d) Spain",
    "company_name": "SIGNA Sports United",
    "salary_year_avg": "157500.0",
    "skills": "aws"
  },
  {
    "job_id": 845058,
    "job_title": "Senior Machine Learning Engineer + Data Scientist",
    "company_name": "Aetion",
    "salary_year_avg": "157500.0",
    "skills": "python"
  },
  {
    "job_id": 845058,
    "job_title": "Senior Machine Learning Engineer + Data Scientist",
    "company_name": "Aetion",
    "salary_year_avg": "157500.0",
    "skills": "r"
  },
  {
    "job_id": 845058,
    "job_title": "Senior Machine Learning Engineer + Data Scientist",
    "company_name": "Aetion",
    "salary_year_avg": "157500.0",
    "skills": "databricks"
  },
  {
    "job_id": 845058,
    "job_title": "Senior Machine Learning Engineer + Data Scientist",
    "company_name": "Aetion",
    "salary_year_avg": "157500.0",
    "skills": "aws"
  },
  {
    "job_id": 845058,
    "job_title": "Senior Machine Learning Engineer + Data Scientist",
    "company_name": "Aetion",
    "salary_year_avg": "157500.0",
    "skills": "spark"
  },
  {
    "job_id": 845058,
    "job_title": "Senior Machine Learning Engineer + Data Scientist",
    "company_name": "Aetion",
    "salary_year_avg": "157500.0",
    "skills": "pytorch"
  },
  {
    "job_id": 845058,
    "job_title": "Senior Machine Learning Engineer + Data Scientist",
    "company_name": "Aetion",
    "salary_year_avg": "157500.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 845058,
    "job_title": "Senior Machine Learning Engineer + Data Scientist",
    "company_name": "Aetion",
    "salary_year_avg": "157500.0",
    "skills": "git"
  },
  {
    "job_id": 845058,
    "job_title": "Senior Machine Learning Engineer + Data Scientist",
    "company_name": "Aetion",
    "salary_year_avg": "157500.0",
    "skills": "docker"
  },
  {
    "job_id": 306051,
    "job_title": "Data Engineer",
    "company_name": "Amadeus",
    "salary_year_avg": "156500.0",
    "skills": "sql"
  },
  {
    "job_id": 306051,
    "job_title": "Data Engineer",
    "company_name": "Amadeus",
    "salary_year_avg": "156500.0",
    "skills": "scala"
  },
  {
    "job_id": 306051,
    "job_title": "Data Engineer",
    "company_name": "Amadeus",
    "salary_year_avg": "156500.0",
    "skills": "azure"
  },
  {
    "job_id": 306051,
    "job_title": "Data Engineer",
    "company_name": "Amadeus",
    "salary_year_avg": "156500.0",
    "skills": "databricks"
  },
  {
    "job_id": 306051,
    "job_title": "Data Engineer",
    "company_name": "Amadeus",
    "salary_year_avg": "156500.0",
    "skills": "bigquery"
  },
  {
    "job_id": 306051,
    "job_title": "Data Engineer",
    "company_name": "Amadeus",
    "salary_year_avg": "156500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 306051,
    "job_title": "Data Engineer",
    "company_name": "Amadeus",
    "salary_year_avg": "156500.0",
    "skills": "spark"
  },
  {
    "job_id": 306051,
    "job_title": "Data Engineer",
    "company_name": "Amadeus",
    "salary_year_avg": "156500.0",
    "skills": "qlik"
  },
  {
    "job_id": 306051,
    "job_title": "Data Engineer",
    "company_name": "Amadeus",
    "salary_year_avg": "156500.0",
    "skills": "github"
  },
  {
    "job_id": 306051,
    "job_title": "Data Engineer",
    "company_name": "Amadeus",
    "salary_year_avg": "156500.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 306051,
    "job_title": "Data Engineer",
    "company_name": "Amadeus",
    "salary_year_avg": "156500.0",
    "skills": "jira"
  }
]
*/
