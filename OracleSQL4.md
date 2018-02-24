# DDL -> Data Definition Language
#### Query yang berhubungan dengan tabel, Create, drop, alter

## CREATE --> untuk membuat tabel
```sql
create table department_137(
    id int primary key,
    department_name varchar2(144),
    email varchar2(144)
);

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
```

## menampilkan informasi tabel yang dibuat
```sql
desc department_137;
```

## DROP --> untuk menghapus tabel
```sql
drop table employees_137;
drop table department_137;
```

## constraint --> untuk menset primary key, foreign key, unique
```sql
drop table department_137;
create table department_137(
    id int,
    department_name varchar2(144),
    email varchar2(144),
    constraint cons_dept_pk primary key(id),
    constraint cons_email_un unique(email)
);
```

## ALTER --> untuk mengubah tabel
```sql
alter table departments_137 drop constraint con_dep_man;
```

# DML -> Data Manipulation Language
#### Query yang berhubungan dengan data, insert, update, delete
## insert
```sql
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
```

#### menampilkan data yang sudah ditambahkan
```sql
select * from department_137;
```

```sql
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
```

## delete
### jika menghapus data pada department saat masih ada data yang menggunakannya(employees_137) maka data tidak bisa dihapus
data department_137 masih digunakan oleh data dari employees_137, jadi tidak bisa dihapus
```sql
delete department_137; --error
```

## jika data tidak digunakan bisa dihapus
```sql
--data department_137 dengan id=1 tidak digunakan di tabel employees_137
delete department_137 where id=1; 
```