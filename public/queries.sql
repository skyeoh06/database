/* create a table */
create table book (
    id int not null auto_increment primary key,
    title varchar(200) not null,
    isbn varchar(20) not null
);

/*insert book */
insert into book(title, isbn) value('Lord Of the Rings', '123-a-123-x');

/*inset more than one*/
insert into book(title, isbn) value('Twilight', '1234-A'),
('Watership Down','237x');

/*delete item*/
delete from book where id=3;

/*update item*/
update author set first_name="Clark Staples" where id=2;

/*select*/
select*from author;

/*select only a few column from the table*/
select first_name, last_name from author;

/*select specific rows from the table*/
select * from author where nationality like "UK";
select first_name, last_name from author where nationality like "UK"

/*compounds*/
select * from author where first_name like "Lewix" and nationality like "UK";
select * from author where first_name like "Lewis" or nationality like "UK";

/* select all authors whose first name starts with "lew"*/
select * from author where first_name like "lew%"

/* select all authors whose first name ends with "lew"*/
select * from author where first_name like "%lew"

/* select all authors whose first name contains "lew" anywhere */
select * from author where first_name like "%lew%"

/*join*/
select lastName, firstName, city, country, addressLine1, addressLine2
from employees inner join offices on employees.officeCode=offices.officeCode

/*select all employees where their office in USA*/
SELECT * FROM employees join offices /*happen first*/
on employees.officeCode=offices.officeCode/*second*/
where country="USA"/*last*/

/*if have selected repeated column from two table*/
SELECT products.productCode,productName, orderNumber, quantityOrdered FROM products join orderdetails
on products.productCode=orderdetails.productCode;

/*joining three tables*/
SELECT * FROM products join orderdetails
on products.productCode=orderdetails.productCode
join orders
on orderdetails.orderNumber=orders.orderNumber

/*joining four tables*/
SELECT customerName, productName, quantityOrdered FROM products JOIN orderdetails
ON products.productCode = orderdetails.productCode
JOIN orders
ON orderdetails.orderNumber = orders.orderNumber
JOIN customers
ON orders.customerNumber = customers.customerNumber


/*grouping*/
select officeCode, count(*)from employees group by officeCode

/*count group by city*/
select city, count(*)from employees join offices
on employees.officeCode= offices.officeCode
group by city

/*select certain country group by city*/
select city, count(*)from employees join offices
on employees.officeCode= offices.officeCode
where country="USA"
group by city

/*swap the tables and sorting in descending order*/
select * from customers order by creditLimit desc

/*order of the select clause*/
select city, count(*)from employees join offices
on employees.officeCode= offices.officeCode
where country="USA"
group by city
order by count(*) desc
limit 2

/*order of all clause
1.join
2.where
3.group by
4.select
5.order by
6.limit
*/


/*limit*/
select * from customers order by creditLimit desc
limit 10

/*Aggregate function
1.sum - total
2.max
3.min
4.avg-average
*/
/*average credit limit from each country*/
select country, sum(creditLimit), from customers
group by country