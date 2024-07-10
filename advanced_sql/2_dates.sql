SELECT
    EXTRACT(MONTH FROM job_posted_date) AS month,
    COUNT(job_id)
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    month ASC