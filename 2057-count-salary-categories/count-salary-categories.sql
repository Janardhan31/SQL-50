# Write your MySQL query statement below
-- select 
-- "Low Salary" as category,
-- count(income) as accounts_count
-- from Accounts
-- where income<20000
-- union
-- select 
-- "Average salary" as category,
-- count(income) as accounts_count
-- from Accounts
-- where income>=20000 and income <=50000
-- union
-- select 
-- "High Salary" as category,
-- count(income) as accounts_count
-- from Accounts
-- where income>50000



WITH cate AS(
    SELECT *, 
    CASE
        WHEN income < 20000 THEN 'Low Salary'
        WHEN income > 50000 THEN 'High Salary'
        ELSE 'Average Salary'
    END AS category
    FROM Accounts
),
all_categories AS (
    SELECT 'Low Salary' AS category
    UNION
    SELECT 'Average Salary'
    UNION
    SELECT 'High Salary'
)

SELECT a.category, IFNULL(COUNT(DISTINCT c.account_id),0) AS accounts_count
FROM all_categories a
LEFT JOIN cate c ON a.category = c.category
GROUP BY a.category