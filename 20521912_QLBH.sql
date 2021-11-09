
/*CÂU 1*/
CREATE TABLE KHACHHANG(
	MAKH CHAR(4), CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKH),
	HOTEN VARCHAR(40),
	DCHI VARCHAR(40),
	SODT VARCHAR(40),
	NGSINH SMALLDATETIME,
	NGDK SMALLDATETIME,
	DOANHSO MONEY,
)

CREATE TABLE NHANVIEN(
	MANV CHAR(4) CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV),
	HOTEN VARCHAR(40),
	SODT VARCHAR(40),
	NGVL SMALLDATETIME
)

CREATE TABLE SANPHAM(
	MASP CHAR(4) CONSTRAINT PK_SANPHAM PRIMARY KEY(MASP),
	TENSP VARCHAR(40),
	DVT VARCHAR(40),
	NUOCSX VARCHAR(40),
	GIA MONEY
)

CREATE TABLE HOADON(
	SOHD INT CONSTRAINT PK_SOHD PRIMARY KEY (SOHD),
	NGHD SMALLDATETIME,
	MAKH CHAR(4) CONSTRAINT FK_HD_KH FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH) ,
	MANV CHAR(4) CONSTRAINT FK_HD_NV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
	TRIGIA MONEY
)

CREATE TABLE CTHD(
	SOHD INT ,
	MASP CHAR(4) ,
	SL INT,
	CONSTRAINT PK_CTHD PRIMARY KEY (SOHD, MASP)
)

ALTER TABLE CTHD
ADD CONSTRAINT FK_CTHD_HD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)

ALTER TABLE CTHD
ADD CONSTRAINT FK_CTHD_SP FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)

/*CÂU 2*/
ALTER TABLE SANPHAM
ADD GHICHU VARCHAR(20)

/*CÂU 3*/
ALTER TABLE KHACHHANG
ADD LOAIKH TINYINT

/*CÂU 4*/
ALTER TABLE SANPHAM
ALTER COLUMN GHICHU VARCHAR(100)

/*CÂU 5*/
ALTER TABLE SANPHAM
DROP COLUMN GHICHU

/*CÂU 6*/
ALTER TABLE KHACHHANG
ALTER COLUMN LOAIKH VARCHAR(20)

/*CÂU 7*/
ALTER TABLE SANPHAM
ADD CONSTRAINT SANPHAM_DVT CHECK (DVT = 'cay' OR DVT = 'hop'
                                  OR DVT = 'cai' OR DVT = 'quyen'
                                  OR DVT = 'chuc')
/*CÂU 8*/
ALTER TABLE SANPHAM
add CONSTRAINT SANPHAM_GIA CHECK (GIA >= 500)

/*CÂU 9*/
ALTER TABLE CTHD
ADD CONSTRAINT CTHD_SL CHECK (SL >=1)

/*CÂU 10*/
ALTER TABLE KHACHHANG
ADD CONSTRAINT KHACHHANG_NGDK CHECK(NGDK >NGSINH)

/*II*/
/*CÂU 1*/
sET DATEFORMAT dmy
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV01', 'Nguyen Nhu Nhut', '0927345678', '13/4/2006')
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV02', 'Le Thi Phi Yen', '0987567390', '21/4/2006')
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV03', 'Nguyen Van B', '0997047382', '27/4/2006')
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV04', 'Ngo Thanh Tuan', '0913758498', '24/6/2006')
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV05', 'Nguyen Thi Truc Thanh', '0918590387', '20/7/2006')


sET DATEFORMAT dmy
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH01', 'Nguyen Van A', '731, Tran Hung Dao, Q5, TPHCM', '08823451', '22/10/1960', 13060000, '22/07/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '03/04/1974', 280000, '30/07/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', '12/06/1980', 3860000, '05/08/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH04', 'Tran Minh Long', '50/34 Le Dai hanh, Q10, TpHCM', '0917325476', '09/03/1965', 250000, '02/10/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TPHCM', '08246108', '10/03/1960', 21000, '28/10/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738', '31/12/1981', 915000, '24/11/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565', '06/04/1971', 12500, '01/12/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TPHCM', '0938435756', '10/01/1971', 365000, '13/12/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TPHCM', '08654763', '03/09/1979', 70000, '14/01/2007')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TPHCM', '08768904', '02/05/1963', 67500, '16/01/2007')

