SHOW DATABASES;
SHOW TABLES;
#creating database
CREATE DATABASE customers;
USE customers;
#creating customer_info table
CREATE TABLE  customer_info(id INTEGER AUTO_INCREMENT , first_name VARCHAR(25), last_name VARCHAR(25) , salary INTEGER , PRIMARY KEY(id));
#inserting values into  the table
insert into customer_info(first_name,last_name,salary)VALUES
('Mithilesh','Dubey',90000),('Krish','Naik',80000),('Chintu','Dubey',70000),('Amit','Sharma',40000),('Ankit','Sharma',NULL);
SELECT * FROM customer_info where salary IS NULL;
SELECT * FROM customer_info where salary IS NOT NULL;

#sql update statement to update NULL values
UPDATE customer_info SET salary=50000 WHERE id=5;

#SQL DELETE statement to delete any record
DELETE FROM customer_info where id = 5;

#SQL ALTER statement to make changes into existing table
ALTER TABLE customer_info add email varchar(30);
UPDATE customer_info set  email= 'abc@gmail.com' WHERE id=1;
UPDATE customer_info set  email= 'bbc@gmail.com' WHERE id=2;
UPDATE customer_info set  email= 'cbc@gmail.com' WHERE id=3;
UPDATE customer_info set  email= 'dbc@gmail.com' WHERE id=4;

ALTER TABLE customer_info ADD dob  date;

#ALTER table modify column
ALTER TABLE  customer_info MODIFY dob  year;
UPDATE customer_info SET dob=1995 WHERE id =1;
UPDATE customer_info SET dob=1996 WHERE id =2;
UPDATE customer_info SET dob=1997 WHERE id =3;
UPDATE customer_info SET dob=1998 WHERE id =4;
SELECT * FROM customer_info;

#SQL query to show schema
DESC customer_info;

#ALTER statement to drop column
ALTER TABLE customer_info DROP COLUMN email;







