# Introduction
Dive into the data job market :-) Focusing on data analyst job roles, this project explores top-paying jobs, in-demand skills, and where high demand meets jhigh salary in data analytics.

SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
Driven by a quest to navigate the Data Analyst job market more effectively, this mini project aims to pinpoint top-paid and in-demand skills, streamlining other work to find optimal jobs.
### The questions I wanted to answer
1. What are teh top-paying data analyst roles?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for Data Analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I used
I harnessed the power of the following key tools:
- **SQL**: The main tool of my analysis, allowing me to query the database and unravel critical insights.
- **PostgreSQL**: The chosen database management system, ideal for handling the job posting data.
- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each quere for this project aimed at investigating specific aspects of the data analyst job market. Here's how I approached this question:
### 1. Top Paying Data Analyst Jobs
To Identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::DATE,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    -- (job_location='San Francisco, CA') AND
    job_location IN ('San Francisco, CA', 'San Jose, CA', 'Palo Alto, CA') AND
    salary_year_avg IS NOT NULL 
ORDER BY
    salary_year_avg DESC
LIMIT 10
```

# What I learned

# Conclusions