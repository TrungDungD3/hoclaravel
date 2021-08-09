use master
go
create database thi_bang_lai_xe
go
use thi_bang_lai_xe
go
create table BaoCaoLoi
(
   MaSo nchar(20) not null primary key,
   MoTa nvarchar(50) not null,
   TinhTrang nvarchar(100)
) 

 create table Loai
 (
   MaLoai nchar(20) not null primary key,
   TenLoai nvarchar(50) not null,
 )

 create table CauHoi
 (
   MaCH nchar(20) not null primary key,
   NoiDung nvarchar(250) not null,
   MaLoai nchar(20),
   Hinh nvarchar(50), -- để kiểu dữ liệu gì?--
   DoKho nvarchar(50),
    constraint fk_CauHoi_Mon foreign key(MaLoai) references  Loai(MaLoai)
 )

 create table DapAn
 (
   MaDA nchar(20) not null primary key,
    MaCH nchar(20),
	NoiDung nvarchar(250),
	DungSai nvarchar(20)
	constraint fk_DapAn_CauHoi foreign key(MaCH) references CauHoi(MaCH)
 )

 create table GiamThi
 (
   MaGiamThi nchar(20) not null primary key,
   Ten nvarchar(100) not null,
   DangNhap nvarchar(250) ,
   MatKhau nvarchar(250),
   NgaySinh date,
 )

 create table ThiSinh
 (
    MaTS nchar(20) not null primary key,
	Ten nchar(50) not null,
	 DangNhap nvarchar(250) ,
   MatKhau nvarchar(250),
   NgaySinh date,
   ĐiaChi nvarchar(150)
 )

 create table KyThi
 (
    MaKyThi nchar(20) not null primary key,
    MaLoai nchar(20),
	TenKyThi nvarchar(50) not null,
	MaGiamThi nchar(20),
	ThoiGianLamBai time,
	ThoiGianMoDe time,
	ThoiGianDongDe time,
	TongSoCau int,
	constraint fk_KyThi_Loai foreign key(MaLoai) references Loai(MaLoai),
	constraint fk_KyThi_GiamThi foreign key(MaGiamThi) 	references GiamThi(MaGiamThi)
 )

 create table KetQua
 (
	MaKQ nchar(20) not null primary key,
	 MaTS nchar(20),
	MaKyThi nchar(20),
	NgayThi date,
	Diem float,
	ThoiGianThi time,
	ThoiGianTraLoi time,
	Loai nvarchar(50),
	constraint fk_KetQua_ThiSinh foreign key(MaTS) references ThiSinh(MaTS),
	constraint fk_KetQua_KyThi foreign key(MaKyThi) references 	KyThi (MaKyThi)
 )
