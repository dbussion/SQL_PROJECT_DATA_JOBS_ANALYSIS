# INTRODUCTION
This project explores the landscape of data-related careers in Spain during 2023 through structured analysis using SQL. By querying and joining multiple related tables, the project identifies the highest-paying data jobs, the most lucrative technical skills, and the skills most in demand across the job market. It also examines the relationship between skill demand and compensation to reveal which competencies offer the strongest salary advantage. The repository demonstrates how SQL can be leveraged for labor market analytics and evidence-based career insights within the data industry.

SQL queries can be checked out here:[FOLDER](/PROJECT_SQL/)


# BACKGROUND
This project was inspired by Luke Barousse’s *SQL for Beginners* course ([lukebarousse.com/sql](https://lukebarousse.com/sql)), which provides an excellent foundation for learning SQL through practical, data-driven exercises. Building upon that framework, this analysis focuses on understanding the data job market in Spain for 2023. Specifically, it aims to answer four key questions:

1. What are the top-paying data jobs in Spain?
2. Which technical skills command the highest salaries?
3. What are the most in-demand skills among employers?
4. Which skills offer the greatest salary advantage relative to demand?

Through the use of SQL queries on interconnected datasets, this project applies the concepts from Barousse’s course to derive meaningful insights about trends and opportunities within the data profession.

# TOOLS USED
This project employs a set of essential tools for data analysis and version-controlled development. **SQL** (Structured Query Language) serves as the core analytical language, enabling efficient querying, filtering, and aggregation of relational data. **PostgreSQL** is used as the database management system, providing a robust, open-source platform for executing SQL commands and managing datasets. **Visual Studio Code (VSCode)** functions as the integrated development environment, offering extensions for database connectivity, syntax highlighting, and streamlined workflow management. Finally, **Git** and **GitHub** facilitate version control, collaboration, and public sharing of the project, ensuring transparency and reproducibility of the analytical process.

# ANALYSIS
The analysis section is structured around four central questions designed to uncover key insights about the data job market in Spain in 2023. Each question addresses a distinct aspect of employment and skill trends—ranging from salary distribution and job demand to the economic value of specific technical competencies—providing a comprehensive understanding of the factors shaping data-related careers.

### Question 1: Top-Paying Data Jobs in Spain (2023)
This analysis identifies the top 10 highest-paying data job postings in Spain during 2023. Only listings with specified salary information are included to ensure data accuracy and comparability.
Objective: To highlight the most lucrative roles within the data field, offering insight into which positions command the highest compensation in the Spanish job market.

```sql
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
```
![Top_Paying_Data_Jobs](assets\img1.png)
*Bar chart showing Top 10 paying data jobs in Spain 2023; ChatGPT generated graph from SQL query results*

#### Insights:
The results reveal that senior and architect-level roles dominate Spain’s top-paying data jobs in 2023. The highest salary is offered to the Senior Data & AI Engineer at Capgemini (€176,500/year), followed closely by a Senior Data Scientist position at Expedia Group (€170,575/year). Roles such as Azure Data Architect and Data Scientist at leading firms like SGS and Amadeus also feature prominently, with salaries around €165,000/year. Overall, the data indicate that advanced technical expertise and leadership responsibilities in AI, architecture, and data science are strongly associated with higher compensation in the Spanish data job market.

### Question 2: Most In-Demand Skills for High-Paying Data Jobs in Spain (2023)
This analysis examines the specific skills required for the top 10 highest-paying data jobs in Spain. By mapping the listed technical competencies associated with these roles, the goal is to identify which skills are most frequently sought after among the best-compensated positions.
Objective: To reveal the key technical skills that are most strongly associated with higher salaries in Spain’s data job market, offering guidance for professionals seeking to enhance their earning potential.

```sql
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
```
![Most in-demand skill for top-paying data jobs in Spain 2023](PROJECT_SQL\img2.png)
*Bar chart showing most in-demand skills for top paying data jobs in Spain 2023; ChatGPT generated graph from SQL query results*

#### Insights:
The results show that Python is by far the most in-demand skill among top-paying data roles in Spain, appearing in the majority of listings. SQL, AWS, and Azure also rank highly, reflecting the strong demand for cloud and database management expertise. Tools and frameworks such as Spark, PyTorch, and Power BI appear frequently, underscoring the value of both machine learning proficiency and data visualization capabilities. Overall, the findings suggest that a combination of programming (Python, SQL) and cloud/data infrastructure skills (AWS, Azure) is most likely to lead to higher-paying opportunities in the Spanish data job market.

### Question 3: Most In-Demand Skills for Data Jobs in Spain (2023)
This analysis examines the overall demand for technical skills across all data-related job postings in Spain during 2023. By joining the job postings and skills tables, it identifies the top 10 most frequently requested skills among employers.
Objective: To determine which competencies are most sought after in the Spanish data job market, offering insight into the core technical skills that drive employability across diverse data roles.

```sql
SELECT
    skills,
    COUNT(skills_job_dim.skill__id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim USING (job_id)
INNER JOIN skills_dim USING (skill_id)
WHERE 
    job_title ILIKE '%data%' AND
    job_country = 'Spain'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 10;
```
![Top 10 most in-demand skills for data jobs](PROJECT_SQL\img3.png)
*Bar chart showing top 10 most in-demand skills for data jobs in Spain 2023; ChatGPT generated graph from SQL query results*

#### Insights:
The findings indicate that Python and SQL overwhelmingly dominate the Spanish data job market in 2023, appearing in over 11,000 and 10,000 postings, respectively. Cloud computing skills—AWS and Azure—also show substantial demand, reflecting the ongoing shift toward cloud-based data infrastructure. Frameworks such as Spark and programming languages like R and Scala remain highly valued, while Power BI, Tableau, and Excel demonstrate continued relevance for data visualization and reporting. Overall, these results highlight that proficiency in Python, SQL, and cloud technologies is essential for competitiveness in Spain’s data-related roles.

### Question 4: Top 25 Skills by Average Salary in Spain (2023)
This analysis explores the average salary associated with each technical skill across data-related job postings in Spain, considering only roles that specify compensation. By ranking the top 25 skills by their mean salary, the analysis highlights which competencies are most strongly linked to higher pay levels.
Objective: To identify the high-value technical skills that offer the greatest salary advantage for data professionals in Spain, providing strategic insight for career development and skill prioritization.

```sql
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
```
![Top 25 highest-paying skills for data jobs](PROJECT_SQL\img4.png)
*Bar chart showing top 25 highest-paying skills for data jobs in Spain 2023; ChatGPT generated graph from SQL query results*

#### Insights:
The results indicate that PySpark, Pandas, and Qlik are the highest-paying technical skills in Spain’s data job market, each associated with average salaries exceeding €120,000. Advanced data engineering and cloud technologies such as Scala, BigQuery, Spark, and Azure also rank highly, reflecting the premium placed on large-scale data processing and cloud infrastructure expertise. Meanwhile, widely used skills like Python and SQL, though in high demand, show moderately lower average salaries due to their broad adoption across roles. Overall, specialized data engineering and big data tools yield the strongest salary advantages for professionals in Spain’s data sector. 

# LEARNINGS
Through this project, I strengthened my understanding of SQL and its practical applications for data analysis. I learned how to perform complex queries involving joins, aggregations, and filtering to extract meaningful insights from relational datasets. Working with PostgreSQL deepened my familiarity with database management and query optimization, while using VSCode improved my workflow by integrating code editing, database connections, and version control. Additionally, managing the project through Git and GitHub provided valuable experience in maintaining clean, reproducible code and documenting analytical work effectively. Overall, this project enhanced both my technical proficiency in SQL and my ability to use a professional data analytics toolchain collaboratively and efficiently.

# CONCLUSIONS
From the analyses conducted, several conclusions can be drawn:

1. High-paying opportunities in Spain’s data market are concentrated in senior and architect-level roles, particularly in AI, data science, and cloud engineering.

2. Python, SQL, and cloud technologies (AWS, Azure) are the most in-demand skills, forming the foundation of employability in the field.

3. Specialized big data and engineering tools such as PySpark, Pandas, and Qlik are associated with the highest salary levels, highlighting their premium value.

4. The Spanish data job market in 2023 demonstrates a clear preference for professionals who combine programming expertise, data infrastructure knowledge, and analytical capability, reinforcing the need for continuous upskilling in these domains.

# *Final Thoughts*
Overall, this project provided both analytical insights into Spain’s 2023 data job market and valuable hands-on learning in SQL and data management tools. It reinforced the importance of combining technical skill development with structured data analysis to extract evidence-based conclusions—an approach essential for both professional growth and informed decision-making in the evolving data industry.
