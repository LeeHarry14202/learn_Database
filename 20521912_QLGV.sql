USE master

CREATE DATABASE QLGV

USE QLGV

/*CAU 1*/
CREATE TABLE KHOA(
	MAKHOA VARCHAR(4),
	TENKHOA VARCHAR(40),
	NGTLAP SMALLDATETIME,
	TRGKHOA CHAR(4),
	CONSTRAINT PK_KHOA PRIMARY KEY (MAKHOA)
)

CREATE TABLE MONHOC(
	MAMH VARCHAR(10),
	TENMH VARCHAR(40),
	TCLT TINYINT,
	TCTH TINYINT,
	MAKHOA VARCHAR(4),
	CONSTRAINT PK_MON_HOC PRIMARY KEY(MAMH)
)

CREATE TABLE DIEUKIEN(
	MAMH VARCHAR(10),
	MAMH_TRUOC VARCHAR(10),
	CONSTRAINT PK_DIEUKIEN PRIMARY KEY(MAMH, MAMH_TRUOC)
)

CREATE TABLE GIAOVIEN(
	MAGV CHAR(4),
	HOTEN VARCHAR(40),
	HOCVI CHAR(10),
	HOCHAM CHAR(10),
	GIOITINH VARCHAR(3),
	NGSINH SMALLDATETIME,
	NGVL SMALLDATETIME,
	HESO NUMERIC(4,2),
	MUCLUONG MONEY,
	MAKHOA VARCHAR(4),
	CONSTRAINT PK_GIAOVIEN PRIMARY KEY (MAGV)
)

CREATE TABLE LOP(
	MALOP CHAR(3),
	TENLOP VARCHAR(40),
	TRGLOP CHAR(5),
	SISO TINYINT,
	MAGVCN CHAR(4),
	CONSTRAINT PK_LOP PRIMARY KEY(MALOP)
)

CREATE TABLE HOCVIEN(
	MAHV CHAR(5),
	HO VARCHAR(40),
	TEN VARCHAR(40),
	NGSINH SMALLDATETIME,
	GIOITINH VARCHAR(3),
	NOISINH VARCHAR(40),
	MALOP CHAR(3),
	CONSTRAINT PK_HOCVIEN PRIMARY KEY(MAHV)
)

CREATE TABLE GIANGDAY(
	MALOP CHAR(3),
	MAMH VARCHAR(10),
	MAGV CHAR(4),
	HOCKY TINYINT,
	NAM SMALLINT,
	TUNGAY SMALLDATETIME,
	DENNGAY SMALLDATETIME,
	CONSTRAINT PK_GIANGDAY PRIMARY KEY (MALOP, MAMH)
)

CREATE TABLE KETQUATHI(
	MAHV CHAR(5),
	MAMH VARCHAR(10),
	LANTHI TINYINT,
	NGTHI SMALLDATETIME,
	DIEM NUMERIC(4,2),
	KQUA VARCHAR(10),
	CONSTRAINT PK_KETQUATHI PRIMARY KEY (MAHV, MAMH, LANTHI)
)

ALTER TABLE DIEUKIEN
ADD CONSTRAINT FK_DK_MH FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)

ALTER TABLE GIANGDAY
ADD CONSTRAINT FK_GD_LOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP),
	CONSTRAINT FK_GD_MH FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH),
	CONSTRAINT FK_GD_GV FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV)

ALTER TABLE KETQUATHI
ADD CONSTRAINT FK_KQT_HV FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV),
	CONSTRAINT FK_KQT_MH FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)

ALTER TABLE GIAOVIEN
ADD CONSTRAINT FK_GV_KHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)

ALTER TABLE HOCVIEN
ADD CONSTRAINT FK_HV_LOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)

ALTER TABLE MONHOC
ADD CONSTRAINT FK_MH_KHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)


/*CAU 2*/
ALTER TABLE HOCVIEN
ADD GHICHU VARCHAR(20),
	DIEMTB NUMERIC(4,2),
	XEPLOAI CHAR(10)

/*CAU 3*/
ALTER TABLE HOCVIEN
add CONSTRAINT HOCVIEN_GIOITINH CHECK(GIOITINH ='Nam' OR GIOITINH ='Nu')

ALTER TABLE GIAOVIEN
add CONSTRAINT GIAOVIEN_GIOITINH CHECK(gioitinh ='Nam' OR gioitinh='Nu')

