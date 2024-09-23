CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
   WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   FIRST_NAME CHAR(25),
   LAST_NAME CHAR(25),
   SALARY INT(15),
   JOINING_DATE DATETIME,
   DEPARTMENT CHAR(25)
);

INSERT INTO Worker
      (WORKER_ID, FIRST_NAME, LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES
      
      (001,'Monika','Arora',100000,'14-02-20 09.00.00','HR'),
      (002,'Niharika','Verma',80000,'14-06-11 09.00.00','Admin'),
      (003,'Vishal','Singhal',300000,'14-02-20 09.00.00','HR'),
      (004,'Amitabh','Singh',500000,'14-02-20 09.00.00','Admin'),
      (005,'Vivek','Bhati',500000,'14-06-11 09.00.00','Admin'),
      (006,'Vipul','Diwan',200000,'14-06-11 09.00.00','Account'),
      (007,'Satish','Kumar',75000,'14-01-20 09.00.00','Account'),
      (008,'Geetika','Chauhan',90000,'14-04-11 09.00.00','Admin');
      
      
SELECT * FROM Worker;




CREATE TABLE Bonus(
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
          REFERENCES Worker(WORKER_ID)
          ON DELETE CASCADE
);


INSERT INTO Bonus
         (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
           (001, 5000, '16-02-20'),
           (002, 3000, '16-06-11'),
           (003, 4000, '16-02-20'),
           (001, 4500, '16-02-20'),
           (002, 3500, '16-06-11');
           
CREATE TABLE Title (

WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
    REFERENCES Worker(WORKER_ID)
    ON DELETE CASCADE
    
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE,AFFECTED_FROM) VALUES
    (001,'Manager','2016-02-20 00:00:00'),
    (002,'Executive','2016-02-20 00:00:00'),
    (008,'Executive','2016-02-20 00:00:00'),
    (005,'Manager','2016-02-20 00:00:00'),
    (004,'Asst.Manager','2016-02-20 00:00:00'),
    (007,'Executive','2016-02-20 00:00:00'),
    (006,'Lead','2016-02-20 00:00:00'),
    (003,'Lead','2016-02-20 00:00:00');
           
           
SELECT * FROM Bonus;
SELECT * FROM Title;
      
      
-- Q1. Write an sql query to fetch 'first_name from worker table using the alias name as <WORKER_NAME>.
   
   SELECT FIRST_NAME AS WORKER_NAME FROM Worker;

-- Q2. Write an sql query to fetch 'first_name' from worker table in upper case.

 select upper(first_name) as worker_name from Worker;
      
-- Q3. Writ an sql query to fetch unique values of department from worker table.

 select distinct(department) from worker;
 select department from worker group by department;

-- Q4. Write an sql query to print the first three characters of first_name from worker table.

 select substr(first_name,1,3) from worker;
 select substr or substring(col,start,len) from table_name;

-- Q5. Write an sql query to find the position of the alphabet ('b') in the first name column 'Amitabh' from worker table.
select instr(first_name,'b') from worker where first_name = 'Amitabh';
      
-- Q6. Write an sql query to print the first_name from worker table after removing white spaces from the right side.
select rtrim(first_name) from worker ;

-- Q7. Write an sql query to print the first_name from worker table after removing white spaces from the left side.
select ltrim(first_name) from worker ;

-- Q8. Write an sql query that fetches the unique value of department from worker table and prints its lenght. 
select distinct(length(first_name)) from worker;
select distinct first_name, length(first_name) from worker;

-- Q9. Write an sql query to print the first_name ffrom worker table and prints its lenght.  
select replace(first_name , 'a','A') as first_name from worker ;

-- Q10 Write an sql query to print the first_name and last_name from worker table into a single column complete_name.
-- a space char should seperathe them.

select concat(first_name,' ',last_name) as complete_name from worker;

-- Q11 Write an sql query to print all worker details from the worker table order by first_name ascending. 

select * from worker order by first_name asc;

-- Q12 Write an sql query to print all worker details from the worker table order by first_name ascending and department descending. 
select * from worker order by first_name asc , department desc;

-- Q13 Write an sql query to print details for workers with the first name as 'vipul; and 'satish' from worker table.

select * from worker where first_name in ('Vipul','Satish'); 
select * from worker where first_name ='Vipul' or first_name = 'Satish';

-- Q14. Write an sql query to print details of workers excluding first_names vipul and satish .
select * from worker where first_name not in ('Vipul','Satish');

-- Q15. Write an sql query to print details of worker with department name as 'Admin****'. 
select * from worker where department like 'Admin%'; -- wildcard operator

-- Q16 Write an sql query to print details of workers where first name contain 'a'. 
select * from worker where first_name like '%a%';

-- Q17 Write an sql query to print details of the worker where first name ends with 'a'. 
select * from worker where first_name like '%a';

-- Q18 Write an sql query to print details of the worker where first name ends with 'h' and contains six alphabets. 
select * from worker where first_name like '_____h';

-- Q-19. Write an sql qurey to print details of the workers whose salary lies between 100000 and 500000.
select * from worker where Salary between 200000 and 500000 ;

-- Q-20. Write an sql query to print details of the workers who have joined in feb'2014. 
select * from worker where joining_date like '2014-02%';

select * from worker where year(joining_date) = 2014 and month(joining_date) = 2; -- and day(joining_date) = 20;

-- Q-21. Write an sql query to fetch the count of employees working in the department 'Admin';

select count(worker_id), department as total_no_of_employee from worker where department = 'Admin';

-- Q22. Write an sql query to fetch worker full names with salaries >= 50000 and <= 100000 . 

select concat(first_name,' ',last_name) as full_name, salary from worker where salary between 50000 and 100000;
             
-- Q23. Write an sql query to fetch the no. of workeres for each department in the descending order. 

select department , count(worker_id) as no_of_worker from worker group by department order by count(worker_id) desc; 

-- Q24. Write an sql query to print details of the workere who are also managers. 
select worker.worker_id, worker.first_name,worker.last_name,worker.salary ,worker.department, title.worker_title
 from worker inner join title on worker.worker_id = title.worker_ref_id where title.worker_title = 'Manager';
 
 
 select w.* from worker as w inner join title as t on w.worker_id = t.worker_ref_id where t.worker_title = 'Manager';
 
 
 -- Q25. Write an sql query to fetch number (more than 1) of different titles in the org. 
 select count(worker_ref_id) as title_count, worker_title from title group by worker_title having count(*) > 1;
 
 
 -- Q26. Write a sql query to show odd row of table.
 select * from worker where MOD (worker_id,2) != 0;
 
 -- Q27. Write a sql query to show even row of table. 
 select * from worker where mod (worker_id,2) = 0;
 
 -- Q28. Write an sql query to clone  a new table from another table.
 create table worker_clone like worker;
 select * from worker_clone;
 insert into worker_clone select * from worker;
 -- Q29. Write an sql query to fetch intersecting record of two tables. 
 select * from worker as w inner join title as t on w.worker_id = t.worker_ref_id;
 
 -- Q30 Write an sql query to show records from one table that another table does not have.
 
 -- set operation query
 select * from worker left join worker_clone using(worker_id) where worker_clone.worker_id is NULL ;

-- Q31. Write an sql query to show the current date and time;
select curdate();
select now();
select curtime();

-- Q32. Write an sql query to determin the top n (say n = 5) highest salary from a table.
select * from worker order by salary desc limit 5;

-- Q33. Write an sql query to determine the nth (say n=5) highest salary from a table.
select * from worker order by salary desc limit 4,1;

-- Q34. Write an sql query to determine the 5th highest salary wihtout using limit keyboard.
select * from worker w1
where 4 = (
    select count(distinct (w2.salary))
    from worker w2
    where w2.salary >= w1.salary 
);

-- Q35. Write an sql query to fetch the list of employees with same salary.
select * from worker w1, worker w2 where w1.salary = w2.salary;

-- Q36. Write an sql query to show the second highest salary from a table.
select max(salary) from worker where salary not in (select max(salary) from worker);

-- Q37. Write an sql query to show one row twice in results from a table.
select * from worker union all select * from worker order by  WORKER_ID;

-- Q38. Write an sql query to list worker_id who does not get bonus.
select * from worker where worker_id not in (select worker_ref_id from bonus);

-- Q39. Write an sql query to fetch the first 50% records from a table.
select * from worker where worker_id < (select count(worker_id)/2 from worker);

-- Q40. Write an sql query to fetch the departpents that have less than 4 people in it.


select department,count(department) as no_of_department from worker group by  department having no_of_department < 4;

-- Q41. Write an sql query to show  all department along with the number of people in there.
select department,count(worker_id) from worker group by department; 

-- Q42. Write an sql query to show the last record from a table.

select * from worker where worker_id in (select max(worker_id) from worker);

-- Q43. Write an sql query to show the first record form a table.
select * from worker where worker_id in (select min(worker_id) from worker);

-- Q44. Write an sql query to fetch the last five records from a table.
(select * from worker order by worker_id desc limit 5) order by worker_id;

-- 45. Write an sql query to print the name of employees having the highest salary in each department.
select w.department , w.first_name,w.salary from
 (select max(salary) as maxsalary ,department from worker group by department) temp
 inner join worker w on temp.department = w.department and temp.maxsalary = w.salary;

-- 46. Write an sql query to fetch three max salaries from a table.

select * from  (select * from (select * from worker order by salary desc) as temp limit 5) temp2 order by salary asc;
select * from worker order by salary desc limit 3;

-- imp co-related subquery

select distinct salary from worker w1
where 3>= (select count(distinct salary) from worker w2 where w1.salary <= w2.salary) order by w1.salary desc;

-- 47. Write an sql query to fetch three min salaries from a table

select * from worker order by salary asc limit 3;
-- imp co-related subquery

select distinct salary from worker w1
where 3>= (select count(distinct salary) from worker w2 where w1.salary >= w2.salary) order by w1.salary desc;

-- Q48. Write an sql query to fetch nth max salaries from table.

select distinct salary from worker w1
where n>= (select count(distinct salary) from worker w2 where w1.salary >= w2.salary) order by w1.salary desc;


-- Q49 Write an sql query to fetch departments along with the totla salaries paid for each of them.

select department , sum(salary) from worker group by department;

-- Q50 Write an sql query to fetch the names of worker who earn the hightest salary.
select * from worker where salary = (select max(salary) from worker );

create table pairs(
    A int,
    B int
);
insert into pairs values(1,2),(2,4),(2,1),(3,2),(4,2),(5,6),(6,5),(7,8);
select * from pairs;

-- using joins

select lt.* from pairs lt left join pairs rt on lt.A = rt.B and lt.B = rt.a
where rt.A is NULL OR lt.A < rt.A;

-- corelated subquery
select * from pairs p1 where not exists (select * from pairs p2 where p1.B = p2.A and p1.A = p2.B and p1.A > p2.A);