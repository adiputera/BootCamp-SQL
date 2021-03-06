--selection all field
select * from employees;

--selection field
select
    employee_id as ID,
    first_name as Nama_Depan,
    last_name as Nama_Belakang,
    email
from EMPLOYEES;

--arithmatic expression
--DUAL --> fungsi yang sudah ada pada oracle
select 'hello world' as kalimat from DUAL;
select 1+1 as penambahan from dual;
select 9-8 as pengurangan from dual;
select 10+5*2 as perkalian from dual;

--penambahan field bonus
select 
    first_name,
    last_name,
    salary,
    salary*2 as bonus
from employees;

--null field, null bukan 0, null+*9999 =null
select 
    first_name,
    last_name,
    salary,
    COMMISSION_PCT
from employees;

--clause where
select * from employees where employee_id=102;
select * from employees where first_name='lex'; -- case sensitive, nama Lex tidak tampil
select * from employees where upper(first_name)=upper('lex'); -- diubah jadi huruf besar semua, lower untuk huruf kecil

--komparasi
select first_name, last_name, salary from employees
where salary =24000;
select first_name, last_name, salary from employees
where salary > 14000;
select first_name, last_name, salary from employees
where salary <>24000; --tidak sama dengan, atau pakai !=

--is null
select first_name, last_name, salary, COMMISSION_PCT from employees
where commission_pct is null;
select first_name, last_name, salary, COMMISSION_PCT from employees
where commission_pct is not null;

--between
select first_name, last_name, salary, COMMISSION_PCT from employees
where salary between 10000 and 15000;
select first_name, last_name, salary, COMMISSION_PCT from employees
where salary > 10000 and salary < 15000;

--and dan or
select first_name, last_name, salary from employees
where first_name='Lex' and salary=17000 or 1=0;
select first_name, last_name, salary from employees
where salary=17000 or 1=0 and first_name='Lex';

--order by
--untuk mengurutkan berdasarkan field tertentu
select*
from employees
order by first_name asc;
select *
from employees
order by first_name desc;
select first_name, last_name as nama_belakang from employees
order by nama_belakang desc;
select * from employees
order by 2;

--ampersand
define theID = 123
select * from employees where employee_id = &theID;
undefine theID;

--single  row function

--1.lower
select lower('JKSAFfdfdASAD') from dual;

--2.upper
select upper('JKSAFfdfdASAD') from dual;
define nama='Saya'
define nama2='nama'
select upper('&nama' || ' ' || '&nama2') from dual;

--3. initcap
define word = 'iNDONESIa'
define word2 = 'jAYa'
select initcap('&word' || ' ' || '&word2') from dual;
select first_name, last_name, initcap(email) from employees order by email;
select initcap(first_name || ' ' || last_name) as Nama_Lengkap from employees;

--concat
--untuk menyambung 2 string
define word1 = 'hello '
define word2 = 'world'
select concat('&word1', '&word2') from dual;
select 'hello' || ' ' || 'world' from dual;

--trim menghilangkan spasi/karakter di depan dan belakang
define word1 = '           halo         asdas    '
select trim('&word1') from dual;

--pembulatan bilangan
--round -> pembulatan bilangan ke atas jika 0.5 ke atas
select round(8.766,2) from dual;
--trunc -> pembulatan bilangan  ke bawah
select trunc(5.6795, 2) from dual;
--mod -> 2 mod 4
select mod(2, 4) from dual;

--date
select sysdate from dual;
select first_name, hire_date from employees
where hire_date = '17-Jun-03'; --where hire_date = to_date('17-Jun-03', 'DD-MM-YY')

--group function
--1.AVG -> rata-rata
select avg(salary) from employees;
select round(avg(salary), 2) from employees;
--2. SUM ->jumlah
select sum(salary) from employees;
--3. MAX -> nilai maximum
select max(salary) from employees;
--4. MIN ->
select min(salary) from employees;
--5. count menghitung jumlah record
--berdasarkan field
select count(commission_pct) from employees; --ada null tidak dihitung
--ngitung semua
select count(*) from employees;
--6.STDDEV (Standar deviasi) dan variance
select stddev(salary) from employees;
select variance(salary) from employees;

--contoh
select
    count(*),
    min(salary),
    max(salary),
    sum(salary),
    round(avg(salary),2)
from employees;

select max(salary), first_name
from employees
group by first_name
order by max(salary) desc;

--group by
select
    avg(salary) as rata2,
    sum(salary) as total,
    count(*) as jumlah, 
    job_id
from employees group by job_id order by 1;

--having untuk memfilter hasil yang dihasilkan oleh group function(where untuk group function)
select
    avg(salary) as rata2,
    sum(salary) as total,
    count(*) as jumlah,
    job_id
from employees group by job_id
having avg(salary) > 10000;

--subquery -> query dalam query