/*CAU 4*/
ALTER TABLE KETQUATHI
add CONSTRAINT KETQUATHI_DIEM CHECK (diem >=0 AND diem <= 10)

/*CAU 5*/

/*CAU 6*/
ALTER TABLE KETQUATHI
add CONSTRAINT KETQUATHI_LANTHI CHECK (lanthi>=0 AND lanthi <=3)

/*CAU 7*/
ALTER TABLE GIANGDAY
add CONSTRAINT GIANGDAY_HOCKY CHECK(hocky>0 AND hocky <=3)

/*CAU 8*/
ALTER TABLE GIAOVIEN
add CONSTRAINT GIAOVIEN_HOCVI CHECK (hocvi = 'CN' OR hocvi = 'KS'
                                    OR hocvi = 'Ths' OR hocvi = 'TS'
                                    OR hocvi = 'PTS')
/*CAU 9*/
ALTER TABLE LOP


/*CAU 10*/

/*CAU 11*/
ALTER TABLE HOCVIEN
add CONSTRAINT HOCVIEN_

/*CAU 12*/
ALTER TABLE GIANGDAY
add CONSTRAINT GIANGDAY_TUNGAY_DENNGAY CHECK (tungay < denngay)

/*CAU 13*/

/*CAU 14*/
ALTER TABLE MONHOC
ADD CONSTRAINT MONHOC_TCLT_TCTH CHECK (abs(tclt -tcth) <153)

/*CAU 15*/

/*CAU 16*/

-- v?? hieu h??a kh??a ngoai ---
alter table hocvien nocheck constraint FK_HV_LOP
alter table hocvien check constraint FK_HV_LOP

-- NHAP DU LIEU LOP --
set DATEFORMAT dmy
INSERT INTO LOP VALUES('K11','Lop 1 khoa 1','K1108',11,'GV07')
INSERT INTO LOP VALUES('K12','Lop 2 khoa 1','K1205',12,'GV09')
INSERT INTO LOP VALUES('K13','Lop 3 khoa 1','K1305',12,'GV14')

-- NHAP DU LIEU KHOA --
INSERT INTO KHOA VALUES('KHMT','Khoa hoc may tinh','7/6/2005','GV01')
INSERT INTO KHOA VALUES('HTTT','He thong thong tin','7/6/2005','GV02')
INSERT INTO KHOA VALUES('CNPM','Cong nghe phan mem','7/6/2005','GV04')
INSERT INTO KHOA VALUES('MTT','Mang va truyen thong','20/10/2005','GV03')
INSERT INTO KHOA VALUES('KTMT','Ky thuat may tinh','20/12/2005','Null')

-- NHAP DU LIEU GIAOVIEN --
INSERT INTO GIAOVIEN VALUES('GV01','Ho Thanh Son','PTS','GS','Nam','2/5/1950','11/1/2004',5,2250000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV02','Tran Tam Thanh','TS','PGS','Nam','17/12/1965','20/4/2004',4.5,2025000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV03','Do Nghiem Phung','TS','GS','Nu','1/8/1950','23/9/2004',4,1800000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV04','Tran Nam Son','TS','PGS','Nam','22/2/1961','12/1/2005',4.5,2025000,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV05','Mai Thanh Danh','ThS','GV','Nam','12/3/1958','12/1/2005',3,1350000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV06','Tran Doan Hung','TS','GV','Nam','11/3/1953','12/1/2005',4.5,2025000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV07','Nguyen Minh Tien','ThS','GV','Nam','23/11/1971','1/3/2005',4,1800000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV08','Le Thi Tran','KS','Null','Nu','26/3/1974','1/3/2005',1.69,760500,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV09','Nguyen To Lan','ThS','GV','Nu','31/12/1966','1/3/2005',4,1800000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV10','Le Tran Anh Loan','KS','Null','Nu','17/7/1972','1/3/2005',1.86,837000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV11','Ho Thanh Tung','CN','GV','Nam','12/1/1980','15/5/2005',2.67,1201500,'MTT')
INSERT INTO GIAOVIEN VALUES('GV12','Tran Van Anh','CN','Null','Nu','29/3/1981','15/5/2005',1.69,760500,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV13','Nguyen Linh Dan','CN','Null','Nu','23/5/1980','15/5/2005',1.69,760500,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV14','Truong Minh Chau','ThS','GV','Nu','30/11/1976','15/5/2005',3,1350000,'MTT')
INSERT INTO GIAOVIEN VALUES('GV15','Le Ha Thanh','ThS','GV','Nam','4/5/1978','15/5/2005',3,1350000,'KHMT')

