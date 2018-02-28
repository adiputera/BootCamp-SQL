-- Nomor 1
create table penerbit(
    kode_penerbit char(5) primary key,
    nama_penerbit varchar(50) not null,
    is_active char(1) not null);
    
desc penerbit;

create table negara(
    kode_negara char(5) primary key,
    nama_negara varchar(50) not null);
    
desc negara;

drop table kota;
create table kota(
    kode_kota char(5) primary key,
    nama_kota varchar(100) not null,
    kode_negara char(5) not null,
    kode_pos char(5) not null,
    constraint con_neg_fk foreign key(kode_negara)
    references negara(kode_negara));
    
desc kota;

create table agama(
    kode_agama char(5) primary key,
    deskripsi varchar(20) not null);

desc agama;

create table pengarang(
    kode_pengarang char(5) primary key,
    nama_pengarang varchar(100) not null,
    umur number not null,
    kode_agama char(5) not null,
    kode_kota char(5) not null
    );

alter table pengarang add constraint con_kota_fk
    foreign key(kode_kota)
    references kota(kode_kota);
alter table pengarang add constraint con_agama_fk
    foreign key(kode_agama)
    references agama(kode_agama);
    
desc pengarang;

create table type_buku(
    kode_type_buku char(5) primary key,
    deskripsi varchar(100) not null);

desc type_buku;

create table buku(
    kode_buku char(5) primary key,
    nama_buku varchar(100) not null,
    kode_pengarang char(5) not null,
    kode_penerbit char(5) not null,
    kode_type_buku char(5) not null,
    constraint con_peng_fk foreign key(kode_pengarang)
    references pengarang(kode_pengarang),
    constraint con_pen_fk foreign key(kode_penerbit)
    references penerbit(kode_penerbit),
    constraint con_type_fk foreign key(kode_type_buku)
    references type_buku(kode_type_buku));

desc buku;

insert into agama(kode_agama, deskripsi)
values ('A001', 'Islam');
insert into agama(kode_agama, deskripsi)
values ('A002', 'Kristen');
insert into agama(kode_agama, deskripsi)
values ('A003', 'Katolik');
insert into agama(kode_agama, deskripsi)
values ('A004', 'Hindu');
insert into agama(kode_agama, deskripsi)
values ('A005', 'Budha');

insert into type_buku(kode_type_buku, deskripsi)
values('T001', 'Teks');
insert into type_buku(kode_type_buku, deskripsi)
values('T002', 'Komik');
insert into type_buku(kode_type_buku, deskripsi)
values('T003', 'ilmiah');

insert into negara(kode_negara, nama_negara)
values('N001', 'Indonesia');
insert into negara(kode_negara, nama_negara)
values('N002', 'Arab Saudi');
insert into negara(kode_negara, nama_negara)
values('N003', 'Iran');
insert into negara(kode_negara, nama_negara)
values('N004', 'Inggris');
insert into negara(kode_negara, nama_negara)
values('N005', 'Ethiopia');

insert into penerbit(KODE_PENERBIT, nama_penerbit, is_active)
values('R001', 'Bina Kasih', 'Y');
insert into penerbit(KODE_PENERBIT, nama_penerbit, is_active)
values('R002', 'Java Books Indonesia', 'Y');
insert into penerbit(KODE_PENERBIT, nama_penerbit, is_active)
values('R003', 'CSIS', 'T');
insert into penerbit(KODE_PENERBIT, nama_penerbit, is_active)
values('R004', 'Rosda', 'Y');
insert into penerbit(KODE_PENERBIT, nama_penerbit, is_active)
values('R005', 'AK Group', 'T');

insert into kota(kode_kota, nama_kota, kode_negara, kode_pos)
values('K001', 'Bandung', 'N001', 23455);
insert into kota(kode_kota, nama_kota, kode_negara, kode_pos)
values('K002', 'Medan', 'N001', 12930);
insert into kota(kode_kota, nama_kota, kode_negara, kode_pos)
values('K003', 'Jakarta', 'N001', 11223);
insert into kota(kode_kota, nama_kota, kode_negara, kode_pos)
values('K004', 'Surabaya', 'N001', 23456);
insert into kota(kode_kota, nama_kota, kode_negara, kode_pos)
values('K005', 'Yogyakarta', 'N001', 12920);

insert into pengarang(kode_pengarang, nama_pengarang, umur, kode_agama, kode_kota)
values('P001', 'Anggoro Hary', 25, 'A001', 'K001');
insert into pengarang(kode_pengarang, nama_pengarang, umur, kode_agama, kode_kota)
values('P002', 'Denny Ihsan', 26, 'A002', 'K003');
insert into pengarang(kode_pengarang, nama_pengarang, umur, kode_agama, kode_kota)
values('P003', 'Perdana Erick', 25, 'A001', 'K003');
insert into pengarang(kode_pengarang, nama_pengarang, umur, kode_agama, kode_kota)
values('P004', 'Diken Pradana', 20, 'A001', 'K004');
insert into pengarang(kode_pengarang, nama_pengarang, umur, kode_agama, kode_kota)
values('P005', 'Fahmi Khaerudin', 33, 'A003', 'K005');

