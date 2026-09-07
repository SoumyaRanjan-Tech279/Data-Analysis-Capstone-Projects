-- Creating Database for the project
create database if not exists sql_capstone_db ; 

-- Make the new database selected
use sql_capstone_db;

-- Creating tables needed under the Database
-- Sales Table
create table if not exists sales_order
(
order_number varchar(15) primary key,
order_date date not null,
customer_name_index int(5) not null,
foreign key(customer_name_index) references customers(customer_index),
distributer_channel varchar(15) not null,
currency_code varchar(3) not null,
warehouse_code varchar(8) not null,
delivery_region_index int(3) not null,
foreign key(delivery_region_index) references regions(region_index),
product_description_index int(3) not null,
foreign key(product_description_index) references products(product_index),
order_quantity int(3) not null,
unit_price decimal(15,3) not null,
line_total decimal(15,3) not null,
total_unit_cost decimal(15,3) not null
);

-- Customers Table
create table if not exists customers
(
customer_index int(4) primary key,
customer_names varchar(30) not null unique
);

-- Regions Table
create table if not exists regions
(
region_index int(3) primary key,
city varchar(30) not null,
country varchar(30) not null,
full_region varchar(60) not null
);

-- Products Table
create table if not exists products
(
product_index int(3) primary key,
product_name varchar(12) not null unique,
foreign key(product_name) references budgets_2017_table(prod_name)
);

-- 2017 Budgets Table
create table if not exists budgets_2017_table
(
prod_name varchar(12) primary key,
budget_2017 decimal(12,3)
);

-- checking data insertion
select * from budgets_2017_table;
select * from customers;
select * from products;
select * from regions;
select * from sales_order;


-- checking if connection is established among the tables;
select * from sales_order so join regions reg where so.delivery_region_index = reg.region_index;

select * from sales_order so join products pro where so.product_description_index = pro.product_index;

select * from sales_order so join customers cust where so.customer_name_index = cust.customer_index;

select * from products pd join budgets_2017_table bt where pd.product_name = bt.prod_name;
