USE [master]
GO
/****** Object:  Database [Shop]    Script Date: 3/6/2024 2:25:32 PM ******/
CREATE DATABASE [Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Shop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shop] SET RECOVERY FULL 
GO
ALTER DATABASE [Shop] SET  MULTI_USER 
GO
ALTER DATABASE [Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shop', N'ON'
GO
ALTER DATABASE [Shop] SET QUERY_STORE = ON
GO
ALTER DATABASE [Shop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Shop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/6/2024 2:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[PhoneNum] [varchar](20) NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/6/2024 2:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartProduct]    Script Date: 3/6/2024 2:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartProduct](
	[cartId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [primarykey_CartProduct] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/6/2024 2:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 3/6/2024 2:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 3/6/2024 2:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/6/2024 2:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[TotalPrice] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[ShipId] [int] NULL,
	[StatusID] [int] NULL,
	[OrderDate] [varchar](250) NULL,
	[DeliveryDate] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 3/6/2024 2:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[amount] [int] NULL,
 CONSTRAINT [primarykey_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 3/6/2024 2:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/6/2024 2:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](1000) NULL,
	[Description] [nvarchar](max) NULL,
	[color] [varchar](20) NULL,
	[OriginalPrice] [int] NULL,
	[SellPrice] [int] NULL,
	[CatID] [int] NULL,
	[SellerID] [int] NULL,
	[Amount] [int] NULL,
	[ImgLink] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/6/2024 2:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipAddress]    Script Date: 3/6/2024 2:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[FullName] [nvarchar](100) NULL,
	[PhoneNum] [varchar](20) NULL,
	[ShipCityId] [int] NULL,
	[DistrictId] [int] NULL,
	[AddressDetail] [nvarchar](1000) NULL,
	[isUse] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Username], [Password], [Email], [PhoneNum], [RoleID]) VALUES (1, N'manh', N'123456', N'ddmanh.221203@gmail.com', N'0962239817', 1)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Email], [PhoneNum], [RoleID]) VALUES (2, N'tuan', N'123456', N'tuan12@gmail.com', N'0123012345', 1)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Email], [PhoneNum], [RoleID]) VALUES (3, N'seller', N'123456', N'seller1@gmail.com', N'0962239826', 2)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Email], [PhoneNum], [RoleID]) VALUES (4, N'admin', N'admin', N'admin@gmail.com', N'0962239777', 3)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Email], [PhoneNum], [RoleID]) VALUES (5, N'ducmanh', N'123456', N'ddmanh.221203@gmail.com', N'0386264489', 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([ID], [UserID]) VALUES (1, 2)
INSERT [dbo].[Cart] ([ID], [UserID]) VALUES (3, 5)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[CartProduct] ([cartId], [productId], [Amount]) VALUES (1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Laptop')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Smartphone')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Accessories')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [name]) VALUES (1, N'An Giang')
INSERT [dbo].[City] ([Id], [name]) VALUES (2, N'Ba Ria - Vung Tau')
INSERT [dbo].[City] ([Id], [name]) VALUES (3, N'Bac Lieu')
INSERT [dbo].[City] ([Id], [name]) VALUES (4, N'Bac Kan')
INSERT [dbo].[City] ([Id], [name]) VALUES (5, N'Bac Giang')
INSERT [dbo].[City] ([Id], [name]) VALUES (6, N'Bac Ninh')
INSERT [dbo].[City] ([Id], [name]) VALUES (7, N'Ben Tre')
INSERT [dbo].[City] ([Id], [name]) VALUES (8, N'Bình Dương')
INSERT [dbo].[City] ([Id], [name]) VALUES (9, N'Bình Định')
INSERT [dbo].[City] ([Id], [name]) VALUES (10, N'Bình Phước')
INSERT [dbo].[City] ([Id], [name]) VALUES (11, N'Bình Thuận')
INSERT [dbo].[City] ([Id], [name]) VALUES (12, N'Cà Mau')
INSERT [dbo].[City] ([Id], [name]) VALUES (13, N'Cao Bằng')
INSERT [dbo].[City] ([Id], [name]) VALUES (14, N'Cần Thơ')
INSERT [dbo].[City] ([Id], [name]) VALUES (15, N'Đà Nẵng')
INSERT [dbo].[City] ([Id], [name]) VALUES (16, N'Đắk Lắk')
INSERT [dbo].[City] ([Id], [name]) VALUES (17, N'Đắk Nông')
INSERT [dbo].[City] ([Id], [name]) VALUES (18, N'Điện Biên')
INSERT [dbo].[City] ([Id], [name]) VALUES (19, N'Đồng Nai')
INSERT [dbo].[City] ([Id], [name]) VALUES (20, N'Đồng Tháp')
INSERT [dbo].[City] ([Id], [name]) VALUES (21, N'Gia Lai')
INSERT [dbo].[City] ([Id], [name]) VALUES (22, N'Hà Giang')
INSERT [dbo].[City] ([Id], [name]) VALUES (23, N'Hà Nam')
INSERT [dbo].[City] ([Id], [name]) VALUES (24, N'Hà Nội')
INSERT [dbo].[City] ([Id], [name]) VALUES (25, N'Hà Tĩnh')
INSERT [dbo].[City] ([Id], [name]) VALUES (26, N'Hải Dương')
INSERT [dbo].[City] ([Id], [name]) VALUES (27, N'Hải Phòng')
INSERT [dbo].[City] ([Id], [name]) VALUES (28, N'Hòa Bình')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([Id], [name]) VALUES (1, N'Ba Đình')
INSERT [dbo].[District] ([Id], [name]) VALUES (2, N'Bắc Từ Liêm')
INSERT [dbo].[District] ([Id], [name]) VALUES (3, N'Cầu Giấy')
INSERT [dbo].[District] ([Id], [name]) VALUES (4, N'Đống Đa')
INSERT [dbo].[District] ([Id], [name]) VALUES (5, N'Hà Đông')
INSERT [dbo].[District] ([Id], [name]) VALUES (6, N'Hai Bà Trưng')
INSERT [dbo].[District] ([Id], [name]) VALUES (7, N'Hoàn Kiếm')
INSERT [dbo].[District] ([Id], [name]) VALUES (8, N'Hoàng Mai')
INSERT [dbo].[District] ([Id], [name]) VALUES (9, N'Long Biên')
INSERT [dbo].[District] ([Id], [name]) VALUES (10, N'Nam Từ Liêm')
INSERT [dbo].[District] ([Id], [name]) VALUES (11, N'Tây Hồ')
INSERT [dbo].[District] ([Id], [name]) VALUES (12, N'Thanh Xuân')
SET IDENTITY_INSERT [dbo].[District] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [UserID], [TotalPrice], [Note], [ShipId], [StatusID], [OrderDate], [DeliveryDate]) VALUES (1, 1, 361, NULL, 1, 2, N'06-11-2023 21:16', N'07-11-2023 08:00')
INSERT [dbo].[Order] ([ID], [UserID], [TotalPrice], [Note], [ShipId], [StatusID], [OrderDate], [DeliveryDate]) VALUES (2, 1, 1446, NULL, 1, 2, N'07-11-2023 08:08', N'08-11-2023 08:00')
INSERT [dbo].[Order] ([ID], [UserID], [TotalPrice], [Note], [ShipId], [StatusID], [OrderDate], [DeliveryDate]) VALUES (3, 1, 334, NULL, 1, 2, N'04-03-2024 11:19', N'05-03-2024 08:00')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([ProductId], [OrderId], [amount]) VALUES (6, 1, 361)
INSERT [dbo].[OrderProduct] ([ProductId], [OrderId], [amount]) VALUES (2, 2, 1446)
INSERT [dbo].[OrderProduct] ([ProductId], [OrderId], [amount]) VALUES (3, 2, 1446)
INSERT [dbo].[OrderProduct] ([ProductId], [OrderId], [amount]) VALUES (6, 2, 1446)
INSERT [dbo].[OrderProduct] ([ProductId], [OrderId], [amount]) VALUES (3, 3, 334)
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (1, N'Waiting for Confirmation')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (2, N'Packaging')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (3, N'Delivering')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (4, N'Canceled')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (5, N'Completed')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [color], [OriginalPrice], [SellPrice], [CatID], [SellerID], [Amount], [ImgLink]) VALUES (1, N'Acer Pro 14 M1', N'Acer Pro sở hữu bộ vi xử lý M1 Pro được sản xuất bằng quy trình 5 nm hiện đại, có 6 lõi hiệu năng cao và 2 lõi tiết kiệm điện, cho hiệu năng nhanh hơn tới 70% và hiệu suất tăng 1.7 lần so với thế hệ trước, mang lại hiệu năng vượt trội nhưng vẫn đảm bảo tiết kiệm điện năng tiêu thụ, cho phép mình làm việc văn phòng mượt mà, chỉnh sửa ảnh hay dựng video độ phân giải cao đều không thành vấn đề.', N'Silver', 400, 417, 1, 3, 100, N'AC1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [color], [OriginalPrice], [SellPrice], [CatID], [SellerID], [Amount], [ImgLink]) VALUES (2, N'Acer Pro M2', N'Acer Pro sở hữu bộ vi xử lý M1 Pro được sản xuất bằng quy trình 5 nm hiện đại, có 6 lõi hiệu năng cao và 2 lõi tiết kiệm điện, cho hiệu năng nhanh hơn tới 70% và hiệu suất tăng 1.7 lần so với thế hệ trước, mang lại hiệu năng vượt trội nhưng vẫn đảm bảo tiết kiệm điện năng tiêu thụ, cho phép mình làm việc văn phòng mượt mà, chỉnh sửa ảnh hay dựng video độ phân giải cao đều không thành vấn đề.', N'Black', 400, 417, 1, 3, 50, N'AC2.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [color], [OriginalPrice], [SellPrice], [CatID], [SellerID], [Amount], [ImgLink]) VALUES (3, N'iPhone 11 64GB', N'Sau chiếc điện thoại iPhone Xr, Apple tiếp tục ra mắt siêu phẩm 2019 mang tên iPhone 11 64GB - một smartphone được nâng cấp toàn diện từ thiết kế cao cấp, vi xử lý hiệu năng mạnh mẽ đến hệ thống camera chất lượng cùng thời lượng pin vượt trội.', N'Black', 300, 334, 2, 3, 50, N'IP1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [color], [OriginalPrice], [SellPrice], [CatID], [SellerID], [Amount], [ImgLink]) VALUES (4, N'iPhone 11 64GB', N'Sau chiếc điện thoại iPhone Xr, Apple tiếp tục ra mắt siêu phẩm 2019 mang tên iPhone 11 64GB - một smartphone được nâng cấp toàn diện từ thiết kế cao cấp, vi xử lý hiệu năng mạnh mẽ đến hệ thống camera chất lượng cùng thời lượng pin vượt trội.', N'Silver', 300, 334, 2, 3, 50, N'IP2.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [color], [OriginalPrice], [SellPrice], [CatID], [SellerID], [Amount], [ImgLink]) VALUES (5, N'AirPods 3', N'Chiếc tai nghe Bluetooth AirPods 3 Lightning Charge Apple MPNY3 Trắng mang đến một thiết kế tối giản, kiểu dáng hiện đại, màu sắc tinh tế và nhiều công nghệ âm thanh vượt trội như: Adaptive EQ, Chip Apple H1, Spatial Audio.', N'White', 350, 361, 3, 3, 50, N'AP1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [color], [OriginalPrice], [SellPrice], [CatID], [SellerID], [Amount], [ImgLink]) VALUES (6, N'AirPods Pro', N'AirPods Pro 2 là một trong những sản phẩm được Apple ra mắt trong năm 2022,
	với nhiều nâng cấp ấn tượng, chip H2 mạnh mẽ, âm thanh phong phú hơn,
	khả năng khử tiếng ồn chủ động,... hứa hẹn sẽ mang lại trải nghiệm tuyệt vời cho người dùng.', N'Silver', 350, 361, 3, 3, 50, N'AP2.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Customer')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Seller')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[ShipAddress] ON 