sET DATEFORMAT dmy
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BC01', 'But Chi', 'cay', 'Singapore', 3000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BC02', 'But Chi', 'cay', 'Singapore', 5000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BC03', 'But Chi', 'cay', 'Viet Nam', 3500)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BC04', 'But Chi', 'hop', 'Viet Nam', 30000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BB01', 'But bi', 'cay', 'Viet Nam', 5000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BB02', 'But bi', 'cay', 'Trung Quoc', 7000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BB03', 'But bi', 'hop', 'Thai Lan', 100000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', 2500)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', 4500)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', 3000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', 5500)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', 23000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', 53000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV07', 'Tap 100 trang', 'chuc', 'Trung Quoc', 34000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', 40000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', 55000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST03', 'So tay loai 2', 'quyen', 'Viet Nam', 51000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST04', 'So tay', 'quyen', 'Thai Lan', 55000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST07', 'Phan khong bui', 'hop', 'Viet Nam', 5000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST08', 'Bong bang', 'cai', 'Viet Nam', 1000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST09', 'But long', 'cay', 'Viet Nam', 5000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST10', 'But long', 'cay', 'Trung Quoc', 7000)

SET DATEFORMAT dmy
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1001, '23/07/2006', 'KH01', 'NV01', 320000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1002, '12/08/2006', 'KH01', 'NV02', 840000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1003, '23/06/2006', 'KH02', 'NV01', 100000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1004, '01/09/2006', 'KH02', 'NV01', 180000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1005, '20/10/2006', 'KH01', 'NV02', 3800000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1006, '16/10/2006', 'KH01', 'NV03', 2430000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1007, '28/10/2006', 'KH03', 'NV03', 510000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1008, '28/10/2006', 'KH01', 'NV03', 440000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1009, '28/10/2006', 'KH03', 'NV04', 320000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1010, '01/11/2006', 'KH01', 'NV01', 5200000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1011, '04/11/2006', 'KH04', 'NV03', 250000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1012, '30/11/2006', 'KH05', 'NV03', 21000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1013, '12/12/2006', 'KH06', 'NV01', 5000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1014, '31/12/2006', 'KH03', 'NV02', 3150000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1015, '01/01/2007', 'KH06', 'NV01', 910000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1016, '01/01/2007', 'KH07', 'NV02', 12500)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1017, '02/01/2007', 'KH08', 'NV03', 35000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1018, '13/01/2007', 'KH08', 'NV03', 330000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1019, '13/01/2007', 'KH01', 'NV03', 30000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1020, '14/01/2007', 'KH09', 'NV04', 70000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1021, '16/01/2007', 'KH10', 'NV03', 67500)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1022, '16/01/2007', NULL, 'NV03', 7000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1023, '17/01/2007', NULL, 'NV01', 330000)


INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1001, 'TV02', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1001, 'ST01', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1001, 'BC01', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1001, 'BC02', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1001, 'ST08', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1002, 'BC04', 20)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1002, 'BB01', 20)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1002, 'BB02', 20)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1002, 'BB03', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1004, 'TV01', 20)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1004, 'TV02', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1004, 'TV03', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1004, 'TV04', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1005, 'TV05', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1005, 'TV06', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1001, 'TV07', 20)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1006, 'ST01', 30)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1006, 'ST02', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1007, 'ST03', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1008, 'ST04', 8)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1009, 'ST05', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1010, 'TV07', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1010, 'ST07', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1010, 'ST08', 100)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1010, 'ST04', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1010, 'TV03', 100)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1011, 'ST06', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1012, 'ST07', 3)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1013, 'ST08', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1014, 'BC02', 80)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1014, 'BB02', 100)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1014, 'BC04', 60)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1014, 'BB01', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1015, 'BB02', 30)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1015, 'BB03', 7)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1016, 'TV01', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1017, 'TV02', 1)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1017, 'TV03', 1)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1017, 'TV04', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1018, 'ST04', 6)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1019, 'ST05', 1)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1019, 'ST06', 2)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1020, 'ST07', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1021, 'ST08', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1021, 'TV01', 7)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1021, 'TV02', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1022, 'TV02', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1023, 'ST04', 6)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1023, 'BC01', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1023, 'ST02', 1)

