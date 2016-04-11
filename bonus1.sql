-- Write a SQL query that returns a sorted list of the departments and the number of support requests per each department (doesn't have to be inside your Rails app). (10%)

SELECT department, COUNT(*) FROM requests
GROUP BY department
ORDER BY department;
