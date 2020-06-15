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