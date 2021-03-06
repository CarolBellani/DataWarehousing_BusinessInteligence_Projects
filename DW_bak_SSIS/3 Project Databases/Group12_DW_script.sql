USE [master]
GO
/****** Object:  Database [Group12_DW.bak]    Script Date: 10/01/2018 20:14:29 ******/
CREATE DATABASE [Group12_DW.bak]
GO
ALTER DATABASE [Group12_DW.bak] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Group12_DW.bak].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Group12_DW.bak] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET ARITHABORT OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Group12_DW.bak] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Group12_DW.bak] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Group12_DW.bak] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Group12_DW.bak] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET RECOVERY FULL 
GO
ALTER DATABASE [Group12_DW.bak] SET  MULTI_USER 
GO
ALTER DATABASE [Group12_DW.bak] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Group12_DW.bak] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Group12_DW.bak] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Group12_DW.bak] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Group12_DW.bak] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Group12_DW.bak', N'ON'
GO
ALTER DATABASE [Group12_DW.bak] SET QUERY_STORE = OFF
GO
USE [Group12_DW.bak]
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
USE [Group12_DW.bak]
GO
/****** Object:  Table [dbo].[Dim_Customer]    Script Date: 10/01/2018 20:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Customer](
	[SK_Customer] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ClientVIPCategory] [nvarchar](50) NULL,
	[ClientCategoryName] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](100) NULL,
	[DeliveryPostalCode] [nvarchar](10) NULL,
	[DeliveryAddressLine1] [nvarchar](60) NULL,
	[DeliveryAddressLine2] [nvarchar](60) NULL,
	[CustomerStartDate] [datetime2](7) NULL,
	[CustomerEndDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Dim_Customer_1] PRIMARY KEY CLUSTERED 
(
	[SK_Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 10/01/2018 20:14:31 ******/
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
/****** Object:  Table [dbo].[Dim_Location]    Script Date: 10/01/2018 20:14:31 ******/
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
/****** Object:  Table [dbo].[Dim_Product]    Script Date: 10/01/2018 20:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Product](
	[SK_Product] [int] NOT NULL,
	[StockMacroGroup] [nvarchar](50) NULL,
	[StockItemName] [nvarchar](100) NULL,
	[PackageTypeName] [nvarchar](50) NULL,
	[Brand] [nvarchar](50) NULL,
	[Size] [nvarchar](20) NULL,
	[ProductStartDate] [datetime2](7) NULL,
	[ProductEndDate] [datetime2](7) NULL,
	[LastCostPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Dim_Product_1] PRIMARY KEY CLUSTERED 
(
	[SK_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Staff]    Script Date: 10/01/2018 20:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Staff](
	[SK_Staff] [int] NOT NULL,
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
	[SK_Staff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Errors_Log]    Script Date: 10/01/2018 20:14:31 ******/
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
/****** Object:  Table [dbo].[ETL_Log]    Script Date: 10/01/2018 20:14:31 ******/
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
/****** Object:  Table [dbo].[Fact_Sales]    Script Date: 10/01/2018 20:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Sales](
	[FK_Dim_Date] [int] NOT NULL,
	[FK_Dim_Location] [int] NOT NULL,
	[FK_Dim_Customer] [int] NOT NULL,
	[FK_Dim_Staff] [int] NOT NULL,
	[FK_Dim_Product] [int] NOT NULL,
	[OrderQuantity] [int] NOT NULL,
	[SalesQuantity] [int] NULL,
	[SalesAmount] [numeric](29, 2) NULL,
	[ProfitLossAmount] [numeric](30, 2) NULL,
	[LostSalesQuantity] [int] NULL,
	[LostSalesAmount] [numeric](29, 2) NULL,
	[BackOrderQuantity] [int] NULL,
	[BackOrderAmount] [numeric](29, 2) NULL,
 CONSTRAINT [PK_Fact_Sales_1] PRIMARY KEY CLUSTERED 
(
	[FK_Dim_Date] ASC,
	[FK_Dim_Location] ASC,
	[FK_Dim_Customer] ASC,
	[FK_Dim_Staff] ASC,
	[FK_Dim_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ETL_Log] ON 

INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1, N'ETL ID:18/12/2017 13:12:50', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (2, N'ETL ID:07/01/2018 19:51:58', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (3, N'ETL ID:07/01/2018 19:51:58', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (4, N'ETL ID:07/01/2018 19:51:58', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (5, N'ETL ID:07/01/2018 19:51:58', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1004, N'ETL ID:08/01/2018 11:28:50', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1005, N'ETL ID:08/01/2018 11:28:50', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1006, N'ETL ID:08/01/2018 11:28:50', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1007, N'ETL ID:08/01/2018 11:28:50', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1008, N'ETL ID:08/01/2018 13:09:01', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1009, N'ETL ID:08/01/2018 13:09:01', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1010, N'ETL ID:08/01/2018 13:09:01', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1011, N'ETL ID:08/01/2018 13:09:01', N'ETL End')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1012, N'ETL ID:08/01/2018 13:30:29', N'ETL STARTED')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1013, N'ETL ID:08/01/2018 13:30:29', N'Loaded Dimensions')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1014, N'ETL ID:08/01/2018 13:30:29', N'Loaded Facts')
INSERT [dbo].[ETL_Log] ([LogID], [ETLName], [ETLDesc]) VALUES (1015, N'ETL ID:08/01/2018 13:30:29', N'ETL End')
SET IDENTITY_INSERT [dbo].[ETL_Log] OFF
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_Dim_Customer] FOREIGN KEY([FK_Dim_Customer])
REFERENCES [dbo].[Dim_Customer] ([SK_Customer])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_Sales_Dim_Customer]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_Dim_Date1] FOREIGN KEY([FK_Dim_Date])
REFERENCES [dbo].[Dim_Date] ([Date_ID])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_Sales_Dim_Date1]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_Dim_Location1] FOREIGN KEY([FK_Dim_Location])
REFERENCES [dbo].[Dim_Location] ([TownID])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_Sales_Dim_Location1]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_Dim_Product] FOREIGN KEY([FK_Dim_Product])
REFERENCES [dbo].[Dim_Product] ([SK_Product])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK_Fact_Sales_Dim_Product]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Sales_Dim_Staff] FOREIGN KEY([FK_Dim_Staff])
REFERENCES [dbo].[Dim_Staff] ([SK_Staff])
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
ALTER DATABASE [Group12_DW.bak] SET  READ_WRITE 
GO