insert into buku(kode_buku, nama_buku, kode_pengarang, kode_penerbit, kode_type_buku)
values('B001', 'Pencarian Ilmu Tak Berujung', 'P001', 'R001', 'T002');
insert into buku(kode_buku, nama_buku, kode_pengarang, kode_penerbit, kode_type_buku)
values('B002', 'Perkembangan Android V001', 'P003', 'R002', 'T001');
insert into buku(kode_buku, nama_buku, kode_pengarang, kode_penerbit, kode_type_buku)
values('B003', 'Cinta Dalam Duka', 'P002', 'R005', 'T002');
insert into buku(kode_buku, nama_buku, kode_pengarang, kode_penerbit, kode_type_buku)
values('B004', 'Cara Menanam Jagung', 'P004', 'R003', 'T002');
insert into buku(kode_buku, nama_buku, kode_pengarang, kode_penerbit, kode_type_buku)
values('B005', 'Teori Bumi Itu Datar', 'P003', 'R002', 'T001');

select * from buku;
select * from pengarang;
select * from penerbit;
select * from negara;
select * from kota;
select * from type_buku;
select * from agama;

-- Nomor 2
select * 
from pengarang
order by umur desc;

-- Nomor 3
Select buku.nama_buku as Nama_Buku,
    pengarang.nama_pengarang as Nama_pengarang,
    penerbit.nama_penerbit as Nama_penerbit,
    type_buku.deskripsi as Type_Buku
FROM buku, pengarang, penerbit, type_buku
where
    buku.nama_buku = 'Teori Bumi Itu Datar' and
    pengarang.kode_pengarang = buku.kode_pengarang and
    penerbit.kode_penerbit = buku.kode_penerbit and
    type_buku.kode_type_buku = buku.kode_type_buku;
    
-- Nomor 4
Select *
from penerbit
where IS_ACTIVE='Y';

-- Nomor 5
Select pengarang.KODE_PENGARANG as Kode_Pengarang,
    pengarang.nama_pengarang as Nama_pengarang,
    pengarang.umur as Umur,
    kota.nama_kota as Kota_Tinggal
from pengarang
join kota
on kota.kode_kota = pengarang.kode_kota and (kota.nama_kota='Bandung' or kota.nama_kota='Jakarta');

-- Nomor 6
select *
from negara
where nama_negara like 'I%';

-- Nomor 7
select penerbit.kode_penerbit as Kode_penerbit,
    penerbit.nama_penerbit as Nama_penerbit,
    penerbit.is_active as Apakah_Aktif
from penerbit 
left outer join buku
on penerbit.KODE_PENERBIT = buku.kode_penerbit
where buku.kode_penerbit is null;

-- Nomor 8
select
    pengarang.kode_pengarang as Kode_Pengarang,
    buku.nama_buku as Nama_Buku,
    penerbit.nama_penerbit as Nama_Penerbit,
    agama.deskripsi as Agama,
    penerbit.is_active as Status,
    negara.nama_negara as Negara,
    kota.nama_kota as Kota,
    type_buku.deskripsi as Type_buku
from pengarang
join buku on pengarang.kode_pengarang = buku.kode_pengarang
join penerbit on penerbit.kode_penerbit = buku.kode_penerbit
join agama on pengarang.kode_agama = agama.kode_agama
join kota on pengarang.kode_kota = kota.kode_kota
join negara on kota.kode_negara = negara.kode_negara
join type_buku on buku.kode_type_buku = type_buku.kode_type_buku
where pengarang.kode_pengarang='P001';

-- Nomor 9
create view nomor9 as
select
    pengarang.kode_pengarang as Kode_Pengarang,
    buku.nama_buku as Nama_Buku,
    penerbit.nama_penerbit as Nama_Penerbit,
    agama.deskripsi as Agama,
    penerbit.is_active as Status,
    negara.nama_negara as Negara,
    kota.nama_kota as Kota,
    type_buku.deskripsi as Type_buku
from pengarang
join buku on pengarang.kode_pengarang = buku.kode_pengarang
join penerbit on penerbit.kode_penerbit = buku.kode_penerbit
join agama on pengarang.kode_agama = agama.kode_agama
join kota on pengarang.kode_kota = kota.kode_kota
join negara on kota.kode_negara = negara.kode_negara
join type_buku on buku.kode_type_buku = type_buku.kode_type_buku;

--menampilkan view
select * from Nomor9
where kode_pengarang = 'P001';

-- Nomor 10
Select
    pengarang.nama_pengarang,
    buku.nama_buku
from pengarang
left outer join buku
on pengarang.kode_pengarang = buku.kode_pengarang group by pengarang.nama_pengarang, buku.nama_buku
order by count(distinct pengarang.nama_pengarang);