/*
The FOREIGN KEY constraint is a key used to link two tables together. 
A FOREIGN KEY is a field (or collection of fields) in one table that refers to the PRIMARY KEY in another table.
*/
-- Foreign key
USE customers;
CREATE TABLE worker(
id INT NOT NULL,
first_name VARCHAR(30) Not Null,
last_name varchar(30) Not null,
age int,
salary int,
primary key(id)
);
desc worker;

CREATE TABLE department(
id INT NOT NULL,
dept_id INT NOT NULL,
dept_name VARCHAR(26) NOT  NULL,
primary key(dept_id),
constraint fk_persondept foreign key(id) references  worker(id)
);
desc department;
drop table department;

CREATE TABLE department1(
id INT NOT NULL,
dept_id INT NOT NULL,
dept_name VARCHAR(26) NOT  NULL,
primary key(dept_id)
);
desc department;
-- adding foreign key
ALTER TABLE department1 ADD foreign key(id) references worker(id);
/*
If you define a CHECK constraint on a column it will allow only certain values for this column. 
If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row. 
*/
-- CHECK  constraint
CREATE TABLE people(
id INT NOT NULL,
first_name VARCHAR(30) Not Null,
last_name varchar(30) Not null,
age int,
salary int,
primary key(id),
CHECK(salary<50000)
);
desc people;
insert into people values(1,'Bittu','dubey',  25, 60000);
insert into people values(1,'Bittu','dubey',  25, 40000);
SELECT  *  FROM people;
drop table people;

-- DEFAULT constraint
CREATE TABLE people(
id INT NOT NULL,
first_name VARCHAR(30) Not Null,
last_name varchar(30) Not null,
city varchar(25) default 'Noida'
);
desc  people;
ALTER TABLE people alter city DROP default;

-- Indexes
/*
->Indexes are special lookup tables that the database search engine can use to speed up data retrieval. 
Simply put, an index is a pointer to data in a table. An index in a database is very similar to an index in the back of a book.
->For example, if you want to reference all pages in a book that discusses a certain topic, you first refer to the index, 
which lists all the topics alphabetically and are then referred to one or more specific page numbers.
->An index helps to speed up SELECT queries and WHERE clauses, but it slows down data input, with the UPDATE and the INSERT statements. 
Indexes can be created or dropped with no effect on the data. 
->Creating an index involves the CREATE INDEX statement, which allows you to name the index, to specify the table and which column or columns to index, and to indicate whether the index is in an ascending or descending order.
Indexes can also be unique, like the UNIQUE constraint, in that the index prevents duplicate entries in the column or combination of columns on which there is an index.
*/
show tables;
drop table people;
show databases;
USE customers;

CREATE TABLE people(
id INT NOT NULL,
first_name VARCHAR(30) Not Null,
last_name varchar(30) Not null,
city_name VARCHAR (25) Not Null
);
SELECT * FROM people;

-- Creating INDEX in SQL
create index index_city_name
on people(city_name);
desc people;

-- dropping index
ALTER TABLE people
DROP INDEX index_city_name;

-- VIEWS in SQL
/*
-> Views is a virtual table based on the result set of an SQL query.
Views in SQL are considered as a virtual table. A view also contains rows and columns.
To create the view, we can select the fields from one or more tables present in the database.
A view can either have specific rows based on certain condition or all the rows of a table.
A view can be created using the CREATE VIEW statement. We can create a view from a single table or multiple tables.
*/

CREATE TABLE student1(
studentid int auto_increment,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
age int,
primary key(studentid)
);

insert into student1 values(1, 'Mithilesh', 'Dubey', 25),
(2, 'Pinku', 'Dubey', 23), (3, 'Chintu', 'Dubey', 21);insert into student1 values(1, 'Mithilesh', 'Dubey', 25),
(2, 'Pinku', 'Dubey', 23), (3, 'Chintu', 'Dubey', 21);

CREATE TABLE degree(
studentid int auto_increment,
department_name varchar(25) not null,
foreign key(studentid) references student1(studentid)
);
SELECT * FROM degree; 
SELECT * FROM student1;
insert into degree values( 1, 'Mechanical'), 
( 2, 'Computer Science'), ( 3, 'Electrical');

-- creating view using Inner join which is a  vertual info
create view student_info as
select first_name, last_name, age from student1 inner join degree using(studentid);
select * from student_info;

-- drop view
DROP view student_info;




