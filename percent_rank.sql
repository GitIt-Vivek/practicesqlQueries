use practicesets;

select * from `hr_emp`;

-- 🔹 Task 1: Percentile Ranking of Salaries
-- 👉 Find each employee’s percentile rank within their department based on MonthlyIncome.
select  employeenumber, department,
		percent_rank() over(partition by department order by monthlyincome asc) as pr
        from `hr_emp`;
    
    
        
-- 🔹 Task 2: Cumulative Distribution of Income
-- 👉 Find how income is distributed across the company —
-- for each employee, calculate what fraction of employees earn less or equal.
SELECT 
    EmployeeNumber,
    MonthlyIncome,
    CUME_DIST() OVER (ORDER BY MonthlyIncome) AS income_cume_dist
FROM hr_emp
ORDER BY MonthlyIncome;


-- 🔹 Task 3: Top 10% Earners
-- 👉 Using PERCENT_RANK(), identify employees who fall into the top 10% of earners.
-- 🪄 Hint: Wrap your query in a CTE, filter where percentile ≥ 0.9.
WITH income_rank AS (
  SELECT 
      EmployeeNumber,
      MonthlyIncome,
      PERCENT_RANK() OVER (ORDER BY MonthlyIncome) AS p_rank
  FROM hr_emp
)
SELECT *
FROM income_rank
WHERE p_rank >= 0.9
ORDER BY MonthlyIncome DESC;
