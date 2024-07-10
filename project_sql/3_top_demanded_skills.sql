/*
Question: What are the most in-demand skills for Data Analysts?
    - Join job postings to inner join table similar to query 2
    - Identify the top 5 in-demand skills for a Data Analyst
    - Focus on all job postings
    - Why? Retrives the top 5 skills with the highest demand in the job market,
        providing insights into the most valuable skills for job seekers
*/

SELECT
    skills,
    Count(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    -- job_title_short IN ('Data Analyst', 'Data Scientist') AND
    job_title_short LIKE '%Analyst%' AND
    job_work_from_home = true
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5

/*
Key insights into the top demanded skills for data analysts:

1. High Demand for SQL: SQL is the most demanded skill with a significant lead, 
having a demand count of 10,281. This indicates its critical role in data management 
and querying databases for data analysts.

2. Essential Tools and Programming Languages: Excel and Python follow as the next most 
demanded skills, with demand counts of 6,294 and 5,930, respectively. Excel remains a 
fundamental tool for data analysis, while Python is crucial for more advanced data 
manipulation and analysis.

3. Visualization Tools: Tableau and Power BI are also highly demanded, with demand counts 
of 5,472 and 3,625, respectively. This highlights the importance of data visualization 
skills in effectively communicating insights derived from data analysis.
*/

/*
[
  {
    "skills": "sql",
    "demand_count": "10281"
  },
  {
    "skills": "excel",
    "demand_count": "6294"
  },
  {
    "skills": "python",
    "demand_count": "5930"
  },
  {
    "skills": "tableau",
    "demand_count": "5472"
  },
  {
    "skills": "power bi",
    "demand_count": "3625"
  }
]
*/