/*CÂU 2*/
SELECT * INTO SANPHAM1 FROM SANPHAM
SELECT * FROM SANPHAM1

SELECT * INTO KHACHHANG1 FROM KHACHHANG
SELECT * FROM KHACHHANG1

/*CÂU 3*/
ALTER TABLE SANPHAM1
ALTER COLUMN gia FLOAT

UPDATE SANPHAM1 
set gia += gia * 0.05 
WHERE nuocsx = 'Thai Lan'

/*CÂU 4*/
UPDATE SANPHAM1 
set gia -= gia * 0.05 
WHERE nuocsx = 'Trung Quoc' AND gia > 10000

/*CÂU 5*/
UPDATE KHACHHANG1 
set loaikh = 'Vip' 
WHERE (ngdk < '1/1/2007' and doanhso >= 10000000) or (ngdk > '1/1/2007' and doanhso >= 2000000)

/*III*/

/*CÂU 1: In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.*/
SELECT masp, tensp 
FROM SANPHAM 
WHERE nuocsx = 'Trung Quoc' 

/*CÂU 2: In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.*/
SELECT masp, tensp 
FROM SANPHAM 
WHERE dvt = 'cay' or dvt = 'quyen' 

/*CÂU 3: In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.*/
SELECT masp, tensp 
FROM SANPHAM 
WHERE masp like 'B%01'

/*CÂU 4: In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến
40.000.*/
SELECT masp, tensp 
FROM SANPHAM 
WHERE nuocsx = 'Trung Quoc' and gia BETWEEN 30000 and 40000 

/*CÂU 5: In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ
30.000 đến 40.000.*/
SELECT masp, tensp 
FROM SANPHAM 
WHERE (nuocsx = 'Trung Quoc' or nuocsx = 'Thai Lan') and gia BETWEEN 30000 and 40000 

/*CÂU 6: In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.*/
SELECT sohd, trigia 
FROM HOADON 
WHERE nghd = '1/1/2007' or nghd = '2/1/2007'

/*CÂU 7: In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của
hóa đơn (giảm dần).*/
SELECT sohd, trigia 
FROM HOADON 
WHERE  MONTH(nghd) = 1 AND YEAR(nghd) = 2007 
ORDER BY trigia DESC, nghd ASC

/*CÂU 8: In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.*/
SELECT KHACHHANG.makh, hoten
FROM KHACHHANG INNER JOIN HOADON
ON KHACHHANG.makh = HOADON.makh
WHERE nghd = '1/1/2007'

/*CÂU 9: In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày
28/10/2006.*/
SELECT HOADON.sohd, trigia
FROM HOADON INNER JOIN NHANVIEN
on HOADON.manv = NHANVIEN.manv
WHERE hoten = 'Nguyen Van B' AND nghd = '10/28/2007'

/*Cau 10: In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong
tháng 10/2006.*/
SELECT SANPHAM.masp, tensp
FROM SANPHAM INNER JOIN CTHD
ON SANPHAM.masp = CTHD.masp
WHERE sohd IN
	(SELECT HOADON.sohd 
     From HOADON INNER JOIN KHACHHANG
     on HOADON.makh = KHACHHANG.makh
     WHERE MONTH(nghd) = '10' 
     AND YEAR(nghd) = '2006' 
     AND hoten = 'Nguyen Van A')

/*Cau 11: Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.*/
-- Cach 1
SELECT DISTINCT sohd
FROM CTHD
WHERE masp IN ('BB01', 'BB02')

