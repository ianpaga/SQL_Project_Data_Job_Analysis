/*
Question: What skills are required for the top-paying Data Analyst role?
    - Use the top 10 highest-paying Data Analyst jobs from the first query
    - Add the specific skills required for these roles
    - Why? It provides a detailed look at which high-paying jobs demand certain skills,
        helping job seekrs understnad which skills to develop that align with the top salaries
*/


WITH top_paying_jobs AS (-- begin CTE
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location IN ('San Francisco, CA', 'San Jose, CA', 'Palo Alto, CA') AND
        salary_year_avg IS NOT NULL 
    -- end CTE
)

SELECT
    top_paying_jobs.*,
    skills_dim.skills,
    skills_dim.type
FROM top_paying_jobs
-- inner join becuase we need jobs that have an associated 'skill_id'
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
-- another inner join to get the 'skills' (python, sql, etc)
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY
    salary_year_avg DESC
LIMIT 10

/*
Key insights from the data on top paying job skills:

1. High Salaries for SQL and Python: Data Analyst roles at Anthropic with SQL and Python 
skills have the highest average salaries, reaching up to $350,000 per year. 
These programming skills are highly valued in top-paying data analyst positions.

2. Diverse Skill Sets in High-Paying Roles: In addition to programming skills, 
high-paying roles also demand expertise in other areas:

  - Research Scientist at OpenAI: Requires GitHub skills, offering $285,000 per year.
  - Data & Intelligence Manager at Asana: Requires SQL, Snowflake (cloud), 
    and Asana (async) skills, with a salary of $235,000 per year.
  - E-commerce Data Analyst at TikTok: Requires SQL and Tableau skills, 
    with a salary of $224,500 per year.

3 .Consistent Demand Across Top Companies: Leading tech companies like Anthropic, 
OpenAI, Asana, and TikTok offer top salaries for data roles, highlighting the 
importance of advanced data skills in high-impact, high-reward positions.
*/


/*
[
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "salary_year_avg": "350000.0",
    "company_name": "Anthropic",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "salary_year_avg": "350000.0",
    "company_name": "Anthropic",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 894135,
    "job_title": "Research Scientist",
    "salary_year_avg": "285000.0",
    "company_name": "OpenAI",
    "skills": "github",
    "type": "other"
  },
  {
    "job_id": 144450,
    "job_title": "Data Analyst",
    "salary_year_avg": "240000.0",
    "company_name": "Anthropic",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 144450,
    "job_title": "Data Analyst",
    "salary_year_avg": "240000.0",
    "company_name": "Anthropic",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "salary_year_avg": "235000.0",
    "company_name": "Asana",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "salary_year_avg": "235000.0",
    "company_name": "Asana",
    "skills": "snowflake",
    "type": "cloud"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "salary_year_avg": "235000.0",
    "company_name": "Asana",
    "skills": "asana",
    "type": "async"
  },
  {
    "job_id": 1145894,
    "job_title": "E-commerce Data Analyst",
    "salary_year_avg": "224500.0",
    "company_name": "TikTok",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 1145894,
    "job_title": "E-commerce Data Analyst",
    "salary_year_avg": "224500.0",
    "company_name": "TikTok",
    "skills": "tableau",
    "type": "analyst_tools"
  }
]
*/
