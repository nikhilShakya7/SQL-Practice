use sakila;
-- Data type validation/ Customer table should contain an email column / Column Exists
describe customer;

-- Primary key validation/ customer_id must be primary key
show create table customer;

-- 
show index from customer;


-- Long method
--  check number of column in table
select count(*) as number_of_column
from information_schema.columns
where table_name= 'customer';

select count(*) as number_of_column
from information_schema.columns
where table_name= 'actor';

select count(*) as number_of_column
from information_schema.columns
where table_name="film";

-- check column names
select column_name from 
information_schema.columns
where table_name="customer";

select column_name from 
information_schema.columns
where table_name='film';

-- check data types of column
select column_name, data_type from
information_schema.columns
where table_name='customer';

select column_name, data_type from
information_schema.columns where
table_name='film';


-- check size of column
select column_name, column_type from 
information_schema.columns
where table_name='customer';

select column_name, column_type from 
information_schema.columns where
table_name='rental';

-- check null fields
select column_name, is_nullable
from information_schema.columns
where table_name='customer';

select column_name, is_nullable from 
information_schema.columns where
table_name='film';


-- check column keys
select column_name, column_key from
information_schema.columns
where table_name='customer';

select column_name, column_key from
information_schema.columns
where table_name='film';

--
-- Level 1: Basic Schema Validation
-- Count the number of columns in the customer table.
select count(*) as no_of_column  from 
information_schema.columns 
where table_name="customer";

-- List all column names of the film table.
select column_name from 
information_schema.columns
where table_name='film';

-- 3. Find the data type of the email column in the customer table.
select column_name, data_type
from information_schema.columns
where table_name='customer'
and column_name='email';

-- 4. Find all columns in the customer table that are NOT NULL.
select column_name 
from informaion_schema.columns
where table_name="customer"
and is_nullable="NO";

-- 5. Find all nullable columns in the film table.
select column_name, is_nullable
from information_schema.columns
where is_nullable="YES";

-- 6. Verify whether customer_id is the Primary Key.
select column_name, column_key
from information_schema.columns
where table_name='customer'
and column_name='customer_id';

-- Count the total number of tables in Sakila.
select  count(*) as total_tables
 from information_schema.columns
where table_schema='sakila';








