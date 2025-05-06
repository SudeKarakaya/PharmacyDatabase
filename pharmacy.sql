-- Name: Sude Karakaya
-- ID: 22070006065

CREATE SCHEMA SE2222_22070006065;
USE SE2222_22070006065;


-- 1. Definitions:

-- Town table holds town_name, population, tot_pharmacies values.
create table Town (
town_name varchar(30) not null primary key,
population int(8) not null,
tot_pharmacies int(3)
);

-- Pharmacy table holds pharmacy_id, name, tot_workers, phone_number, opening_date,
-- town_name values.
create table Pharmacy(
pharmacy_id int(4) not null auto_increment primary key,
name varchar(25) not null,
tot_workers int (3),
phone_number varchar(10),
opening_date date not null,
town_name varchar(30) not null,
constraint Pharmacy_town_name_fk foreign key (town_name) references town(town_name)
);

-- Manager table holds manager_id, name, surname, phone_number, salary, birth_date,
-- workplace_id values.
create table Manager (
manager_id int(4) not null primary key,
name varchar(10) not null,
surname varchar(15) not null,
phone_number varchar(10),
salary int(7) not null,
birth_date date,
workplace_id int(4) not null,
constraint Manager_workplace_id_fk foreign key (workplace_id) references Pharmacy(pharmacy_id)
);

-- Worker table holds worker_id, name, surname, phone_number, salary, emp_date, workplace_id,
-- conductor_id, medications values.
create table Worker(
worker_id int not null primary key,
name varchar(10) not null,
surname varchar(15) not null,
phone_number varchar(10),
salary int (7) not null,
emp_date date,
workplace_id int(4),
conductor_id int(4),
medication_count int(5),
constraint Worker_workplace_id_fk foreign key (workplace_id) references Pharmacy(pharmacy_id),
constraint Worker_conductor_id_fk foreign key (conductor_id) references Manager(manager_id)
);

-- Company table holds company_id, name, comp_number, pharmacy_id values.
create table Company(
company_id int(5) not null primary key,
name varchar (15) not null,
comp_number varchar(10),
pharmacy_id int(4),
constraint Company_pharmacy_id_fk foreign key (pharmacy_id) references Pharmacy(pharmacy_id)
);

-- Baby_Product table holds baby_product_name, expire_date, company_id values.
create table Baby_Product(
baby_product_name varchar(20) not null primary key,
expire_date date not null,
company_id int(5) not null,
constraint Baby_Product_company_id_fk foreign key (company_id) references Company(company_id)
);

-- Vitamin table holds vitamin_name, amount, expire_date, company_id values.
create table Vitamin(
vitamin_name varchar(20) not null primary key,
amount int (3),
expire_date date not null,
company_id int(5) not null,
constraint Vitamin_company_id_fk foreign key (company_id) references Company(company_id)
);

-- Medication_With_Prescription table holds med_code, name, age_restriction, expire_date,
-- company_id, worker_id values.
create table Medication_With_Prescription(
med_code int(6) not null primary key,
name varchar(18) not null,
age_restriction varchar(30) not null,
expire_date date not null,
company_id int(5) not null,
worker_id int,
constraint Medication_With_Prescription_company_id_fk foreign key (company_id) references Company(company_id),
constraint Medication_With_Prescription_worker_id_fk foreign key (worker_id) references Worker(worker_id)
);

-- 2. Insertions(Data manipulation):

insert into town values ('Bornova', 45000, 4);
insert into town values ('Gaziemir', 14000, 1);
insert into town values ('Konak', 32000, 3);
insert into town values ('Selçuk', 4000, 1);
insert into town values ('Torbalı', 21000, 2);

insert into pharmacy values (101, 'Ege', 5, '111 1111' , '2002-02-02', 'Bornova');
insert into pharmacy values (117, 'İzmir', 7, '222 2222' , '1987-07-28', 'Bornova');
insert into pharmacy values (406, 'Yafay', 4, '333 3333' , '2004-07-12', 'Selçuk');
insert into pharmacy values (208, 'Forum', 8, '444 4444' , '2013-10-16', 'Gaziemir');
insert into pharmacy values (509, 'Torbalı', 4, '555 5555' , '2003-11-21', 'Torbalı');
insert into pharmacy values (303, 'Vitamin', 3, '666 6666' , '2021-12-22', 'Konak');

