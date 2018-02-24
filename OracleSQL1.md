# Latihan Oracle SQL Developer
## Login SQLPLUS
```sql
sqlplus / as sysdba;
```

## Mengaktifkan user HR yang masih terkunci, note : 1234 merupakan password yang dibuat untuk user HR
```sql
SQL> alter user hr identified by 1234 account unlock;
User altered.
SQL> conn hr/1234
Connected.
SQL> show user;
USER is "HR"
SQL>
```

## selection all field
```sql
select * from employees;
```

## selection field
```sql
select
    employee_id as ID,
    first_name as Nama_Depan,
    last_name as Nama_Belakang,
    email
from EMPLOYEES;
```

## arithmatic expression
## DUAL --> fungsi yang sudah ada pada oracle
```sql
select 'hello world' as kalimat from DUAL;

select 1+1 as penambahan from dual;

select 9-8 as pengurangan from dual;

select 10+5*2 as perkalian from dual;
```sql

## penambahan field bonus
```sql
select 
    first_name,
    last_name,
    salary,
    salary*2 as bonus
from employees;
```

## null field, null bukan 0, null+*9999 =null
```sql
select 
    first_name,
    last_name,
    salary,
    COMMISSION_PCT
from employees;
```

## clause where
```sql
select * from employees where employee_id=102;

-- case sensitive, nama Lex tidak tampil
select * from employees where first_name='lex'; 

-- diubah jadi huruf besar semua, lower untuk huruf kecil
select * from employees where upper(first_name)=upper('lex'); 
```

## searching
### 1. equals "="
```sql
select *
from employees
where
first_name = 'William' and last_name='Smith';
```

## 2. in -> mirip OR
```sql
select* from employees where
first_name = 'William' or first_name = 'Lex';

select * from employees
where first_name in('William', 'Lex');
```

## 3. like -> untuk mencari dengan karakter yang ditentukan, ditambah %
mencari first name yang depannya huruf L
```sql
select * from employees
where first_name like 'L%';
```

mencari first name yang diakhiri huruf l
```sql
select * from employees
where first_name like '%l';
```

mencari first name yang mengandung huruf 'sa'
```sql
select * from employees
where first_name like '%sa%';
```

## komparasi
```sql
select first_name, last_name, salary from employees
where salary =24000;

select first_name, last_name, salary from employees
where salary > 14000;

select first_name, last_name, salary from employees
where salary <>24000; --tidak sama dengan, atau pakai !=
```

## is null
```sql
select first_name, last_name, salary, COMMISSION_PCT from employees
where commission_pct is null;

select first_name, last_name, salary, COMMISSION_PCT from employees
where commission_pct is not null;
```

## between
```sql
select first_name, last_name, salary, COMMISSION_PCT from employees
where salary between 10000 and 15000;
select first_name, last_name, salary, COMMISSION_PCT from employees
where salary > 10000 and salary < 15000;
```

## AND dan OR
```sql
select first_name, last_name, salary from employees
where first_name='Lex' and salary=17000 or 1=0;

select first_name, last_name, salary from employees
where salary=17000 or 1=0 and first_name='Lex';
```

## order by
### untuk mengurutkan berdasarkan field tertentu
```sql
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
```

## ampersand 
### untuk menambahkan variabel, jika belum didefinisikan akan berupa inputan, ditandai dengan tanda dan(&)
```sql
define theID = 123
select * from employees where employee_id = &theID;
undefine theID;
```

# single  row function

## 1.lower -> untuk merubah semua huruf menjadi huruf kecil
```sql
select lower('JKSAFfdfdASAD') from dual;
```

## 2.upper -> untuk merubah semuahuruf menjadi huruf besar
```sql
select upper('JKSAFfdfdASAD') from dual;
define nama='Saya'
define nama2='nama'
select upper('&nama' || ' ' || '&nama2') from dual;
```

## 3. initcap -> untuk membuat huruf awal tiap kata menjadi kapital, dan huruf selanjutnya kecil
```sql
define word = 'iNDONESIa'
define word2 = 'jAYa'
select initcap('&word' || ' ' || '&word2') from dual;

select first_name, last_name, initcap(email) from employees order by email;

select initcap(first_name || ' ' || last_name) as Nama_Lengkap from employees;
```

## concat
## untuk menyambung 2 string
```sql
define word1 = 'hello '
define word2 = 'world'
select concat('&word1', '&word2') from dual;

select 'hello' || ' ' || 'world' from dual;
```

## trim menghilangkan spasi/karakter di depan dan belakang
```sql
define word1 = '           halo         asdas    '
select trim('&word1') from dual;
```

## pembulatan bilangan
## round -> pembulatan bilangan ke atas jika 0.5 ke atas
```sql
select round(8.766,2) from dual;
```

## trunc -> pembulatan bilangan  ke bawah
```sql
select trunc(5.6795, 2) from dual;
```
## mod -> 2 mod 4
```sql
select mod(2, 4) from dual;
```

## date
```sql
select sysdate from dual;

select first_name, hire_date from employees
where hire_date = '17-Jun-03'; --where hire_date = to_date('17-Jun-03', 'DD-MM-YY')
```
