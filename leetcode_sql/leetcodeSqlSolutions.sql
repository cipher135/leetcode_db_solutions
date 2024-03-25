-- https://leetcode.com/problems/second-highest-salary/description/
select max(salary) as "SecondHighestSalary" from employee where salary < (select max(salary) from employee);

-- 2nd way
select ifnull((select distinct salary from employee order by salary desc limit 1,1), null) as SecondHighestSalary;


--- https://leetcode.com/problems/nth-highest-salary/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N=N-1;
  RETURN (
      # Write your MySQL query statement below.
    select distinct salary from employee order by salary desc limit N,1

  );
END

/*
LIMIT m, n; means, retrieve n rows starting from m+1th row
LIMIT 5, 10; means, 10 rows starting from 6th rows
LIMIT 0, 10; means, first 10 rows
*/

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

-- https://leetcode.com/problems/customers-who-never-order/
/*
SELECT * FROM table1 t1, table2 t2; and 
SELECT * FROM table1 t1 CROSS JOIN table2 t2; are same
*/
select name customers from customers where id not in (
select c.id from customers c, orders o where  c.id = o.customerId);

