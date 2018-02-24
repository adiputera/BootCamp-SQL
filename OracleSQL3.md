# multiple table
## JOIN
### INNER JOIN = JOIN
```sql
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
```

## LEFT OUTER JOIN //menampilkan semua data dari tabel yang disebut pertama(employees) walaupun tidak match dengan tabel kedua
### many to one
#### misal siapa saja yang ada di departemen IT
```sql
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
```

## RIGHT OUTER JOIN // menampilkan data yang sama, ditambah data di tabel "kanan(tabel yang di-join)" yang tidak match
### one to many
#### misal : departement IT, yang pakai ada 5
```sql
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
```

## Contoh
### hitung gaji rata-rata berdasarkan department
```sql
select
    (select department_name from departments 
		where department_id=e.department_id) as "Nama Departemen",
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
```

## hitung gaji rata-rata berdasarkan departemen yang gaji totalnya di atas marketing
```sql
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
```

## menampilkan data karyawan dan managernya
### self join -> join dengan tabel sendiri
```sql
select
    e1.employee_id,
    e1.first_name || ' ' || e1.last_name as Karyawan,
    e1.email,
    e2.first_name || ' ' || e2.last_name as Manager
from employees e1
join employees e2
on e1.manager_id=e2.employee_id
order by Manager;
```

## union -> untuk menggabungkan data, menampilkan data yang sama sekali, meski beda tabel, asal tipe field nya sama dan jumlah kolomnya sama
```sql
select first_name, last_name from employees
union
select street_address, postal_code from locations;
```

## union all -> menampilkan semua data, menampilkan semua data, meski kembar
```sql
select first_name, last_name from employees
union all
select first_name, last_name from employees;
```