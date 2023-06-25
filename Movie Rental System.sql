create database MovieRentalSystem

--1
create table Distributor (
DistributorID int primary key,
DistributorName varchar(50) not null,
DistributorAddress varchar(255) not null,
DistributorPhoneNumber varchar(50) not null
);

--2
create table Store (
StoreID int primary key,
StoreName varchar(50),
StoreAddress varchar(255),
StorePhoneNumber varchar(50),
DistributorID int not null foreign key references Distributor(DistributorID)
);

--3
create table Movie (
MovieID int primary key,
MovieTitle varchar(50),
MovieDescr varchar(255),
DirectorName varchar(50),
NameOfMajorStar varchar(50),
MovieRating decimal(10, 1)
);

--4
create table Tape (
TapeID int primary key,
TapeCondition varchar(50) not null,
MovieInfo varchar(50) not null,
RentalStatus varchar(50) not null,
StoreID int not null foreign key references Store(StoreID),
MovieID int not null foreign key references Movie(MovieID)
);

--5
create table Manager (
ManagerID int primary key,
ManagerName varchar(50) not null,
ManagerSIN varchar(50) not null,
ManagerWorkplace varchar(50) not null,
ManagerAddress varchar(255) not null,
ManagerPhoneNumber varchar(50) not null,
DateOfAppointment date not null,
StoreID int not null foreign key references Store(StoreID)
);

--6
create table Employee (
EmployeeID int primary key,
EmployeeName varchar(50) not null,
EmployeeSIN varchar(50) not null,
EmployeeWorkplace varchar(50) not null,
EmployeeAddress varchar(255) not null,
EmployeePhoneNumber varchar(50) not null,
DateOfEmployment date not null,
ManagerID int not null foreign key references Manager(ManagerID),
StoreID int not null foreign key references Store(StoreID)
);

--7
create table Customer (
CustomerID int primary key,
CustomerName varchar(50) not null,
CustomerAddress varchar(255) not null,
CustomerPhoneNumber varchar(50) not null
);

--8
create table Payment (
PaymentID int primary key,
PaymentAmount decimal(10, 2) not null,
PaymentDate date,
PaymentTime time,
PaymentType varchar(20),
EmployeeID int not null foreign key references Employee(EmployeeID),
CustomerID int not null foreign key references Customer(CustomerID)
);

--9
create table MovieRental (
OrderID int primary key,
RentalDate date not null,
RentalTime time not null,
RentalStatus varchar(20) not null,
DueDate date not null,
OverdueCharge decimal(10, 2),
RentalRate decimal(10, 1),
CustomerID int not null foreign key references Customer(CustomerID),
EmployeeID int not null foreign key references Employee(EmployeeID),
PaymentID int foreign key references Payment(PaymentID),
StoreID int not null foreign key references Store(StoreID),
TapeID int not null foreign key references Tape(TapeID)
);

--10
create table Rented (
TapeID int foreign key references Tape(TapeID),
StatusDesc varchar(50),
primary key(TapeID)
);

create table Returned (
TapeID int foreign key references Tape(TapeID),
StatusDesc varchar(50),
primary key(TapeID)
);

create table ReturnedLate (
TapeID int foreign key references Tape(TapeID),
StatusDesc varchar(50),
primary key(TapeID)
);

create table Cash (
PaymentID int foreign key references Payment(PaymentID),
ReceiptNum varchar(50),
primary key(PaymentID)
);

create table CCheck (
PaymentID int foreign key references Payment(PaymentID),
AccNumber varchar(50),
primary key(PaymentID)
);

create table CreditCard (
PaymentID int foreign key references Payment(PaymentID),
CCardNumber varchar(50),
primary key(PaymentID)
);

create table DebitCard (
PaymentID int foreign key references Payment(PaymentID),
DCardNumber varchar(50),
primary key(PaymentID)
);

