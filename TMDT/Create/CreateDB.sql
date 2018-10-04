
use master
go
--create database TMDT
-- on
-- (
--	 name='TMDT_dat',
--	 filename='D:\Data\SQLdb\TMDT_dat.mdf'
-- )
--log on
-- (
--	 name='TMDT_log',
--	 filename='D:\Data\SQLdb\TMDT_log.mdf'
-- )
go
use TMDT
go
create table Admin
(
	Username varchar(30) primary key,
	Password varchar(40)
)
go
create table Nhom
(
	IDNhom int identity(1,1) primary key,
	TenNhom nvarchar(50),
	SoLuong int default 0
)
go
create table Loai
(
	IDLoai int identity(1,1) primary key,
	TenLoai nvarchar(50),
	IDNhom int,
	SoLuong int default 0
	constraint FK_Loai_IDNhom foreign key (IDNhom) references Nhom(IDNhom)
)
go
create table NSX
(
	IDNSX int identity(1,1) primary key,
	TenNSX nvarchar(100),
	GioiThieu nvarchar(500) COLLATE Vietnamese_CI_AS,
	HinhAnh varchar(50),
	IDLoai int,
	constraint FK_NSX_IDLoai foreign key (IDLoai) references Loai(IDLoai)
)
go
create table SanPham
(
	IDSanPham int identity(1,1) primary key,
	TenSanPham nvarchar(100),
	HinhAnh varchar(50),
	DonGia decimal(12,0),
	SoLuongDaDat int,
	PhiVanChuyen decimal(12,0),
	NgayCapNhat datetime,
	IDNSX int,
	constraint FK_SanPham_IDNSX foreign key (IDNSX) references NSX(IDNSX)
)
go
create table KhuyenMai
(
	IDSanPham int primary key,
	GiamGia float,
	constraint FK_KhuyenMai_IDSanPham foreign key (IDSanPham) references SanPham(IDSanPham)
)
go
create table TaiKhoan
(
	IDUser int identity(1,1) primary key,
	Username varchar(30),
	Password varchar(40),
	HoTen nvarchar(50),
	GioiTinh bit,
	Email varchar(100),
	Sdt varchar(15)
)	
go
create table DatHang
(
	ID int identity(1,1) primary key,
	IDUser int,
	ThoiGianDatHang datetime,
	DiaChiGiaoHang nvarchar(200),
	ThanhTien decimal(12,0),
	DaGiaoHang bit,
	constraint KF_DatHang_IDUser foreign key (IDUser) references TaiKhoan(IDUser),
)
go
create table ChiTietDatHang
(
	ID int,
	IDSanPham int,
	SoLuong int,
	primary key (ID, IDSanPham),
	constraint FK_ChiTietDatHang_ID foreign key (ID) references DatHang(ID),
	constraint FK_ChiTietDatHang_IDSanPham foreign key (IDSanPham) references SanPham(IDSanPham)
)
go
create table CaiDat
(
	IDCaiDat int identity(1,1) primary key,
	TenThamSo varchar(50) unique,
	HienThi nvarchar(50),
	GiaTri nvarchar(100)
)
go
create table LogLogin
(
	IDLog int identity(1, 1) primary key,
	Username varchar(30),
	LoginTime datetime,
	constraint FK_Username foreign key (Username) references Admin(Username)
)