
--Creating database named dbStudent
Create database dbStudent

--Using database dbStudent
use dbStudent

--Creating table named user_login
Drop table if exists user_login 
Create table user_login(
    user_id int primary key,
    user_password text,
    first_name varchar(50),
	last_name varchar(50),
	sign_up_on date,
	email_id text
);

--Creating table named parent_details
Drop table if exists parent_details
Create table parent_details (
	parent_id int primary key,
    father_first_name varchar(50),
	father_last_name varchar(50),
	father_email_id TEXT,
	father_mobile bigint,
	father_occupation varchar(50),
	mother_first_name varchar(50),
	mother_last_name varchar(50),
	mother_email_id TEXT,
	mother_mobile bigint,
	mother_occupation varchar(50)
);

--Creating table named teachers
Drop table if exists teachers
Create table teachers (
	teacher_id int primary key,
    first_name varchar(50),
	last_name varchar(50),
	date_of_birth date,
	email_id text,
	contact bigint,
	registration_date date,
	registration_id int not null,
);


--Creating table named class_details
Drop table if exists class_details
Create table class_details (
	class_id int primary key,
    class_teacher varchar(50),
	teacher_id int references teachers (teacher_id),
	class_year int
);


--Creating table named student_details
Drop table if exists student_details
Create table student_details (
	student_id int primary key,
    first_name varchar(50),
	last_name varchar(50),
	date_of_birth date,
	class_id int references class_details (class_id),
	roll_no int,
	email_id text,
	parent_id int references parent_details (parent_id),
	registration_date date,
	registration_id int not null
);

--Creating table named subject
Drop table if exists subject
Create table subject (
	subject_id int primary key,
    subject_name varchar(50),
	class_year int,
	subject_head varchar(50),
	teacher_id int references teachers (teacher_id)
);

--Creating table named subject_tutors
Drop table if exists subject_tutors
Create table subject_tutors (
	row_id int primary key,
    subject_id int references subject (subject_id),
	teacher_id int references teachers (teacher_id),
	class_id int references class_details (class_id)
);



insert into user_login (user_id, user_password, first_name, last_name, sign_up_on, email_id) values
(1, 'password123', 'Ram', 'Sharma', '2023-06-01', 'ramsharma@gmail.com'),
(2, 'password456', 'Sita', 'Gurung', '2023-06-15', 'sitagurung@gmail.com'),
(3, 'password789', 'Hari', 'Nepal', '2023-07-01', 'harinepal@gmail.com'),
(4, 'passwordabc', 'Gita', 'Bhandari', '2023-07-15', 'gitabhandari@gmail.com'),
(5, 'passworddef', 'Bikash', 'Rai', '2023-08-01', 'bikashrai@gmail.com'),
(6, 'passwordghi', 'Rita', 'Lama', '2023-08-15', 'ritalama@gmail.com'),
(7, 'passwordjkl', 'Kiran', 'KC', '2023-09-01', 'kirankc@gmail.com'),
(8, 'passwordmno', 'Prakash', 'Thapa', '2023-09-15', 'prakashthapa@gmail.com'),
(9, 'passwordpqr', 'Sunita', 'Magar', '2023-10-01', 'sunitamagar@gmail.com'),
(10, 'passwordstu', 'Ramesh', 'Karki', '2023-10-15', 'rameshkarki@gmail.com');

select * from user_login;


insert into parent_details (parent_id, father_first_name, father_last_name, father_email_id, father_mobile, father_occupation, mother_first_name, mother_last_name, mother_email_id, mother_mobile, mother_occupation) values
(1, 'Ram', 'Sharma', 'ramsharma@gmail.com', 9800000001, 'Engineer', 'Sita', 'Sharma', 'sita.sharma@gmail.com', 9800000002, 'Teacher'),
(2, 'Hari', 'Nepal', 'harinepal@gmail.com', 9800000003, 'Doctor', 'Gita', 'Nepal', 'gita.nepal@gmail.com', 9800000004, 'Nurse'),
(3, 'Ramesh', 'Karki', 'rameshkarki@gmail.com', 9800000005, 'Businessman', 'Sunita', 'Karki', 'sunita.karki@gmail.com', 9800000006, 'Homemaker'),
(4, 'Prakash', 'Thapa', 'prakashthapa@gmail.com', 9800000007, 'Lawyer', 'Mina', 'Thapa', 'mina.thapa@gmail.com', 9800000008, 'Accountant'),
(5, 'Bikash', 'Rai', 'bikashrai@gmail.com', 9800000009, 'Architect', 'Puja', 'Rai', 'puja.rai@gmail.com', 9800000010, 'Designer'),
(6, 'Krishna', 'Rana', 'krishnarana@gmail.com', 9800000011, 'Pilot', 'Anita', 'Rana', 'anita.rana@gmail.com', 9800000012, 'Banker'),
(7, 'Sanjay', 'Gautam', 'sanjaygautam@gmail.com', 9800000013, 'Professor', 'Binita', 'Gautam', 'binita.gautam@gmail.com', 9800000014, 'Lecturer'),
(8, 'Rajan', 'Shah', 'rajanshah@gmail.com', 9800000015, 'Chef', 'Rita', 'Shah', 'rita.shah@gmail.com', 9800000016, 'Hotel Manager'),
(9, 'Dipendra', 'Singh', 'dipendrasingh@gmail.com', 9800000017, 'Artist', 'Suman', 'Singh', 'suman.singh@gmail.com', 9800000018, 'Writer'),
(10, 'Manoj', 'Bista', 'manojbista@gmail.com', 9800000019, 'Software Developer', 'Gita', 'Bista', 'gita.bista@gmail.com', 9800000020, 'Data Analyst');

