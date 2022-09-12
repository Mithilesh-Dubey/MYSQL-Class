## SQL JOINS
/*
1.Inner Join - Inner join returns the value which is matching in both the tables.
2.Left Join - This join returns all the records from the left table and the matched records from the right table.
3.Right Join - This join returns all the records from the right table and the matching ones from the left table.
4.Full Outer Joint - The full outer join returns all the records from both the tables if a common field is shared.
5.Natural Join - In MySQL, the NATURAL JOIN is such a join that performs the same task as an INNER or LEFT JOIN, in which the ON or USING clause refers to all columns that the tables to be joined have in common.
                 -The MySQL NATURAL JOIN is structured in such a way that, columns with the same name of associate tables will appear once only.
6.Cross Join - This join produces a result where the number of rows in the first table gets multiplied with the rows in the second table. This kind of result is called the Cartesian Product. If we use the WHERE clause with this join, then this will work as an inner join.
*/
use customers;
create table student(
studentid int,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int
);
desc student;
-- inserting values
insert into student values
(1, 'Mithilesh', 'Dubey', 25),
(2, 'Ramesh', 'Sharma', 26),
(3, 'Ram', 'Singh', 25),
(4, 'Aman', 'Tiwari', 28),
(5, 'Amit', 'Goswami', 27);
select * from student;
update student set studentid = 5 where first_name ='Amit';
create table department(
studentid int,
department_name varchar(25) not null);
insert into department values
(1, 'CSE'),
(2, 'ECE'),
(3, 'MECH'),
(4, 'CIVIL');
select * from department;

## Inner join
select * from student
inner join department on student.studentid = department.studentid;

select s.first_name, s.last_name, s.age, d.department_name
from student as s
inner join department as d on d.studentid = s.studentid;

-- Left Join
select s.studentid, s.first_name, s.last_name, s.age, d.department_name
from student as s
left join department as d on d.studentid = s.studentid;

-- Right Join
select s.studentid, s.first_name, s.last_name, s.age, d.department_name
from student as s
right join department as d on d.studentid = s.studentid;

-- Full Outer Join - combine left join & right join using UNION
select s.studentid, s.first_name, s.last_name, s.age, d.department_name
from student as s
left join department as d on d.studentid = s.studentid
union
select s.studentid, s.first_name, s.last_name, s.age, d.department_name
from student as s
right join department as d on d.studentid = s.studentid;

-- Cross Join - shows all the posible combination
select s.studentid, s.first_name, s.last_name, s.age, d.department_name
from student as s
cross join department as d;

-- Natural join

select s.studentid, s.first_name, s.last_name, s.age, d.department_name
from student as s
natural join department as d;


