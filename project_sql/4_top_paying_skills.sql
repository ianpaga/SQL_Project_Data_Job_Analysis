/*
Question: What are the top skills based on salary ?
    - Look at the average salary associate with each skill for Data Analyst positions
    - Focus on roles with specified salaries, regardless of location
    - Why? It eveals how different skills impact salary levels for Data Analysts and
        helps identify the most finantially rewarding skills to acquire/improve
*/

SELECT
    skills,
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
    skills
ORDER BY
    avg_salary DESC
LIMIT 25


/*
Key insights broken down into three main bullet points:

1. Top Paying Skills:
    - Bitbucket: $189,154.50
    - Angular, FastAPI, and Keras: $185,000.00
2. High-Paying Skill Categories:
    - Machine Learning Libraries: Keras, PySpark, Jupyter, Pandas, NumPy, Scikit-learn, PyTorch
    - Programming Languages: Golang, Swift, Rust, Scala
    - Web Frameworks: Angular, FastAPI, Flask
3. Important Tools and Frameworks:
    - DevOps Tools: Bitbucket, GitLab, Chef, Jenkins
    - Data Tools: PySpark, Couchbase, Cassandra, Databricks, DataRobot
    - Specialized Tools: IBM Watson, Twilio
*/

/*
[
  {
    "skills": "bitbucket",
    "avg_salary": "189154.5"
  },
  {
    "skills": "angular",
    "avg_salary": "185000.0"
  },
  {
    "skills": "fastapi",
    "avg_salary": "185000.0"
  },
  {
    "skills": "keras",
    "avg_salary": "185000.0"
  },
  {
    "skills": "pyspark",
    "avg_salary": "182586.1"
  },
  {
    "skills": "golang",
    "avg_salary": "161750.0"
  },
  {
    "skills": "watson",
    "avg_salary": "160515.0"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515.0"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500.0"
  },
  {
    "skills": "chef",
    "avg_salary": "152500.0"
  },
  {
    "skills": "jupyter",
    "avg_salary": "151138.3"
  },
  {
    "skills": "swift",
    "avg_salary": "147833.3"
  },
  {
    "skills": "pandas",
    "avg_salary": "146476.3"
  },
  {
    "skills": "numpy",
    "avg_salary": "142920.3"
  },
  {
    "skills": "flask",
    "avg_salary": "142000.0"
  },
  {
    "skills": "cassandra",
    "avg_salary": "140000.0"
  },
  {
    "skills": "rust",
    "avg_salary": "138000.0"
  },
  {
    "skills": "databricks",
    "avg_salary": "134042.9"
  },
  {
    "skills": "scala",
    "avg_salary": "133835.8"
  },
  {
    "skills": "datarobot",
    "avg_salary": "128992.8"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000.0"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125893.8"
  },
  {
    "skills": "linux",
    "avg_salary": "125753.8"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436.3"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125000.0"
  }
]
*/