select * from parent_details;


insert into teachers (teacher_id, first_name, last_name, date_of_birth, email_id, contact, registration_date, registration_id) values
(1, 'Mohan', 'Adhikari', '1980-05-15', 'mohanadhikari@gmail.com', 9801000001, '2010-02-20', 1001),
(2, 'Sita', 'Lama', '1982-08-25', 'sitalama@gmail.com', 9801000002, '2011-03-15', 1002),
(3, 'Hari', 'Shrestha', '1978-11-10', 'harishrestha@gmail.com', 9801000003, '2009-04-18', 1003),
(4, 'Rita', 'Gurung', '1985-02-28', 'ritagurung@gmail.com', 9801000004, '2012-05-12', 1004),
(5, 'Krishna', 'Rai', '1983-07-19', 'krishnarai@gmail.com', 9801000005, '2013-06-25', 1005),
(6, 'Puja', 'Karki', '1981-12-05', 'pujakarki@gmail.com', 9801000006, '2014-07-30', 1006),
(7, 'Anita', 'Thapa', '1987-09-09', 'anitathapa@gmail.com', 9801000007, '2015-08-14', 1007),
(8, 'Ramesh', 'Bhandari', '1984-04-17', 'rameshbhandari@gmail.com', 9801000008, '2016-09-23', 1008),
(9, 'Sunita', 'Magar', '1986-06-22', 'sunitamagar@gmail.com', 9801000009, '2017-10-11', 1009),
(10, 'Manoj', 'Shah', '1989-01-30', 'manojshah@gmail.com', 9801000010, '2018-11-05', 1010);

select * from teachers;


insert into class_details (class_id, class_teacher, teacher_id, class_year) values
(1, 'Mohan Adhikari', 1, 2023),
(2, 'Sita Lama', 2, 2023),
(3, 'Hari Shrestha', 3, 2023),
(4, 'Rita Gurung', 4, 2023),
(5, 'Krishna Rai', 5, 2023),
(6, 'Puja Karki', 6, 2023),
(7, 'Anita Thapa', 7, 2023),
(8, 'Ramesh Bhandari', 8, 2023),
(9, 'Sunita Magar', 9, 2023),
(10, 'Manoj Shah', 10, 2023);

select * from class_details;


insert into student_details (student_id, first_name, last_name, date_of_birth, class_id, roll_no, email_id, parent_id, registration_date, registration_id) values
(1, 'Arun', 'Sharma', '2010-01-15', 1, 1, 'arunsharma@gmail.com', 1, '2023-06-01', 2001),
(2, 'Nita', 'Nepal', '2011-02-20', 2, 1, 'nitanepal@gmail.com', 2, '2023-06-02', 2002),
(3, 'Ravi', 'Karki', '2009-03-10', 3, 1, 'ravikarki@gmail.com', 3, '2023-06-03', 2003),
(4, 'Sima', 'Thapa', '2010-04-05', 4, 1, 'simathapa@gmail.com', 4, '2023-06-04', 2004),
(5, 'Bina', 'Rai', '2011-05-15', 5, 1, 'binarai@gmail.com', 5, '2023-06-05', 2005),
(6, 'Kiran', 'Rana', '2009-06-25', 6, 1, 'kiranrana@gmail.com', 6, '2023-06-06', 2006),
(7, 'Rita', 'Gautam', '2010-07-10', 7, 1, 'ritagautam@gmail.com', 7, '2023-06-07', 2007),
(8, 'Pradeep', 'Shah', '2011-08-30', 8, 1, 'pradeepshah@gmail.com', 8, '2023-06-08', 2008),
(9, 'Maya', 'Singh', '2010-09-25', 9, 1, 'mayasingh@gmail.com', 9, '2023-06-09', 2009),
(10, 'Aman', 'Bista', '2011-10-15', 10, 1, 'amanbista@gmail.com', 10, '2023-06-10', 2010);

select * from student_details


insert into subject (subject_id, subject_name, class_year, subject_head, teacher_id) values
(1, 'Mathematics', 2023, 'Mohan Adhikari', 1),
(2, 'Science', 2023, 'Sita Lama', 2),
(3, 'English', 2023, 'Hari Shrestha', 3),
(4, 'Nepali', 2023, 'Rita Gurung', 4),
(5, 'Social Studies', 2023, 'Krishna Rai', 5),
(6, 'Computer Science', 2023, 'Puja Karki', 6),
(7, 'Physical Education', 2023, 'Anita Thapa', 7),
(8, 'History', 2023, 'Ramesh Bhandari', 8),
(9, 'Geography', 2023, 'Sunita Magar', 9),
(10, 'Art', 2023, 'Manoj Shah', 10);

select * from subject;


insert into subject_tutors (row_id, subject_id, teacher_id, class_id) values
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6),
(7, 7, 7, 7),
(8, 8, 8, 8),
(9, 9, 9, 9),
(10, 10, 10, 10);

select * from subject_tutors;



  SQL Queries:


1)Retrieve all records from teachers
SELECT * FROM teachers;


2)Retrieve student details along with their class information
select * from student_details
select * from class_details
select s.first_name, s.last_name, s.email_id, c.class_teacher, c.class_year
from student_details s
join class_details c on s.class_id=c.class_id;


3)Retrieve teachers born after 1985 sorted by their registration date
select * from teachers
where date_of_birth> '1985'
order by registration_date;

4)Retrieve subjects taught by teacher 'Puja Karki'
select * from subject
select * from teachers

select s.subject_name
from subject s
join teachers t on s.teacher_id=t.teacher_id
where first_name='Puja' and last_name='Karki';