insert into manager values (1, 'Eren', 'Ayva', '533 3333', 50000, '1990-06-10', 406);
insert into manager values (5, 'Defne', 'Elma', '544 4444', 35000, '1984-02-26', 208);
insert into manager values (2, 'Taha', 'Portakal', '566 6666', 40000, '1995-06-01', 303);
insert into manager values (4, 'Lara', 'Şeftali', '522 2222', 60000, '1993-10-30', 117);
insert into manager values (7, 'Ecem', 'Armut', '511 1111', 39000, '1971-04-22', 101);
insert into manager values (9, 'Batı', 'Kavun', '555 5555', 28000, '1988-12-31', 509);

insert into worker values (23, 'İlayda', 'Erik', '577 7777', 20000, '2022-05-17', 303, 2, 5);
insert into worker values (11, 'Sude', 'Kiraz', '588 8888', 23000, '2016-01-21', 117, 4, 2);
insert into worker values (3, 'Arda', 'Vişne', '599 9999', 13000, '2018-06-28', 101, 7, 17);
insert into worker values (17, 'İrem', 'Çilek', '512 1212', 15000, '2023-08-19', 208, 5, 28);
insert into worker values (26, 'Özgür', 'Karpuz', '534 3434', 19000, '2017-09-12', 406, 1, 44);
insert into worker values (13, 'Efe', 'Kayısı', '556 5656', 21000, '2018-11-03', 509, 9, 0);
insert into worker values (8, 'Berk', 'Muz', '578 7878', 22000, '2015-07-07', 101, 7, 8);

insert into company values (10, 'Ispanak', '121 2121', 117);
insert into company values (11, 'Kereviz', '343 4343', 208);
insert into company values (12, 'Havuç', '565 6565', 406);
insert into company values (13, 'Patlıcan', '787 8787', 101);
insert into company values (14, 'Patates', '919 1919', 509);
insert into company values (15, 'Biber', '242 4242', 303);

insert into baby_product values ('Bez', '2040-01-01', 10);
insert into baby_product values ('Krem', '2036-06-26', 11);
insert into baby_product values ('Katı Besin', '2027-07-27', 12);
insert into baby_product values ('Sıvı Besin', '2025-05-05', 13);
insert into baby_product values ('Ateş Düşürücü', '2027-07-27', 14);
insert into baby_product values ('Biberon', '2050-05-15', 15);

insert into vitamin values ('C vitamini', 18, '2030-03-30', 15);
insert into vitamin values ('B6 vitamini', 35, '2029-09-29', 14);
insert into vitamin values ('B1 vitamini', 7, '2028-08-08', 13);
insert into vitamin values ('D vitamini', 24, '2027-01-11', 12);
insert into vitamin values ('B6+B12 vitaminleri', 10, '2026-11-06', 11);
insert into vitamin values ('B12 vitamini', 5, '2032-12-06', 10);

insert into medication_with_prescription values (68, 'Arveles', '+16', '2034-11-20', 13, 8);
insert into medication_with_prescription values (37, 'Vermidon', '+16', '2027-07-27', 10, 11);
insert into medication_with_prescription values (94, 'Metpamid', '+10', '2033-03-13', 11, 17);
insert into medication_with_prescription values (02, 'Aferin', '+3', '2030-01-01', 12, 26);
insert into medication_with_prescription values (55, 'Folbiol', '+18', '2029-09-19', 13, 3);
insert into medication_with_prescription values (49, 'Parol', '+16', '2032-12-02', 15, 23);

-- 3. Queries:

-- A function that returns the average salary of workers in a given pharmacy_id.
DELIMITER //
create function avgsalaryOfWorkers (pharmacy_id int)
returns decimal(7,1)
reads sql data
begin
declare avgSal DECIMAL(7,1);
    select avg(w.salary) into avgSal from pharmacy as p, worker as w where p.pharmacy_id=pharmacy_id and w.workplace_id=p.pharmacy_id;
    RETURN avgSal;
end;//


-- A trigger that gives each null medication_count a 0 value after an insertion on worker table.
DELIMITER //
create trigger CheckMedCount
before insert on worker for each row
begin
if new.medication_count is null 
then set new.medication_count=0;
end if;
end;//

-- A prodecure that updates a town's population with given town name and population.
DELIMITER //
create procedure UpdatePopulation (town_name varchar(30), population int)
begin
update town as t set t.population = population where town_name = town_name;
end;


-- Displays manager's name and manager's salary increased by 5000 where manager_id is 5.
select m.name, m.salary+5000 as increasedSal from manager as m where m.name = (select m.name from manager m where manager_id=5);

-- Updates medication's expire date to 12 of February 2036 where medication's code is 49.
update medication_with_prescription set expire_date = '2036-12-02' where med_code = 49;

