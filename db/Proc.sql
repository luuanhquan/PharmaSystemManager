USE PharmaSystemManager
GO

------------------------------------------------------------------
--------------------------------SALE------------------------------
CREATE PROCEDURE InsertSaleInvoice
	@IvoiceId NVARCHAR(10) OUT,
	@saleDate DATETIME,
	@PayByCash MONEY,
	@PayByCard MONEY,
	@Discount INT,
	@EmployeeID NVARCHAR(10)
as
	BEGIN
		DECLARE @IDjustInserted TABLE(id NVARCHAR(10))
		INSERT INTO [dbo].[HoaDonBanHang]([NgayBan],[TTTienMat],[TTThe],[GiamGia],[MaNV]) OUTPUT Inserted.MaHDBan
			INTO @IDjustInserted VALUES (@saleDate,@PayByCash,@PayByCard,@Discount,@EmployeeID)
			SET @IvoiceId = (SELECT id FROM @IDjustInserted)
	end
GO


--------------------------------SALE------------------------------
------------------------------------------------------------------

------------------------------------------------------------------
------------------------------PURCHASE----------------------------

CREATE PROCEDURE InsertPurchaseInvoice
	@IvoiceId NVARCHAR(10) OUT,
	@Date DATETIME,
	@PayByCash MONEY,
	@PayByCard MONEY,
	@Discount INT,
	@remainMoney MONEY,
	@EmployeeID NVARCHAR(10),
	@SupplierID NVARCHAR(10)
as
	BEGIN
		DECLARE @IDjustInserted TABLE(id NVARCHAR(10))
		INSERT INTO [dbo].[HoaDonThuMua] ([NgayMua],[TTTienMat],[TTThe],[GiamGia],[SoTienConLai],[MaNV],[MaNCC]) OUTPUT Inserted.MaHDMua
			INTO @IDjustInserted VALUES (@Date,@PayByCash,@PayByCard,@Discount,@remainMoney,@EmployeeID,@SupplierID)
			SET @IvoiceId = (SELECT id FROM @IDjustInserted)
	end
GO

------------------------------PURCHASE----------------------------
------------------------------------------------------------------

