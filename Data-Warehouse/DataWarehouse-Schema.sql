USE [master]
GO
CREATE DATABASE [SakilaDW]

USE [SakilaDW]
GO

CREATE TABLE [dbo].[DimCustomer](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[FirstName] [varchar](45) NOT NULL,
	[LastName] [varchar](45) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[LocationKey] [int] NOT NULL,
	[IsCurrent] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 21/10/2024 11:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDate] [date] NOT NULL,
	[Year] [int] NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[MonthNumber] [tinyint] NOT NULL,
	[MonthName] [nvarchar](20) NOT NULL,
	[WeekOfYear] [smallint] NOT NULL,
	[DayOfMonth] [tinyint] NOT NULL,
	[DayOfWeek] [tinyint] NOT NULL,
	[DayName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimFilm]    Script Date: 21/10/2024 11:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimFilm](
	[FilmKey] [int] IDENTITY(1,1) NOT NULL,
	[FilmId] [int] NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[ReleaseYear] [varchar](4) NOT NULL,
	[LanguageName] [varchar](20) NOT NULL,
	[RentalDuration] [tinyint] NOT NULL,
	[RentalRate] [numeric](4, 2) NOT NULL,
	[Length] [smallint] NOT NULL,
	[ReplacementCost] [numeric](5, 2) NOT NULL,
	[Rating] [varchar](10) NOT NULL,
	[SpecialFeatures] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FilmKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLocation]    Script Date: 21/10/2024 11:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocation](
	[LocationKey] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
	[AddressLine] [varchar](50) NOT NULL,
	[PostalCode] [varchar](10) NULL,
	[AddressId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStaff]    Script Date: 21/10/2024 11:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStaff](
	[StaffKey] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [tinyint] NOT NULL,
	[FirstName] [varchar](45) NOT NULL,
	[LastName] [varchar](45) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[LocationKey] [int] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[Username] [varchar](16) NOT NULL,
	[Password] [varchar](40) NOT NULL,
	[IsCurrent] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStore]    Script Date: 21/10/2024 11:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStore](
	[StoreKey] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[LocationKey] [int] NOT NULL,
	[ManagerFirstName] [varchar](45) NOT NULL,
	[ManagerLastName] [varchar](45) NOT NULL,
	[ManagerEmail] [varchar](50) NOT NULL,
	[IsCurrent] [bit] NOT NULL,
 CONSTRAINT [PK__DimStore__ADC1E1ADCDFD6854] PRIMARY KEY CLUSTERED 
(
	[StoreKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactRental]    Script Date: 21/10/2024 11:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactRental](
	[RentalKey] [int] IDENTITY(1,1) NOT NULL,
	[RentalId] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[Amount] [numeric](5, 2) NOT NULL,
	[PaymentDateKey] [int] NOT NULL,
	[RentalDateKey] [int] NOT NULL,
	[ReturnDateKey] [int] NULL,
	[FilmKey] [int] NOT NULL,
	[StaffKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RentalKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimCustomer] ADD  DEFAULT ((1)) FOR [IsCurrent]
GO
ALTER TABLE [dbo].[DimStaff] ADD  DEFAULT ((1)) FOR [IsCurrent]
GO
ALTER TABLE [dbo].[DimStore] ADD  CONSTRAINT [DF__DimStore__IsCurr__3B75D760]  DEFAULT ((1)) FOR [IsCurrent]
GO
ALTER TABLE [dbo].[DimCustomer]  WITH CHECK ADD FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
ALTER TABLE [dbo].[DimCustomer]  WITH CHECK ADD FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStore] ([StoreKey])
GO
ALTER TABLE [dbo].[DimStaff]  WITH CHECK ADD FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStore] ([StoreKey])
GO
ALTER TABLE [dbo].[DimStaff]  WITH CHECK ADD FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
ALTER TABLE [dbo].[DimStore]  WITH CHECK ADD  CONSTRAINT [FK__DimStore__Locati__3C69FB99] FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
ALTER TABLE [dbo].[DimStore] CHECK CONSTRAINT [FK__DimStore__Locati__3C69FB99]
GO
ALTER TABLE [dbo].[FactRental]  WITH CHECK ADD FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[DimCustomer] ([CustomerKey])
GO
ALTER TABLE [dbo].[FactRental]  WITH CHECK ADD FOREIGN KEY([FilmKey])
REFERENCES [dbo].[DimFilm] ([FilmKey])
GO
ALTER TABLE [dbo].[FactRental]  WITH CHECK ADD FOREIGN KEY([PaymentDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactRental]  WITH CHECK ADD FOREIGN KEY([RentalDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactRental]  WITH CHECK ADD FOREIGN KEY([ReturnDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactRental]  WITH CHECK ADD FOREIGN KEY([StaffKey])
REFERENCES [dbo].[DimStaff] ([StaffKey])
GO
USE [master]
GO
ALTER DATABASE [SakilaDW] SET  READ_WRITE 
GO
