/*
Question: What are the most optimal skills to learn (high demand AND high paying)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles.
- Focus on remote positions with specified salaries.
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
  offering strategic insights for career development in data analysis.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere'
GROUP BY
    skills_dim.skills
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 25;