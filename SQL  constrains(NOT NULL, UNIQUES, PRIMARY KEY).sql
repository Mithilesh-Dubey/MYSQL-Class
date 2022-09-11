/* SQL Constraints are used  to specify any rules for  the records in the table. Constraints can be used to limit the type of data that can go into
a table. It ensures accuracy and reliability of records in the  table, and if there is any violation between the constraints and the record action, 
the action is aborted. Constaints can be column level or table level.
Column level constrains apply to the columns, and table level constaints apply to the whole table.
1)Not Null
2)Unique
3)Primary Key
4)Foreign Key
5)Check
6)Default
7)Index
*/
USE customers;
#1) Not Null constaints
CREATE TABLE student(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
age INT
);
SELECT * FROM student;
insert into student1 values(1, 'Mithilesh', 'Dubey', 25),
(2, 'Pinku', 'Dubey', 23), (3, 'Chintu', 'Dubey', 21),;
DESC student;
ALTER TABLE student MODIFY age int not null;

#2)Unique Constaints
CREATE TABLE person(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
age INT NOT NULL,
UNIQUE(id)
);
DESC person;
INSERT into person values(1,'Mithilesh','Dubey',25);
INSERT into person values(2,'Bittu','Dubey',26);
INSERT into person values(3,'Abhi','Dubey',25);
SELECT * FROM person;

#add Unique constraint to another value
ALTER TABLE person ADD UNIQUE(first_name);
INSERT into person values(4,'Abhi','Dubey',25);

ALTER TABLE person ADD CONSTRAINT uc_person UNIQUE(age,first_name);
DESC person;
#Drop UNIQUE constraint
ALTER TABLE person DROP INDEX uc_person;
ALTER TABLE person DROP INDEX first_name;


-- Primary key constraint
CREATE TABLE person1(
id INT NOT NULL,
first_name VARCHAR(30),
last_name varchar(30),
age int,
constraint pk_person primary key(id, last_name)
);
desc person1;
-- droping primary key
ALTER TABLE person1 ADD primary key(id);
ALTER TABLE person1 DROP primary key;

CREATE TABLE person2(
id INT NOT NULL,
first_name VARCHAR(30) not null,
last_name varchar(30) not null,
age int,
primary key(id)
);
desc person2;
drop table person2;

CREATE TABLE person2(
id INT NOT NULL,
first_name VARCHAR(30) Not Null,
last_name varchar(30) Not null,
age int
); 
ALTER TABLE person2 add constraint pk_person primary key(id,age);