INSERT [dbo].[ShipAddress] ([Id], [userId], [FullName], [PhoneNum], [ShipCityId], [DistrictId], [AddressDetail], [isUse]) VALUES (1, 1, N'Đức Mạnh', N'0386264489', 24, 1, N'158, Kim Mã', 1)
INSERT [dbo].[ShipAddress] ([Id], [userId], [FullName], [PhoneNum], [ShipCityId], [DistrictId], [AddressDetail], [isUse]) VALUES (2, 2, N'Tuấn', N'0123122435', 24, 2, N'Số 92, Xuân Đỉnh', 1)
INSERT [dbo].[ShipAddress] ([Id], [userId], [FullName], [PhoneNum], [ShipCityId], [DistrictId], [AddressDetail], [isUse]) VALUES (3, 3, N'Duc Manh', N'0943028799', 24, 2, N'154, To 1', 1)
SET IDENTITY_INSERT [dbo].[ShipAddress] OFF
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((1)) FOR [RoleID]
GO
ALTER TABLE [dbo].[ShipAddress] ADD  DEFAULT ((0)) FOR [isUse]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [userID_in_cart] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [userID_in_cart]
GO
ALTER TABLE [dbo].[CartProduct]  WITH CHECK ADD  CONSTRAINT [fk_cartId] FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([ID])
GO
ALTER TABLE [dbo].[CartProduct] CHECK CONSTRAINT [fk_cartId]
GO
ALTER TABLE [dbo].[CartProduct]  WITH CHECK ADD  CONSTRAINT [fk_productId] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[CartProduct] CHECK CONSTRAINT [fk_productId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [ShipId_in_ship_address] FOREIGN KEY([ShipId])
REFERENCES [dbo].[ShipAddress] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [ShipId_in_ship_address]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [statusID_in_order_status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[OrderStatus] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [statusID_in_order_status]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [userID_in_order_status] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [userID_in_order_status]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [fk_orderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [fk_orderId]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [fk_ProductId_OrderProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [fk_ProductId_OrderProduct]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [product_in_Category] FOREIGN KEY([CatID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [product_in_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [SellerID_in_Account] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [SellerID_in_Account]
GO
ALTER TABLE [dbo].[ShipAddress]  WITH CHECK ADD  CONSTRAINT [district_in_ship_address] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[ShipAddress] CHECK CONSTRAINT [district_in_ship_address]
GO
ALTER TABLE [dbo].[ShipAddress]  WITH CHECK ADD  CONSTRAINT [ship_city_in_ship_address] FOREIGN KEY([ShipCityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[ShipAddress] CHECK CONSTRAINT [ship_city_in_ship_address]
GO
ALTER TABLE [dbo].[ShipAddress]  WITH CHECK ADD  CONSTRAINT [userID_in_user_address] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[ShipAddress] CHECK CONSTRAINT [userID_in_user_address]
GO
USE [master]
GO
ALTER DATABASE [Shop] SET  READ_WRITE 
GO