-- Cach 2
SELECT sohd
FROM CTHD
WHERE masp = 'BB01'
UNION
SELECT sohd
FROM CTHD
WHERE masp = 'BB02'

/*Cau 12: Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số
lượng từ 10 đến 20.*/
-- Cach 1
SELECT DISTINCT sohd
FROM CTHD
WHERE masp IN ('BB01', 'BB02') AND sl BETWEEN 10 AND 20

-- Cach 2
SELECT sohd
FROM CTHD
WHERE masp = 'BB01'
AND SL BETWEEN 10 AND 20 
UNION
SELECT sohd
FROM CTHD
WHERE masp = 'BB02'
AND SL BETWEEN 10 AND 20 

/*Cau 13:Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với
số lượng từ 10 đến 20.*/
-- Cach 1
SELECT sohd
FROM CTHD A
WHERE A.MASP = 'BB01'
	AND SL BETWEEN 10 AND 20
	AND EXISTS(SELECT *
               FROM CTHD B 
               WHERE B.MASP = 'BB02'
               AND SL BETWEEN 10 AND 20
               AND A.SOHD = B.SOHD)
               
-- Cach 2
SELECT sohd
FROM CTHD
WHERE masp = 'BB01'
AND SL BETWEEN 10 AND 20 
INTERSECT
SELECT sohd
FROM CTHD
WHERE masp = 'BB02'
AND SL BETWEEN 10 AND 20 

/*Cau 14: Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với
số lượng từ 10 đến 20.*/
-- Cach 1 Không dùng OR do sẽ bị thiếu TH
SELECT DISTINCT SANPHAM.masp, SANPHAM.tensp
FROM SANPHAM INNER JOIN CTHD
ON SANPHAM.MASP = CTHD.masp
WHERE nuocsx = 'Trung Quoc' 
OR CTHD.sohd IN (SELECT sohd 
                     FROM HOADON 
                     WHERE nghd = '1/1/2007')

-- Cách 2: Nên dùng
SELECT SANPHAM.masp, SANPHAM.tensp
FROM SANPHAM
WHERE nuocsx = 'Trung Quoc'
UNION
SELECT SANPHAM.masp, SANPHAM.tensp
FROM SANPHAM INNER JOIN CTHD
ON SANPHAM.MASP = CTHD.MASP
WHERE CTHD.SOHD IN (SELECT sohd 
                     FROM HOADON 
                     WHERE nghd = '1/1/2007')

/*Cau 15: In ra danh sách các sản phẩm (MASP,TENSP) không bán được.*/
SELECT masp, tensp
FROM SANPHAM
WHERE masp NOT IN (SELECT SANPHAM.masp
                  FROM SANPHAM INNER JOIN CTHD 
                  ON SANPHAM.MASP = CTHD.MASP)

/*Cau 16: In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.*/
SELECT masp, tensp
FROM SANPHAM
WHERE masp NOT IN (
  -- Lấy ra SANPHAM bán năm 2006
  SELECT SANPHAM.masp 
  FROM SANPHAM INNER JOIN CTHD 
  ON SANPHAM.MASP = CTHD.MASP 
  WHERE CTHD.SOHD IN (
    -- Lấy ra HOADON bán năm 2006
     SELECT HOADON.SOHD 
     FROM HOADON INNER JOIN CTHD 
     ON HOADON.SOHD = CTHD.SOHD 
     WHERE YEAR(nghd) = 2006))

/* Cau 17: In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong
năm 2006.*/
SELECT masp, tensp
FROM SANPHAM
WHERE masp NOT IN (
  -- Lấy ra SANPHAM bán năm 2006 do 'Trung Quoc' sản xuất
  SELECT SANPHAM.masp 
  FROM SANPHAM INNER JOIN CTHD 
  ON SANPHAM.MASP = CTHD.MASP 
  WHERE CTHD.SOHD IN (
    -- Lấy ra HOADON bán năm 2006
     SELECT HOADON.SOHD 
     FROM HOADON INNER JOIN CTHD 
     ON HOADON.SOHD = CTHD.SOHD 
     WHERE YEAR(nghd) = 2006)) AND nuocsx = 'Trung Quoc'

