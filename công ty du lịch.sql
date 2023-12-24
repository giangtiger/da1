create database tour_du_lich;
-- tạo bảng tài khoản
create table taiKhoan (
ID nvarchar(10) not null primary key,
TenDangNhap nvarchar(50) not null,
MatKhau nvarchar(50) not null,
MaQuyen nvarchar(10) not null,
)
--tạo bảng nhân viên
create table NhanVien (
ID_NV nvarchar(10) not null,
Ten nvarchar(50) not null,
ntns date not null,
soCanCuoc int not null,
sdt int not null,
email nvarchar(50),
primary key(ID_NV),
foreign key(ID_NV) references taiKhoan(ID),
);

/*drop table taiKhoan;
drop table NhanVien;
drop table KhachHang;
drop table Ve;
drop table CongTyVT;
drop table KhachSan;
drop table Tour;*/

-- tạo bảng khách hàng
create table KhachHang (
ID_KH nvarchar(10) not null,
Ten nvarchar(50) not null,
ntns date not null,
soCanCuoc int not null,
sdt int not null,
email nvarchar(50),
primary key(ID_KH),
foreign key(ID_KH) references taiKhoan(ID)
);
-- tạo bảng công ty vận tải 
create table CongTyVT(
MaCTVT nvarchar(10) not null primary key,
Ten nvarchar(50) not null,
sdt int not null,
email nvarchar(20),
);
-- Tạo bảng khách sạn 
create table KhachSan(
MaKS nvarchar(10) not null primary key,
Ten nvarchar(50) not null,
DiaChi nvarchar(50) not null,
Sdt int not null,
email nvarchar(20),
);
-- Tạo bảng tour 
create table Tour (
MaTour nvarchar(10) not null primary key,
TenTour nvarchar(20) not null,
GiaTour_VND int,
LoaiTour nvarchar(20),
MaCTVT nvarchar(10) foreign key references CongTyVT(MaCTVT),
MaKS nvarchar(10) foreign key references KhachSan(MaKS),
);
-- Tạo bảng vé 
create table Ve (
MaVe nvarchar(10) not null primary key,
SoLuongNguoi int,
GiaVe_VND int,
NgayDi date,
NgayVe date,
LichTrinh nvarchar(100),
MaTour nvarchar(10) foreign key references Tour(MaTour),
ID_KH nvarchar(10) foreign key references KhachHang(ID_KH),
);

/*alter table taiKhoan
add foreign key (ID) references NhanVien(ID_NV);


alter table taiKhoan
add foreign key (ID) references KhachHang(ID_KH);*/

insert into taiKhoan(ID,TenDangNhap,MatKhau,MaQuyen)
values ('01','PhamBaDo', '123', '01');
insert into taiKhoan(ID,TenDangNhap,MatKhau,MaQuyen)
values ('02','Giang','234','02');
insert into NhanVien(ID_NV,Ten ,ntns,soCanCuoc,sdt,email)
values ('01','PhamBaDo','11/07/2002','012345','113','Do1107@gmail.com');
insert into KhachHang(ID_KH,Ten,ntns,soCanCuoc,sdt,email)
values ('02','Giang','11/09/2002','0123456','114','Giang1109@gmail.com');
insert into CongTyVT(MaCTVT,Ten,sdt,email)
values ('VT01','BaoYen','0978338788','VTBaoYen01@gmail.com');
insert into KhachSan(MaKS,Ten,DiaChi,Sdt,email)
values ('KS01','DauCungDuoc','HaNoi','0378888888','DCD01@gmail.com');
insert into KhachSan(MaKS,Ten,DiaChi,Sdt,email)
values ('KS02','TuyAnh','HaNoi','0378888889','Tuyanh02@gmail.com');
insert into Tour(MaTour,TenTour,GiaTour_VND,LoaiTour,MaCTVT,MaKS)
values ('T01', 'HaNoi','1000000','CaNhan','VT01','KS01');
insert into Ve(MaVe,SoLuongNguoi,GiaVe_VND,NgayDi,NgayVe,MaTour,ID_KH)
values ('HN01','1','1000000','9/1/2023','10/1/2023','T01','02');

/*delete taiKhoan;
delete NhanVien;*/

-- kiểm tra các bảng 
select *from taiKhoan
select *from NhanVien
select *from KhachHang
select *from CongTyVT
select *from KhachSan
select *from Tour
select *from Ve
