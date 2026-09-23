create database bookmyshowdb;

use bookmyshowdb;

create table movie (
    movieid int primary key,
    moviename varchar(100),
    duration int,
    rating decimal(2,1),
    languages varchar(30)
);

insert into movie values
(121, 'baahubali: the beginning', 159, 4.8, 'telugu'),
(231, 'baahubali: the conclusion', 167, 5.0, 'telugu'),
(324, 'salaar: part 1 - ceasefire', 175, 4.7, 'telugu'),
(652, 'mirchi', 155, 4.8, 'telugu'),
(465, 'darling', 150, 4.6, 'telugu'),
(565, 'gabbar singh', 152, 4.9, 'telugu'),
(135, 'jalsa', 161, 4.8, 'telugu'),
(851, 'kushi', 177, 4.7, 'telugu'),
(895, 'thammudu', 162, 4.6, 'telugu'),
(235, 'attarintiki daredi', 175, 4.9, 'telugu');

select * from movie;

create table theater (
    theaterid int primary key,
    theatername varchar(100),
    locations varchar(100),
    totalscreens int,
    contactno varchar(15)
);

insert into theater values
(108, 'manam cinemas', 'tirupati', 8, '9856589542'),
(462, 'pkr', 'vizag', 6, '9865982221'),
(524, 'pkm', 'rly kodur', 8, '9826884524'),
(845, 'pkr cinemas', 'tirupati', 5, '9876548951'),
(125, 'pgr cinemas', 'bangalore', 9, '9876543214'),
(154, 'pnr cinemas', 'chennai', 8, '8964546523'),
(995, 'pvr cinemas', 'chittoor', 7, '7586554256'),
(589, 'sathyam cinemas', 'chennai', 5, '8562465517'),
(194, 'prathap', 'hyderabad', 5, '8645545135'),
(150, 'group theaters', 'tirupati', 4, '8888869519');

select * from theater;

create table customer (
    customerid int primary key,
    customername varchar(100),
    email varchar(100),
    phone varchar(15),
    city varchar(50)
);

insert into customer values
(7, 'nikhil', 'nikhil2@gmail.com', '8900025620', 'hyderabad'),
(45, 'dhanush', 'dhanush@gmail.com', '9253685451', 'tirupati'),
(22, 'guna', 'guna@gmail.com', '8900253625', 'vizag'),
(56, 'mujeeb', 'mujeeb@gmail.com', '8000025869', 'tirupati'),
(78, 'rahul', 'rahul@gmail.com', '8000251496', 'chennai'),
(48, 'karthik', 'karthik@gmail.com', '8960854120', 'tirupati'),
(65, 'sandeep', 'sandeep@gmail.com', '8965369841', 'chandragiri'),
(24, 'harsha', 'harsha@gmail.com', '8000521069', 'kodur'),
(62, 'mujeeb', 'mujeeb2@gmail.com', '9000002535', 'vizag'),
(58, 'vamsi', 'vamsi@gmail.com', '9008900006', 'tirupati'),
(73, 'nikhil', 'nikhil@gmail.com', '8900025600', 'nellore');


select * from customer;

create table shows (
    showid int primary key,
    movieid int,
    theaterid int,
    showtime time,
    screenno int,
    ticketprice int
);

insert into shows values
(53, 121, 108, '10:00:00', 1, 250),
(23, 231, 462, '11:22:00', 2, 270),
(15, 324, 524, '18:00:00', 3, 300),
(65, 652, 845, '18:00:50', 1, 260),
(35, 465, 125, '18:00:00', 2, 260),
(25, 565, 154, '15:00:00', 4, 250),
(66, 135, 995, '16:00:30', 2, 230),
(46, 851, 589, '18:00:00', 3, 500),
(45, 895, 194, '17:10:00', 1, 240),
(98, 235, 150, '10:00:00', 2, 220);

select * from shows;

create table booking (
    bookingid int primary key,
    customerid int,
    showid int,
    bookingdate date,
    seats int,
    totalamount int
);

insert into booking values
(81, 45, 53, '2026-01-01', 2, 500),
(82, 22, 45, '2025-04-30', 3, 720),
(53, 56, 23, '2019-06-23', 2, 540),
(64, 78, 65, '2024-08-04', 4, 1040),
(55, 65, 98, '2025-12-05', 2, 440),
(61, 48, 15, '2015-04-09', 3, 900),
(21, 78, 25, '2026-02-17', 2, 500),
(56, 65, 66, '2026-09-28', 4, 920),
(54, 24, 35, '2026-04-04', 2, 520),
(69, 62, 98, '2022-03-15', 3, 660);

select * from booking;

1.
select customername from customer where city='tirupati';

2.
select customername, phone from customer where city='hyderabad';

3.
select * from movie where languages='telugu';

4.
alter table movie add genre varchar(30);
update movie set genre='action';
select moviename, genre from movie where genre='action';


5.
select moviename from movie where duration > 150;

6.
select * from theater where locations='tirupati';

7.
select theatername, locations from theater where totalscreens > 3;

8.
alter table shows add showdate date;
update shows set showdate='2026-01-01';
select * from shows where showdate='2026-01-01';

9.
select showid, movieid, showtime from shows where showtime > '18:00:00';

10.
select * from booking where seats > 3;

11.
select bookingid, customerid, seats from booking where bookingdate > '2025-01-01';

12.
create table payment (
    paymentid int primary key,
    bookingid int,
    amount int,
    paymentmode varchar(20),
    paymentstatus varchar(20)
);
select * from payment where amount > 500;

