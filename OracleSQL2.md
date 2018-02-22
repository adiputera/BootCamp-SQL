#ORACLE SQL

##group function
###1.AVG -> rata-rata
```sql
select avg(salary) from employees;

select round(avg(salary), 2) from employees;
```
###2. SUM ->jumlah
```sql
select sum(salary) from employees;
```

###3. MAX -> nilai maximum
```sql
select max(salary) from employees;
```

##4. MIN -> nilai minimum
```sql
select min(salary) from employees;
```

##5. count menghitung jumlah record
###berdasarkan field
```sql
select count(commission_pct) from employees; --ada null tidak dihitung
```

###ngitung semua
```sql
select count(*) from employees;
```

##6.STDDEV (Standar deviasi) dan variance -> statistika
```sql
select stddev(salary) from employees;

select variance(salary) from employees;
```

##contoh
```sql
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
```

##group by -> untuk menggrupkan pada field yang ditentukan
```sql
select
    avg(salary) as rata2,
    sum(salary) as total,
    count(*) as jumlah, 
    job_id
from employees group by job_id order by 1;
```

##having untuk memfilter hasil yang dihasilkan oleh group function(where untuk group function)
```sql
select
    avg(salary) as rata2,
    sum(salary) as total,
    count(*) as jumlah,
    job_id
from employees group by job_id
having avg(salary) > 10000;
```

##subquery -> query dalam query
```sql
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
```

## ALL -> and, harus lebih besar dari semua record
## ANY -> or, harus lebih besar dari salah satu record
Pada contoh di bawah, misal subquery akan menghasilkan salary 5000, 6000, 7000.
Jika menggunakan ALL, maka nilai yang tampil adalah lebih dari 7000, namun jika menggunakan ANY, nilai yang tampil adalah lebih dari 5000.
```sql
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
```