-- https://leetcode.com/problems/second-highest-salary/description/
select max(salary) as "SecondHighestSalary" from employee where salary < (select max(salary) from employee);

-- 2nd way
select ifnull((select distinct salary from employee order by salary desc limit 1,1), null) as SecondHighestSalary;

-- https://leetcode.com/problems/employees-earning-more-than-their-managers/
select e.name as Employee from employee e, employee m where m.id=e.managerId and e.salary > m.salary;

/*
> MSSQL server and MS Access database
SELECT TOP x
SELECT TOP x PERCENT

> MySQL
LIMIT x

> Oracle (at the end of the query)     
FETCH FIRST x ROWS ONLY;
FETCH FIRST x PERCENT ROWS ONLY
ROWNUM >=< x
*/

