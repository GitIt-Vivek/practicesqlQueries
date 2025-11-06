use practicesets;

CREATE TABLE TEACHER (
    TEACHER_CODE CHAR(4) PRIMARY KEY,
    TEACHER_NAME VARCHAR(30),
    DOJ DATE
);

INSERT INTO TEACHER VALUES
('T001', 'ANAND', '2001-01-30'),
('T002', 'AMIT', '2007-09-05'),
('T003', 'ANKIT', '2007-09-20'),
('T004', 'BALBIR', '2010-02-15'),
('T005', 'JASBIR', '2011-01-20'),
('T006', 'KULBIR', '2008-07-11');

select * from teacher;

select teacher_name,doj from teacher
where teacher_name like "%I%";

select * from teacher where doj like "%-09-%";

CREATE TABLE ACCOUNT (
    ANO INT PRIMARY KEY,
    ANAME VARCHAR(30),
    ADDRESS VARCHAR(30)
);

INSERT INTO ACCOUNT VALUES
(101, 'Nirja Singh', 'Bangalore'),
(102, 'Rohan Gupta', 'Chennai'),
(103, 'Ali Reza', 'Hyderabad'),
(104, 'Rishabh Jain', 'Chennai'),
(105, 'Simran Kaur', 'Chandigarh');
select * from account;

CREATE TABLE TRANSACT (
    TRNO CHAR(4) PRIMARY KEY,
    ANO INT,
    AMOUNT INT,
    TYPE VARCHAR(10),
    DOT DATE,
    FOREIGN KEY (ANO) REFERENCES ACCOUNT(ANO)
);

INSERT INTO TRANSACT VALUES
('T001', 101, 2500, 'Withdraw', '2017-12-21'),
('T002', 103, 3000, 'Deposit', '2017-06-01'),
('T003', 102, 2000, 'Withdraw', '2017-05-12'),
('T004', 103, 1000, 'Deposit', '2017-10-22'),
('T005', 102, 12000, 'Deposit', '2017-11-06');

select * from transact;

select * from transact where type = "Withdraw";

select ano, amount 
from transact 
where dot between '2017-05-01' and '2017-05-30';

select min(dot)
from transact where 
ano = 102;

select a.ano,a.aname,t.amount,t.dot
from account a
inner join transact t
on a.ano = t.ano
where amount <= 3000;

select ano,aname
from account 
where address not in ('Chennai','bangalore');

select distinct ano from transact;

select ano, count(*), min(amount)
from transact
group by ano
having count(*) > 1;

select ano, count(*), sum(amount)
from transact
where dot <='2017-10-01'
group by ano;

CREATE TABLE TRAINS (
    TNO INT PRIMARY KEY,
    TNAME VARCHAR(50),
    START VARCHAR(50),
    END VARCHAR(50)
);

INSERT INTO TRAINS VALUES
(11096, 'Ahimsa Express', 'Pune Junction', 'Ahmedabad Junction'),
(12015, 'Ajmer Shatabdi', 'New Delhi', 'Ajmer Junction'),
(1651,  'Pune Hbj Special', 'Pune Junction', 'Habibganj'),
(13005, 'Amritsar Mail', 'Howrah Junction', 'Amritsar Junction'),
(12002, 'Bhopal Shatabdi', 'New Delhi', 'Habibganj'),
(12417, 'Prayag Raj Express', 'Allahabad Junction', 'New Delhi'),
(14673, 'Shaheed Express', 'Jaynagar', 'Amritsar Junction'),
(12314, 'Sealdah Rajdhani', 'New Delhi', 'Sealdah'),
(12498, 'Shane Punjab', 'Amritsar Junction', 'New Delhi'),
(12451, 'Shram Shakti Express', 'Kanpur Central', 'New Delhi'),
(12030, 'Swarna Shatabdi', 'Amritsar Junction', 'New Delhi');

select * from trains;

CREATE TABLE PASSENGERS (
    PNR CHAR(5) PRIMARY KEY,
    TNO INT,
    PNAME VARCHAR(50),
    GENDER VARCHAR(10),
    AGE INT,
    TRAVELDATE DATE,
    FOREIGN KEY (TNO) REFERENCES TRAINS(TNO)
);

