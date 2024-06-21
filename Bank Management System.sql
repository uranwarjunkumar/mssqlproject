
--Creating database
create database dbBank;

--Using database
use dbBank;

--Droping Schema
drop schema if exists bank_management;

--Creating Schema
create schema bank_management;

--drop table if exists bank_management.customer_personal_info;
--Creating table named bank_management.customer_personal_info
create table bank_management.customer_personal_info(
customer_id int not null primary key identity,
customer_name varchar(30),
date_of_birth date,
guardian_name varchar(30),
address varchar(50),
contact_no bigint,
mail_id varchar(30),
gender char,
martial_status varchar(10),
identification_doc_type varchar(20),
id_doc_no int not null,
citizenship varchar(10)
);


--drop table if exists bank_management.customer_reference_info;
--Creating table named bank_management.customer_reference_info
create table bank_management.customer_reference_info(
customer_id int not null primary key identity,
reference_acc_name varchar(20),
reference_acc_no bigint,
reference_acc_address varchar(50),
relation varchar(25),
constraint fk_per_ref_info foreign key(customer_id) references bank_management.customer_personal_info(customer_id)
);


--drop table if exists bank_management.bank_info;
--Creating table named bank_management.bank_info
create table bank_management.bank_info(
ifsc_code varchar(20) primary key,
bank_name varchar(50),
branch_name varchar(50),
);


--drop table if exists bank_management.account_info;
--Creating table named bank_management.account_info
create table bank_management.account_info(
account_no bigint primary key,
customer_id int not null,
account_type varchar(10),
registration_date date,
activation_date date,
ifsc_code varchar(20),
interest decimal(7,2),
initial_deposit bigint,
constraint fk_acc_per_info foreign key(customer_id) references bank_management.customer_personal_info(customer_id),
constraint fk_acc_bank_info foreign key(ifsc_code) references bank_management.bank_info(ifsc_code)
);


INSERT INTO bank_management.customer_personal_info (customer_name, date_of_birth, guardian_name, address, contact_no,
mail_id, gender, martial_status, identification_doc_type, id_doc_no, citizenship) VALUES 
('Ram Shrestha', '1995-01-01', 'Krishna Shrestha', 'Kathmandu, Nepal', 9801234567, 'ramshrestha@gmail.com', 'M',
'Married', 'Citizenship Card', 123456789, 'Nepali'),
('Sita Sharma', '1990-05-15', 'Hari Sharma', 'Pokhara, Nepal', 9807654321, 'sitasharma@gmail.com', 'F',
'Single', 'Passport', 987654321, 'Nepali'),
('Gita Gurung', '1980-03-30', 'Mani Gurung', 'Lalitpur, Nepal', 9801122334, 'gitagurung@gmail.com', 'F', 
'Married', 'Driving License', 234567890, 'Nepali'),
('Hari Acharya', '1975-12-22', 'Bishnu Acharya', 'Bhaktapur, Nepal', 9809988776, 'hariacharya@gmail.com', 'M', 
'Married', 'Citizenship Card', 345678901, 'Nepali'),
('Radha Koirala', '1992-07-08', 'Madan Koirala', 'Biratnagar, Nepal', 9808877665, 'radhakoirala@gmail.com', 'F',
'Single', 'Passport', 456789012, 'Nepali');

select * from bank_management.customer_personal_info


INSERT INTO bank_management.customer_reference_info (reference_acc_name, reference_acc_no, 
reference_acc_address, relation) VALUES ('Shyam Shrestha', 1234567890123456, 'Kathmandu, Nepal', 'Brother'),
('Gopal Sharma', 2345678901234567, 'Pokhara, Nepal', 'Father'),
('Suman Gurung', 3456789012345678, 'Lalitpur, Nepal', 'Brother'),
('Rita Acharya', 4567890123456789, 'Bhaktapur, Nepal', 'Wife'),
('Mina Koirala', 5678901234567890, 'Biratnagar, Nepal', 'Sister');

select * from bank_management.customer_reference_info


INSERT INTO bank_management.bank_info (ifsc_code, bank_name, branch_name) VALUES 
('SCBNL0003', 'Standard Chartered Bank Nepal', 'Lalitpur Branch'),
('RBB0002', 'Rastriya Banijya Bank', 'Pokhara Branch'),
('NABIL0004', 'Nabil Bank', 'Bhaktapur Branch'),
('HBL0005', 'Himalayan Bank Limited', 'Biratnagar Branch'),
('NBL0001', 'Nepal Bank Limited', 'Kathmandu Branch');

select * from bank_management.bank_info


INSERT INTO bank_management.account_info (account_no, customer_id, account_type, registration_date, activation_date,
ifsc_code, interest, initial_deposit) VALUES 
(1000000002, 2, 'Current', '2024-02-01', '2024-02-02', 'RBB0002', 3.75, 100000),
(1000000003, 3, 'Savings', '2024-03-01', '2024-03-02', 'SCBNL0003', 4.00, 75000),
(1000000014, 4, 'Savings', '2023-02-01', '2023-02-02', 'NABIL0004', 4.10, 55000),
(1000000015, 5, 'Fixed', '2023-03-01', '2023-03-05', 'HBL0005', 5.75, 180000),
(1000000006, 1, 'Current', '2024-06-01', '2024-06-02', 'NBL0001', 3.50, 150000);

select * from bank_management.account_info

 
 SQL Queries:

--1) Retrieve all accounts with a specific interest rate
select * from bank_management.account_info where interest=4.10

--2) Retrieve all customers who have a 'Savings' account
select customer_personal_info.customer_name, account_info.account_no, account_info.account_type
from bank_management.customer_personal_info 
join bank_management.account_info  ON customer_personal_info.customer_id = account_info.customer_id
where account_info.account_type = 'Savings';

--3) Retrieve all accounts created in 2024
select * from bank_management.account_info where year(registration_date)=2024;

--4) Retrieve customer information and their account details
select * from bank_management.customer_personal_info
select * from bank_management.account_info

select c.customer_name, c.address, c.contact_no, a.account_no, a.account_type, a.initial_deposit
from bank_management.customer_personal_info c
join bank_management.account_info a 
on c.customer_id = a.customer_id;

