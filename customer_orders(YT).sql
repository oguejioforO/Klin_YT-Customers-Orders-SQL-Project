-- Create database
create database klin_YT;
use klin_YT;

-- Create Customers table
create table customers(
id int NOT NULL AUTO_INCREMENT,
first_name varchar(30),
last_name varchar(30),
email varchar(30),
address varchar(30),
city varchar(30),
state varchar(30),
zipcode varchar(30),
primary key (id)
);


-- Insert sample customers
insert into customers (first_name, last_name, email, address, city, state, zipcode) values
('john','doe','jdoe@gmail.com','55 Main St', 'Boston','Massachusetts','01221'),
('Mike','Smith','Msmith@gmail.com','22 Birch lane', 'Amesbury','Massachusetts','01913'),
('Kathy','Morris','Kmorrish@gmail.com','40 williow st', 'Haverhill','Massachusetts','01868'),
('Steven','Samson','Ssamsom@gmail.com','12 Gills Rd', 'Amesbury','New Hampshire','01283'),
('Lilian','Davidson','liliand@gmail.com','7 Whittier st', 'Amesbury','New York','34883'),
('Derek','Williams','dwill@gmail.com','445 Madison ct', 'Amesbury','New York','34993');


-- Update a customer email
Update customers
set email = 'test@gamil.com'
Where id = 3;


-- DELECT A CUSTOMER COLUMN
Delete from customers
where id = 3;


-- ALTER table examples(used to add and delect a column)
-- Add a column
alter table customers
add testcol varchar(30);


-- change datatype for a column
alter table customers
modify column testcor int(20);
 
 -- to drop a column
 alter table customers
 drop column testcol;
 
 -- TO ADD COLUMN
 alter table customers
 add column age int;
 insert into customers (age) values (23),(45),(65),(77),(89),(67);
 
-- SELECT queries
 -- 1. To select all
 SELECT * from customers;
 
 -- 2. to select specific column
 select first_name,last_name from customers;
 

 -- 3. To select a specific customers
select * from customers where id = 3;
 
 -- 4. To sort the data
 select * from customers order by last_name;
 select * from customers order by last_name DESC;
 select * from customers order by last_name ASC;
 
 -- 5. To remove duplicates from a data
select distinct state from customers;
select * from customers where state in ('New york', 'New Hampshire');
 
-- Like operator id used to search
-- % is a wildcard meaning any letter and ends with n
select * from customers where city like '%n%';


-- INDEXES 
create index Cindex on customers (city);

-- relationships and foreign key
create table products(
id int NOT NULL AUTO_INCREMENT,
name varchar(30),
price int,
primary key (id)
);

create table orders(
id int NOT NULL AUTO_INCREMENT,
order_number int,
product_id int,
customer_id int,
order_date datetime default current_timestamp,
primary key (id),
foreign key (customer_id) references customers(id),
foreign key (product_id) references products(id));


-- JOINS

INSERT INTO products(name,price) values
('product one', 10),
('product two', 5),
('product three', 65),
('product four', 45),
('product five', 100);

insert into orders (order_number, product_id, customer_id) values
(001,1,4),
(002,3,1),
(004,1,1),
(005,1,2),
(006,1,1),
(007,4,6),
(008,4,4),
(009,2,5);


-- INNER JOIN(RETURNS ALL ROWS WITH AT LEAST ONE MaTCH IN BOTH TABLES)
SELECT customers.first_name, customers.last_name, orders.order_number
from customers
inner join orders
on customers.id = orders.customer_id
order by orders.order_number;

-- LEFT JOIN (RETURNS ROWS ON THE LEFT TABLES WITH MATCHING ROWS ON THE RIGHT TABLE)
select customers.first_name, customers.last_name, orders.order_number, orders.order_date
from customers
left join orders
on customers.id = orders.customer_id
order by customers.last_name;


-- RIGHT JOIN (RETURNS ROWS ON THE RIGHT TABLES WITH MATCHING ROWS ON THE LEFT TABLE)
select orders.order_number, customers.first_name, customers.last_name
from orders
right join customers
on orders.customer_id = customers.id
order by orders.order_number;

select orders.order_number, customers.first_name, customers.last_name, products.name
from orders
inner join products
on orders.product_id = products.id
inner join customers
on orders.customer_id = customers.id
order by orders.order_number;

-- Alises (used to give tables or columns a temporary name making it more readable)
select first_name As 'First Name', last_name As 'Last Name'
from customers;


-- To join two colunm together
select concat(first_name,' ', last_name) as 'Name', address, city, state 
from customers;

-- To join the addrees field together
select concat(first_name,' ', last_name) as 'Name', concat(address, ' ', city,' ' state) as Address 
from customers;

-- you can also join table
select o.id, o.order_date,c.first_name, c.last_name
from customers as c, orders as o;


select count(age) from customers;
select avg(age) from customers;
select min(age) from customers;
select sum(age) from customers;


select age, count(age)
from customers
where age > 30
group by age;

-- to capture age that appears more than ones
select age, count(age)
from customers
group by age
Having count(age) >= 2;

-- To change to uppercase 
select UCASE (first_name) from customers;
-- To change to lowercase 
select LCASE (first_name) from customers;