-- NHAP DU LIEU MONHOC --
INSERT INTO MONHOC VALUES('THDC','Tin hoc dai cuong',4,1,'KHMT')
INSERT INTO MONHOC VALUES('CTRR','Cau truc roi rac',5,0,'KHMT')
INSERT INTO MONHOC VALUES('CSDL','Co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT')
INSERT INTO MONHOC VALUES('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT')
INSERT INTO MONHOC VALUES('DHMT','Do hoa may tinh',3,1,'KHMT')
INSERT INTO MONHOC VALUES('KTMT','Kien truc may tinh',3,0,'KTMT')
INSERT INTO MONHOC VALUES('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT')
INSERT INTO MONHOC VALUES('HDH','He dieu hanh',4,0,'KTMT')
INSERT INTO MONHOC VALUES('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM')
INSERT INTO MONHOC VALUES('LTCFW','Lap trinh C for win',3,1,'CNPM')
INSERT INTO MONHOC VALUES('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')

-- NHAP DU LIEU GIANGDAY --
INSERT INTO GIANGDAY VALUES ('K11','THDC','GV07',1,2006,'2/1/2006','12/5/2006')
INSERT INTO GIANGDAY VALUES ('K12','THDC','GV06',1,2006,'2/1/2006','12/5/2006')
INSERT INTO GIANGDAY VALUES ('K13','THDC','GV15',1,2006,'2/1/2006','12/5/2006')
INSERT INTO GIANGDAY VALUES ('K11','CTRR','GV02',1,2006,'9/1/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES ('K12','CTRR','GV02',1,2006,'9/1/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES ('K13','CTRR','GV08',1,2006,'9/1/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES ('K11','CSDL','GV05',2,2006,'1/6/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES ('K12','CSDL','GV09',2,2006,'1/6/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES ('K13','CTDLGT','GV15',2,2006,'1/6/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES ('K13','CSDL','GV05',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES ('K13','DHMT','GV07',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES ('K11','CTDLGT','GV15',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES ('K12','CTDLGT','GV15',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES ('K11','HDH','GV04',1,2007,'2/1/2007','18/2/2007')
INSERT INTO GIANGDAY VALUES ('K12','HDH','GV04',1,2007,'2/1/2007','20/3/2007')
INSERT INTO GIANGDAY VALUES ('K11','DHMT','GV07',1,2007,'18/2/2007','20/3/2007')

-- NHAP DU LIEU DIEUKIEN --
INSERT INTO DIEUKIEN VALUES ('CSDL','CTRR')
INSERT INTO DIEUKIEN VALUES ('CSDL','CTDLGT')
INSERT INTO DIEUKIEN VALUES ('CTDLGT','THDC')
INSERT INTO DIEUKIEN VALUES ('PTTKTT','THDC')
INSERT INTO DIEUKIEN VALUES ('PTTKTT','CTDLGT')
INSERT INTO DIEUKIEN VALUES ('DHMT','THDC')
INSERT INTO DIEUKIEN VALUES ('LTHDT','THDC')
INSERT INTO DIEUKIEN VALUES ('PTTKHTTT','CSDL')

-- NHAP DU LIEU HOCVIEN --
set DATEFORMAT dmy
INSERT INTO HOCVIEN VALUES ('K1101','Nguyen Van','A','27/1/1986','Nam','TpHCM','K11',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1102','Tran Ngoc','Han','14/3/1986','Nu','Kien Giang','K11',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1103','Ha Duy','Lap','18/4/1986','Nam','Nghe An','K11',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1104','Tran Ngoc','Linh','30/3/1986','Nu','Tay Ninh','K11',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1105','Tran Minh ','Long','27/2/1986','Nam','TpHCM','K11',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1106','Le Nhat ','Minh','24/1/1986','Nam','TpHCM','K11',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1107','Nguyen Nhu ','Nhut','27/1/1986','Nam','Ha Noi','K11',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1108','Nguyen Manh','Tam','27/2/1986','Nam','Kien Giang','K11',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1109','Pham Thi Thanh','Tam','27/1/1986','Nu','Vinh Long','K11',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1110','Le Hoai','Thuong','5/2/1986','Nu','Can Tho','K11',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1111','Le Ha','Vinh','25/12/1986','Nam','Vinh Long','K11',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1201','Nguyen Van','B','11/2/1986','Nam','TpHCM','K12',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1202','Nguyen Thi Kim','Duyen','18/1/1986','Nu','TpHCM','K12',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1203','Tran Thi Kim','Duyen','17/9/1986','Nu','TpHCM','K12',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1204','Truong My','Hanh','19/5/1986','Nu','Dong Nai','K12',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1205','Nguyen Thanh','Nam','17/4/1986','Nam','TpHCM','K12',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1206','Nguyen Thi Truc','Thanh','4/3/1986','Nu','Kien Giang','K12',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1207','Tran Thi Bich','Thuy','8/2/1986','Nu','Nghe An','K12',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1208','Huynh Thi Kim','Trieu','8/4/1986','Nu','Tay Ninh','K12',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1209','Pham Thanh','Trieu','23/2/1986','Nam','TpHCM','K12',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1210','Ngo Thanh','Tuan','14/2/1986','Nam','TpHCM','K12',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1211','Do Thi','Xuan','9/3/1986','Nu','Ha Noi','K12',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1212','Le Thi Phi','Yen','12/3/1986','Nu','TpHCM','K12',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1301','Nguyen Thi Kim','Cuc','9/6/1986','Nu','Kien Giang','K13',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1302','Nguyen Thi My','Hien','18/3/1986','Nu','Nghe An','K13',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1303','Le Duc','Hien','23/3/1986','Nam','Tay Ninh','K13',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1304','Le Quang','hien','18/4/1986','Nam','TpHCM','K13',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1305','Le Thi','Huong','27/3/1986','Nu','TpHCM','K13',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1306','Nguyen Thai','Huu','30/3/1986','Nam','Ha Noi','K13',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1307','Tran Minh','Man','28/5/1986','Nam','TpHCM','K13',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1308','Nguyen Hieu','Nghia','8/4/1986','Nam','Kien Giang','K13',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1309','Nguyen Trung','Nghia','18/1/1987','Nam','Nghe An','K13',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1310','Tran Thi Hong','Tham','22/4/1986','Nu','Tay Ninh','K13',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1311','Tran Minh','Thuc','4/4/1986','Nam','TpHCM','K13',null, null, null)
INSERT INTO HOCVIEN VALUES ('K1312','Nguyen Thi Kim','Yen','7/9/1986','Nu','TpHCM','K13',null, null, null)

-- NHAP DU LIEU KETQUATHI --
set DATEFORMAT dmy
INSERT INTO KETQUATHI VALUES ('K1101','CSDL',1,'20/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES ('K1101','CTDLGT',1,'28/12/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES ('K1101','THDC',1,'20/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES ('K1101','CTRR',1,'13/5/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CSDL',1,'20/7/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CSDL',2,'27/7/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CSDL',3,'10/8/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CTDLGT',1,'28/12/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CTDLGT',2,'5/1/2007',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CTDLGT',3,'15/1/2007',6,'Dat')
INSERT INTO KETQUATHI VALUES ('K1102','THDC',1,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CTRR',1,'13/5/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES ('K1103','CSDL',1,'20/7/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1103','CSDL',2,'27/7/2006',8.25,'Dat')
INSERT INTO KETQUATHI VALUES ('K1103','CTDLGT',1,'28/12/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES ('K1103','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES ('K1103','CTRR',1,'13/5/2006',6.5,'Dat')
INSERT INTO KETQUATHI VALUES ('K1104','CSDL',1,'20/7/2006',3.75,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104','CTRR',1,'13/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104','CTRR',2,'20/5/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104','CTRR',3,'30/6/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1201','CSDL',1,'20/7/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES ('K1201','CTDLGT',1,'28/12/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES ('K1201','THDC',1,'20/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES ('K1201','CTRR',1,'13/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES ('K1202','CSDL',1,'20/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES ('K1202','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202','CTDLGT',2,'5/1/2007',5,'Dat')
INSERT INTO KETQUATHI VALUES ('K1202','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202','THDC',2,'27/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202','CTRR',1,'13/5/2006',3,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202','CTRR',2,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202','CTRR',3,'30/6/2006',6.25,'Dat')
INSERT INTO KETQUATHI VALUES ('K1203','CSDL',1,'20/7/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES ('K1203','CTDLGT',1,'28/12/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES ('K1203','THDC',1,'20/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES ('K1203','CTRR',1,'13/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES ('K1204','CSDL',1,'20/7/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES ('K1204','CTDLGT',1,'28/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES ('K1204','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1204','CTRR',1,'13/5/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES ('K1301','CSDL',1,'20/12/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1301','CTDLGT',1,'25/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES ('K1301','THDC',1,'20/5/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES ('K1301','CTRR',1,'13/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES ('K1302','CSDL',1,'20/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES ('K1302','CTDLGT',1,'25/7/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES ('K1302','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES ('K1302','CTRR',1,'13/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES ('K1303','CSDL',1,'20/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303','CTDLGT',1,'25/7/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303','CTDLGT',2,'7/8/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303','CTDLGT',3,'15/8/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303','THDC',1,'20/5/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303','CTRR',1,'13/5/2006',3.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303','CTRR',2,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES ('K1304','CSDL',1,'20/12/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES ('K1304','CTDLGT',1,'25/7/2006',9.75,'Dat')
INSERT INTO KETQUATHI VALUES ('K1304','THDC',1,'20/5/2006',5.5,'Dat')
INSERT INTO KETQUATHI VALUES ('K1304','CTRR',1,'13/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES ('K1305','CSDL',1,'20/12/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES ('K1305','CTDLGT',1,'25/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES ('K1305','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES ('K1305','CTRR',1,'13/5/2006',10,'Dat')

/*II*/
/* Cau 1 */
UPDATE 
	GIAOVIEN
SET 
	heso = heso + 0.2
WHERE 
	magv IN (SELECT 
             	trgkhoa 
             FROM 
             	KHOA)

/* Cau 3 */
UPDATE 
	HOCVIEN 
set 
	ghichu = 'Cam thi'
WHERE 
	mahv IN (SELECT 
             	mahv 
             FROM 
             	KETQUATHI
             WHERE 
             lanthi = 3 
             AND 
             	diem < 5)

/* Cau 4 */
UPDATE 
	HOCVIEN
SET 
	xeploai =
    (
      CASE
        WHEN diemtb>= 9 THEN 'XS'
        WHEN diemtb >= 8 AND diemtb < 9 THEN 'G'
        WHEN diemtb >=6.5 AND diemtb < 8 THEN 'K'
        WHEN diemtb >= 5 AND diemtb < 6.5 THEN 'TB'
        WHEN diemtb < 5 THEN 'Y'
      END
    )

/*III*/
/* C??u 1: In ra danh s??ch (m?? h???c vi??n, h??? t??n, ng??y sinh, m?? l???p) l???p tr?????ng c???a c??c l???p.*/
SELECT 
	HOCVIEN.mahv, 
    (Ho+' '+Ten) HoTen, 
    HOCVIEN.ngsinh, 
    HOCVIEN.malop
FROM 
	HOCVIEN INNER JOIN LOP
ON 
	HOCVIEN.malop = LOP.malop 
WHERE 
	mahv IN (SELECT 
             	trglop 
             FROM 
             	LOP )
/*2. In ra b???ng ??i???m khi thi (m?? h???c vi??n, h??? t??n , l???n thi, ??i???m s???) m??n CTRR c???a l???p ???K12???,
s???p x???p theo t??n, h??? h???c vi??n.*/
SELECT 
	HOCVIEN.mahv, (Ho+' '+Ten) HoTen, lanthi, diem
FROM 
	HOCVIEN INNER JOIN KETQUATHI
ON 
	HOCVIEN.mahv = KETQUATHI.mahv
WHERE 
	HOCVIEN.malop = 'K12' 
    AND mamh = 'CTRR'
ORDER by 
	ten ASC

/*3. In ra danh s??ch nh???ng h???c vi??n (m?? h???c vi??n, h??? t??n) v?? nh???ng m??n h???c m?? h???c vi??n ???? thi
l???n th??? nh???t ???? ?????t.*/
SELECT 
	HOCVIEN.mahv, (Ho+' '+Ten) HoTen
FROM 
	HOCVIEN INNER JOIN KETQUATHI
ON 
	HOCVIEN.mahv = KETQUATHI.mahv
WHERE 
	lanthi = 1 
    AND kqua = 'Dat'

/*4. In ra danh s??ch h???c vi??n (m?? h???c vi??n, h??? t??n) c???a l???p ???K11??? thi m??n CTRR kh??ng ?????t (???
l???n thi 1).*/
-- C??ch 1
SELECT 
	DISTINCT HOCVIEN.mahv, (Ho+' '+Ten) HoTen
FROM 
	HOCVIEN INNER JOIN KETQUATHI
ON 
	HOCVIEN.mahv = KETQUATHI.mahv
WHERE 
	lanthi = 1 
    AND kqua = 'Khong Dat' 
    AND HOCVIEN.malop = 'K11' 
    AND mamh = 'CTRR'

-- C??ch 2
sELECT
	HocVien.MaHV, (Ho+' '+Ten) HoTen
FROM
	HocVien, KetQuaThi
WHERE
	HocVien.MaHV = KetQuaThi.MaHV
	AND MaLop = 'K11'
	AND MaMH = 'CTRR'
	AND KQua = 'Khong Dat'
	AND LanThi = 1

/*5. * Danh s??ch h???c vi??n (m?? h???c vi??n, h??? t??n) c???a l???p ???K??? thi m??n CTRR kh??ng ?????t (??? t???t c???
c??c l???n thi).*/
SELECT DISTINCT 
	HocVien.MaHV, (Ho+' '+Ten) HoTen
FROM 
	HOCVIEN, KETQUATHI
WHERE 
	HOCVIEN.mahv = KETQUATHI.mahv
    AND malop LIKE 'K%'
    AND NOT EXISTS (SELECT * 
                    FROM KETQUATHI 
                    WHERE 
                    	kqua = 'Dat' 
                        AND mamh = 'CTRR' 
                    	AND KETQUATHI.mahv = HOCVIEN.mahv)
              
/* with ties l???y t???t c??? c??c tr?????ng h??p c?? k???t qu??? t????ng t???*/
/*T??m c??i NH???T*/
/*C??CH 1*/
SELECT TOP 1 WITH TIES diem
FROM KETQUATHI
ORDER BY diem desc

SELECT diem
FROM KETQUATHI
WHERE diem >= ALL(SELECT diem FROM KETQUATHI)

SELECT diem
FROM KETQUATHI
WHERE diem = (SELECT MAX(diem) FROM KETQUATHI)

/*C??u 6. T??m t??n nh???ng m??n h???c m?? gi??o vi??n c?? t??n ???Tran Tam Thanh??? d???y trong h???c k??? 1 n??m
2006.*/
SELECT mamh, tenmh
FROM MONHOC
WHERE mamh IN (SELECT DISTINCT GIANGDAY.mamh
               FROM GIAOVIEN JOIN GIANGDAY
               ON GIAOVIEN.MAGV = GIANGDAY.MAGV
               WHERE 
               		hoten = 'Tran Tam Thanh' 
               		AND hocky = 1 
               		AND nam = 2006)

/*C??u 7. T??m nh???ng m??n h???c (m?? m??n h???c, t??n m??n h???c) m?? gi??o vi??n ch??? nhi???m l???p ???K11??? d???y
trong h???c k??? 1 n??m 2006.*/
SELECT mamh, tenmh
FROM MONHOC
WHERE mamh IN (SELECT DISTINCT GIANGDAY.mamh
               FROM GIAOVIEN JOIN GIANGDAY
               ON GIAOVIEN.MAGV = GIANGDAY.MAGV
               WHERE 
               		GIAOVIEN.magv IN (SELECT magvcn 
                                      FROM LOP) 
               		AND hocky = 1 
               		AND nam = 2006)

/*C??u 8. T??m h??? t??n l???p tr?????ng c???a c??c l???p m?? gi??o vi??n c?? t??n ???Nguyen To Lan??? d???y m??n ???Co So
Du Lieu???.*/
SELECT ho +' ' + ten
FROM HOCVIEN
WHERE mahv IN (SELECT trglop
               FROM LOP
               WHERE malop IN (SELECT GD.malop
                               FROM GIAOVIEN GV JOIN GIANGDAY GD
                               ON GV.magv = GD.magv
                               WHERE 
                               		hoten = 'Nguyen To Lan' 
                               		AND GD.mamh IN (SELECT mamh
                                                    FROM MONHOC 
                                                    wHERE tenmh = 'Co So Du Lieu')))

/*C??u 9. In ra danh s??ch nh???ng m??n h???c (m?? m??n h???c, t??n m??n h???c) ph???i h???c li???n tr?????c m??n ???Co So
Du Lieu???.*/
SELECT mamh,tenmh
FROM MONHOC
WHERE mamh IN (SELECT mamh_truoc
               FROM DIEUKIEN DK JOIN MONHOC MH
               ON DK.mamh = MH.mamh
               WHERE MH.tenmh = 'Co So Du Lieu')
               
/*C??u 10. M??n ???Cau Truc Roi Rac??? l?? m??n b???t bu???c ph???i h???c li???n tr?????c nh???ng m??n h???c (m?? m??n h???c,
t??n m??n h???c) n??o.*/
SELECT mamh, tenmh
FROM MONHOC
WHERE mamh IN (SELECT mamh
               FROM DIEUKIEN 
               WHERE mamh_truoc IN (SELECT mamh
                                    FROM MONHOC
                                    WHERE tenmh ='Cau Truc Roi Rac'))

/*C??U 11. T??m h??? t??n gi??o vi??n d???y m??n CTRR cho c??? hai l???p ???K11??? v?? ???K12??? trong c??ng h???c k??? 1
n??m 2006.*/
SELECT hoten
FROM GIAOVIEN
WHERE magv IN (SELECT magv
               FROM GIANGDAY 
               WHERE malop = 'K11' AND hocky = 1 AND nam = 2006 AND mamh = 'CTRR'
               INTERSECT
               SELECT magv
               FROM GIANGDAY 
               WHERE malop = 'K12' AND hocky = 1 AND nam = 2006 AND mamh = 'CTRR')

/*C??U 12. T??m nh???ng h???c vi??n (m?? h???c vi??n, h??? t??n) thi kh??ng ?????t m??n CSDL ??? l???n thi th??? 1 nh??ng
ch??a thi l???i m??n n??y.*/
SELECT DISTINCT mahv
FROM KETQUATHI
WHERE kqua = 'Khong Dat' AND mamh = 'CSDL' AND lanthi = 1
EXCEPT
SELECT mahv
FROM KETQUATHI
WHERE lanthi = 2 AND mamh = 'CSDL'

/*C??U 13. T??m gi??o vi??n (m?? gi??o vi??n, h??? t??n) kh??ng ???????c ph??n c??ng gi???ng d???y b???t k??? m??n h???c n??o.*/
SELECT magv, hoten
FROM GIAOVIEN
WHERE NOT EXISTS (SELECT DISTINCT magv 
                  FROM GIANGDAY 
                  WHERE GIAOVIEN.magv = GIANGDAY.magv) 


SELECT magv,hoten
FROM GIAOVIEN
WHERE magv IN (SELECT magv
               FROM GIAOVIEN
               EXCEPT
               SELECT magv
               FROM GIANGDAY)


/*C??U 14. T??m gi??o vi??n (m?? gi??o vi??n, h??? t??n) kh??ng ???????c ph??n c??ng gi???ng d???y b???t k??? m??n h???c 
n??o thu???c khoa gi??o vi??n ???? ph??? tr??ch.*/
SELECT magv, hoten
FROM GIAOVIEN
WHERE NOT EXISTS (SELECT * 
                  FROM MONHOC 
                  WHERE MONHOC.MAKHOA = GIAOVIEN.makhoa 
                  AND NOT EXISTS (SELECT * 
                                  FROM GIANGDAY 
                                  WHERE MONHOC.mamh = GIANGDAY.mamh 
                                  AND GIANGDAY.magv = GIAOVIEN.magv ))

/*C??U 15. T??m h??? t??n c??c h???c vi??n thu???c l???p ???K11??? thi m???t m??n b???t k??? qu?? 3 l???n v???n ???Khong dat???
ho???c thi l???n th??? 2 m??n CTRR ???????c 5 ??i???m.*/
SELECT ho +' '+ten
FROM HOCVIEN 
WHERE mahv IN(SELECT mahv
              FROM KETQUATHI
              WHERE kqua = 'Khong Dat'
              GROUP by mahv, mamh
              HAVING COUNT(mahv) > 3
              UNION 
              SELECT mahv
              FROM KETQUATHI
              WHERE 
					lanthi = 2 
    				AND mamh = 'CTRR' 
    				AND diem = 5 
					AND mahv IN (SELECT mahv 
                                 FROM HOCVIEN
                                 WHERE malop = 'K11'))
/*16. T??m h??? t??n gi??o vi??n d???y m??n CTRR cho ??t nh???t hai l???p trong c??ng m???t h???c k??? c???a m???t n??m
h???c.*/


/*17. Danh s??ch h???c vi??n v?? ??i???m thi m??n CSDL (ch??? l???y ??i???m c???a l???n thi sau c??ng).*/


/*18. Danh s??ch h???c vi??n v?? ??i???m thi m??n ???Co So Du Lieu??? (ch??? l???y ??i???m cao nh???t c???a c??c l???n
thi).*/


/*19. Khoa n??o (m?? khoa, t??n khoa) ???????c th??nh l???p s???m nh???t.*/
SELECT TOP 1 WITH TIES makhoa, tenkhoa
FROM KHOA
ORDER BY ngtlap ASC

/*20. C?? bao nhi??u gi??o vi??n c?? h???c h??m l?? ???GS??? ho???c ???PGS???.*/
SELECT hocham, COUNT(magv) magv
FROM GIAOVIEN
WHERE hocham = 'GS' OR hocham = 'PGS'
GROUP BY hocham

/*21. Th???ng k?? c?? bao nhi??u gi??o vi??n c?? h???c v??? l?? ???CN???, ???KS???, ???Ths???, ???TS???, ???PTS??? trong m???i
khoa.*/
SELECT makhoa,hocvi, COUNT(magv ) SL
FROM GIAOVIEN
GROUP BY makhoa, hocvi
/*22. M???i m??n h???c th???ng k?? s??? l?????ng h???c vi??n theo k???t qu??? (?????t v?? kh??ng ?????t).*/
SELECT mamh, kqua,COUNT(mahv)
FROM KETQUATHI
GROUP BY mamh, kqua
/*23. T??m gi??o vi??n (m?? gi??o vi??n, h??? t??n) l?? gi??o vi??n ch??? nhi???m c???a m???t l???p, ?????ng th???i d???y cho
l???p ???? ??t nh???t m???t m??n h???c.*/


/*24. T??m h??? t??n l???p tr?????ng c???a l???p c?? s??? s??? cao nh???t.*/
SELECT HO+' '+TEN
FROM HOCVIEN
WHERE mahv IN (SELECT TOP 1 WITH TIES trglop
               FROM LOP
               ORDER BY siso DESC)
/*25. * T??m h??? t??n nh???ng LOPTRG thi kh??ng ?????t qu?? 3 m??n (m???i m??n ?????u thi kh??ng ?????t ??? t???t c???
c??c l???n thi).*/

/*26. T??m h???c vi??n (m?? h???c vi??n, h??? t??n) c?? s??? m??n ?????t ??i???m 9,10 nhi???u nh???t.*/

/*27. Trong t???ng l???p, t??m h???c vi??n (m?? h???c vi??n, h??? t??n) c?? s??? m??n ?????t ??i???m 9,10 nhi???u nh???t.*/

/*28. Trong t???ng h???c k??? c???a t???ng n??m, m???i gi??o vi??n ph??n c??ng d???y bao nhi??u m??n h???c, bao
nhi??u l???p.*/

/*29. Trong t???ng h???c k??? c???a t???ng n??m, t??m gi??o vi??n (m?? gi??o vi??n, h??? t??n) gi???ng d???y nhi???u nh???t.*/


/*30. T??m m??n h???c (m?? m??n h???c, t??n m??n h???c) c?? nhi???u h???c vi??n thi kh??ng ?????t (??? l???n thi th??? 1)
nh???t.*/

/*31. T??m h???c vi??n (m?? h???c vi??n, h??? t??n) thi m??n n??o c??ng ?????t (ch??? x??t l???n thi th??? 1).*/

/*32. * T??m h???c vi??n (m?? h???c vi??n, h??? t??n) thi m??n n??o c??ng ?????t (ch??? x??t l???n thi sau c??ng).*/

/*33. * T??m h???c vi??n (m?? h???c vi??n, h??? t??n) ???? thi t???t c??? c??c m??n ?????u ?????t (ch??? x??t l???n thi th??? 1).*/

/*34. * T??m h???c vi??n (m?? h???c vi??n, h??? t??n) ???? thi t???t c??? c??c m??n ?????u ?????t (ch??? x??t l???n thi sau c??ng).*/

/*35. ** T??m h???c vi??n (m?? h???c vi??n, h??? t??n) c?? ??i???m thi cao nh???t trong t???ng m??n (l???y ??i???m ??? l???n
thi sau c??ng).*/




