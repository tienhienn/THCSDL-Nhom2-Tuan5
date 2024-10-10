create database QUANLYGIAOHANG
go
use QUANLYGIAOHANG
create table KHACHHANG
(
	makhachhang char(10) primary key,
	tencongty nvarchar(100),
	tengiaodich nvarchar(50),
	diachi nvarchar(100),
	email varchar(50) unique,
	dienthoai varchar(11) unique,
	fax varchar(11) unique
)
create table NHANVIEN
(
	manhanvien char(10) primary key,
	ho nvarchar(10),
	ten nvarchar(10),
	ngaysinh date,
	ngaylamviec date,
	diachi nvarchar(100),
	dienthoai varchar(11) unique,
	luongcoban money,
	phucap money
)
create table DONDATHANG
(
	sohoadon char(10) primary key,
	makhachhang char(10),
	manhanvien char(10),
	ngaydathang date,
	ngaygiaohang date,
	ngaychuyenhang date,
	noigiaohang nvarchar(100),
	foreign key(makhachhang) references KHACHHANG(makhachhang),
	foreign key(manhanvien) references NHANVIEN(manhanvien)
)
create table NHACUNGCAP
(
	macongty char(10) primary key,
	tencongty nvarchar(100),
	tengiaodich nvarchar(100),
	dienthoai varchar(11) unique,
	fax varchar(11) unique,
	email varchar(11) unique,
)
create table LOAIHANG
(
	maloaihang char(10) primary key,
	tenloaihang nvarchar(50),
)
create table MATHANG
(
	mahang char(10) primary key,
	tenhang nvarchar(100),
	macongty char(10),
	maloaihang char(10),
	soluong int,
	donvitinh money,
	giahang money,
    foreign key (maloaihang) references LOAIHANG(maloaihang),
    foreign key (macongty) references NHACUNGCAP(macongty)
)
create table CHITIETDONHANG
(
	sohoadon char(10),
	mahang char(10),
	giaban money,
	soluong int, 
	mucgiamgia decimal(5,2),
	primary key(sohoadon,mahang),
	foreign key (sohoadon) references DONDATHANG(sohoadon),
	foreign key (mahang) references MATHANG(mahang)
)

