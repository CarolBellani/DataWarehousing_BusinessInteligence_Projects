USE [master]
GO
/****** Object:  Database [Group12_STAGING.bak]    Script Date: 12/01/2018 22:39:56 ******/
CREATE DATABASE [Group12_STAGING.bak]
GO
ALTER DATABASE [Group12_STAGING.bak] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Group12_STAGING.bak].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Group12_STAGING.bak] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET ARITHABORT OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Group12_STAGING.bak] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Group12_STAGING.bak] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Group12_STAGING.bak] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Group12_STAGING.bak] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET RECOVERY FULL 
GO
ALTER DATABASE [Group12_STAGING.bak] SET  MULTI_USER 
GO
ALTER DATABASE [Group12_STAGING.bak] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Group12_STAGING.bak] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Group12_STAGING.bak] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Group12_STAGING.bak] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Group12_STAGING.bak] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Group12_STAGING.bak', N'ON'
GO
ALTER DATABASE [Group12_STAGING.bak] SET QUERY_STORE = OFF
GO
USE [Group12_STAGING.bak]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Group12_STAGING.bak]
GO
/****** Object:  Table [dbo].[Dim_Customer]    Script Date: 12/01/2018 22:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Customer](
	[SK_Customer] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ClientVIPCategory] [bit] NULL,
	[ClientCategoryName] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](100) NULL,
	[DeliveryPostalCode] [nvarchar](10) NULL,
	[DeliveryAddressLine1] [nvarchar](60) NULL,
	[DeliveryAddressLine2] [nvarchar](60) NULL,
	[PostalPostalCode] [nvarchar](10) NULL,
	[PostalAddressLine1] [nvarchar](60) NULL,
	[PostalAddressLine2] [nvarchar](60) NULL,
	[CustomerStartDate] [datetime2](7) NULL,
	[CustomerEndDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Dim_Customer_1] PRIMARY KEY CLUSTERED 
(
	[SK_Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 12/01/2018 22:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[day_date] [date] NULL,
	[Date_ID] [int] NOT NULL,
	[full_date] [nvarchar](50) NULL,
	[day_number] [int] NULL,
	[day_name] [nvarchar](50) NULL,
	[day_name_short] [nvarchar](50) NULL,
	[is_week_day] [nvarchar](50) NULL,
	[week_number] [int] NULL,
	[month_number] [int] NULL,
	[month_name] [nvarchar](50) NULL,
	[month_name_short] [nvarchar](50) NULL,
	[quarter_number] [int] NULL,
	[year] [int] NULL,
 CONSTRAINT [PK_Dim_Date_1] PRIMARY KEY CLUSTERED 
(
	[Date_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Location]    Script Date: 12/01/2018 22:39:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Location](
	[TownID] [int] NOT NULL,
	[Region] [nvarchar](50) NULL,
	[Continent] [nvarchar](50) NULL,
	[Subregion] [nvarchar](50) NULL,
	[NationName] [nvarchar](60) NULL,
	[SalesTerritory] [nvarchar](50) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[TownName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Location] PRIMARY KEY CLUSTERED 
(
	[TownID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Product]    Script Date: 12/01/2018 22:39:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Product](
	[SK_Dim_Product] [int] IDENTITY(1,1) NOT NULL,
	[StockItemID] [int] NOT NULL,
	[StockMacroGroup] [bit] NULL,
	[StockItemName] [nvarchar](100) NULL,
	[PackageTypeName] [nvarchar](50) NULL,
	[Barcode] [nvarchar](50) NULL,
	[Brand] [nvarchar](50) NULL,
	[Size] [nvarchar](20) NULL,
	[ProductStartDate] [datetime2](7) NULL,
	[ProductEndDate] [datetime2](7) NULL,
	[LastCostPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Dim_Product] PRIMARY KEY CLUSTERED 
(
	[SK_Dim_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Staff]    Script Date: 12/01/2018 22:39:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Staff](
	[SK_Dim_Staff] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[IsEmployee] [bit] NULL,
	[IsSalesPerson] [bit] NULL,
	[IsMultilingual] [bit] NULL,
	[FullName] [nvarchar](50) NULL,
	[OtherLanguages] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[StaffStartDate] [datetime2](7) NULL,
	[StaffEndDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Dim_Staff] PRIMARY KEY CLUSTERED 
(
	[SK_Dim_Staff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Errors_Log]    Script Date: 12/01/2018 22:39:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Errors_Log](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[ETLName] [nvarchar](50) NULL,
	[Error] [nvarchar](max) NULL,
	[Source] [nvarchar](100) NULL,
 CONSTRAINT [PK_Errors_Log] PRIMARY KEY CLUSTERED 
(
	[ErrorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ETL_Log]    Script Date: 12/01/2018 22:39:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETL_Log](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[ETLName] [nvarchar](50) NULL,
	[ETLDesc] [nvarchar](50) NULL,
 CONSTRAINT [PK_ETL_Log] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Sales]    Script Date: 12/01/2018 22:39:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Sales](
	[SK_Facts] [int] IDENTITY(1,1) NOT NULL,
	[FK_Dim_Date] [int] NOT NULL,
	[FK_Dim_Location] [int] NOT NULL,
	[FK_Dim_Customer] [int] NOT NULL,
	[FK_Dim_Staff] [int] NOT NULL,
	[FK_Dim_Product] [int] NOT NULL,
	[OrderQuantity] [int] NULL,
	[SalesQuantity] [int] NULL,
	[SalesAmount] [numeric](29, 2) NULL,
	[ProfitLossAmount] [numeric](30, 2) NULL,
	[LostSalesQuantity] [int] NULL,
	[LostSalesAmount] [numeric](29, 2) NULL,
	[BackOrderQuantity] [int] NULL,
	[BackOrderAmount] [numeric](29, 2) NULL,
 CONSTRAINT [PK_Fact_Sales] PRIMARY KEY CLUSTERED 
(
	[SK_Facts] ASC,
	[FK_Dim_Date] ASC,
	[FK_Dim_Location] ASC,
	[FK_Dim_Customer] ASC,
	[FK_Dim_Staff] ASC,
	[FK_Dim_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ETL_Log] ON 

INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1, N'ETL NAME18/12/2017 13:54:58', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (2, N'ETL NAME06/01/2018 18:27:52', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (3, N'ETL NAME06/01/2018 18:27:52', N'Incremental Load: Yes')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (4, N'ETL NAME06/01/2018 18:27:52', N'Max Order Date:2016-12-05')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (5, N'ETL NAME06/01/2018 18:28:42', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (6, N'ETL NAME06/01/2018 18:28:42', N'Max Order Date:2016-12-05')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (7, N'ETL NAME06/01/2018 18:28:42', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (8, N'ETL NAME06/01/2018 18:28:42', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (9, N'ETL NAME06/01/2018 18:38:47', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (10, N'ETL NAME06/01/2018 18:49:00', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (11, N'ETL NAME06/01/2018 18:53:30', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (12, N'ETL NAME06/01/2018 18:53:30', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (13, N'ETL NAME06/01/2018 18:53:30', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (14, N'ETL NAME06/01/2018 18:53:30', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (15, N'ETL NAME06/01/2018 18:53:30', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (16, N'ETL NAME06/01/2018 18:53:30', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (17, N'ETL NAME06/01/2018 18:53:30', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (18, N'ETL NAME06/01/2018 18:53:30', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (19, N'ETL NAME06/01/2018 18:53:30', N'Number of fact rows loaded:231412')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (20, N'ETL NAME06/01/2018 18:53:30', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (21, N'ETL NAME06/01/2018 18:56:27', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (22, N'ETL NAME06/01/2018 18:56:27', N'Incremental Load: Yes')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (23, N'ETL NAME06/01/2018 18:56:27', N'Max Order Date:2016-12-05')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (24, N'ETL NAME 07/01/2018 16:29:46', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (25, N'ETL NAME 07/01/2018 16:29:46', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (26, N'ETL NAME 07/01/2018 16:29:46', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (27, N'ETL NAME 07/01/2018 16:29:46', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (28, N'ETL NAME 07/01/2018 16:29:46', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (29, N'ETL NAME 07/01/2018 16:29:46', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (30, N'ETL NAME 07/01/2018 16:29:46', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (31, N'ETL NAME 07/01/2018 16:38:35', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (32, N'ETL NAME 07/01/2018 16:38:35', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (33, N'ETL NAME 07/01/2018 16:38:35', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (34, N'ETL NAME 07/01/2018 16:38:35', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (35, N'ETL NAME 07/01/2018 16:38:35', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (36, N'ETL NAME 07/01/2018 16:38:35', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (37, N'ETL NAME 07/01/2018 16:51:23', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (38, N'ETL NAME 07/01/2018 16:51:23', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (39, N'ETL NAME 07/01/2018 16:51:23', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (40, N'ETL NAME 07/01/2018 16:51:23', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (41, N'ETL NAME 07/01/2018 16:51:23', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (42, N'ETL NAME 07/01/2018 16:51:23', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (43, N'ETL NAME 07/01/2018 16:51:23', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (44, N'ETL NAME 07/01/2018 16:53:20', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (45, N'ETL NAME 07/01/2018 16:53:20', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (46, N'ETL NAME 07/01/2018 16:53:20', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (47, N'ETL NAME 07/01/2018 16:53:20', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (48, N'ETL NAME 07/01/2018 16:53:20', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (49, N'ETL NAME 07/01/2018 16:53:20', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (50, N'ETL NAME 07/01/2018 16:53:20', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (51, N'ETL NAME 07/01/2018 17:00:07', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (52, N'ETL NAME 07/01/2018 17:00:07', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (53, N'ETL NAME 07/01/2018 17:00:07', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (54, N'ETL NAME 07/01/2018 17:00:07', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (55, N'ETL NAME 07/01/2018 17:00:07', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (56, N'ETL NAME 07/01/2018 17:00:07', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (57, N'ETL NAME 07/01/2018 17:00:07', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (58, N'ETL NAME 07/01/2018 17:00:07', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (59, N'ETL NAME 07/01/2018 17:00:07', N'Number of fact rows loaded:231412')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (60, N'ETL NAME 07/01/2018 17:00:07', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (61, N'ETL NAME 07/01/2018 17:01:42', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (62, N'ETL NAME 07/01/2018 17:01:42', N'Max Order Date:2016-12-05')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (63, N'ETL NAME 07/01/2018 17:01:42', N'Incremental Load: Yes')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (64, N'ETL NAME 07/01/2018 17:01:42', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (65, N'ETL NAME 07/01/2018 17:01:42', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (66, N'ETL NAME 07/01/2018 17:01:42', N'Number of fact rows loaded:0')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (67, N'ETL NAME 07/01/2018 17:01:42', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (68, N'ETL NAME 07/01/2018 17:09:00', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (69, N'ETL NAME 07/01/2018 17:09:00', N'Incremental Load: Yes')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (70, N'ETL NAME 07/01/2018 17:09:00', N'Max Order Date:2016-12-05')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (71, N'ETL NAME 07/01/2018 17:09:00', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (72, N'ETL NAME 07/01/2018 17:09:00', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (73, N'ETL NAME 07/01/2018 17:09:00', N'Number of fact rows loaded:1')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (74, N'ETL NAME 07/01/2018 17:09:00', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (75, N'ETL NAME 07/01/2018 17:16:47', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (76, N'ETL NAME 07/01/2018 17:16:47', N'Max Order Date:2016-12-05')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (77, N'ETL NAME 07/01/2018 17:16:47', N'Incremental Load: Yes')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (78, N'ETL NAME 07/01/2018 17:16:47', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (79, N'ETL NAME 07/01/2018 17:16:47', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (80, N'ETL NAME 07/01/2018 17:16:47', N'Number of fact rows loaded:1')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (81, N'ETL NAME 07/01/2018 17:16:47', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (82, N'ETL NAME 07/01/2018 17:19:54', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (83, N'ETL NAME 07/01/2018 17:19:54', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (84, N'ETL NAME 07/01/2018 17:19:54', N'Max Order Date:2017-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (85, N'ETL NAME 07/01/2018 17:19:54', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (86, N'ETL NAME 07/01/2018 17:19:54', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (87, N'ETL NAME 07/01/2018 17:19:54', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (88, N'ETL NAME 07/01/2018 17:25:04', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (89, N'ETL NAME 07/01/2018 17:25:04', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (90, N'ETL NAME 07/01/2018 17:25:04', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (91, N'ETL NAME 07/01/2018 17:25:04', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (92, N'ETL NAME 07/01/2018 17:25:04', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (93, N'ETL NAME 07/01/2018 17:25:04', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (94, N'ETL NAME 07/01/2018 17:25:04', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (95, N'ETL NAME 07/01/2018 17:25:04', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (96, N'ETL NAME 07/01/2018 17:25:04', N'Number of fact rows loaded:231413')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (97, N'ETL NAME 07/01/2018 17:25:04', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (98, N'ETL NAME 07/01/2018 17:39:27', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (99, N'ETL NAME 07/01/2018 17:39:27', N'Max Order Date:2017-01-01')
GO
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (100, N'ETL NAME 07/01/2018 17:39:27', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (101, N'ETL NAME 07/01/2018 17:39:27', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (102, N'ETL NAME 07/01/2018 17:39:27', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (103, N'ETL NAME 07/01/2018 17:39:27', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (104, N'ETL NAME 07/01/2018 17:39:27', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (105, N'ETL NAME 07/01/2018 17:39:27', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (106, N'ETL NAME 07/01/2018 17:39:27', N'Number of fact rows loaded:231413')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (107, N'ETL NAME 07/01/2018 17:39:27', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (108, N'ETL NAME 07/01/2018 17:49:15', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (109, N'ETL NAME 07/01/2018 17:49:15', N'Max Order Date:2017-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (110, N'ETL NAME 07/01/2018 17:49:15', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (111, N'ETL NAME 07/01/2018 17:49:15', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (112, N'ETL NAME 07/01/2018 17:49:15', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (113, N'ETL NAME 07/01/2018 17:49:15', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (114, N'ETL NAME 07/01/2018 17:49:15', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (115, N'ETL NAME 07/01/2018 17:49:15', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (116, N'ETL NAME 07/01/2018 17:49:15', N'Number of fact rows loaded:231413')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (117, N'ETL NAME 07/01/2018 17:49:15', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (118, N'ETL NAME 07/01/2018 19:49:29', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (119, N'ETL NAME 07/01/2018 19:49:29', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (120, N'ETL NAME 07/01/2018 19:49:29', N'Max Order Date:2017-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (121, N'ETL NAME 07/01/2018 19:49:29', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (122, N'ETL NAME 07/01/2018 19:49:29', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (123, N'ETL NAME 07/01/2018 19:49:29', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (124, N'ETL NAME 07/01/2018 19:49:29', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (125, N'ETL NAME 07/01/2018 19:49:29', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (126, N'ETL NAME 07/01/2018 19:49:29', N'Number of fact rows loaded:231413')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (127, N'ETL NAME 07/01/2018 19:49:29', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (128, N'ETL NAME 08/01/2018 10:45:41', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (129, N'ETL NAME 08/01/2018 10:45:41', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (130, N'ETL NAME 08/01/2018 10:45:41', N'Max Order Date:2017-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (131, N'ETL NAME 08/01/2018 10:45:41', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (132, N'ETL NAME 08/01/2018 10:45:41', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (133, N'ETL NAME 08/01/2018 10:45:41', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (134, N'ETL NAME 08/01/2018 10:45:41', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (135, N'ETL NAME 08/01/2018 10:45:41', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (136, N'ETL NAME 08/01/2018 10:45:41', N'Number of fact rows loaded:231413')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (137, N'ETL NAME 08/01/2018 10:45:41', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (138, N'ETL NAME 08/01/2018 10:47:30', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (139, N'ETL NAME 08/01/2018 10:47:30', N'Incremental Load: Yes')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (140, N'ETL NAME 08/01/2018 10:47:30', N'Max Order Date:2017-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (141, N'ETL NAME 08/01/2018 10:47:30', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (142, N'ETL NAME 08/01/2018 10:47:30', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (143, N'ETL NAME 08/01/2018 10:47:30', N'Number of fact rows loaded:0')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (144, N'ETL NAME 08/01/2018 10:47:30', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (145, N'ETL NAME 08/01/2018 11:25:31', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (146, N'ETL NAME 08/01/2018 11:25:31', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (147, N'ETL NAME 08/01/2018 11:25:31', N'Max Order Date:2017-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (148, N'ETL NAME 08/01/2018 11:25:31', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (149, N'ETL NAME 08/01/2018 11:25:31', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (150, N'ETL NAME 08/01/2018 11:25:31', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (151, N'ETL NAME 08/01/2018 11:25:31', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (152, N'ETL NAME 08/01/2018 11:25:31', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (153, N'ETL NAME 08/01/2018 11:25:31', N'Number of fact rows loaded:231413')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (154, N'ETL NAME 08/01/2018 11:25:31', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (155, N'ETL NAME 08/01/2018 11:27:18', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (156, N'ETL NAME 08/01/2018 11:27:18', N'Max Order Date:2017-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (157, N'ETL NAME 08/01/2018 11:27:18', N'Incremental Load: Yes')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (158, N'ETL NAME 08/01/2018 11:27:18', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (159, N'ETL NAME 08/01/2018 11:27:18', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (160, N'ETL NAME 08/01/2018 11:27:18', N'Number of fact rows loaded:0')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (161, N'ETL NAME 08/01/2018 11:27:18', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (162, N'ETL NAME 08/01/2018 11:41:19', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (163, N'ETL NAME 08/01/2018 11:41:19', N'Incremental Load: Yes')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (164, N'ETL NAME 08/01/2018 11:41:19', N'Max Order Date:2017-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (165, N'ETL NAME 08/01/2018 11:41:19', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (166, N'ETL NAME 08/01/2018 11:41:19', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (167, N'ETL NAME 08/01/2018 11:41:19', N'Number of fact rows loaded:0')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (168, N'ETL NAME 08/01/2018 11:41:19', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (169, N'ETL NAME 08/01/2018 11:58:09', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (170, N'ETL NAME 08/01/2018 11:58:09', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (171, N'ETL NAME 08/01/2018 11:58:09', N'Max Order Date:2017-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (172, N'ETL NAME 08/01/2018 11:58:09', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (173, N'ETL NAME 08/01/2018 11:58:09', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (174, N'ETL NAME 08/01/2018 11:58:09', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (175, N'ETL NAME 08/01/2018 11:58:09', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (176, N'ETL NAME 08/01/2018 11:58:09', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (177, N'ETL NAME 08/01/2018 11:58:09', N'Number of fact rows loaded:231412')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (178, N'ETL NAME 08/01/2018 11:58:09', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (179, N'ETL NAME 08/01/2018 12:01:46', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (180, N'ETL NAME 08/01/2018 12:01:46', N'Max Order Date:2016-05-31')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (181, N'ETL NAME 08/01/2018 12:01:46', N'Incremental Load: Yes')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (182, N'ETL NAME 08/01/2018 12:01:46', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (183, N'ETL NAME 08/01/2018 12:01:46', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (184, N'ETL NAME 08/01/2018 12:01:46', N'Number of fact rows loaded:1')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (185, N'ETL NAME 08/01/2018 12:01:46', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (186, N'ETL NAME 08/01/2018 12:03:57', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (187, N'ETL NAME 08/01/2018 12:03:57', N'Max Order Date:2017-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (188, N'ETL NAME 08/01/2018 12:03:57', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (189, N'ETL NAME 08/01/2018 12:03:57', N'Truncate Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (190, N'ETL NAME 08/01/2018 12:03:57', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (191, N'ETL NAME 08/01/2018 12:03:57', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (192, N'ETL NAME 08/01/2018 12:03:57', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (193, N'ETL NAME 08/01/2018 12:03:57', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (194, N'ETL NAME 08/01/2018 12:03:57', N'Number of fact rows loaded:231412')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (195, N'ETL NAME 08/01/2018 12:03:57', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (196, N'ETL NAME 08/01/2018 13:24:35', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (197, N'ETL NAME 08/01/2018 13:24:35', N'Max Order Date:2016-05-31')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (198, N'ETL NAME 08/01/2018 13:24:35', N'Incremental Load: No')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (199, N'ETL NAME 08/01/2018 13:24:35', N'Truncate Facts')
GO
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (200, N'ETL NAME 08/01/2018 13:24:35', N'Max Order Date:1980-01-01')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (201, N'ETL NAME 08/01/2018 13:24:35', N'Deleted Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (202, N'ETL NAME 08/01/2018 13:24:35', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (203, N'ETL NAME 08/01/2018 13:24:35', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (204, N'ETL NAME 08/01/2018 13:24:35', N'Number of fact rows loaded:231412')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (205, N'ETL NAME 08/01/2018 13:24:35', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (206, N'ETL NAME 08/01/2018 13:28:00', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (207, N'ETL NAME 08/01/2018 13:28:00', N'Incremental Load: Yes')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (208, N'ETL NAME 08/01/2018 13:28:00', N'Max Order Date:2016-05-31')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (209, N'ETL NAME 08/01/2018 13:28:00', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (210, N'ETL NAME 08/01/2018 13:28:00', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (211, N'ETL NAME 08/01/2018 13:28:00', N'Number of fact rows loaded:0')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (212, N'ETL NAME 08/01/2018 13:28:00', N'ETL End')
SET IDENTITY_INSERT [dbo].[ETL_Log] OFF
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_Dim_Customer] FOREIGN KEY([FK_Dim_Customer])
REFERENCES [dbo].[Dim_Customer] ([SK_Customer])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_Sales_Dim_Customer]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_Dim_Date] FOREIGN KEY([FK_Dim_Date])
REFERENCES [dbo].[Dim_Date] ([Date_ID])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_Sales_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_Dim_Location] FOREIGN KEY([FK_Dim_Location])
REFERENCES [dbo].[Dim_Location] ([TownID])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_Sales_Dim_Location]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_Dim_Product] FOREIGN KEY([FK_Dim_Product])
REFERENCES [dbo].[Dim_Product] ([SK_Dim_Product])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_Sales_Dim_Product]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_Dim_Staff] FOREIGN KEY([FK_Dim_Staff])
REFERENCES [dbo].[Dim_Staff] ([SK_Dim_Staff])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_Sales_Dim_Staff]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Dimension populated from the Selling System' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Customer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location Dimension populated from the Applicational System' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Dimension populated from the Warehousing System' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Product'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Staff Dimension populated from the Applicational System' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Staff'
GO
USE [master]
GO
ALTER DATABASE [Group12_STAGING.bak] SET  READ_WRITE 
GO
