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






