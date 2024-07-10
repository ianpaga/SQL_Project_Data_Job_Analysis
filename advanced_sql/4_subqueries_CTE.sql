-- SELECT *
-- FROM ( -- subquery starts
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH FROM job_posted_date) = 1
-- ) AS january_jobs;
-- -- subquery ends

-- /*
-- The code below does the same thing
-- */

-- WITH january_jobs AS (-- CTE starts
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH FROM job_posted_date) = 1
-- )
-- -- CTE ends

-- SELECT *
-- FROM january_jobs;

-- SELECT 
--     company_id,
--     name AS company_name
-- FROM 
--     company_dim
-- WHERE company_id IN (
--     SELECT 
--         company_id
--     FROM 
--         job_postings_fact
--     WHERE
--         job_no_degree_mention = true
-- )


WITH company_job_count AS (
    SELECT 
        company_id,
        COUNT(*) AS counts
    FROM 
        job_postings_fact
    GROUP BY
        company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.counts
FROM company_dim
LEFT JOIN company_job_count 
    ON company_job_count.company_id = company_dim.company_id
ORDER BY
    company_job_count.counts DESC


    