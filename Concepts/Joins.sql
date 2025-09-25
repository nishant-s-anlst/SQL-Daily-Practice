-- Find all employees who have the same salary within the same department.

--Sample table
CREATE TABLE emp_salary
(
    emp_id INTEGER  NOT NULL,
    name NVARCHAR(20)  NOT NULL,
    salary NVARCHAR(30),
    dept_id INTEGER
);

INSERT INTO emp_salary VALUES
(101, 'sohan', '3000', '11'),
(102, 'rohan', '4000', '12'),
(103, 'mohan', '5000', '13'),
(104, 'cat', '3000', '11'),
(105, 'suresh', '4000', '12'),
(109, 'mahesh', '7000', '12'),
(108, 'kamal', '8000', '11');


--SOLUTION (BY INNER JOIN)
WITH sal_dept AS (
SELECT dept_id,salary FROM emp_salary
GROUP BY dept_id,salary
HAVING COUNT(*) > 1 )

SELECT e.* FROM emp_salary AS e
INNER JOIN sal_dept AS s
  ON e.dept_id=s.dept_id
  AND e.salary=s.salary;


-- Find employees whose salary is greater than their manager’s salary.

--Sample table
create table emp(emp_id int,emp_name varchar(10),salary int ,manager_id int);

insert into emp values(1,'Ankit',10000,4);
insert into emp values(2,'Mohit',15000,5);
insert into emp values(3,'Vikas',10000,4);
insert into emp values(4,'Rohit',5000,2);
insert into emp values(5,'Mudit',12000,6);
insert into emp values(6,'Agam',12000,2);
insert into emp values(7,'Sanjay',9000,2);
insert into emp values(8,'Ashish',5000,2);


--SOLUTION (BY SELF JOIN)
SELECT t1.emp_id, t1.emp_name, t1.salary AS emp_sal, t2.emp_name AS manager_name, t2.salary AS manager_sal FROM emp AS t1 
INNER JOIN emp AS t2
 ON t1.manager_id=t2.emp_id
 WHERE t1.salary>t2.salary;