/*Câu 18: Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.*/
SELECT DISTINCT CTHD.sohd
FROM CTHD INNER JOIN SANPHAM
ON CTHD.MASP = SANPHAM.MASP
WHERE SANPHAM.NUOCSX = 'Singapore' AND CTHD.SOHD IN (SELECT sohd 
                                                     FROM CTHD 
                                                     WHERE masp = 'BC01'
                                                     INTERSECT 
                                                     SELECT sohd
                                                     FROM CTHD 
                                                     WHERE masp = 'BC02')
                                                    
SELECT H.SOHD 
FROM HOADON H
WHERE NOT EXISTS(SELECT * 
                 FROM SANPHAM S
                 WHERE NUOCSX = 'SINGAPORE'
                 AND NOT EXISTS(SELECT * 
                                FROM CTHD C
                                WHERE C.SOHD = H.SOHD
                                AND C.MASP = S.MASP))
/*Đếm dòng*/
SELECT COUNT(*) Đặt_Tên_Nè
FROM HOADON

/*Đếm dòng đã được điền */
SELECT COUNT(makh)
FROM HOADON
 
/*Đếm các mã tổn tại*/
SELECT COUNT(DISTINCT makh)
FROM HOADON

/*Câu 20: Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?*/
SELECT COUNT(sohd)
From HOADON
WHERE makh is NULL

/*Câu 21: Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.*/
SELECT COUNT(DISTINCT masp)
FROM CTHD JOIN HOADON HD
ON CTHD.sohd = HD.sohd
WHERE YEAR(nghd) = 2006

SELECT COUNT(DISTINCT masp)
FROM CTHD
WHERE sohd IN (SELECT sohd 
               FROM HOADON
               WHERE YEAR(nghd) = 2006)
               
/*Câu 22: Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?*/
-- CAO NHẤT --
SELECT trigia
FROM HOADON
WHERE trigia >= all(SELECT trigia 
                    FROM HOADON)
                    
SELECT TOP 1 WITH TIES trigia
FROM HOADON
ORDER BY trigia DESC

SELECT trigia 
FROM HOADON
WHERE trigia = (SELECT max(trigia) 
                   FROM HOADON)
                   
-- THẤP NHẤT --
SELECT TOP 1 WITH TIES trigia 
FROM HOADON
ORDER by trigia ASC

SELECT trigia
FROM HOADON
WHERE trigia = (SELECT MIN(trigia) 
                FROM HOADON)
                
SELECT trigia
FROM HOADON
WHERE trigia <= ALL(SELECT trigia 
                    FROM HOADON)
                   
/*Câu 23: Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?*/
SELECT avg(trigia) TriGiaTrungBinh
FROM HOADON
WHERE YEAR(nghd) = 2006

/*Câu 24: Tính doanh thu bán hàng trong năm 2006.*/
SELECT SUM(trigia)
FROM HOADON

/*Câu 25: Tìm số hóa đơn có trị giá cao nhất trong năm 2006.*/
SELECT TOP 1 sohd
FROM HOADON
WHERE YEAR(nghd)=2006
ORDER BY trigia DESC

SELECT sohd 
FROM HOADON
WHERE trigia >= all(SELECT trigia 
                    FROM HOADON)

SELECT sohd
FROM HOADON
WHERE trigia = (SELECT max(trigia) 
                FROM HOADON)

/*Câu 26: Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.*/
SELECT TOP 1 hoten
FROM KHACHHANG JOIN HOADON 
ON KHACHHANG.makh = HOADON.makh
ORDER by trigia DESC

SELECT hoten
FROM KHACHHANG
WHERE makh = (SELECT makh 
              FROM HOADON 
              WHERE trigia = (SELECT max(trigia) 
                              FROM HOADON 
                              WHERE YEAR(nghd)=2006)) 

                              
SELECT hoten
FROM KHACHHANG KH JOIN HOADON HD
on KH.makh = HD.makh
WHERE trigia = (SELECT max(trigia) 
                FROM HOADON 
                WHERE YEAR(nghd) = 2006)