select
    avg(salary) as rata2,
    max(salary) as maksimal,
    sum(salary) as total,
    job_id
from employees
where job_id<>'AC_MGR'
group by job_id
having sum(salary)>(Select min(salary) from employees where first_name='Steven') and 
    sum(salary)<(select max(salary) from employees where first_name='Steven')
order by rata2;

-- ALL -> and, harus lebih besar dari semua record
-- ANY -> or, harus lebih besar dari salah satu record

select
    avg(salary) as rata2,
    max(salary) as maksimal,
    sum(salary) as total,
    job_id
from employees
where job_id<>'AC_MGR'
group by job_id
having sum(salary)>ALL(Select salary from employees where first_name='Steven')
order by rata2;


select
    avg(salary) as rata2,
    max(salary) as maksimal,
    sum(salary) as total,
    job_id
from employees
where job_id<>'AC_MGR'
group by job_id
having sum(salary)>ANY(Select salary from employees where first_name='Steven')
order by rata2;

---searching
-- 1. equals "="
select *
from employees
where
first_name = 'William' and last_name='Smith';

-- 2. in -> mirip OR
select* from employees where
first_name = 'William' or first_name = 'Lex';

select * from employees
where first_name in('William', 'Lex');

-- 3. like -> untuk mencari dengan karakter yang ditentukan, ditambah %
-- mencari first name yang depannya huruf L
select * from employees
where first_name like 'L%';

--mencari first name yang diakhiri huruf l
select * from employees
where first_name like '%l';

--mencari first name yang mengandung huruf 'sa'
select * from employees
where first_name like '%sa%';

--multiple table
--JOIN
--INNER JOIN = JOIN
select 
    e.employee_id,
    e.first_name,
    e.last_name,
    d.DEPARTMENT_NAME,
    e.salary,
    loc.street_address as "alamat kantor"
from employees e
join departments d
on e.department_id = d.department_id
join locations loc
on loc.location_id = d.location_id;

--LEFT OUTER JOIN //menampilkan semua data dari tabel yang disebut pertama(employees) walaupun tidak match
--many to one
--misal siapa saja yang ada di departemen IT
select 
    e.employee_id,
    e.first_name,
    e.last_name,
    d.DEPARTMENT_NAME,
    e.salary,
    loc.street_address as "alamat kantor"
from employees e
left outer join departments d
on e.department_id = d.department_id
left outer join locations loc
on loc.location_id = d.location_id;

--RIGHT OUTER JOIN // menampilkan data yang sama, ditambah data di tabel "kanan(tabel yang dijoin)" yang tidak match
--one to many
--misal : departement IT, yang pakai ada 5
select 
    e.employee_id,
    e.first_name,
    e.last_name,
    d.DEPARTMENT_NAME,
    e.salary,
    loc.street_address as "alamat kantor"
from employees e
right outer join departments d
on e.department_id = d.department_id
right outer join locations loc
on loc.location_id = d.location_id;

--hitung gaji rata-rata berdasarkan department
select
    (select department_name from departments where department_id=e.department_id) as "Nama Departemen",
    round(avg(e.salary),2) as "Rata-rata Gaji"
from employees e
join departments d
on e.department_id = d.department_id
group BY d.department_id;

select
    round(avg(salary), 2) as rata, dept.department_name
from employees e
inner join departments dept
on e.department_id = dept.department_id
group by dept.department_name
order by rata;

--hitung gaji rata-rata berdasarkan departemen yang gaji totalnya di atas marketing
select
    round(avg(salary), 2) as rata, dept.department_name
from employees e
inner join departments dept
on e.department_id = dept.department_id
group by dept.department_name
having avg(salary) > (select sum(salary) from employees where department_id=20)
order by rata;

select
    round(avg(salary), 2) as rata, dept.department_name
from employees e
inner join departments dept
on e.department_id = dept.department_id
group by department_name
having sum(e.salary) > (select sum(e.salary)
from employees e
inner join departments dept
on e.department_id = dept.department_id
where dept.department_name='Marketing')
order by rata;


select
    round(avg(salary), 2) as rata, dept.department_name
from employees e, departments dept
where e.department_id = dept.department_id
group by department_name
having sum(e.salary) > (select sum(e.salary)
from employees e, departments dept
where e.department_id = dept.department_id
and dept.department_name='Marketing')
order by rata;

select * from employees;


---menampilkan data karyawan dan managernya
--self join
select
    e1.employee_id,
    e1.first_name || ' ' || e1.last_name as Karyawan,
    e1.email,
    e2.first_name || ' ' || e2.last_name as Manager
from employees e1
join employees e2
on e1.manager_id=e2.employee_id
order by Manager;

--union -> untuk menggabungkan data, menampilkan data yang sama sekali, meski beda tabel, asal tipe field nya sama dan jumlah kolomnya sama
select first_name, last_name from employees
union
select street_address, postal_code from locations;