insert into Customer values
(1, 'Abdurahman Drake', '10, Lorong 40N, Seri Kerinchi, 34405 Parit Buntar, Perak Darul Ridzuan', '015-2331246'),
(2, 'Fajar binti Uda', 'No. 24, Jalan Genting Klang 9/93I, Kampung Ria, 16074 Salor, Kelantan', '016-6740078'),
(3, 'Chahaya binti Sagari', '78, Jalan 9/67K, Taman Rahman, 41369 Dengkil, Selangor', '015-4626767'),
(4, 'Hayati binti Budiarto', '44, Jln 1/4D, Seri Setia Jaya, 08732 Sintok, Kedah', '015-2602860'),
(5, 'Waleeda bin Linda', '22, Jalan Vermont 4V, Kampung Baru Medan, 46662 Ulu Klang, Selangor Darul Ehsan' , '018-1574499'),
(6, 'Jia Spence', 'No. 2, Lorong 5/3, Petaling Rahmat, 39047 Lanchang, Pahang' , '015-2130318'),
(7, 'Kang Phong Sit', '3, Jalan Wisma Putra 6U, Kampung Bendahara, 17767 Rantau Panjang, Kelantan', '015-2182081'),
(8, 'G. Shree', 'No. C-00-16, Jln Madras 2/6X, Sri Ria, 76273 Ramuan China, Malacca', '019-2418712'),
(9, 'Bernard Mah Jing Sung' , '31, Jalan 9J, Kota Medan, 17626 Bunut Payong, Kelantan Darul Naim' , '013-4488010'),
(10, 'Aw Beh Yut' , '5-5, Lorong Ampang 5, Bandar Country Heights, 32562 Jelapang, Perak', '015-6577142'),
(11, 'Putri Nazar' , '10, Jln Yew 7O, Bandar Aman, 09494 Kuah, Kedah' , '010-8026319')

insert into Distributor values
(1, 'American Movie', '228, Jalan 2/1, Damansara Timur, 56354 Sri Petaling, WP Kuala Lumpur', '08225-6797'),
(2, 'Rengvo', '1S-49, Jalan 7/26, Seksyen 48, 82362 Iskandar Puteri, Johor Darul Ta''zim', '07224-5542'),
(3, 'Mega Big', '999, Lorong Bijih Timah 3/9, PJS1, 14358 Batu Kawan, Penang', '032694-9649'),
(4, 'M & R', '75, Jalan Lembah Permai 3/27, PJU39, 26623 Pekan, Pahang', '09622-2673'),
(5, 'Wirmon', '8-4, Jalan 8/62T, Seksyen 94, 71639 Pedas, Negeri Sembilan', '07232-8411'),
(6, 'Zynaty', '4U-47, Jln Ampang Hilir 3/31O, Taman Putra, 75058 Klebang, Malacca', '04917-6803'),
(7, 'Dravmo', '9, Jalan Hang Lekiu, Seksyen 1, 02630 Padang Besar, Perlis', '04399-9744'),
(8, 'Cheap Box', '24, Jln Chow Kit 8/17, Pangsapuri Setia Jaya, 72904 Rompin, Negeri Sembilan', '04468-3522'),
(9, 'Big Movie', '753, Jalan 9/3, USJ 14U, 36769 Taiping, Perak', '09701-2140'),
(10, 'SignifiRental', '73, Jalan Faraday 9/14Z, SS22L, 70031 Gemas, Negeri Sembilan' , '09955-1599')

insert into Store values
(1, '1st Johor', '25, Jln Mohana Chandran 5/40D, Taman Medan, 84468 Larkin, Johor', '09743-2508', 1),
(2, '2nd Johor', '32, Jalan 9/1, Bandar Genting, 82252 Ulu Tiram, Johor', '05366-8736', 1),
(3, '1st Negeri Sembilan', 'Lot 16, Jalan Serian 1 2/55, Alam Changkat, 72661 Sungai Gadut, Negeri Sembilan Darul Khusus', '04771-4410', 2),
(4, '2nd Negeri Sembilan', 'Lot 4-1, Lorong 2, Bandar Mutiara, 70209 Pengkalan Kempas, Negeri Sembilan Darul Khusus', '08876-2577', 3),
(5, '1st Selangor', '78, Jalan Sultan Azlan Shah 3, Bandar Antarabangsa, 43382 Paya Jaras, Selangor', '033341-7767', 4),
(6, '1st Terengganu', 'No. 8, Lorong Mohana Chandran, Batu Utara, 21297 Merchang, Terengganu', '033181-2505', 5),
(7, '1st Malacca', 'Lot P-55-24, Jalan Sin Chee 13A, Seksyen 6, 77556 Umbai, Malacca', '08782-1281', 6),
(8, '1st Perak', '36, Lorong Sin Chee 3, Pangsapuri Sentosa, 30517 Simpang Pulai, Perak', '07771-7820', 7),
(9, '1st Pahang', '7, Jalan Dato''Keramat, Seksyen 7, 39159 Teriang, Pahang', '034252-6653', 8),
(10, '1st Kedah', '622, Lorong 2/6, Taman Rahman, 09466 Kuala Ketil, Kedah', '09478-9933', 9),
(11, '2nd Kedah', '1M-01, Lorong Kuching 1/24, Taman Putra, 07386 Baling, Kedah Darul Aman', '05533-5799', 10)