/*Câu 27: In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.*/
SELECT TOP 3 makh, hoten
FROM KHACHHANG
ORDER BY doanhso DESC 

/*Câu 28: In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.*/

SELECT masp, tensp
FROM SANPHAM
WHERE gia IN (SELECT DISTINCT TOP 3 gia 
              FROM SANPHAM 
              ORDER BY gia DESC)
--TEST--
SELECT DISTINCT TOP 3 gia 
FROM SANPHAM               
ORDER BY gia DESC

SELECT TOP 3 gia 
FROM SANPHAM 
ORDER BY gia DESC

/*Cau 29: In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức
giá cao nhất (của tất cả các sản phẩm).*/
SELECT masp, tensp
from SANPHAM
WHERE nuocsx = 'Thai Lan'
AND gia IN (SELECT DISTINCT TOP 3 gia 
            FROM SANPHAM 
            ORDER BY gia DESC)

/*CAU 30: In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức
giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).*/
SELECT masp, tensp
FROM SANPHAM
WHERE nuocsx = 'Trung Quoc' 
AND gia IN (SELECT DISTINCT TOP 3 GIA 
            FROM SANPHAM 
            ORDER BY GIA DESC)

/*Cau 31: In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).*/
SELECT TOP 3 makh, hoten, doanhso
FROM KHACHHANG
ORDER BY doanhso DESC 

/*Cau 32: Tính tổng số sản phẩm do “Trung Quoc” sản xuất.*/
SELECT COUNT(masp)
FROM SANPHAM
WHERE nuocsx = 'Trung Quoc'

/*Cau 33: Tính tổng số sản phẩm của từng nước sản xuất.*/
-- 'Từng' nhớ dùng GROUP BY
SELECT nuocsx, COUNT(masp)
FROM SANPHAM
GROUP BY nuocsx

/*Cau 34: Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.*/
-- Nhớ đặt tên cho cột --
SELECT nuocsx, MAX(gia) GiaCaoNhat, Min(gia) GiaThapNhat, AVG(gia) GiaTrungBinh
FROM SANPHAM
GROUP BY nuocsx

/*Cau 35: Tính doanh thu bán hàng mỗi ngày.*/
SELECT DAY(nghd) Ngày,SUM(doanhso) DoanhthuNgay
FROM KHACHHANG KH JOIN HOADON HD
ON KH.makh = HD.makh
GROUP BY DAY(nghd)

/*Cau 36: Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.*/
SELECT masp, COUNT(sl)
from CTHD JOIN HOADON
ON CTHD.sohd = HOADON.sohd
WHERE MONTH(nghd) = 10 AND YEAR(nghd) = 2006
GROUP BY masp

/*CaU 37: Tính doanh thu bán hàng của từng tháng trong năm 2006.*/
SELECT MONTH(nghd) Tháng, SUM(trigia) DoanhthuThang
FROM HOADON
WHERE YEAR(nghd) = 2006
GROUP by MONTH(nghd)

/*Cau 38: Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.*/
SELECT HD.sohd
FROM HOADON HD JOIN CTHD
on HD.sohd = CTHD.sohd
GROUP by HD.sohd
HAVING COUNT(masp) >= 4

/*Cau 39: Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).*/
SELECT HD.sohd
FROM HOADON HD JOIN CTHD
on HD.sohd = CTHD.sohd
WHERE masp IN (SELECT masp 
               FROM SANPHAM 
               WHERE nuocsx ='Viet Nam')
GROUP by HD.sohd
HAVING COUNT(masp) = 3

/*Cau 40: Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.*/
SELECT makh, COUNT(makh) solan
FROM HOADON
GROUP by makh
HAVING COUNT(makh) >= all(SELECT COUNT(makh)
                          FROM HOADON 
                          GROUP by makh)

/*Cau 41: Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?*/

/*Câu 42: Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.*/

/*Câu 43: *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.*/

/*Câu 44: Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.*/

/*Câu 45: *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.*/

