/*
Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill ID, name, and count of postings requiring the skill
*/

WITH remote_jobs_skills AS(
    SELECT
        skills_to_job.skill_id,
        COUNT(*) AS skill_count

    FROM 
        skills_job_dim AS skills_to_job

    INNER JOIN job_postings_fact AS job_postings
        ON job_postings.job_id = skills_to_job.job_id

    WHERE
        job_postings.job_work_from_home = True AND job_postings.job_title_short = 'Data Analyst'
    GROUP BY
        skills_to_job.skill_id
)

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    remote_jobs_skills.skill_count
FROM 
    remote_jobs_skills
INNER JOIN skills_dim
    ON skills_dim.skill_id = remote_jobs_skills.skill_id
ORDER BY
    remote_jobs_skills.skill_count DESC
LIMIT 5;

