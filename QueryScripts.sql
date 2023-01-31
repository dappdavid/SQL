--select * from dept;

select * from employee;

select * from INCENTIVES;

--Display unique Department names from Employee table
SELECT DISTINCT DEPTNAME FROM Employee ;

--List the details of the employees in ascending order of their salaries.
SELECT * 
FROM Employee
ORDER BY SAL ASC;

--List the employees who joined before 1981.
SELECT * 
FROM Employee
WHERE HIREDATE < '01-JAN-1981';

-- print the number of employees per department in the organization
SELECT DEPTNAME, COUNT(DEPTNAME) AS Employees_count FROM   Employee GROUP  BY DEPTNAME;

--find the name of the top level manager of each department
select ename, deptname from employee where mgr is null; 


--find the employee details who got second maximum incentive in Febrauary 2019
select * from employee where empno = (select empid from incentives where incentives.incentive_amount in 
(select max(incentive_amount) from incentives where TO_CHAR(incentive_date, 'MM-YYY')='02-2019'));

select * from (select * from employee e, incentives i where e.empno=i.empid and TO_CHAR(incentive_date, 'MM-YYYY')='02-2019' and i.incentive_amount < 
(select max (incentive_amount)from incentives where TO_CHAR(incentive_date, 'MM-YYYY')='02-2019')  order by i.incentive_amount desc) where ROWNUM <=1 ;

