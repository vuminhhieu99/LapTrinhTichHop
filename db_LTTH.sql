USE [master]
GO
/****** Object:  Database [QuanLyGiaoVienDB_LTTH]    Script Date: 12/6/2020 6:10:13 PM ******/
CREATE DATABASE [QuanLyGiaoVienDB_LTTH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyGiaoVienDB_LTTH', FILENAME = N'E:\kỳ 1 năm 4\Công nghệ lập trình tích hợp\Project\Backend\data\QuanLyGiaoVienDB_LTTH.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyGiaoVienDB_LTTH_log', FILENAME = N'E:\kỳ 1 năm 4\Công nghệ lập trình tích hợp\Project\Backend\data\QuanLyGiaoVienDB_LTTH_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyGiaoVienDB_LTTH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyGiaoVienDB_LTTH]
GO
/****** Object:  Table [dbo].[BaiBao]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BaiBao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](5) NULL,
	[Ten] [nvarchar](100) NULL,
	[TenTapChiCongBo] [nvarchar](150) NULL,
	[KiHoc] [int] NULL,
	[NamHoc] [varchar](10) NULL,
	[SoThanhVien] [int] NULL DEFAULT ((0)),
	[IdLoaiBaiBao] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BoMon]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BoMon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](5) NULL,
	[Ten] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeTai]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeTai](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](5) NULL,
	[Ten] [nvarchar](200) NULL,
	[KiHoc] [int] NULL,
	[NamHoc] [varchar](10) NULL,
	[CoQuanQuanLy] [nvarchar](200) NULL,
	[SoThanhVien] [int] NULL DEFAULT ((0)),
	[IdLoaiDeTai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GiaoVien]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiaoVien](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](5) NULL,
	[Ten] [nvarchar](40) NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](100) NULL,
	[DienThoai] [varchar](12) NULL,
	[Email] [varchar](50) NULL,
	[IdBoMon] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GV_BaiBao]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GV_BaiBao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdGiaoVien] [int] NULL,
	[IdBaiBao] [int] NULL,
	[SoGio] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GV_ChamThi]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GV_ChamThi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdGiaoVien] [int] NULL,
	[IdLoaiChamThi] [int] NULL,
	[SoLuong] [int] NULL,
	[NamHoc] [varchar](10) NULL,
	[KiHoc] [int] NULL,
	[SoGio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GV_DeTai]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GV_DeTai](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdGiaoVien] [int] NULL,
	[IdDeTai] [int] NULL,
	[LaChuTri] [int] NULL DEFAULT ((0)),
	[SoGio] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GV_HoiDong]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GV_HoiDong](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdGiaoVien] [int] NULL,
	[IdHoiDong] [int] NULL,
	[VaiTro] [nvarchar](20) NULL,
	[NamHoc] [varchar](10) NULL,
	[KiHoc] [int] NULL,
	[Solan] [int] NULL,
	[SoGio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GV_HuongDan]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GV_HuongDan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdGiaoVien] [int] NULL,
	[IdLoaiHuongDan] [int] NULL,
	[IdHocVien] [int] NULL,
	[TenDeTai] [nvarchar](50) NULL,
	[KiHoc] [int] NULL,
	[NamHoc] [varchar](10) NULL,
	[BaoVeThanhCong] [bit] NULL,
	[SoGio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GV_LopHocPhan]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GV_LopHocPhan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdGiaoVien] [int] NULL,
	[IdLopHocPhan] [int] NULL,
	[SoTiet] [int] NULL,
	[SoGio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GV_Sach]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GV_Sach](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdGiaoVien] [int] NULL,
	[IdSach] [int] NULL,
	[SoTrangDaViet] [int] NULL DEFAULT ((0)),
	[SoGio] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[He]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[He](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocPhan]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocPhan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](5) NULL,
	[Ten] [nvarchar](100) NULL,
	[SoTinChi] [int] NULL,
	[IdDoiTuongHoc] [int] NULL,
	[IdLoaiDayHoc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HocVien]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocVien](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](5) NULL,
	[Ten] [nvarchar](40) NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NULL,
	[Diachi] [nvarchar](100) NULL,
	[IdLop] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoiDong]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDong](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[GhiChu] [ntext] NULL,
	[IdLoaiHoiDong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiBaiBao]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiBaiBao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](300) NULL,
	[DonViTinh] [int] NULL,
	[GioChuan] [int] NULL,
	[GhiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiChamThi]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiChamThi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[DonViTinh] [int] NULL,
	[GioChuan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiDayHoc]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDayHoc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[GioChuan] [int] NULL,
	[DonViTinh] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiDeTai]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDeTai](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[DonViTinh] [int] NULL,
	[GioChuan] [int] NULL,
	[GhiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiHoiDong]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHoiDong](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiHuongDan]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHuongDan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[DonViTinh] [int] NULL,
	[GioChuan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSach]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSach](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[DonViTinh] [int] NULL,
	[GioChuan] [int] NULL,
	[GhiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lop]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](5) NULL,
	[Te] [nvarchar](50) NULL,
	[SiSo] [int] NULL,
	[IdHe] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LopHocPhan]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LopHocPhan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](5) NULL,
	[SiSo] [int] NULL,
	[KiHoc] [int] NULL,
	[NamHoc] [varchar](10) NULL,
	[IdHocPhan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuanLy]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuanLy](
	[Id] [int] NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[HinhAnh] [varchar](250) NULL,
	[HoVaTen] [nvarchar](50) NULL,
	[GioiTinh] [tinyint] NULL,
	[NgayTao] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sach](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](5) NULL,
	[Ten] [nvarchar](100) NULL,
	[NoiXuatBan] [nvarchar](100) NULL,
	[KiHoc] [int] NULL,
	[NamHoc] [varchar](10) NULL,
	[SoThanhVien] [int] NULL DEFAULT ((0)),
	[IdLoaiSach] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BaiBao] ON 

INSERT [dbo].[BaiBao] ([Id], [Ma], [Ten], [TenTapChiCongBo], [KiHoc], [NamHoc], [SoThanhVien], [IdLoaiBaiBao]) VALUES (8, N'BB008', N'Bai bao 1', N'Tap chi 1', 1, N'2019-2020', 0, 1)
INSERT [dbo].[BaiBao] ([Id], [Ma], [Ten], [TenTapChiCongBo], [KiHoc], [NamHoc], [SoThanhVien], [IdLoaiBaiBao]) VALUES (9, N'BB009', N'Bai bao 1', N'Tap chi 1', 1, N'2019-2020', 0, 1)
INSERT [dbo].[BaiBao] ([Id], [Ma], [Ten], [TenTapChiCongBo], [KiHoc], [NamHoc], [SoThanhVien], [IdLoaiBaiBao]) VALUES (10, N'BB010', N'jpasodf', N'hhhh', 2, N'2019-2020', 1, 2)
INSERT [dbo].[BaiBao] ([Id], [Ma], [Ten], [TenTapChiCongBo], [KiHoc], [NamHoc], [SoThanhVien], [IdLoaiBaiBao]) VALUES (11, N'BB011', N'sadf', N'sdfasdf', 1, N'2020-2021', 1, 2)
INSERT [dbo].[BaiBao] ([Id], [Ma], [Ten], [TenTapChiCongBo], [KiHoc], [NamHoc], [SoThanhVien], [IdLoaiBaiBao]) VALUES (12, N'BB012', N'Ietls6', N'IID', 2, N'2020-2021', NULL, 2)
INSERT [dbo].[BaiBao] ([Id], [Ma], [Ten], [TenTapChiCongBo], [KiHoc], [NamHoc], [SoThanhVien], [IdLoaiBaiBao]) VALUES (13, N'BB013', N'Ietls6', N'IID', 2, N'2020-2021', 2, 2)
SET IDENTITY_INSERT [dbo].[BaiBao] OFF
SET IDENTITY_INSERT [dbo].[BoMon] ON 

INSERT [dbo].[BoMon] ([Id], [Ma], [Ten]) VALUES (1, N'BM001', N'Bộ Môn An Toàn Thông Tin')
INSERT [dbo].[BoMon] ([Id], [Ma], [Ten]) VALUES (2, N'BM002', N'Bộ Môn Hệ Thống Thông Tin')
INSERT [dbo].[BoMon] ([Id], [Ma], [Ten]) VALUES (3, N'BM003', N'Bộ Môn Kỹ Thuật Phần Mềm')
INSERT [dbo].[BoMon] ([Id], [Ma], [Ten]) VALUES (4, N'BM004', N'Bộ Môn Cơ Học Máy')
INSERT [dbo].[BoMon] ([Id], [Ma], [Ten]) VALUES (5, N'BM005', N'Bộ Môn Chế Tạo Máy')
SET IDENTITY_INSERT [dbo].[BoMon] OFF
SET IDENTITY_INSERT [dbo].[DeTai] ON 

INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (5, N'DT005', N'Đề tài A', 2, N'2019-2020', N'Cơ quan A', 7, 2)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (6, N'DT006', N'Đề tài A', 1, N'2019-2020', N'Cơ quan A', 4, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (8, N'DT008', N'Đề tài D', 2, N'2018-2019', N'Cơ quan A', 5, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (11, N'DT011', N'Đề tài E', 2, N'2015-2016', N'Cơ quan E', 2, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (13, N'DT013', N'Đề tài CC', 1, N'2017-2018', N'Carsar', 1, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (14, N'DT014', N'Đề tài O', 2, N'2016-2017', N'Oixois', 1, 2)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (15, N'DT015', N'Đề tài đặc biệt', 2, N'2016-2017', N'Especially', NULL, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (19, N'DT019', N'gui', 1, N'2017-2018', N'dvSV', 1, 2)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (20, N'DT020', N'16TH', 1, N'2020-2021', N'Libu', 1, 2)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (21, N'DT021', N'De tai  C', 2, N'2020-2021', N'MTA', 3, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (22, N'DT022', N'De tai  C', 2, N'2020-2021', N'MTA', NULL, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (23, N'DT023', N'De tai  C', 2, N'2020-2021', N'MTA', NULL, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (24, N'DT024', N'De tai  C', 2, N'2020-2021', N'MTA', NULL, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (25, N'DT025', N'De tai  C', 2, N'2020-2021', N'MTA', NULL, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (26, N'DT026', N'Nguyen HUu TIen ', 2, N'2020-2021', N'MTA_ITEN', NULL, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (28, N'DT028', N'20/11', 2, N'2020-2021', N'2323', 3, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (29, N'DT029', N'SDAHFUSF', 1, N'2020-2021', N'', 1, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (30, N'DT030', N'complete Topic', 1, N'2020-2021', N'5 ae', 2, 1)
INSERT [dbo].[DeTai] ([Id], [Ma], [Ten], [KiHoc], [NamHoc], [CoQuanQuanLy], [SoThanhVien], [IdLoaiDeTai]) VALUES (31, N'DT031', N'one more nice', 1, N'2019-2020', N'Symain B', NULL, 2)
SET IDENTITY_INSERT [dbo].[DeTai] OFF
SET IDENTITY_INSERT [dbo].[GiaoVien] ON 

INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (3, N'GV003', N'Chu Thị H', 0, CAST(N'1977-04-14' AS Date), N'210 Cầu Giấy', N'123443221   ', N'gv03@gmail.com', 3)
INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (4, N'GV004', N'Hà Văn A', 1, CAST(N'1976-03-01' AS Date), N'236 Hoàng Quốc Việt', N'123456678', N'gv02@gmail.com', 2)
INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (5, N'GV005', N'Nguyễn Văn B', 1, CAST(N'1980-02-01' AS Date), N'117 Trần Cung', N'123456789   ', N'gv05@gmail.com', 5)
INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (6, N'GV006', N'Nguyễn Văn C', 1, CAST(N'1980-04-01' AS Date), N'117 Trần Cung', N'123456789   ', N'gv06@gmail.com', 1)
INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (7, N'GV007', N'Chu Văn A', 1, CAST(N'1980-06-01' AS Date), N'117 Trần Cung', N'123456789   ', N'gv07@gmail.com', 2)
INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (8, N'GV008', N'Nguyễn Văn C', 1, CAST(N'1980-01-05' AS Date), N'117 Trần Cung', N'123456789   ', N'gv08@gmail.com', 3)
INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (9, N'GV009', N'Nguyễn Thị H', 0, CAST(N'1980-01-30' AS Date), N'117 Trần Cung', N'123456789   ', N'gv09@gmail.com', 4)
INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (10, N'GV010', N'Nguyễn Thị K', 0, CAST(N'1980-01-24' AS Date), N'117 Trần Cung', N'123456789   ', N'gv10@gmail.com', 5)
INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (15, N'GV015', N'Nguyễn Hữu Tiếnn', 1, CAST(N'2000-02-01' AS Date), N'à', N'sf', N'sa', 2)
INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (28, N'GV028', N'hdasdfdsaf', 0, CAST(N'2020-12-18' AS Date), N'1234', N'3456', N'5678', 5)
INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (31, N'GV031', N'sdfsd', NULL, NULL, N'wer', N'wer', N'wer', 4)
INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (32, N'GV032', N'324', 0, CAST(N'2020-12-04' AS Date), N'fhs', N'dfgsdfh', N'ghd', 1)
INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (34, N'GV034', N'Nguyễn Minh Nguyệt', 1, CAST(N'2020-12-06' AS Date), N'Hồ Tùng Mậu', N'033985461', N'nguyennun55@gmail.com', 5)
INSERT [dbo].[GiaoVien] ([Id], [Ma], [Ten], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [IdBoMon]) VALUES (35, N'GV035', N'Trần Đình Trọng', 1, CAST(N'2020-12-17' AS Date), N'45 Trần Văn Khuê', N'0185468015', N'samary@gmail.com', 5)
SET IDENTITY_INSERT [dbo].[GiaoVien] OFF
SET IDENTITY_INSERT [dbo].[GV_BaiBao] ON 

INSERT [dbo].[GV_BaiBao] ([Id], [IdGiaoVien], [IdBaiBao], [SoGio]) VALUES (2, 3, 10, 150)
INSERT [dbo].[GV_BaiBao] ([Id], [IdGiaoVien], [IdBaiBao], [SoGio]) VALUES (3, 3, 11, 150)
INSERT [dbo].[GV_BaiBao] ([Id], [IdGiaoVien], [IdBaiBao], [SoGio]) VALUES (4, 34, 13, 75)
INSERT [dbo].[GV_BaiBao] ([Id], [IdGiaoVien], [IdBaiBao], [SoGio]) VALUES (5, 4, 13, 75)
SET IDENTITY_INSERT [dbo].[GV_BaiBao] OFF
SET IDENTITY_INSERT [dbo].[GV_DeTai] ON 

INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (10, 3, NULL, 0, NULL)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (11, 4, 5, 0, 20)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (12, 3, 5, 0, 64)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (13, 4, 5, 0, 53)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (14, 6, 5, 0, 20)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (16, 3, 8, 0, 320)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (18, 5, 8, 0, 64)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (34, 6, 6, 0, 106)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (40, 3, 6, 0, 106)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (41, 7, 8, 0, 40)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (42, 15, 8, 0, 40)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (43, 5, 11, 0, 160)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (44, 3, 11, 0, 160)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (47, 9, 13, 0, 320)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (52, 4, 14, 1, 200)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (54, 9, 6, 0, 80)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (55, 5, 5, 0, 40)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (59, 4, 20, 1, 200)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (62, 3, 28, 1, 400)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (63, 6, 28, 1, 240)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (64, 9, 28, 1, 186)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (65, 7, 5, 1, 60)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (66, 3, 30, 1, 400)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (67, 4, 30, 0, 160)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (68, 5, 21, 1, 400)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (70, 6, 21, NULL, NULL)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (71, 4, 19, 1, 200)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (72, 3, 29, 1, 400)
INSERT [dbo].[GV_DeTai] ([Id], [IdGiaoVien], [IdDeTai], [LaChuTri], [SoGio]) VALUES (73, 34, 5, 1, 62)
SET IDENTITY_INSERT [dbo].[GV_DeTai] OFF
SET IDENTITY_INSERT [dbo].[GV_Sach] ON 

INSERT [dbo].[GV_Sach] ([Id], [IdGiaoVien], [IdSach], [SoTrangDaViet], [SoGio]) VALUES (1, 4, 9, 3, 9)
INSERT [dbo].[GV_Sach] ([Id], [IdGiaoVien], [IdSach], [SoTrangDaViet], [SoGio]) VALUES (3, 3, 8, 12, 36)
INSERT [dbo].[GV_Sach] ([Id], [IdGiaoVien], [IdSach], [SoTrangDaViet], [SoGio]) VALUES (4, 34, 10, 12, 48)
INSERT [dbo].[GV_Sach] ([Id], [IdGiaoVien], [IdSach], [SoTrangDaViet], [SoGio]) VALUES (5, 5, 8, 2, 6)
INSERT [dbo].[GV_Sach] ([Id], [IdGiaoVien], [IdSach], [SoTrangDaViet], [SoGio]) VALUES (6, 3, 10, 4, 16)
SET IDENTITY_INSERT [dbo].[GV_Sach] OFF
SET IDENTITY_INSERT [dbo].[LoaiBaiBao] ON 

INSERT [dbo].[LoaiBaiBao] ([Id], [Ten], [DonViTinh], [GioChuan], [GhiChu]) VALUES (1, N'Đăng trong các kỳ hội nghị khoa học trong nước', 1, 100, N'Số giờ chuẩn chia đều cho các tác giả')
INSERT [dbo].[LoaiBaiBao] ([Id], [Ten], [DonViTinh], [GioChuan], [GhiChu]) VALUES (2, N'Đăng trong tạp chí Khoa học trong nước, có chỉ số ISSN', 1, 150, N'Số giờ chuẩn chia đều cho các tác giả')
INSERT [dbo].[LoaiBaiBao] ([Id], [Ten], [DonViTinh], [GioChuan], [GhiChu]) VALUES (3, N'Đăng trong các kỳ Hội nghị Khoa học Quốc tế', 1, 150, N'Số giờ chuẩn chia đều cho các tác giả')
INSERT [dbo].[LoaiBaiBao] ([Id], [Ten], [DonViTinh], [GioChuan], [GhiChu]) VALUES (4, N'Đăng trong tạp chí Khoa học Quốc tế có chỉ số ISI', 1, 200, N'Số giờ chuẩn chia đều cho các tác giả')
SET IDENTITY_INSERT [dbo].[LoaiBaiBao] OFF
SET IDENTITY_INSERT [dbo].[LoaiDeTai] ON 

INSERT [dbo].[LoaiDeTai] ([Id], [Ten], [DonViTinh], [GioChuan], [GhiChu]) VALUES (1, N'Đề tài, dự án nghiên cứu cấp nhà nước', 1, 400, N'Nếu công trình do tập thể thực hiện thì cán bộ chủ trì hưởng 1/5 số giờ, 4/5 giờ chuẩn còn lại được chia đều cho tất cả các thành viên kể (kể cả cán bộ chủ trì)')
INSERT [dbo].[LoaiDeTai] ([Id], [Ten], [DonViTinh], [GioChuan], [GhiChu]) VALUES (2, N'Đề tài, dự án nghiên cứu cấp học viện', 1, 200, N'Nếu công trình do tập thể thực hiện thì cán bộ chủ trì hưởng 1/5 số giờ, 4/5 giờ chuẩn còn lại được chia đều cho tất cả các thành viên kể (kể cả cán bộ chủ trì)')
SET IDENTITY_INSERT [dbo].[LoaiDeTai] OFF
SET IDENTITY_INSERT [dbo].[LoaiSach] ON 

INSERT [dbo].[LoaiSach] ([Id], [Ten], [DonViTinh], [GioChuan], [GhiChu]) VALUES (1, N'Sách chuyên khảo', 1, 3, N'Mỗi cán bộ căn cứ vào số trang để tính giờ chuẩn')
INSERT [dbo].[LoaiSach] ([Id], [Ten], [DonViTinh], [GioChuan], [GhiChu]) VALUES (2, N'Giáo trình mới', 1, 4, N'Nếu sách do tập thể thực hiện thì cán bộ chủ trì đc hưởng 1/5 số giờ chuẩn, còn lại 4/5 số giờ chuẩn được chia đều cho tất cả những người tham gia cả bán bộ chủ trì')
INSERT [dbo].[LoaiSach] ([Id], [Ten], [DonViTinh], [GioChuan], [GhiChu]) VALUES (3, N'Giáo trình tái bản', 1, 3, N'Nếu sách do tập thể thực hiện thì cán bộ chủ trì đc hưởng 1/5 số giờ chuẩn, còn lại 4/5 số giờ chuẩn được chia đều cho tất cả những người tham gia cả bán bộ chủ trì')
INSERT [dbo].[LoaiSach] ([Id], [Ten], [DonViTinh], [GioChuan], [GhiChu]) VALUES (4, N'Tài liệu biên dịch, sách tham khảo', 1, 4, N'Nếu sách do tập thể thực hiện thì cán bộ chủ trì đc hưởng 1/5 số giờ chuẩn, còn lại 4/5 số giờ chuẩn được chia đều cho tất cả những người tham gia cả bán bộ chủ trì')
INSERT [dbo].[LoaiSach] ([Id], [Ten], [DonViTinh], [GioChuan], [GhiChu]) VALUES (5, N'Sách hướng dẫn, bài giảng với học phần chưa có giáo trình', 1, 2, N'Nếu sách do tập thể thực hiện thì cán bộ chủ trì đc hưởng 1/5 số giờ chuẩn, còn lại 4/5 số giờ chuẩn được chia đều cho tất cả những người tham gia cả bán bộ chủ trì')
SET IDENTITY_INSERT [dbo].[LoaiSach] OFF
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([Id], [Ma], [Ten], [NoiXuatBan], [KiHoc], [NamHoc], [SoThanhVien], [IdLoaiSach]) VALUES (8, N'SA008', N'Sach A', N'NXB 1', 1, N'2019-2020', NULL, 1)
INSERT [dbo].[Sach] ([Id], [Ma], [Ten], [NoiXuatBan], [KiHoc], [NamHoc], [SoThanhVien], [IdLoaiSach]) VALUES (9, N'SA009', N'Sach A', N'NXB 1', 1, N'2019-2020', NULL, 1)
INSERT [dbo].[Sach] ([Id], [Ma], [Ten], [NoiXuatBan], [KiHoc], [NamHoc], [SoThanhVien], [IdLoaiSach]) VALUES (10, N'SA010', N'Test formDetai', N'', 1, N'2020-2021', NULL, 2)
SET IDENTITY_INSERT [dbo].[Sach] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (1, N'tienmta', N'122', NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (2, N'HieuDepTrai90', N'1222', N'vuhieupro1999@gmail.com', N'Vũ Minh Hiếu')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (3, N'tienmta', N'1222', N'tien@gmail.com', N'Tiến')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (4, N'tienmta', N'1222', N'tien@gmail.com', N'Tiến')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (5, N'ndhung', N'1111', N'hung@gmail.com', N'Nguyễn Đức Hưng')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (6, N'pvTruong', N'1111', N'truong@gmail.com', N'Phùng Văn Trường')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (7, N'pvTruong', N'1111', N'truong@gmail.com', N'Phùng Văn Trường')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (8, N'pvTruong', N'1111', N'truong@gmail.com', N'Phùng Văn Trường')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (9, N'pvTruong', N'1111', N'truong@gmail.com', N'Phùng Văn Trường')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (10, N'pvTruong', N'1111', N'truong@gmail.com', N'Phùng Văn Trường')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (11, N'pvTruong', N'1111', N'truong@gmail.com', N'Phùng Văn Trường')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (12, N'pvTruong', N'1111', N'truong@gmail.com', N'Phùng Văn Trường')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (13, N'pvTruong', N'1111', N'truong@gmail.com', N'Phùng Văn Trường')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (14, N'pvTruong', N'1111', N'truong@gmail.com', N'Phùng Văn Trường')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (15, N'pvTruong', N'1111', N'truong@gmail.com', N'Phùng Văn Trường')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (16, N'pvTruong', N'1111', N'truong@gmail.com', N'Phùng Văn Trường')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (17, N'pvTruong', N'1111', N'truong@gmail.com', N'Phùng Văn Trường')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (18, N'hieumta', N'1111', N'hieu@gmail.com', N'Vũ Minh Hiếu')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (19, N'hieumta', N'1111', N'hieu@gmail.com', N'Vũ Minh Hiếu')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Name]) VALUES (20, N'cvHuy', N'1111', N'huy@gmail.com', N'Cao Văn Huy')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[GV_ChamThi] ADD  DEFAULT ((0)) FOR [SoGio]
GO
ALTER TABLE [dbo].[GV_HuongDan] ADD  DEFAULT ((0)) FOR [SoGio]
GO
ALTER TABLE [dbo].[GV_LopHocPhan] ADD  DEFAULT ((0)) FOR [SoGio]
GO
ALTER TABLE [dbo].[BaiBao]  WITH CHECK ADD FOREIGN KEY([IdLoaiBaiBao])
REFERENCES [dbo].[LoaiBaiBao] ([Id])
GO
ALTER TABLE [dbo].[DeTai]  WITH CHECK ADD FOREIGN KEY([IdLoaiDeTai])
REFERENCES [dbo].[LoaiDeTai] ([Id])
GO
ALTER TABLE [dbo].[GiaoVien]  WITH CHECK ADD FOREIGN KEY([IdBoMon])
REFERENCES [dbo].[BoMon] ([Id])
GO
ALTER TABLE [dbo].[GV_BaiBao]  WITH CHECK ADD FOREIGN KEY([IdBaiBao])
REFERENCES [dbo].[BaiBao] ([Id])
GO
ALTER TABLE [dbo].[GV_BaiBao]  WITH CHECK ADD FOREIGN KEY([IdGiaoVien])
REFERENCES [dbo].[GiaoVien] ([Id])
GO
ALTER TABLE [dbo].[GV_ChamThi]  WITH CHECK ADD FOREIGN KEY([IdGiaoVien])
REFERENCES [dbo].[GiaoVien] ([Id])
GO
ALTER TABLE [dbo].[GV_ChamThi]  WITH CHECK ADD FOREIGN KEY([IdLoaiChamThi])
REFERENCES [dbo].[LoaiChamThi] ([Id])
GO
ALTER TABLE [dbo].[GV_DeTai]  WITH CHECK ADD FOREIGN KEY([IdDeTai])
REFERENCES [dbo].[DeTai] ([Id])
GO
ALTER TABLE [dbo].[GV_DeTai]  WITH CHECK ADD FOREIGN KEY([IdGiaoVien])
REFERENCES [dbo].[GiaoVien] ([Id])
GO
ALTER TABLE [dbo].[GV_HoiDong]  WITH CHECK ADD FOREIGN KEY([IdGiaoVien])
REFERENCES [dbo].[GiaoVien] ([Id])
GO
ALTER TABLE [dbo].[GV_HoiDong]  WITH CHECK ADD FOREIGN KEY([IdHoiDong])
REFERENCES [dbo].[HoiDong] ([Id])
GO
ALTER TABLE [dbo].[GV_HuongDan]  WITH CHECK ADD FOREIGN KEY([IdGiaoVien])
REFERENCES [dbo].[GiaoVien] ([Id])
GO
ALTER TABLE [dbo].[GV_HuongDan]  WITH CHECK ADD FOREIGN KEY([IdHocVien])
REFERENCES [dbo].[HocVien] ([Id])
GO
ALTER TABLE [dbo].[GV_HuongDan]  WITH CHECK ADD FOREIGN KEY([IdLoaiHuongDan])
REFERENCES [dbo].[LoaiHuongDan] ([Id])
GO
ALTER TABLE [dbo].[GV_LopHocPhan]  WITH CHECK ADD FOREIGN KEY([IdGiaoVien])
REFERENCES [dbo].[GiaoVien] ([Id])
GO
ALTER TABLE [dbo].[GV_LopHocPhan]  WITH CHECK ADD FOREIGN KEY([IdLopHocPhan])
REFERENCES [dbo].[LopHocPhan] ([Id])
GO
ALTER TABLE [dbo].[GV_Sach]  WITH CHECK ADD FOREIGN KEY([IdGiaoVien])
REFERENCES [dbo].[GiaoVien] ([Id])
GO
ALTER TABLE [dbo].[GV_Sach]  WITH CHECK ADD FOREIGN KEY([IdSach])
REFERENCES [dbo].[Sach] ([Id])
GO
ALTER TABLE [dbo].[HocPhan]  WITH CHECK ADD FOREIGN KEY([IdDoiTuongHoc])
REFERENCES [dbo].[He] ([Id])
GO
ALTER TABLE [dbo].[HocPhan]  WITH CHECK ADD FOREIGN KEY([IdLoaiDayHoc])
REFERENCES [dbo].[LoaiDayHoc] ([Id])
GO
ALTER TABLE [dbo].[HocVien]  WITH CHECK ADD FOREIGN KEY([IdLop])
REFERENCES [dbo].[Lop] ([Id])
GO
ALTER TABLE [dbo].[HoiDong]  WITH CHECK ADD FOREIGN KEY([IdLoaiHoiDong])
REFERENCES [dbo].[LoaiHoiDong] ([Id])
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD FOREIGN KEY([IdHe])
REFERENCES [dbo].[He] ([Id])
GO
ALTER TABLE [dbo].[LopHocPhan]  WITH CHECK ADD FOREIGN KEY([IdHocPhan])
REFERENCES [dbo].[HocPhan] ([Id])
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD FOREIGN KEY([IdLoaiSach])
REFERENCES [dbo].[LoaiSach] ([Id])
GO
ALTER TABLE [dbo].[GV_DeTai]  WITH CHECK ADD CHECK  (((0)<=[LaChuTri] AND [LaChuTri]<=(1)))
GO
ALTER TABLE [dbo].[LoaiBaiBao]  WITH CHECK ADD CHECK  (([DonViTinh]<>(0)))
GO
ALTER TABLE [dbo].[LoaiChamThi]  WITH CHECK ADD CHECK  (([DonViTinh]<>(0)))
GO
ALTER TABLE [dbo].[LoaiDayHoc]  WITH CHECK ADD CHECK  (([DonViTinh]<>(0)))
GO
ALTER TABLE [dbo].[LoaiDeTai]  WITH CHECK ADD CHECK  (([DonViTinh]<>(0)))
GO
ALTER TABLE [dbo].[LoaiHuongDan]  WITH CHECK ADD CHECK  (([DonViTinh]<>(0)))
GO
ALTER TABLE [dbo].[LoaiSach]  WITH CHECK ADD CHECK  (([DonViTinh]<>(0)))
GO
/****** Object:  Trigger [dbo].[Delete_BaiBao]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger delete for table BaiBao
create trigger [dbo].[Delete_BaiBao] on [dbo].[BaiBao] instead of delete
as
begin
	declare @Id int
	select @Id=Id from deleted

	delete GV_BaiBao where IdBaiBao=@Id
	delete BaiBao where Id=@Id
end

GO
/****** Object:  Trigger [dbo].[Insert_BaiBao]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Trigger insert for table BaiBao
create trigger [dbo].[Insert_BaiBao] on [dbo].[BaiBao] for insert
as
begin
	declare @Id int, @Ma varchar(5)
	select @Id=Id from inserted

	set @Ma = 'BB'+RIGHT('000'+CONVERT(varchar(3), @Id), 3)

	update BaiBao set Ma=@Ma  where Id=@Id 
end

GO
/****** Object:  Trigger [dbo].[update_BaiBao]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger update for table BaiBao
create trigger [dbo].[update_BaiBao] on [dbo].[BaiBao] for update
as
begin
	declare @Id int, @GioChuan int, @SoTV int
	select @Id=Id from inserted

	select @GioChuan=GioChuan, @SoTV=SoThanhVien from LoaiBaiBao join BaiBao
	on LoaiBaiBao.Id=BaiBao.IdLoaiBaiBao where BaiBao.Id=@Id
	
	if @SoTV > 0
		update GV_BaiBao set SoGio=@GioChuan/@SoTV  where IdBaiBao=@Id
end

GO
/****** Object:  Trigger [dbo].[Insert_BoMon]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--======================================== Create trigger ==============

--Trigger insert for table BoMon
create trigger [dbo].[Insert_BoMon] on [dbo].[BoMon] for insert
as
begin
	declare @Id int, @Ma varchar(5)
	select @Id=Id from inserted

	set @Ma = 'BM'+RIGHT('000'+CONVERT(varchar(3), @Id), 3)

	update BoMon set Ma=@Ma  where Id=@Id 
end

GO
/****** Object:  Trigger [dbo].[Delete_Detai]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger delete for table Detai
create trigger [dbo].[Delete_Detai] on [dbo].[DeTai] instead of delete
as
begin
	declare @Id int
	select @Id=Id from deleted

	delete GV_DeTai where IdDeTai=@Id
	delete DeTai where Id=@Id
end

GO
/****** Object:  Trigger [dbo].[Insert_DeTai]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Trigger insert for table Detai
create trigger [dbo].[Insert_DeTai] on [dbo].[DeTai] for insert
as
begin
	declare @Id int, @Ma varchar(5)
	select @Id=Id from inserted

	set @Ma = 'DT'+RIGHT('000'+CONVERT(varchar(3), @Id), 3)

	update DeTai set Ma=@Ma  where Id=@Id 
end

GO
/****** Object:  Trigger [dbo].[Update_Detai]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger update for table Detai
create trigger [dbo].[Update_Detai] on [dbo].[DeTai] for update
as
begin
	declare @Id int, @GioChuan int, @SoTV int
	select @Id=Id from inserted

	select @GioChuan=GioChuan, @SoTV=SoThanhVien from LoaiDeTai join DeTai 
	on LoaiDeTai.Id=DeTai.IdLoaiDeTai  where DeTai.Id=@Id

	if @SoTV > 0
		update GV_DeTai set SoGio=(LaChuTri*@GioChuan/5 + @GioChuan*4/(5*@SoTV))  where Id=@Id
end

GO
/****** Object:  Trigger [dbo].[Delete_GiaoVein]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger delete for table GiaoVien
create trigger [dbo].[Delete_GiaoVein] on [dbo].[GiaoVien] instead of delete
as
begin
	declare @Id int
	select @Id=Id from deleted

	delete GV_BaiBao where IdGiaoVien=@Id
	delete GV_DeTai where IdGiaoVien=@Id
	delete GV_Sach where IdGiaoVien=@Id
	delete GiaoVien where Id=@Id
end

GO
/****** Object:  Trigger [dbo].[Insert_GiaoVien]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger insert for table GiaoVien
create trigger [dbo].[Insert_GiaoVien] on [dbo].[GiaoVien] for insert
as
begin
	declare @Id int, @Ma varchar(5)
	select @Id=Id from inserted

	set @Ma = 'GV'+RIGHT('000'+CONVERT(varchar(3), @Id), 3)

	update GiaoVien set Ma=@Ma  where Id=@Id 
end

GO
/****** Object:  Trigger [dbo].[Delete_GV_BaiBao]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger delete for table GV_BaiBao
create trigger [dbo].[Delete_GV_BaiBao] on [dbo].[GV_BaiBao] for delete
as
begin
	declare @IdBaiBao int
	select @IdBaiBao=IdBaiBao from deleted

	update BaiBao set SoThanhVien=(select COUNT(*) from GV_BaiBao where IdBaiBao=@IdBaiBao)  
	where Id=@IdBaiBao
end

GO
/****** Object:  Trigger [dbo].[Insert_GV_BaiBao]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger insert for table GV_BaiBao
create trigger [dbo].[Insert_GV_BaiBao] on [dbo].[GV_BaiBao] for insert
as
begin
	declare @Id int, @IdBaiBao int, @SoGio int, @SoTV int
	select @Id=Id, @IdBaiBao=IdBaiBao from inserted

	select @SoTV = COUNT(*) from GV_BaiBao where IdBaiBao=@IdBaiBao
	update BaiBao set SoThanhVien=@SoTV  where Id=@IdBaiBao

	select @SoGio=GioChuan/SoThanhVien from LoaiBaiBao join BaiBao 
	on LoaiBaiBao.Id=BaiBao.IdLoaiBaiBao where BaiBao.Id=@IdBaiBao

	update GV_BaiBao set SoGio=@SoGio  where Id=@Id
end

GO
/****** Object:  Trigger [dbo].[Delete_GV_DeTai]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger delete for table GV_DeTai
create trigger [dbo].[Delete_GV_DeTai] on [dbo].[GV_DeTai] for delete
as
begin
	declare @IdDeTai int
	select @IdDeTai=IdDeTai from deleted

	update DeTai set SoThanhVien=(select COUNT(*) from GV_DeTai where IdDeTai=@IdDeTai)  
	where Id=@IdDeTai
end

GO
/****** Object:  Trigger [dbo].[Insert_GV_DeTai]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger insert for table GV_DeTai
create trigger [dbo].[Insert_GV_DeTai] on [dbo].[GV_DeTai] for insert
as
begin
	declare @Id int, @IdDeTai int, @GioChuan int, @SoTV int
	select @Id=Id, @IdDeTai=IdDeTai from inserted

	select @SoTV = COUNT(*) from GV_DeTai where IdDeTai=@IdDeTai
	update DeTai set SoThanhVien=@SoTV  where Id=@IdDeTai

	select @GioChuan=GioChuan from LoaiDeTai join DeTai 
	on LoaiDeTai.Id=DeTai.IdLoaiDeTai  where DeTai.Id=@IdDeTai

	update GV_DeTai set SoGio=(LaChuTri*@GioChuan/5 + @GioChuan*4/(5*@SoTV))  where Id=@Id
end

GO
/****** Object:  Trigger [dbo].[Update_GV_DeTai]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger insert for table GV_DeTai
create trigger [dbo].[Update_GV_DeTai] on [dbo].[GV_DeTai] for update
as
begin
	declare @Id int, @IdDeTai int, @GioChuan int, @SoTV int
	select @Id=Id, @IdDeTai=IdDeTai from inserted

	select @GioChuan=GioChuan, @SoTV=SoThanhVien from LoaiDeTai join DeTai 
	on LoaiDeTai.Id=DeTai.IdLoaiDeTai  where DeTai.Id=@IdDeTai

	update GV_DeTai set SoGio=(LaChuTri*@GioChuan/5 + @GioChuan*4/(5*@SoTV))  where Id=@Id
end

GO
/****** Object:  Trigger [dbo].[IU_GV_Sach]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Trigger insert, update for table GV_Sach
create trigger [dbo].[IU_GV_Sach] on [dbo].[GV_Sach] for insert, update
as
begin
	declare @Id int, @IdSach int, @GioChuan int, @DonViTinh int
	
	select @Id=Id, @IdSach=IdSach from inserted

	select @GioChuan=GioChuan, @DonViTinh=DonViTinh from LoaiSach 
	join Sach on LoaiSach.Id=Sach.IdLoaiSach where Sach.Id=@IdSach

	update GV_Sach set SoGio=@GioChuan*SoTrangDaViet/@DonViTinh  where Id=@Id
	
end

GO
/****** Object:  Trigger [dbo].[Delete_Sach]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger delete for table Sach
create trigger [dbo].[Delete_Sach] on [dbo].[Sach] instead of delete
as
begin
	declare @Id int
	select @Id=Id from deleted

	delete GV_Sach where IdSach=@Id
	delete Sach where Id=@Id
end

GO
/****** Object:  Trigger [dbo].[Insert_Sach]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--Trigger insert for table Sach
create trigger [dbo].[Insert_Sach] on [dbo].[Sach] for insert
as
begin
	declare @Id int, @Ma varchar(5)
	select @Id=Id from inserted

	set @Ma = 'SA'+RIGHT('000'+CONVERT(varchar(3), @Id), 3)

	update Sach set Ma=@Ma  where Id=@Id 
end

GO
/****** Object:  Trigger [dbo].[update_Sach]    Script Date: 12/6/2020 6:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger update for table Sach
create trigger [dbo].[update_Sach] on [dbo].[Sach] for update
as
begin
	declare @Id int, @GioChuan int, @DonViTinh  int
	select @Id=Id from inserted

	select @GioChuan=GioChuan, @DonViTinh=DonViTinh from LoaiSach 
	join Sach on LoaiSach.Id=Sach.IdLoaiSach where Sach.Id=@Id

	update GV_Sach set SoGio=@GioChuan*SoTrangDaViet/@DonViTinh  where IdSach=@Id
end

GO
USE [master]
GO
ALTER DATABASE [QuanLyGiaoVienDB_LTTH] SET  READ_WRITE 
GO