INSERT INTO PASSENGERS VALUES
('P001', 13005, 'R N AGRAWAL', 'MALE', 45, '2018-12-25'),
('P002', 12015, 'P TIWARY', 'MALE', 28, '2018-11-10'),
('P003', 12015, 'S TIWARY', 'FEMALE', 22, '2018-11-10'),
('P004', 12030, 'S K SAXENA', 'MALE', 42, '2018-10-12'),
('P005', 12030, 'S SAXENA', 'FEMALE', 35, '2018-10-12'),
('P006', 12030, 'P SAXENA', 'FEMALE', 52, '2018-10-12'),
('P007', 13005, 'N S SINGH', 'MALE', 52, '2018-05-09'),
('P008', 12030, 'J K SHARMA', 'MALE', 65, '2018-05-09'),
('P009', 12030, 'R SHARMA', 'MALE', 58, '2018-05-09');

select * from passengers;

select * from trains 
where start = 'New Delhi';

select pnr, pname,age,gender
from passengers
where age < 50;

select gender,count(*)
from passengers
group by gender;

select * from passengers
where tno = 12015;

select max(traveldate), min(traveldate)
from passengers 
where gender = 'Female';

select tno , count(*)
from trains 
group by tno
having count(*) > 1;

select distinct traveldate 
from passengers;

select tname, pname from 
trains t, passengers p
where t.tno = p.tno
and (age between 50 and 60);

CREATE TABLE SHOPPE (
    Id CHAR(3) PRIMARY KEY,
    SName VARCHAR(50),
    Area VARCHAR(30)
);

INSERT INTO SHOPPE VALUES
('S01', 'ABC Computronics', 'CP'),
('S02', 'All Infotech Media', 'GK II'),
('S03', 'Tech Shoppe', 'CP'),
('S04', 'Geeks Tecno Soft', 'Nehru Place'),
('S05', 'Hitech Tech Store', 'Nehru Place');

select * from shoppe;

CREATE TABLE ACCESSORIES (
    No CHAR(3) PRIMARY KEY,
    Name VARCHAR(50),
    Price INT,
    Id CHAR(3),
    FOREIGN KEY (Id) REFERENCES SHOPPE(Id)
);

INSERT INTO ACCESSORIES VALUES
('A01', 'Mother Board', 12000, 'S01'),
('A02', 'Hard Disk', 5000, 'S01'),
('A03', 'Keyboard', 3000, 'S02'),
('A04', 'Mouse', 300, 'S02'),
('A05', 'Mother Board', 13000, 'S02'),
('A06', 'Keyboard', 400, 'S03'),
('A07', 'LCD', 6000, 'S04'),
('A08', 'LCD', 5500, 'S05'),
('A09', 'Mouse', 350, 'S03'),
('T10', 'Hard Disk', 4500, 'S03');

select * from accessories;

select name,price 
from accessories
order by price desc;

select id, sname
from shoppe
where area = 'Nehru Place';

select name, min(price), max(price)
from accessories
group by name;

select * from
accessories
where name like '%board%';

select distinct name 
from accessories 
where price > 5000;

select area, count(*)
from shoppe 
group by area;

select avg(price),max(price)
from accessories
where price > 10000;

select name, price * 0.05 as discount 
from accessories 
where id in ('S02','S-3');

select * from shoppe s,
accessories a
where s.id = a.id and
price >= 10000;

CREATE TABLE DOCTORS (
    DocID INT PRIMARY KEY,
    DocName VARCHAR(50),
    Department VARCHAR(30),
    NoOfOpdDays INT
);

INSERT INTO DOCTORS VALUES
(101, 'J K Mishra', 'Ortho', 3),
(102, 'Mahesh Tripathi', 'ENT', 4),
(103, 'Ravi Kumar', 'Neuro', 5),
(104, 'Mukesh Jain', 'Physio', 3);

select * from doctors;

CREATE TABLE PATIENTS (
    PatNo INT PRIMARY KEY,
    PatName VARCHAR(50),
    Department VARCHAR(30),
    DocId INT,
    FOREIGN KEY (DocId) REFERENCES DOCTORS(DocID)
);

INSERT INTO PATIENTS VALUES
(1, 'Payal', 'ENT', 102),
(2, 'Naveen', 'Ortho', 101),
(3, 'Rakesh', 'Neuro', 103),
(4, 'Atul', 'Physio', 104);

select * from patients;

select p.patno, p.patname,d.docname
from patients p
join doctors d
on p.docid = p.docid;

select docname,NoOfOpdDays
from doctors
where noofopddays > 3;

select d.docname,d.department,p.patname, p.docid
from patients p
left join 
doctors d
on p.docid = d.docid
where p.docid = 102 or p.docid = 103;

select distinct department 
from patients;