13.
insert into payment values
(1,81,500,'UPI','Successful'),
(2,82,720,'Card','Pending'),
(3,53,540,'Cash','Successful'),
(4,64,1040,'UPI','Failed'),
(5,55,440,'UPI','Successful');
select paymentid, bookingid, paymentmode from payment where paymentmode='UPI';

14.
select * from payment where paymentstatus='Successful';

15.
select customername, email from customer where city='tirupati' or city='chennai';

16.
select moviename from movie where languages='telugu' and genre='action';


17.
select moviename from movie where duration > 120 and duration < 180;


18.
select * from customer where city='tirupati' and email like '%@gmail.com';


19.
select * from theater where locations='tirupati' or locations='hyderabad';

20.
select theatername from theater where totalscreens > 2 and locations='tirupati';

21.
select * from booking where seats >= 2 and seats <= 5;

22.
select bookingid, customerid from booking where bookingdate='2026-01-01' or seats > 4;


23.
select * from payment where amount > 500 and paymentstatus='Successful';

24.
select paymentid, amount, paymentmode from payment where paymentmode='UPI' or paymentmode='Card';

25.
select customername from customer where (city='tirupati' or city='hyderabad') and phone is not null;

26.
select customerid, customername from customer where city='tirupati';

27.
select moviename, languages, genre from movie where duration > 120;

28.
select theatername, locations, totalscreens from theater where totalscreens > 3;

29.
select showid, movieid, showtime from shows where showtime > '18:00:00';

30.
select paymentid, amount, paymentstatus from payment where amount > 2500;

31.
select c.customername, b.bookingid from customer c join booking b on c.customerid = b.customerid;

32.
select c.customername, c.phone, b.seats from customer c join booking b on c.customerid = b.customerid;

33.
select m.moviename, s.showtime from movie m join shows s on m.movieid = s.movieid;

34.
select m.moviename, m.languages, s.showdate from movie m join shows s on m.movieid = s.movieid;

35.
select t.theatername, s.showtime from theater t join shows s on t.theaterid = s.theaterid;

36.
select t.theatername, t.locations, s.showdate from theater t join shows s on t.theaterid = s.theaterid;

37.
select m.moviename, t.theatername from movie m join shows s on m.movieid = s.movieid join theater t on s.theaterid = t.theaterid;

38.
select m.moviename, t.theatername, t.locations from movie m join shows s on m.movieid = s.movieid join theater t on s.theaterid = t.theaterid where t.locations='tirupati';

39.
select c.customername, m.moviename, b.seats from customer c join booking b on c.customerid = b.customerid join shows s on b.showid = s.showid join movie m on s.movieid = m.movieid where b.seats > 2;

40.
select m.moviename, t.theatername, s.showtime from movie m join shows s on m.movieid = s.movieid join theater t on s.theaterid = t.theaterid where t.locations='tirupati' and s.showtime > '18:00:00';

41.
select c.customername, m.moviename, b.bookingdate from customer c join booking b on c.customerid = b.customerid join shows s on b.showid = s.showid join movie m on s.movieid = m.movieid where b.bookingdate > '2025-01-01';

42.
select m.moviename, t.theatername, t.locations from movie m join shows s on m.movieid = s.movieid join theater t on s.theaterid = t.theaterid where m.languages='telugu' and t.locations='tirupati';

43.
update customer set city='chittoor' where customerid=45;

44.
update movie set genre='action' where movieid=121;

45.
update theater set totalscreens = totalscreens + 1 where theaterid=108;

46.
update payment set paymentstatus='Successful' where paymentid=1;

47.
update payment set paymentmode='UPI' where paymentstatus='Pending' and amount < 500;

48.
delete from customer where customerid=7;

49.
delete from movie where duration < 90;

50.
delete from theater where totalscreens < 2 and locations='tirupati';

51.
delete from booking where seats=1 and bookingdate < '2025-01-01';

52.
delete from payment where paymentstatus='Failed' and amount < 300;

53.
update movie set duration = duration + 10 where duration < 120;

54.
update theater set totalscreens = totalscreens + 1 where totalscreens < 3;

55.
update theater set locations='tirupati' where locations='chittoor' and totalscreens >= 3;

56.
update movie set languages='telugu' where languages='english' and genre='drama';

57.
update movie set genre='action' where languages='telugu' and duration > 120;

58.
update shows set showtime='18:00:00' where showdate='2026-01-01' and showtime < '18:00:00';

59.
update booking set seats = seats + 1 where seats < 3;

60.
update booking set bookingdate='2026-01-01' where seats > 4 and bookingdate < '2025-01-01';

61.
update payment set paymentmode='UPI' where paymentmode='Cash';

62.
update payment set paymentstatus='Successful' where amount > 500 and paymentstatus='Pending';

63.
update payment set paymentstatus='Failed' where amount < 100 and paymentstatus='Pending';

64.
update payment set amount = amount + 100 where paymentmode='UPI' and amount < 2500;

65.
delete from customer where city='tirupati' and email like '%@gmail.com';

66.
delete from movie where languages='english' and duration > 180;

67.
delete from theater where (locations='hyderabad' or locations='chennai') and totalscreens < 3;

68.
delete from shows where showdate='2026-01-01' and showtime < '17:00:00';

69.
delete from booking where seats > 4 and bookingdate < '2025-01-01';

70.
delete from payment where amount > 1000 and paymentstatus='Failed';

