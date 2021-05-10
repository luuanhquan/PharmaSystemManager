
CREATE TRIGGER TRG_HUYHOADONMUA ON HoaDonThuMua AFTER UPDATE AS
BEGIN
	UPDATE ThuocTrongKho
	SET SoLuongTon = SoLuongTon - SoLuong
	FROM ThuocTrongKho JOIN HoaDonThuMuaChiTiet ON ThuocTrongKho.IDThuoc = HoaDonThuMuaChiTiet.IDThuoc
						JOIN inserted ON HoaDonThuMuaChiTiet.MaHDMua=inserted.MaHDMua
END


CREATE TRIGGER TRG_THEMHOADONMUA ON HoaDonThuMuaChiTiet AFTER INSERT AS
BEGIN
	UPDATE ThuocTrongKho
	SET SoLuongTon = SoLuongTon + (SELECT SoLuong FROM INSERTED WHERE IDThuoc = ThuocTrongKho.IDThuoc)
	FROM ThuocTrongKho JOIN INSERTED ON INSERTED.IDThuoc = ThuocTrongKho.IDThuoc
END

CREATE TRIGGER TRG_HOADONBAN_UPDATE ON HOADONBANHANG AFTER UPDATE AS
BEGIN
	UPDATE ThuocTrongKho
	SET SoLuongTon = SoLuongTon + SoLuong
	FROM ThuocTrongKho JOIN HoaDonBanHangChiTiet ON ThuocTrongKho.IDThuoc=HoaDonBanHangChiTiet.IDThuoc
						JOIN inserted ON HoaDonBanHangChiTiet.MaHDBan=inserted.MaHDBan
	WHERE HoaDonBanHangChiTiet.IDThuoc=ThuocTrongKho.IDThuoc
END

CREATE TRIGGER TRG_HOADONBAN ON HOADONBANHANGCHITIET AFTER INSERT AS
BEGIN
	UPDATE ThuocTrongKho 
	SET SoLuongTon = SoLuongTon - (SELECT HCT.SoLuong FROM HoaDonBanHangChiTiet HCT JOIN inserted ON inserted.IDThuoc=HCT.IDThuoc)
	FROM ThuocTrongKho JOIN HoaDonBanHangChiTiet ON ThuocTrongKho.IDThuoc=HoaDonBanHangChiTiet.IDThuoc
END