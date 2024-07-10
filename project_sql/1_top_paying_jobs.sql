/*
Question: What are the top-paying Data Analyst jobs in the Bay Area?
    1. Identify the top 10 highest-paying Data Analyst roles that are available remotely
    2. Focus on job postings with specifified salaries (remove NULL)
    3. Why? Highlight the top-paying opportunities for Data Analysts offering insights into
        the job market
*/

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

/*
[
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-06-22",
    "company_name": "Anthropic"
  },
  {
    "job_id": 894135,
    "job_title": "Research Scientist",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "285000.0",
    "job_posted_date": "2023-04-19",
    "company_name": "OpenAI"
  },
  {
    "job_id": 144450,
    "job_title": "Data Analyst",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "240000.0",
    "job_posted_date": "2023-06-21",
    "company_name": "Anthropic"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-07-05",
    "company_name": "Asana"
  },
  {
    "job_id": 1145894,
    "job_title": "E-commerce Data Analyst",
    "job_location": "San Jose, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "224500.0",
    "job_posted_date": "2023-05-02",
    "company_name": "TikTok"
  },
  {
    "job_id": 200616,
    "job_title": "TikTok Shop - Data Analyst",
    "job_location": "San Jose, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "222093.5",
    "job_posted_date": "2023-12-30",
    "company_name": "TikTok"
  },
  {
    "job_id": 112060,
    "job_title": "Business Intelligence Data Analyst - Global Monetization Product ...",
    "job_location": "San Jose, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "208500.0",
    "job_posted_date": "2023-12-07",
    "company_name": "TikTok"
  },
  {
    "job_id": 1772185,
    "job_title": "Data Analyst（SF）",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-03-01",
    "company_name": "ThinkingData"
  },
  {
    "job_id": 958605,
    "job_title": "Staff Analytics Engineer, Guest Data",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-09-13",
    "company_name": "Airbnb"
  },
  {
    "job_id": 388990,
    "job_title": "Sr. Business Intelligence Engineer",
    "job_location": "Palo Alto, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "198875.0",
    "job_posted_date": "2023-05-11",
    "company_name": "TripActions"
  }
]
*/