insert into Movie values
(1, 'The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'Frank Darabont', 'Tim Robbins', 9.3),
(2, 'The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'Francis Ford Coppola', 'Marlon Brando', 9.2),
(3, 'The Godfather: Part II', 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.', 'Francis Ford Coppola', 'Al Pacino', 9.0),
(4, 'The Dark Knight', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 'Christopher Nolan', 'Christian Bale', 9.0),
(5, '12 Angry Men', 'A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.', 'Sidney Lumet', 'Martin Balsam', 9.0),
(6, 'Schindler''s List', 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', 'Steven Spielberg', 'Liam Neeson', 8.9),
(7, 'The Lord of the Rings: The Return of the King', 'Gandalf and Aragorn lead the World of Men against Sauron''s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 'Peter Jackson', 'Elijah Wood', 8.9),
(8, 'Pulp Fiction', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'Quentin Tarantino', 'John Travolta', 8.9),
(9, 'The Good, the Bad and the Ugly', 'A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.', 'Sergio Leone', 'Clint Eastwood', 8.8),
(10, 'The Lord of the Rings: The Fellowship of the Ring', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 'Peter Jackson', 'Elijah Wood', 8.8),
(11, 'Forrest Gump', 'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate and other historical events unfold through the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.', 'Robert Zemeckis', 'Tom Hanks', 8.8),
(12, 'Inception', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 'Christopher Nolan', 'Leonardo DiCaprio', 8.8)

insert into Tape values
(1, 'Good', 'Drama', 'Borrowed', 1, 1),
(2, 'Poor', 'Crime', 'Borrowed', 1, 2),
(3, 'Poor', 'Crime', 'Borrowed', 2, 3),
(4, 'Excellent', 'Action', 'Borrowed', 3, 4),
(5, 'Bad', 'Crime', 'Free', 4, 5),
(6, 'Good', 'Biography', 'Free', 5, 6),
(7, 'Good', 'Adventure', 'Borrowed', 6, 7),
(8, 'Good', 'Crime', 'Free', 7, 8),
(9, 'Poor', 'Western', 'Borrowed', 8, 9),
(10, 'Good', 'Adventure', 'Free', 9, 10),
(11, 'Good', 'Drama', 'Borrowed', 10, 11),
(12, 'Excellent', 'Sci-Fi', 'Free', 11, 12)

insert into Manager values
(1, 'Meriam bin Zamrud', '343913380', '1st Johor', 'Lot 8, Jln Sultan Azlan Shah 5/4M, PJU8, 84973 Skudai, Johor', '015-2256522', '11/3/1990', 1),
(2, 'Woon Peh Sang', '490799665', '2nd Johor', '5P-51, Jalan Perak 5/81D, Bandar Selatan, 79379 Desaru, Johor', '015-3440792', '6/21/1995', 2),
(3, 'Yau Peng Pin', '022907604', '1st Negeri Sembilan', 'No. 39, Jalan 9/8, Bandar Hartamas, 71909 Dangi, Negeri Sembilan Darul Khusus', '016-4118549', '12/31/1989', 3),
(4, 'New Bai Qiu', '022926596', '2nd Negeri Sembilan', '66, Jalan 7/55V, Apartment Sungai Buaya, 71627 Sungai Gadut, Negeri Sembilan Darul Khusus', '016-6122275', '1/27/2000', 4),
(5, 'Azura bin Manjalara', '842916496', '1st Selangor', 'E-77-65, Jln 8/3V, Bandar Timur, 43048 Batang Kali, Selangor', '018-7002967', '6/17/1996', 5),
(6, 'D. S. Devaser', '825378359', '1st Terengganu', 'Lot 4, Jln Zainal Abidin 6/9, Taman Desa Tengah, 23891 Pasir Raja, Terengganu', '015-6541027', '4/13/1994', 6),
(7, 'Waiy Thok Phang', '058083684', '1st Malacca', 'No. 2, Jln 62Y, Kota Rahmat, 76448 Klebang, Malacca', '018-8647835', '10/31/1993', 7),
(8, 'Maya bin Izzati', '459376950', '1st Perak', 'No. 57, Jln Ariffin, Damansara Perdana, 30358 Bukit Gantang, Perak Darul Ridzuan', '015-4076367', '10/15/1994', 8),
(9, 'Puspawati binti Sulung', '716820675', '1st Pahang', 'Lot 4-2, Jalan 40M, PJU80, 39067 Raub, Pahang', '017-4461938', '5/22/1998', 9),
(10, 'Janet Luo Duo Ngah', '016846487', '1st Kedah', '24, Jalan 47J, PJU93, 05136 Kuah, Kedah', '017-2946102', '7/31/1999', 10),
(11, 'Sakri Sharif', '967105636', '2nd Kedah', '6-6, Lorong Parlimen 6/52P, Damansara Manggis, 09809 Yan, Kedah', '015-5370656', '3/3/2004', 11)

insert into Employee values
(1, 'Teh Fui Looi', '126023068', '1st Johor', '9M-25, Jalan Sultan Sulaiman 2/1Q, Kota Utara, 85115 Senai, Johor Darul Ta''zim', '018-987 7174', '9/23/1991', 1, 1),
(2, 'Wong Kei Chua', '242263754', '2nd Johor', '55, Jln 8/9K, Bukit Kinrara, 82218 Sri Gading, Johor', '012-401 7635', '5/26/1993', 2, 2),
(3, 'Manjalara bin Tipah', '277751343', '1st Negeri Sembilan', '83, Jln 1/80, PJU41F, 72323 Ampangan, Negeri Sembilan', '015-981 1856', '9/3/1993', 3, 3),
(4, 'Mahura binti Baba', '438315657', '2nd Negeri Sembilan', 'No. 75, Jalan 9Z, SS8, 73431 Kuala Pilah, Negeri Sembilan', '015-599 4629', '6/8/1994', 4, 4),
(5, 'Katijah binti Selamat', '036576155', '1st Selangor', '77, Jln Kia Peng 54Q, PJS71G, 41287 Sekinchan, Selangor Darul Ehsan', '015-981 3482', '8/11/1995', 5, 5),
(6, 'Koh Gun Kum', '089486237', '1st Terengganu', '60, Lorong Genting Klang 1F, USJ 2, 22230 Kijal, Terengganu Darul Iman', '015-389 1217', '10/24/1996', 6, 6),
(7, 'Faza binti Wan Agus', '863474516', '1st Malacca', '9, Jln 9/6V, Bandar Bestari, 76102 Umbai, Malacca', '015-419 0768', '10/12/1997', 7, 7),
(8, 'Xia Tar Peik', '856135256', '1st Perak', 'No. 2Y-51, Jln 57F, PJU46N, 33790 Tanjung Rambutan, Perak', '010-680 5902', '12/27/1997', 8, 8),
(9, 'Chow Ki Thu', '519524912', '1st Pahang', '9-1, Jln 2/76N, Pangsapuri Casa, 27675 Genting Highlands, Pahang', '018-511 3952', '6/3/1998', 9, 9),
(10, 'R. S. Pillay', '931240857', '1st Kedah', '83, Jalan 3/8, USJ 6, 08740 Kepala Batas, Kedah Darul Aman', '015-310 3044', '10/31/2000', 10, 10),
(11, 'Low Mel Mew', '750220600', '2nd Kedah', 'No. 23, Jalan 7/3F, SS2, 05253 Sintok, Kedah Darul Aman', '015-976 8698', '1/10/2002', 11, 11)

insert into Payment values
(1, 35.00, '7/4/2019', '10:40:00', 'D', 1, 1),
(2, 35.00, '7/22/2019', '11:30:00', 'E', 1, 2),
(3, 50.00, '8/12/2019', '15:30:00', 'F', 2, 3),
(4, 65.00, '11/6/2019', '16:10:00', 'G', 3, 3),
(5, 45.00, '11/7/2019', '16:50:00', 'D', 5, 4),
(6, 80.00, '12/6/2019', '10:15:00', 'E', 5, 6),
(7, 50.00, '4/7/2020', '11:50:00', 'F', 7, 6),
(8, 100.00, '6/23/2020', '13:45:00', 'G', 8, 7),
(9, 35.00, '8/14/2020', '14:40:00', 'D', 9, 8),
(10, 45.00, '9/8/2020', '16:20:00', 'E', 10, 9)

insert into MovieRental values
(1, '7/1/2019', '09:15:00', 'Returned In Time', '10/1/2019', 0.00, 35.00, 1, 1, 1, 7, 8),
(2, '7/19/2019', '12:15:00', 'Rented', '10/19/2019', null, 35.00, 2, 1, 2, 3, 4),
(3, '8/10/2019', '13:55:00', 'Returned In Time', '11/10/2019', 0.00, 50.00, 3, 2, 3, 5, 6),
(4, '11/1/2019', '15:40:00', 'Returned Lated', '2/1/2020', 10.00, 65.00, 3, 3, 4, 9, 10),
(5, '11/1/2019', '16:25:00', 'Rented', '2/1/2020', null, 45.00, 4, 5, 5, 1, 1),
(6, '12/5/2019', '12:45:00', 'Rented', '3/5/2020', null, 80.00, 6, 5, 6, 2, 3),
(7, '4/4/2020', '13:00:00', 'Returned Lated', '7/4/2020', 15.00, 50.00, 6, 7, 7, 4, 5),
(8, '6/18/2020', '14:15:00', 'Rented', '9/18/2020', null, 100.00, 7, 8, 8, 1, 2),
(9, '8/14/2020', '09:45:00', 'Returned In Time', '11/14/2020', 0.00, 35.00, 9, 8, 9, 11, 12),
(10, '9/6/2020', '15:00:00', 'Rented', '12/6/2020', null, 45.00, 9, 10, 10, 8, 9)

insert into Rented values
(1, 'Borrowed'),
(2, 'Borrowed'),
(3, 'Borrowed'),
(4, 'Borrowed'),
(7, 'Borrowed'),
(9, 'Borrowed'),
(10, 'Borrowed'),
(11, 'Borrowed')

insert into Returned values
(6, 'Free'),
(8, 'Free'),
(12, 'Free')

insert into ReturnedLate values
(5, 'Free'),
(10, 'Free')

insert into Cash values
(1, 000007030793),
(5, 000008443862),
(9, 000009970917)

insert into CCheck values
(2, 4662501098129636),
(6, 5129745721371446),
(10, 4835878995687664)

insert into CreditCard values
(3, 4929881020720341),
(7, 5535344040182888)

insert into DebitCard values
(4, 4716398838768922),
(8, 4485545561253725)

--A1
select CustomerID, CustomerName
from Customer
where CustomerAddress = 'Selangor' 

--A2
select PaymentAmount,EmployeeSIN
from Payment,Employee

--A3
select count(Movie.MovieID)
from movie,tape ,store 
where tape.storeid=store.storeid and tape.movieid=movie.movieid 
group by store.storeid 
order by store.storeid

--A4
SELECT  MOVIEID,TAPEID
FROM Tape 
WHERE TapeID NOT IN (SELECT DISTINCT TapeID FROM MOVIERENTAL)
ORDER BY MOVIEID,TAPEID

--A5
SELECT PAYMENTTYPE,SUM(PAYMENTAMOUNT) AS TOTALAMOUNT
FROM PAYMENT P
GROUP BY PAYMENTTYPE
ORDER BY PaymentType DESC

--A6
SELECT CUSTOMERID,CUSTOMERNAME
FROM CUSTOMER
WHERE CUSTOMERID NOT IN (SELECT DISTINCT CUSTOMERID FROM MOVIERENTAL)
ORDER BY CUSTOMERID

--A7
SELECT MOVIERATING,COUNT(M.MOVIEID) AS NO_OF_MOVIES
FROM MOVIERENTAL MR
INNER JOIN MOVIE M ON M.MOVIEID = M.MOVIEID
GROUP BY MOVIERATING

--A8
select top 5 C.CustomerID, CustomerName, CustomerAddress, CustomerPhoneNumber, sum(PaymentAmount) as 'TotalPayment' 
from Customer C, Payment P
where C.CustomerID = P.CustomerID
group by C.CustomerID, CustomerName, CustomerAddress, CustomerPhoneNumber
order by sum(PaymentAmount) desc

--A9
select MovieTitle, R.RentalStatus, RentalRate, R.EmployeeID as 'RentalEmployee',
R.PaymentID as 'PaymentAccepted', PaymentType, 'Received on ' + convert(varchar(20),datediff(dd, PaymentDate, getdate())) + ' days ago' as PaymentStatus
from Movie M, MovieRental R, Payment P, Tape T
where M.MovieID = T.MovieID and R.TapeID = T.TapeID and P.PaymentID = R.PaymentID

--A10
select ManagerName, EmployeeName 
from Manager M, Employee E 
where E.ManagerID = M.ManagerID
order by M.ManagerSIN asc, E.EmployeeSIN asc

--A11
--Display all the information of the cusomters and their total payment which the total payment is within the range of smallest payment amount and 50.00.
select C.CustomerID, CustomerName, CustomerAddress, CustomerPhoneNumber, sum(PaymentAmount) as 'TotalPayment' 
from Customer C, Payment P
where C.CustomerID = P.CustomerID
group by C.CustomerID, CustomerName, CustomerAddress, CustomerPhoneNumber
having sum(PaymentAmount) >= (select min(PaymentAmount)) and sum(PaymentAmount) <= 50.00

--A12
-- Display the distributor name, address and phone number for the distributor whose id is 6.
select distributorname, distributoraddress, distributorphonenumber
from distributor
where distributorid = 6