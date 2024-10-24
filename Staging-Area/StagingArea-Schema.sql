USE [master]
GO

CREATE DATABASE [SakilaSA]

USE [SakilaSA]
GO

CREATE TABLE [dbo].[CustomerSA](
	[CustomerId] [int] NOT NULL,
	[StoreId] [int] NULL,
	[FirstName] [varchar](45) NULL,
	[LastName] [varchar](45) NULL,
	[Email] [varchar](50) NULL,
	[AddressId] [int] NULL,
	[Active] [varchar](1) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmSA]    Script Date: 21/10/2024 11:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmSA](
	[FilmId] [int] NOT NULL,
	[Title] [varchar](255) NULL,
	[Description] [varchar](max) NULL,
	[ReleaseYear] [varchar](4) NULL,
	[LanguageName] [varchar](20) NULL,
	[RentalDuration] [tinyint] NULL,
	[RentalRate] [numeric](4, 2) NULL,
	[Length] [smallint] NULL,
	[ReplacementCost] [numeric](5, 2) NULL,
	[Rating] [varchar](10) NULL,
	[SpecialFeatures] [varchar](255) NULL,
	[LastUpdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FilmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationSA]    Script Date: 21/10/2024 11:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationSA](
	[CountryName] [varchar](50) NULL,
	[CityName] [varchar](50) NULL,
	[AddressLine] [varchar](50) NULL,
	[PostalCode] [varchar](10) NULL,
	[AddressId] [int] NOT NULL,
	[LastUpdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalSA]    Script Date: 21/10/2024 11:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalSA](
	[CustomerId] [int] NULL,
	[StaffId] [tinyint] NULL,
	[RentalId] [int] NOT NULL,
	[Amount] [numeric](5, 2) NULL,
	[PaymentDate] [datetime] NULL,
	[RentalDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL,
	[FilmId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RentalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffSA]    Script Date: 21/10/2024 11:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffSA](
	[StaffId] [tinyint] NOT NULL,
	[FirstName] [varchar](45) NULL,
	[LastName] [varchar](45) NULL,
	[AddressId] [int] NULL,
	[Picture] [varbinary](max) NULL,
	[Email] [varchar](50) NULL,
	[StoreId] [int] NULL,
	[Active] [bit] NULL,
	[Username] [varchar](16) NULL,
	[Password] [varchar](40) NULL,
	[LastUpdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreSA]    Script Date: 21/10/2024 11:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreSA](
	[StoreId] [int] NOT NULL,
	[AddressId] [int] NULL,
	[ManagerFirstName] [varchar](45) NULL,
	[ManagerLastName] [varchar](45) NULL,
	[ManagerEmail] [varchar](50) NULL,
	[StoreLastUpdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [SakilaSA] SET  READ_WRITE 
GO
