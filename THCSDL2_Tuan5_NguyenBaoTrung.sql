create database Quanlycongtacgiaohang
use Quanlycongtacgiaohang
create table Khachhang
(
	Makhachhang char(10) primary key,
	Tencongty nvarchar(50),
	Tengiaodich nvarchar(50),
	Diachi nvarchar(50),
	Email varchar(30) unique,
	Dienthoai varchar(11) unique,
	Fax varchar(30) unique,
)
create table Nhanvien
(
	Manhanvien char(10) Primary key,
	Ho nvarchar(10),
	Ten nvarchar(10),
	Ngaysinh date,
	Ngaylamviec date,
	Diachi nvarchar(50),
	Dienthoai varchar(11) unique,
	Luongcoban money,
	Phucap money
)
create table Dondathang
(
	Sohoadon char(10) Primary key,
	Makhachhang char(10) foreign key (makhachhang) references Khachhang(Makhachhang),
	manhanvien char(10) foreign key (Manhanvien) references Nhanvien(Manhanvien),
	Ngaydathang date,
	Ngaygiaohang date,
	Ngaychuyenhang date,
	Noigiaohang nvarchar(50)
)
create table Loaihang
(
	Maloaihang char(10) primary key,
	Tenloaihang nvarchar(50)
)
create table Nhacungcap
(
	Macongty char(10) Primary key,
	Tencongty nvarchar(50),
	Tengiaodich nvarchar(50),
	Diachi nvarchar(50),
	Dienthoai varchar(11) unique,
	Fax varchar(30) unique,
	Email varchar(30) unique
)
create table Mahang
(
	Mahang char(10) primary key,
	Tenhang nvarchar(50),
	Macongty char(10) foreign key (Macongty) references Nhacungcap(Macongty),
	Maloaihang char(10) foreign key (Maloaihang) references Loaihang(Maloaihang),
	Soluong int,
	Donvitinh money,
	Giahang money
)
create table Chitietdathang
(
	Sohoadon char(10) ,
	Mahang char(10) ,
	Giaban money,
	Soluong int,
	Mucgiamgia decimal
	primary key (Sohoadon, Mahang),
	foreign key (Sohoadon) references Dondathang(Sohoadon),
	foreign key (Mahang) references Mahang(Mahang)
)