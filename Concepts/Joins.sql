## Find employees whose salary is greater than their manager’s salary.

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
SELECT t1.emp_id, t1.emp_name, t2.emp_name AS manager_name FROM emp AS t1
INNER JOIN emp AS t2
ON t1.manager_id=t2.emp_id
WHERE t1.salary>t2.salary




