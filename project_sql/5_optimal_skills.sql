/*
Question: What are teh most optimal skills to learn? (aka top-demanded and high-paying skill)
    - Identify skills in high demand and associated with high average salaries 
        for Data Analyst roles.
    - Concentrate on remote positions with specified salaries
    - Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
        offering strategic insights for career development in data analytics
Hint: We'll put queries from 3 and 4 in CTe's to reuse code
*/

WITH skills_demand AS (--CTE from query 3
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        Count(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE
        job_title_short LIKE '%Analyst%' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = true
    GROUP BY
        skills_dim.skill_id
), average_salary AS (--CTE from query 4
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg),1) AS avg_salary
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE
        job_title_short LIKE '%Analyst%' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = true
    GROUP BY
        skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 50
ORDER BY
    avg_salary DESC, -- in two values are equal move order by this
    demand_count DESC 
LIMIT 25

/*
Key insights from the dataset on the most in-demand and high-paying jobs for data analysts:

1. Most In-Demand Skills:
    - SQL is the most in-demand skill, with a demand count of 567.
    - Tableau and Python follow, with demand counts of 337 and 328, respectively.   
2. Highest Paying Skills:
    - Snowflake has the highest average salary at $115,597.30.
    - Looker and Oracle follow with average salaries of $112,927.60 and $107,585.30, respectively.
3. Popular and Well-Paid:
    - Python and Tableau are both highly in-demand and offer relatively high salaries, 
        making them attractive options for data analysts. Python has an average salary 
        of $106,770.90, while Tableau has an average salary of $103,820.60.

These insights highlight the importance of certain skills in the job market for data analysts, focusing on both demand and compensation.
*/

/*
[
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "64",
    "avg_salary": "115597.3"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "86",
    "avg_salary": "112927.6"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "53",
    "avg_salary": "107585.3"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "328",
    "avg_salary": "106770.9"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "197",
    "avg_salary": "104688.3"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "337",
    "avg_salary": "103820.6"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "89",
    "avg_salary": "101948.6"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "89",
    "avg_salary": "101948.6"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "567",
    "avg_salary": "101714.9"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "153",
    "avg_salary": "99673.1"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "77",
    "avg_salary": "90966.4"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "335",
    "avg_salary": "90369.5"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "64",
    "avg_salary": "87105.7"
  }
]
*/






