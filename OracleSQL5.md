# Latihan
## buat table dari schema HR
### buat tabel
```sql
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
```

### menambahkan foreign key pada tabel departments_137
```sql
alter table departments_137
    add constraint con_dep_man foreign key(manager_id)
    references employees_137(employee_id)
;
```

### menghilangkan foregin key pada tabel departments_137
```sql
alter table departments_137 drop constraint con_dep_man;
```

## insert data
```sql
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
```