--union all -> menampilkan semua data, menampilkan semua data, meski kembar
select first_name, last_name from employees
union all
select first_name, last_name from employees;


--DDL
--CREATE
drop table department_137;
create table department_137(
    id int primary key,
    department_name varchar2(144),
    email varchar2(144)
);

--menampilkan informasi tabel yang dibuat
desc department_137;

--constraint
drop table department_137;
create table department_137(
    id int,
    department_name varchar2(144),
    email varchar2(144),
    constraint cons_dept_pk primary key(id),
    constraint cons_email_un unique(email)
);

---DML
--insert
insert into department_137 (id, department_name, email)
values (1, 'infrastruktur', 'infra1@xsis.co.id');
insert into department_137 (id, department_name, email)
values (2, 'infrastruktur', 'infra2@xsis.co.id');
insert into department_137 (id, department_name, email)
values (3, 'infrastruktur', 'infra3@xsis.co.id');
insert into department_137 (id, department_name, email)
values (4, 'infrastruktur', 'infra4@xsis.co.id');
insert into department_137 (id, department_name, email)
values (5, 'infrastruktur', 'infra5@xsis.co.id');
insert into department_137 (id, department_name, email)
values (6, 'infrastruktur', 'infra6@xsis.co.id');
insert into department_137 (id, department_name, email)
values (7, 'infrastruktur', 'infra7@xsis.co.id');
insert into department_137 (id, department_name, email)
values (8, 'infrastruktur', 'infra8@xsis.co.id');
insert into department_137 (id, department_name, email)
values (9, 'infrastruktur', 'infra9@xsis.co.id');
insert into department_137 (id, department_name, email)
values (10, 'infrastruktur', 'infra10@xsis.co.id');

select * from department_137;

drop table employees_137;
create table employees_137(
    id int,
    name varchar(144),
    email varchar(144),
    department_id int,
    constraint cons_emp_pk primary key(id),
    constraint cons_email_emp unique(email),
    constraint cons_reff_dept foreign key(department_id)
    REFERENCES department_137(id)
);

desc employees_137;
select * from department_137;
select * from employees_137;

insert into employees_137
(id, name, email, department_id)
values
(1, 'Yusuf', 'yusuf@adiputera.com', '2');
insert into employees_137
(id, name, email, department_id)
values
(2, 'Yusuf', 'yusuf2@adiputera.com', '6');
insert into employees_137
(id, name, email, department_id)
values
(3, 'Yusuf', 'yusuf3@adiputera.com', '3');

--jika menghapus data pada department saat masih ada data yang menggunakannya(employees_137) maka data tidak bisa dihapus
delete department_137; --error

--jika data tidak digunakan bisa dihapus
delete department_137 where id=1; 

--drop table
drop table employees_137;
drop table department_137;

-- buat table dari schema HR
create table regions_137(
    region_id int primary key,
    region_name varchar2(144)
);

create table countries_137(
    country_id int primary key,
    country_name varchar2(144),
    region_id int,
    constraint con_coun_fk foreign key (region_id) 
    references regions_137(region_id) 
);

create table locations_137(
    location_id int primary key,
    street_address varchar2(144),
    postal_code int,
    city varchar(144),
    state_province varchar(144),
    country_id int,
    constraint con_loc foreign key(country_id)
    references countries_137(country_id)
);

create table departments_137(
    department_id int primary key,
    department_name varchar2(144),
    manager_id int,
    location_id int,
    constraint con_dep_loc_fk foreign key(location_id)
    references locations_137(location_id)
);

create table employees_137(
    employee_id int primary key,
    first_name varchar2(144),
    last_name varchar2(144),
    email varchar2(144) unique,
    phone_number varchar2(50) unique,
    hire_date date,
    job_id int,
    salary int not null,
    commission_pct int,
    manager_id int,
    department_id int,
    constraint con_em_em_fk foreign key(manager_id)
    references employees_137(employee_id),
    constraint con_em_dep foreign key(department_id)
    references departments_137(department_id)
);

alter table departments_137
    add constraint con_dep_man foreign key(manager_id)
    references employees_137(employee_id)
;

insert into regions_137
(region_id, region_name)
values
(10, 'North Africa');

insert into countries_137
(country_id, country_name, region_id)
values
(10, 'France', 9);

insert into LOCATIONS_137
(location_id, street_address, postal_code, city, state_province, country_id)
values
(10, 'Jalan Korut', 43325, 'Korea', 'Jepang Utara', 3);

insert into Departments_137
(department_id, department_name, manager_id, location_id)
values
(10, 'Sweeper', 10, 3);


insert into employees_137
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values
(1, 'Budi', 'Banu', 'budi@banu.com', 080989999, 12-Jun-2010, 2, 3000000, null, 2, 1);

alter table departments_137 drop constraint con_dep_man;
