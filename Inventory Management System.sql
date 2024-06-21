create database dbInventory
use dbInventory

drop table if exists user_login;
create table user_login (
	user_id int PRIMARY KEY,
    user_password TEXT, 
    first_name varchar(30),
	last_name varchar(30),
	sign_up_on DATE,
	email_id TEXT
);


DROP TABLE IF EXISTS supplier;
Create table supplier (
	supplier_id int primary key,
	supplier_name varchar(30),
	address text,
	registered_on date
);

drop table if exists product_items;
Create table product_items (
	item_id int PRIMARY KEY,
	item_code TEXT,
	item_name TEXT,
	item_type TEXT,
	item_description TEXT,
	brand_name TEXT,
	supplier_id int,
	constraint fk_pro_supp foreign key(supplier_id) REFERENCES supplier (supplier_id),
	cost_per_unit decimal,
	stock_count INT
);


drop table if exists purchase_orders;
Create table purchase_orders (
	order_id int primary key,
	item_id int, 
	supplier_id int, 
	order_date date,
	quantity int,
	delivery_date date,
	payment_id TEXT,
	constraint fk_pur_pro_item_id foreign key(item_id) references product_items (item_id),
	constraint fk_pur_supp_supplier_id foreign key(supplier_id) references supplier (supplier_id)
);


insert into user_login(user_id, user_password, first_name, last_name, sign_up_on, email_id) values
(101, 'abcd12s@', 'Arjun', 'Uranw', '2023-01-10', 'uranwarjunkumar227@gmail.com'),
(111, 'abuxhhdkjf11', 'Arun', 'Yadav', '2022-11-10', 'umesh021@gmail.com'),
(121, 'abcvvb2s@', 'Balen', 'Shah', '2023-11-11', 'bishalkumar201@gmail.com'),
(110, 'xyz@3#4vbnm', 'Rojina', 'Chaudhary', '2023-02-12', 'rollingarjun227@gmail.com'),
(123, 'jklio*$53v', 'Sanu', 'Biswas', '2024-03-03', 'kumarsanu204@gmail.com'),
(124, 'axyd123s@#', 'Binu', 'Newar', '2024-03-11', 'binunewari17@gmail.com');

select * from user_login

insert into supplier(supplier_id, supplier_name, address, registered_on) values
(5001, 'Tulasi Uranw', 'Tanamuna-11, Sunsari', '2022-09-11'),
(5003, 'Sushila Khawas', 'Duhabi-11, Sunsari', '2022-09-12'),
(5006, 'Tula Biswas', 'Biratnagar-11, Morang ', '2022-09-13'),
(5007, 'Susmita Rai', 'Damak-12, Jhapa', '2022-09-14'),
(5011, 'Sagar Chapagain', 'Itahari-12, Sano Galli', '2022-09-15');

select * from supplier

insert into product_items(item_id, item_code, item_name, item_type, item_description, brand_name, supplier_id,
cost_per_unit, stock_count) values
(301, 'A123', 'Wireless Mouse', 'Electronics', 'Ergonomic wireless mouse with adjustable DPI.', 'Logitech', 5011,
250, 12),
(311, 'B456', 'Bluetooth Speaker', 'Electronics', 'Portable Bluetooth speaker with 10-hour battery life.', 'JBL', 
5007, 5000, 15),
(321, 'C789', 'Running Shoes', 'Footwear', 'Lightweight running shoes with breathable mesh.', 'Nike', 
5001, 50, 25),
(331, 'D012', 'Ceramic Mug', 'Kitchenware', '12oz ceramic mug with a custom design.', 'Generic', 
5003, 100, 5),
(341, 'E345', 'Notebook', 'Stationery', '200-page ruled notebook with a durable cover.', 'Moleskine', 
5006, 150, 50),
(351, 'F678', 'LED Desk Lamp', 'Home Office', 'Adjustable LED desk lamp with touch controls.', 'Philips', 
5007, 50, 250),
(361, 'G901', 'Yoga Mat', 'Fitness', 'Non-slip yoga mat with a carry strap.', 'Manduka', 
5003, 20, 1650),
(371, 'H234', 'Coffee Maker', 'Kitchen Appliances', 'Drip coffee maker with a programmable timer.', 'Keurig', 
5001, 120, 250),
(381, 'I567', 'Water Bottle', 'Accessories', 'Stainless steel water bottle with a 1-liter capacity.', 'Hydro Flask', 
5011, 10, 150),
(391, 'J890', 'Smart Watch', 'Wearable Tech', 'Smart watch with fitness tracking and notifications.', 'Apple', 
5006, 110, 1050);

select * from product_items;

insert into purchase_orders(order_id, item_id, supplier_id, order_date, quantity, delivery_date, payment_id) values
(2001, 301, 5011, '2024-05-01', 50, '2024-05-05', '1111'),
(2002, 311, 5007, '2024-05-02', 100, '2024-05-07', '2222'),
(2003, 321, 5001, '2024-05-03', 30, '2024-05-08', '3333'),
(2004, 331, 5003, '2024-05-04', 200, '2024-05-09', '4444'),
(2005, 341, 5006, '2024-05-05', 35, '2024-05-10', '5555'),
(2006, 351, 5007, '2024-05-06', 70, '2024-05-11', '6666'),
(2007, 361, 5003, '2024-05-07', 40, '2024-05-12', '7777'),
(2008, 371, 5001, '2024-05-08', 20, '2024-05-13', '8888'),
(2009, 381, 5011, '2024-05-09', 25, '2024-05-14', '9999'),
(2010, 391, 5006, '2024-05-10', 10, '2024-05-15', '1010');

select * from purchase_orders



SQL queries:

--1) Select all product items with low stock count

select item_id, item_name, stock_count
from product_items
where stock_count<50;

--2) Retrieve all users who signed up in 2024

SELECT * FROM user_login
WHERE YEAR(sign_up_on) = 2024;

--3) List all suppliers from Sunsari:
select * from supplier
select * from product_items
where address like '%Sunsari%';

--4) Get all product items supplied by 'Sushila Khawas'
select p.*
From product_items p
join supplier s ON p.supplier_id=s.supplier_id
where supplier_name='Sushila Khawas';

--5) Retrieve all purchase orders with a quantity greater than 50
select * from purchase_orders where quantity>50;

--6) List all products that are currently out of stock
SELECT * FROM product_items
WHERE stock_count = 0;

