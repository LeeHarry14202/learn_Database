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

-- vô hieu hóa khóa ngoai ---
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
/* Câu 1: In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.*/
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
/*2. In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”,
sắp xếp theo tên, họ học viên.*/
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

/*3. In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi
lần thứ nhất đã đạt.*/
SELECT 
	HOCVIEN.mahv, (Ho+' '+Ten) HoTen
FROM 
	HOCVIEN INNER JOIN KETQUATHI
ON 
	HOCVIEN.mahv = KETQUATHI.mahv
WHERE 
	lanthi = 1 
    AND kqua = 'Dat'

/*4. In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở
lần thi 1).*/
-- Cách 1
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

-- Cách 2
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

/*5. * Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả
các lần thi).*/
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
              
/* with ties lấy tất cả các trường hơp có kết quả tương tự*/
/*Tìm cái NHẤT*/
/*CÁCH 1*/
SELECT TOP 1 WITH TIES diem
FROM KETQUATHI
ORDER BY diem desc

SELECT diem
FROM KETQUATHI
WHERE diem >= ALL(SELECT diem FROM KETQUATHI)

SELECT diem
FROM KETQUATHI
WHERE diem = (SELECT MAX(diem) FROM KETQUATHI)

/*Câu 6. Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm
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

/*Câu 7. Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy
trong học kỳ 1 năm 2006.*/
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

/*Câu 8. Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So
Du Lieu”.*/
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

/*Câu 9. In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So
Du Lieu”.*/
SELECT mamh,tenmh
FROM MONHOC
WHERE mamh IN (SELECT mamh_truoc
               FROM DIEUKIEN DK JOIN MONHOC MH
               ON DK.mamh = MH.mamh
               WHERE MH.tenmh = 'Co So Du Lieu')
               
/*Câu 10. Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học,
tên môn học) nào.*/
SELECT mamh, tenmh
FROM MONHOC
WHERE mamh IN (SELECT mamh
               FROM DIEUKIEN 
               WHERE mamh_truoc IN (SELECT mamh
                                    FROM MONHOC
                                    WHERE tenmh ='Cau Truc Roi Rac'))

/*CÂU 11. Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1
năm 2006.*/
SELECT hoten
FROM GIAOVIEN
WHERE magv IN (SELECT magv
               FROM GIANGDAY 
               WHERE malop = 'K11' AND hocky = 1 AND nam = 2006 AND mamh = 'CTRR'
               INTERSECT
               SELECT magv
               FROM GIANGDAY 
               WHERE malop = 'K12' AND hocky = 1 AND nam = 2006 AND mamh = 'CTRR')

/*CÂU 12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng
chưa thi lại môn này.*/
SELECT DISTINCT mahv
FROM KETQUATHI
WHERE kqua = 'Khong Dat' AND mamh = 'CSDL' AND lanthi = 1
EXCEPT
SELECT mahv
FROM KETQUATHI
WHERE lanthi = 2 AND mamh = 'CSDL'

/*CÂU 13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.*/
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


/*CÂU 14. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học 
nào thuộc khoa giáo viên đó phụ trách.*/
SELECT magv, hoten
FROM GIAOVIEN
WHERE NOT EXISTS (SELECT * 
                  FROM MONHOC 
                  WHERE MONHOC.MAKHOA = GIAOVIEN.makhoa 
                  AND NOT EXISTS (SELECT * 
                                  FROM GIANGDAY 
                                  WHERE MONHOC.mamh = GIANGDAY.mamh 
                                  AND GIANGDAY.magv = GIAOVIEN.magv ))

/*CÂU 15. Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat”
hoặc thi lần thứ 2 môn CTRR được 5 điểm.*/
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
/*16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm
học.*/


/*17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).*/


/*18. Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần
thi).*/


/*19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.*/
SELECT TOP 1 WITH TIES makhoa, tenkhoa
FROM KHOA
ORDER BY ngtlap ASC

/*20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.*/
SELECT hocham, COUNT(magv) magv
FROM GIAOVIEN
WHERE hocham = 'GS' OR hocham = 'PGS'
GROUP BY hocham

/*21. Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi
khoa.*/
SELECT makhoa,hocvi, COUNT(magv ) SL
FROM GIAOVIEN
GROUP BY makhoa, hocvi
/*22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).*/
SELECT mamh, kqua,COUNT(mahv)
FROM KETQUATHI
GROUP BY mamh, kqua
/*23. Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho
lớp đó ít nhất một môn học.*/


/*24. Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.*/
SELECT HO+' '+TEN
FROM HOCVIEN
WHERE mahv IN (SELECT TOP 1 WITH TIES trglop
               FROM LOP
               ORDER BY siso DESC)
/*25. * Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả
các lần thi).*/

/*26. Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.*/

/*27. Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.*/

/*28. Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao
nhiêu lớp.*/

/*29. Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.*/


/*30. Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1)
nhất.*/

/*31. Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).*/

/*32. * Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).*/

/*33. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1).*/

/*34. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi sau cùng).*/

/*35. ** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần
thi sau cùng).*/




