USE [master]
GO
/****** Object:  Database [PharmaSystemManager]    Script Date: 21/3/2020 9:21:41 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PharmaSystemManager')
BEGIN
CREATE DATABASE [PharmaSystemManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PharmaSystemManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PharmaSystemManager.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PharmaSystemManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PharmaSystemManager_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [PharmaSystemManager] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PharmaSystemManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PharmaSystemManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PharmaSystemManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PharmaSystemManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PharmaSystemManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PharmaSystemManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PharmaSystemManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PharmaSystemManager] SET  MULTI_USER 
GO
ALTER DATABASE [PharmaSystemManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PharmaSystemManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PharmaSystemManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PharmaSystemManager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PharmaSystemManager] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PharmaSystemManager]
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MaHDBan]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUTO_MaHDBan]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[AUTO_MaHDBan]()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaHDBan) FROM HoaDonBanHang) = 0
		SET @ID = ''0''
	ELSE
		SELECT @ID = MAX(RIGHT(MaHDBan, 3)) FROM HoaDonBanHang
		SELECT @ID = CASE
						WHEN @ID >= 99 THEN ''HDB'' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN ''HDB0'' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 0 and @ID < 9 THEN ''HDB00'' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)	
		END
	RETURN @ID
END





' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MaHDMua]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUTO_MaHDMua]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[AUTO_MaHDMua]()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaHDMua) FROM HoaDonThuMua) = 0
		SET @ID = ''0''
	ELSE
		SELECT @ID = MAX(RIGHT(MaHDMua, 3)) FROM HoaDonThuMua
		SELECT @ID = CASE
			WHEN @ID >= 99 THEN ''HDM'' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN ''HDM0'' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 0 and @ID < 9 THEN ''HDM00'' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)	
		END
	RETURN @ID
END





' 
END

GO
/****** Object:  Table [dbo].[DaiLy]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DaiLy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DaiLy](
	[MaDaiLy] [nvarchar](10) NOT NULL,
	[TenDaiLy] [nvarchar](100) NOT NULL,
	[EmailDaiLy] [nvarchar](50) NOT NULL,
	[SDTDaiLy] [nvarchar](15) NOT NULL,
	[DiaChiDaiLy] [nvarchar](50) NOT NULL,
	[ThanhPhoDaiLy] [nvarchar](50) NOT NULL,
	[TrangThaiDaiLy] [nvarchar](50) NULL,
 CONSTRAINT [PK_DaiLy] PRIMARY KEY CLUSTERED 
(
	[MaDaiLy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HoaDonBanHang]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HoaDonBanHang]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HoaDonBanHang](
	[MaHDBan] [nvarchar](10) NOT NULL CONSTRAINT [PK_HoaDonBanHang]  DEFAULT ([DBO].[AUTO_MaHDBan]()),
	[NgayBan] [datetime] NOT NULL,
	[HinhThucThanhToan] [nvarchar](50) NOT NULL,
	[GiamGia] [int] NOT NULL,
	[TrangThaiHDBan] [nvarchar](50) NULL,
	[MaNV] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HoaDonBanHangChiTiet]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HoaDonBanHangChiTiet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HoaDonBanHangChiTiet](
	[MaHDBan] [nvarchar](10) NOT NULL,
	[IDThuoc] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_HoaDonBanHangChiTiet] PRIMARY KEY CLUSTERED 
(
	[MaHDBan] ASC,
	[IDThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HoaDonThuMua]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HoaDonThuMua]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HoaDonThuMua](
	[MaHDMua] [nvarchar](10) NOT NULL CONSTRAINT [PK_HoaDonThuMua]  DEFAULT ([DBO].[AUTO_MaHDMua]()),
	[NgayMua] [date] NOT NULL,
	[HinhThucThanhToan] [nvarchar](50) NOT NULL,
	[GiamGia] [int] NOT NULL,
	[SoTienThanhToan] [money] NOT NULL,
	[SoTienConLai] [money] NOT NULL,
	[TrangThaiHDMua] [nvarchar](50) NULL,
	[MaNV] [nvarchar](10) NOT NULL,
	[MaNCC] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDMua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HoaDonThuMuaChiTiet]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HoaDonThuMuaChiTiet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HoaDonThuMuaChiTiet](
	[MaHDMua] [nvarchar](10) NOT NULL,
	[IDThuoc] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_HoaDonThuMuaChiTiet] PRIMARY KEY CLUSTERED 
(
	[MaHDMua] ASC,
	[IDThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LoaiThuoc]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoaiThuoc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoaiThuoc](
	[MaLoaiThuoc] [nvarchar](10) NOT NULL,
	[TenLoaiThuoc] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoaiThuoc] PRIMARY KEY CLUSTERED 
(
	[MaLoaiThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NhaCungCap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](10) NOT NULL,
	[TenNCC] [nvarchar](100) NOT NULL,
	[EmailNCC] [nvarchar](50) NOT NULL,
	[SDTNCC] [nvarchar](15) NOT NULL,
	[DiaChiNCC] [nvarchar](50) NOT NULL,
	[ThanhPhoNCC] [nvarchar](50) NOT NULL,
	[Mota] [nvarchar](max) NOT NULL,
	[TrangThaiNCC] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NhanVien]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](10) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[VaiTro] [bit] NOT NULL,
	[HoVaTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[NgayLamViec] [date] NOT NULL,
	[SDTNV] [nvarchar](15) NOT NULL,
	[EmailNV] [nvarchar](50) NOT NULL,
	[DiaChiNV] [nvarchar](50) NOT NULL,
	[TrangThaiNV] [nvarchar](50) NULL,
	[Hinh] [varbinary](max) NULL,
	[MaDaiLy] [nvarchar](10) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Thuoc]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Thuoc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Thuoc](
	[MaThuoc] [nvarchar](10) NOT NULL,
	[TenThuoc] [nvarchar](100) NOT NULL,
	[TenKhoaHoc] [nvarchar](50) NOT NULL,
	[NhietDoBaoQuan] [int] NOT NULL,
	[QuyCachDongGoi] [nvarchar](50) NOT NULL,
	[DonViTinh] [nvarchar](10) NOT NULL,
	[NhaSX] [nvarchar](50) NOT NULL,
	[MoTaThuoc] [nvarchar](max) NOT NULL,
	[TrangThaiThuoc] [nvarchar](50) NULL,
	[MaLoaiThuoc] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Thuoc] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ThuocTrongKho]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ThuocTrongKho]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ThuocTrongKho](
	[IDThuoc] [int] IDENTITY(100,1) NOT NULL,
	[MaLoHang] [nvarchar](10) NOT NULL,
	[NgaySX] [date] NOT NULL,
	[NgayHetHan] [date] NOT NULL,
	[SoLuongTon] [int] NOT NULL,
	[NgayNhapHang] [date] NOT NULL,
	[GiaBan] [money] NOT NULL,
	[GiaNhap] [money] NOT NULL,
	[MaThuoc] [nvarchar](10) NOT NULL,
	[MaDaiLy] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_ThuocTrongKho] PRIMARY KEY CLUSTERED 
(
	[IDThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[DaiLy] ([MaDaiLy], [TenDaiLy], [EmailDaiLy], [SDTDaiLy], [DiaChiDaiLy], [ThanhPhoDaiLy], [TrangThaiDaiLy]) VALUES (N'DL01', N'QLD cs1', N'qld.cs1@gmail.com', N'0985345124', N'Số 1, Nguyễn Quý Đức, Thanh Xuân', N'Hà Nội', NULL)
INSERT [dbo].[DaiLy] ([MaDaiLy], [TenDaiLy], [EmailDaiLy], [SDTDaiLy], [DiaChiDaiLy], [ThanhPhoDaiLy], [TrangThaiDaiLy]) VALUES (N'DL02', N' QLD cs2', N'qld.cs2@gmail.com', N'0903452381', N'Số 493, Nguyễn Lương Bằng, Đống Đa', N'Hà Nội', NULL)
INSERT [dbo].[DaiLy] ([MaDaiLy], [TenDaiLy], [EmailDaiLy], [SDTDaiLy], [DiaChiDaiLy], [ThanhPhoDaiLy], [TrangThaiDaiLy]) VALUES (N'DL03', N'QLD cs3', N'qld.cs3@gmail.com', N'0943948231', N'số 83, Nguyễn Khuyến, Hà Đồng', N'Hà Nội', NULL)
INSERT [dbo].[DaiLy] ([MaDaiLy], [TenDaiLy], [EmailDaiLy], [SDTDaiLy], [DiaChiDaiLy], [ThanhPhoDaiLy], [TrangThaiDaiLy]) VALUES (N'DL04', N'QLD cs4', N'qld.cs4@gmail.com', N'0938123412', N'số 22, Mạc Thái Tổ, Cầy Giấy', N'Hà Nội', NULL)
INSERT [dbo].[DaiLy] ([MaDaiLy], [TenDaiLy], [EmailDaiLy], [SDTDaiLy], [DiaChiDaiLy], [ThanhPhoDaiLy], [TrangThaiDaiLy]) VALUES (N'DL05', N'QLD cs5', N'qld.cs5@gmail.com', N'0931227458', N'số 98, Hai Bà Trương, Hoàn Kiếm', N'Hà Nội', NULL)
INSERT [dbo].[HoaDonBanHang] ([MaHDBan], [NgayBan], [HinhThucThanhToan], [GiamGia], [TrangThaiHDBan], [MaNV]) VALUES (N'HDB001', CAST(N'2020-03-21 12:30:30.000' AS DateTime), N'CASH', 0, NULL, N'NV006')
INSERT [dbo].[HoaDonBanHang] ([MaHDBan], [NgayBan], [HinhThucThanhToan], [GiamGia], [TrangThaiHDBan], [MaNV]) VALUES (N'HDB002', CAST(N'2020-03-21 02:03:00.000' AS DateTime), N'DEBIT', 0, NULL, N'NV003')
INSERT [dbo].[HoaDonBanHangChiTiet] ([MaHDBan], [IDThuoc], [SoLuong]) VALUES (N'HDB001', 101, 2)
INSERT [dbo].[HoaDonBanHangChiTiet] ([MaHDBan], [IDThuoc], [SoLuong]) VALUES (N'HDB001', 102, 1)
INSERT [dbo].[HoaDonBanHangChiTiet] ([MaHDBan], [IDThuoc], [SoLuong]) VALUES (N'HDB002', 104, 10)
INSERT [dbo].[HoaDonThuMua] ([MaHDMua], [NgayMua], [HinhThucThanhToan], [GiamGia], [SoTienThanhToan], [SoTienConLai], [TrangThaiHDMua], [MaNV], [MaNCC]) VALUES (N'HDM001', CAST(N'2020-02-02' AS Date), N'Nợ', 10, 0.0000, 30200.0000, NULL, N'NV006', N'NCC001')
INSERT [dbo].[HoaDonThuMua] ([MaHDMua], [NgayMua], [HinhThucThanhToan], [GiamGia], [SoTienThanhToan], [SoTienConLai], [TrangThaiHDMua], [MaNV], [MaNCC]) VALUES (N'HDM002', CAST(N'2020-03-03' AS Date), N'Nợ', 10, 0.0000, 20100.0000, NULL, N'NV003', N'NCC005')
INSERT [dbo].[HoaDonThuMuaChiTiet] ([MaHDMua], [IDThuoc], [SoLuong]) VALUES (N'HDM001', 101, 30)
INSERT [dbo].[HoaDonThuMuaChiTiet] ([MaHDMua], [IDThuoc], [SoLuong]) VALUES (N'HDM001', 102, 100)
INSERT [dbo].[HoaDonThuMuaChiTiet] ([MaHDMua], [IDThuoc], [SoLuong]) VALUES (N'HDM001', 103, 1200)
INSERT [dbo].[HoaDonThuMuaChiTiet] ([MaHDMua], [IDThuoc], [SoLuong]) VALUES (N'HDM002', 104, 1500)
INSERT [dbo].[HoaDonThuMuaChiTiet] ([MaHDMua], [IDThuoc], [SoLuong]) VALUES (N'HDM002', 106, 1600)
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc], [MoTa]) VALUES (N'LT001', N'Thuốc gây mê', NULL)
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc], [MoTa]) VALUES (N'LT002', N'Thuốc chống dị ứng và phản vệ', NULL)
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc], [MoTa]) VALUES (N'LT003', N'Thuốc giải độc và các chất giải độc khác', NULL)
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc], [MoTa]) VALUES (N'LT004', N'Thuốc chống co giật', NULL)
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc], [MoTa]) VALUES (N'LT005', N'Thuốc chống bệnh truyền nhiễm', NULL)
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc], [MoTa]) VALUES (N'LT006', N'Thuốc da liễu', NULL)
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc], [MoTa]) VALUES (N'LT007', N'Thuốc lợi niệu', NULL)
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc], [MoTa]) VALUES (N'LT008', N'Thuốc dạ dày ruột', NULL)
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc], [MoTa]) VALUES (N'LT009', N'Thuốc tim mạch', NULL)
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc], [MoTa]) VALUES (N'LT010', N'Thuốc nội tiết', NULL)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [EmailNCC], [SDTNCC], [DiaChiNCC], [ThanhPhoNCC], [Mota], [TrangThaiNCC]) VALUES (N'NCC001', N'Công ty CP dược Hậu Giang', N'dhgpharma@dhgpharma.com.vn', N'(0292). 3891433', N'288 Bis Nguyễn Văn Cừ, P. An Hòa, Q. Ninh Kiều', N'Cần Thơ', N'1', NULL)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [EmailNCC], [SDTNCC], [DiaChiNCC], [ThanhPhoNCC], [Mota], [TrangThaiNCC]) VALUES (N'NCC002', N'Công ty CP Traphaco', N'info@traphaco.com.vn', N'18006612', N'75 Yên Ninh, Ba Đình', N'Hà Nội', N'3', NULL)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [EmailNCC], [SDTNCC], [DiaChiNCC], [ThanhPhoNCC], [Mota], [TrangThaiNCC]) VALUES (N'NCC003', N'Công ty CP Pymepharco', N'cnhn@pymepharco.com', N'32011536', N'Lô 5 -TT 24  Xuân Phương,Nam Từ Liêm', N'Hà Nội', N'2', NULL)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [EmailNCC], [SDTNCC], [DiaChiNCC], [ThanhPhoNCC], [Mota], [TrangThaiNCC]) VALUES (N'NCC004', N'Công ty CP dược phẩm Imexpharm', N'imexpharm@gmail.com', N'02773851941', N'Số 4, đường 30/4, Phường 1, Thành phố Cao Lãnh', N'Đồng Tháp', N'3', NULL)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [EmailNCC], [SDTNCC], [DiaChiNCC], [ThanhPhoNCC], [Mota], [TrangThaiNCC]) VALUES (N'NCC005', N'Công Ty CP DongPoppa', N'dongpoppa@thuocpoppa.com.vn', N'095562541', N'số 9, đường Nguyễn Quý Đức, Thanh Xuân', N'Hà Nội', N'Giám đốc là người cực kỳ ưu tín', NULL)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [VaiTro], [HoVaTen], [NgaySinh], [NgayLamViec], [SDTNV], [EmailNV], [DiaChiNV], [TrangThaiNV], [Hinh], [MaDaiLy]) VALUES (N'NV001', N'123', 1, N'Lưu Anh Quân', CAST(N'1991-10-08' AS Date), CAST(N'2004-04-04' AS Date), N'0942244512', N'luuanhquan@gmail.com', N'An Dương', NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [VaiTro], [HoVaTen], [NgaySinh], [NgayLamViec], [SDTNV], [EmailNV], [DiaChiNV], [TrangThaiNV], [Hinh], [MaDaiLy]) VALUES (N'NV002', N'123', 1, N'Đỗ Hoàng Long', CAST(N'1992-08-10' AS Date), CAST(N'2004-04-04' AS Date), N'0934551356', N'dohoanglong@gmail.com', N'Tôn Thất Tùng', NULL, NULL, N'DL01')
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [VaiTro], [HoVaTen], [NgaySinh], [NgayLamViec], [SDTNV], [EmailNV], [DiaChiNV], [TrangThaiNV], [Hinh], [MaDaiLy]) VALUES (N'NV003', N'123', 0, N'Nguyễn Thành Đồng', CAST(N'1999-08-10' AS Date), CAST(N'2019-10-10' AS Date), N'0852600125', N'nguyenthanhdong@gmail.com', N'Thanh Xuân', NULL, NULL, N'DL02')
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [VaiTro], [HoVaTen], [NgaySinh], [NgayLamViec], [SDTNV], [EmailNV], [DiaChiNV], [TrangThaiNV], [Hinh], [MaDaiLy]) VALUES (N'NV004', N'123', 0, N'Nguyễn Thanh Hiệp', CAST(N'1999-05-05' AS Date), CAST(N'2020-01-01' AS Date), N'0942556784', N'nguyenthanhhiep@gmail.com', N'Phạm Văn Bô', NULL, NULL, N'DL03')
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [VaiTro], [HoVaTen], [NgaySinh], [NgayLamViec], [SDTNV], [EmailNV], [DiaChiNV], [TrangThaiNV], [Hinh], [MaDaiLy]) VALUES (N'NV005', N'123', 0, N'Phạm Văn Đại', CAST(N'1998-04-04' AS Date), CAST(N'2020-02-02' AS Date), N'0945338495', N'vandai@gmail.com', N'Trần Cung', NULL, NULL, N'DL04')
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [VaiTro], [HoVaTen], [NgaySinh], [NgayLamViec], [SDTNV], [EmailNV], [DiaChiNV], [TrangThaiNV], [Hinh], [MaDaiLy]) VALUES (N'NV006', N'123', 0, N'Lê Quang Vinh', CAST(N'2000-04-12' AS Date), CAST(N'2020-01-01' AS Date), N'0942345635', N'vinh@gmail.com', N'Mỹ Đình', NULL, NULL, N'DL01')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [TenKhoaHoc], [NhietDoBaoQuan], [QuyCachDongGoi], [DonViTinh], [NhaSX], [MoTaThuoc], [TrangThaiThuoc], [MaLoaiThuoc]) VALUES (N'MT001', N'Thuốc gây mê dạng hít', N'Sevoflurane', 10, N'????', N'bình', N'Lucas Luu', N'có công thức hóa học là C4H3F7O có tác dụng chủ yếu tại tủy sống và hệ thần kinh trung ương, cũng như các thụ thể GABA. Sevoflurane là một Ether có hàm lượng fluor hóa cao, thường được sử dụng trong các ca phẫu thuật không quá dài. Thuốc này là một chất đối kháng hoạt động trên các thụ thể glycine (chất dẫn truyền thần kinh axit amin glycine) làm giảm kết nối ty thể, giảm áp lực động mạch và tăng nhịp hô hấp', NULL, N'LT001')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [TenKhoaHoc], [NhietDoBaoQuan], [QuyCachDongGoi], [DonViTinh], [NhaSX], [MoTaThuoc], [TrangThaiThuoc], [MaLoaiThuoc]) VALUES (N'MT002', N'Thuốc tiêm tĩnh mạch Propofol', N'Propofol ', 5, N'?????', N'ống', N'DHL', N'có công thức hóa học là C12H18O. Sau khi tiêm Propofol vào đường tĩnh mạch thì thuốc này sẽ đi vào tuần hoàn máu của toàn bộ cơ thể và hoạt động trong não, do não có nguồn cung cấp máu tốt. Propofol đi vào não và kích thích các thụ thể GABA (Đây là một acid amin cũng như là chất dẫn truyền thần kinh phân bố rộng rãi trên hệ thần kinh trung ương), tạo ra tác dụng an thần. Propofol ảnh hưởng đến hệ thần kinh trung ương bằng cách giảm mạnh các chuỗi dải gamma thông qua màng tế bào, khiến mức độ mất ý thức ở người bệnh cực kỳ sâu sắc.', NULL, N'LT001')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [TenKhoaHoc], [NhietDoBaoQuan], [QuyCachDongGoi], [DonViTinh], [NhaSX], [MoTaThuoc], [TrangThaiThuoc], [MaLoaiThuoc]) VALUES (N'MT003', N'Loratadin', N'Loratadine', 15, N'??????', N'viên', N'DongPoppa', N'Tác dụng kéo dài, không hoặc ít gây buồn ngủ và kháng muscarin. Người lớn, người cao tuổi và trẻ em trên 6 tuổi: uống 1 lần 10 mg/ngày. Trẻ em dưới 2 tuổi: chưa xác định được tính an toàn và hiệu quả, 2 – 5 tuổi: 5 mg/ngày uống 1 lần. Người suy gan, thận: 10 mg/ngày, cứ 2 ngày một lần.', NULL, N'LT002')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [TenKhoaHoc], [NhietDoBaoQuan], [QuyCachDongGoi], [DonViTinh], [NhaSX], [MoTaThuoc], [TrangThaiThuoc], [MaLoaiThuoc]) VALUES (N'MT004', N'Cetirizin hydroclorid', N'Cetirizin hydroclorid', 15, N'?????', N'viên', N'DongPoppa', N'Chỉ định Cetirizin hydroclorid
Xem clorphenamin. Các thể viêm mũi dị ứng; mày đay; phù Quincke.

Chống chỉ định Cetirizin hydroclorid
Xem clorphenamin. Dị ứng với cetirizin và hydro- xyzin; phụ nữ có thai và cho con bú.', NULL, N'LT002')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [TenKhoaHoc], [NhietDoBaoQuan], [QuyCachDongGoi], [DonViTinh], [NhaSX], [MoTaThuoc], [TrangThaiThuoc], [MaLoaiThuoc]) VALUES (N'MT005', N'Kedermfa ', N'Kedermfa ', 20, N'??????', N'tuýp', N'Saranghe', N'Kem bôi Kedermfa có tác dụng chống nấm, kháng khuẩn và ký sinh trùng,… được chỉ định dùng cho các trường hợp nấm da, viêm da dị ứng, hắc lào,…. Bên cạnh đó, loại thuốc này còn có công dụng giảm ngứa do kích thích hoặc côn trùng trích.

Phụ nữ có thai, người mẫn cảm với thành phần của thuốc không nên sử dụng loại thuốc này.', NULL, N'LT006')
SET IDENTITY_INSERT [dbo].[ThuocTrongKho] ON 

INSERT [dbo].[ThuocTrongKho] ([IDThuoc], [MaLoHang], [NgaySX], [NgayHetHan], [SoLuongTon], [NgayNhapHang], [GiaBan], [GiaNhap], [MaThuoc], [MaDaiLy]) VALUES (101, N'LH001', CAST(N'2019-10-10' AS Date), CAST(N'2022-10-10' AS Date), 30, CAST(N'2020-02-02' AS Date), 600.0000, 400.0000, N'MT001', N'DL01')
INSERT [dbo].[ThuocTrongKho] ([IDThuoc], [MaLoHang], [NgaySX], [NgayHetHan], [SoLuongTon], [NgayNhapHang], [GiaBan], [GiaNhap], [MaThuoc], [MaDaiLy]) VALUES (102, N'LH001', CAST(N'2019-09-12' AS Date), CAST(N'2023-09-12' AS Date), 100, CAST(N'2020-02-02' AS Date), 200.0000, 110.0000, N'MT002', N'DL01')
INSERT [dbo].[ThuocTrongKho] ([IDThuoc], [MaLoHang], [NgaySX], [NgayHetHan], [SoLuongTon], [NgayNhapHang], [GiaBan], [GiaNhap], [MaThuoc], [MaDaiLy]) VALUES (103, N'LH001', CAST(N'2019-09-10' AS Date), CAST(N'2023-09-10' AS Date), 1200, CAST(N'2020-02-02' AS Date), 10.0000, 6.0000, N'MT003', N'DL01')
INSERT [dbo].[ThuocTrongKho] ([IDThuoc], [MaLoHang], [NgaySX], [NgayHetHan], [SoLuongTon], [NgayNhapHang], [GiaBan], [GiaNhap], [MaThuoc], [MaDaiLy]) VALUES (104, N'LH002', CAST(N'2019-12-12' AS Date), CAST(N'2024-12-12' AS Date), 1500, CAST(N'2020-03-03' AS Date), 11.0000, 7.0000, N'MT004', N'DL02')
INSERT [dbo].[ThuocTrongKho] ([IDThuoc], [MaLoHang], [NgaySX], [NgayHetHan], [SoLuongTon], [NgayNhapHang], [GiaBan], [GiaNhap], [MaThuoc], [MaDaiLy]) VALUES (106, N'LH002', CAST(N'2019-09-10' AS Date), CAST(N'2020-03-23' AS Date), 1600, CAST(N'2020-03-03' AS Date), 10.0000, 6.0000, N'MT003', N'DL02')
INSERT [dbo].[ThuocTrongKho] ([IDThuoc], [MaLoHang], [NgaySX], [NgayHetHan], [SoLuongTon], [NgayNhapHang], [GiaBan], [GiaNhap], [MaThuoc], [MaDaiLy]) VALUES (109, N'LH003', CAST(N'2019-10-10' AS Date), CAST(N'2020-03-21' AS Date), 55, CAST(N'2332-08-08' AS Date), 2323.0000, 2323.0000, N'MT001', N'DL01')
INSERT [dbo].[ThuocTrongKho] ([IDThuoc], [MaLoHang], [NgaySX], [NgayHetHan], [SoLuongTon], [NgayNhapHang], [GiaBan], [GiaNhap], [MaThuoc], [MaDaiLy]) VALUES (110, N'LH003', CAST(N'2019-10-10' AS Date), CAST(N'2020-03-20' AS Date), 55, CAST(N'2332-08-08' AS Date), 2323.0000, 2323.0000, N'MT003', N'DL01')
INSERT [dbo].[ThuocTrongKho] ([IDThuoc], [MaLoHang], [NgaySX], [NgayHetHan], [SoLuongTon], [NgayNhapHang], [GiaBan], [GiaNhap], [MaThuoc], [MaDaiLy]) VALUES (111, N'LH003', CAST(N'2019-10-10' AS Date), CAST(N'2020-03-20' AS Date), 55, CAST(N'2332-08-08' AS Date), 2323.0000, 2323.0000, N'MT002', N'DL01')
SET IDENTITY_INSERT [dbo].[ThuocTrongKho] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HoaDonBanHang_NhanVien]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonBanHang]'))
ALTER TABLE [dbo].[HoaDonBanHang]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBanHang_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HoaDonBanHang_NhanVien]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonBanHang]'))
ALTER TABLE [dbo].[HoaDonBanHang] CHECK CONSTRAINT [FK_HoaDonBanHang_NhanVien]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HoaDonBanHangChiTiet_HoaDonThuMua]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonBanHangChiTiet]'))
ALTER TABLE [dbo].[HoaDonBanHangChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBanHangChiTiet_HoaDonThuMua] FOREIGN KEY([MaHDBan])
REFERENCES [dbo].[HoaDonBanHang] ([MaHDBan])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HoaDonBanHangChiTiet_HoaDonThuMua]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonBanHangChiTiet]'))
ALTER TABLE [dbo].[HoaDonBanHangChiTiet] CHECK CONSTRAINT [FK_HoaDonBanHangChiTiet_HoaDonThuMua]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HoaDonBanHangChiTiet_ThuocTrongKho]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonBanHangChiTiet]'))
ALTER TABLE [dbo].[HoaDonBanHangChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBanHangChiTiet_ThuocTrongKho] FOREIGN KEY([IDThuoc])
REFERENCES [dbo].[ThuocTrongKho] ([IDThuoc])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HoaDonBanHangChiTiet_ThuocTrongKho]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonBanHangChiTiet]'))
ALTER TABLE [dbo].[HoaDonBanHangChiTiet] CHECK CONSTRAINT [FK_HoaDonBanHangChiTiet_ThuocTrongKho]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HoaDonThuMua_NhaCungCap]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonThuMua]'))
ALTER TABLE [dbo].[HoaDonThuMua]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonThuMua_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HoaDonThuMua_NhaCungCap]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonThuMua]'))
ALTER TABLE [dbo].[HoaDonThuMua] CHECK CONSTRAINT [FK_HoaDonThuMua_NhaCungCap]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HoaDonThuMua_NhanVien]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonThuMua]'))
ALTER TABLE [dbo].[HoaDonThuMua]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonThuMua_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HoaDonThuMua_NhanVien]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonThuMua]'))
ALTER TABLE [dbo].[HoaDonThuMua] CHECK CONSTRAINT [FK_HoaDonThuMua_NhanVien]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PK_HoaDonThuMuaChiTiet_HoaDonThuMua]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonThuMuaChiTiet]'))
ALTER TABLE [dbo].[HoaDonThuMuaChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_PK_HoaDonThuMuaChiTiet_HoaDonThuMua] FOREIGN KEY([MaHDMua])
REFERENCES [dbo].[HoaDonThuMua] ([MaHDMua])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PK_HoaDonThuMuaChiTiet_HoaDonThuMua]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonThuMuaChiTiet]'))
ALTER TABLE [dbo].[HoaDonThuMuaChiTiet] CHECK CONSTRAINT [FK_PK_HoaDonThuMuaChiTiet_HoaDonThuMua]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PK_HoaDonThuMuaChiTiet_ThuocTrongKho]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonThuMuaChiTiet]'))
ALTER TABLE [dbo].[HoaDonThuMuaChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_PK_HoaDonThuMuaChiTiet_ThuocTrongKho] FOREIGN KEY([IDThuoc])
REFERENCES [dbo].[ThuocTrongKho] ([IDThuoc])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PK_HoaDonThuMuaChiTiet_ThuocTrongKho]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDonThuMuaChiTiet]'))
ALTER TABLE [dbo].[HoaDonThuMuaChiTiet] CHECK CONSTRAINT [FK_PK_HoaDonThuMuaChiTiet_ThuocTrongKho]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NhanVien]') AND parent_object_id = OBJECT_ID(N'[dbo].[NhanVien]'))
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien] FOREIGN KEY([MaDaiLy])
REFERENCES [dbo].[DaiLy] ([MaDaiLy])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NhanVien]') AND parent_object_id = OBJECT_ID(N'[dbo].[NhanVien]'))
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Thuoc_LoaiThuoc]') AND parent_object_id = OBJECT_ID(N'[dbo].[Thuoc]'))
ALTER TABLE [dbo].[Thuoc]  WITH CHECK ADD  CONSTRAINT [FK_Thuoc_LoaiThuoc] FOREIGN KEY([MaLoaiThuoc])
REFERENCES [dbo].[LoaiThuoc] ([MaLoaiThuoc])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Thuoc_LoaiThuoc]') AND parent_object_id = OBJECT_ID(N'[dbo].[Thuoc]'))
ALTER TABLE [dbo].[Thuoc] CHECK CONSTRAINT [FK_Thuoc_LoaiThuoc]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ThuocTrongKho_DaiLy]') AND parent_object_id = OBJECT_ID(N'[dbo].[ThuocTrongKho]'))
ALTER TABLE [dbo].[ThuocTrongKho]  WITH CHECK ADD  CONSTRAINT [FK_ThuocTrongKho_DaiLy] FOREIGN KEY([MaDaiLy])
REFERENCES [dbo].[DaiLy] ([MaDaiLy])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ThuocTrongKho_DaiLy]') AND parent_object_id = OBJECT_ID(N'[dbo].[ThuocTrongKho]'))
ALTER TABLE [dbo].[ThuocTrongKho] CHECK CONSTRAINT [FK_ThuocTrongKho_DaiLy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ThuocTrongKho_Thuoc]') AND parent_object_id = OBJECT_ID(N'[dbo].[ThuocTrongKho]'))
ALTER TABLE [dbo].[ThuocTrongKho]  WITH CHECK ADD  CONSTRAINT [FK_ThuocTrongKho_Thuoc] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Thuoc] ([MaThuoc])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ThuocTrongKho_Thuoc]') AND parent_object_id = OBJECT_ID(N'[dbo].[ThuocTrongKho]'))
ALTER TABLE [dbo].[ThuocTrongKho] CHECK CONSTRAINT [FK_ThuocTrongKho_Thuoc]
GO
/****** Object:  Trigger [dbo].[TRG_HOADONBAN_UPDATE]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TRG_HOADONBAN_UPDATE]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TRG_HOADONBAN_UPDATE] ON [dbo].[HoaDonBanHang] AFTER UPDATE AS
BEGIN
	UPDATE ThuocTrongKho
	SET SoLuongTon = SoLuongTon + SoLuong
	FROM ThuocTrongKho JOIN HoaDonBanHangChiTiet ON ThuocTrongKho.IDThuoc=HoaDonBanHangChiTiet.IDThuoc
						JOIN inserted ON HoaDonBanHangChiTiet.MaHDBan=inserted.MaHDBan
	WHERE HoaDonBanHangChiTiet.IDThuoc=ThuocTrongKho.IDThuoc
END
' 
GO
/****** Object:  Trigger [dbo].[TRG_HOADONBAN]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TRG_HOADONBAN]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TRG_HOADONBAN] ON [dbo].[HoaDonBanHangChiTiet] AFTER INSERT AS
BEGIN
	UPDATE ThuocTrongKho 
	SET SoLuongTon = SoLuongTon - (SELECT HCT.SoLuong FROM HoaDonBanHangChiTiet HCT JOIN inserted ON inserted.IDThuoc=HCT.IDThuoc)
	FROM ThuocTrongKho JOIN HoaDonBanHangChiTiet ON ThuocTrongKho.IDThuoc=HoaDonBanHangChiTiet.IDThuoc
END
' 
GO
/****** Object:  Trigger [dbo].[TRG_HUYHOADONMUA]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TRG_HUYHOADONMUA]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TRG_HUYHOADONMUA] ON [dbo].[HoaDonThuMua] AFTER UPDATE AS
BEGIN
	UPDATE ThuocTrongKho
	SET SoLuongTon = SoLuongTon - SoLuong
	FROM ThuocTrongKho JOIN HoaDonThuMuaChiTiet ON ThuocTrongKho.IDThuoc = HoaDonThuMuaChiTiet.IDThuoc
						JOIN inserted ON HoaDonThuMuaChiTiet.MaHDMua=inserted.MaHDMua
END
' 
GO
/****** Object:  Trigger [dbo].[TRG_THEMHOADONMUA]    Script Date: 21/3/2020 9:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TRG_THEMHOADONMUA]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[TRG_THEMHOADONMUA] ON [dbo].[HoaDonThuMuaChiTiet] AFTER INSERT AS
BEGIN
	UPDATE ThuocTrongKho
	SET SoLuongTon = SoLuongTon + (SELECT SoLuong FROM INSERTED WHERE IDThuoc = ThuocTrongKho.IDThuoc)
	FROM ThuocTrongKho JOIN INSERTED ON INSERTED.IDThuoc = ThuocTrongKho.IDThuoc
END
' 
GO
USE [master]
GO
ALTER DATABASE [PharmaSystemManager] SET  READ_WRITE 
GO
