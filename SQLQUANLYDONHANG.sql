create database QUANLYDONHANG
use QUANLYDONHANG
create table KhachHang
(
	makhachhang char(10) primary key ,
	tencongty nvarchar(100),
	tengiaodich nvarchar(50),
	diachi nvarchar(100),
	email varchar(50) unique,
	dienthoai varchar(11) unique,
	fax varchar(11) unique
)
create table NhanVien
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
create table DonDatHang
(
	sohoadon char(10) primary key,
	makhachhang char(10),
	manhanvien char(10),
	ngaydathang date,
	ngaygiaohang date,
	ngaychuyenhang date,
	noigiaohang nvarchar(100),
	foreign key (manhanvien) references NhanVien(manhanvien),
	foreign key (makhachhang) references KhachHang(makhachhang)
)

create table NhaCungCap
(
	macongty char(10) primary key,
	tencongty nvarchar(100),
	tengiaodich nvarchar(100),
	diachi nvarchar(100),
	dienthoai varchar(11) unique,
	fax varchar(11) unique,
	email varchar(50) unique

)
create table LoaiHang
(
	maloaihang char(10) primary key,
	tenloaihang nvarchar(50)
)
create table MatHang
(
	mahang char(10) primary key,
	tenhang nvarchar(100),
	macongty char(10),
	maloaihang char(10),
	soluong int,
	donvitinh money,
	giahang money,
	foreign key (macongty) references NhaCungCap(macongty),
	foreign key (maloaihang) references LoaiHang(maloaihang)

)
create table ChiTietDonHang
(
	sohoadon char(10),
	mahang char(10),
	giaban money,
	soluong int,
	mucgiamgia decimal,
	primary key (sohoadon, mahang),
	foreign key (sohoadon) references DonDatHang(sohoadon),
	foreign key (mahang) references MatHang(mahang)
)
