create database zadanielaverna
USE [zadanielaverna]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 09.07.2025 21:59:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 09.07.2025 21:59:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fio] [nvarchar](255) NOT NULL,
	[Salary] [decimal](10, 2) NOT NULL,
	[Age] [int] NULL,
	[Phone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 09.07.2025 21:59:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Volume] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sells]    Script Date: 09.07.2025 21:59:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sells](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Manag] [int] NULL,
	[ID_Prod] [int] NULL,
	[Count] [int] NOT NULL,
	[Sum] [decimal](10, 2) NOT NULL,
	[Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sells]  WITH CHECK ADD FOREIGN KEY([ID_Manag])
REFERENCES [dbo].[Managers] ([ID])
GO
ALTER TABLE [dbo].[Sells]  WITH CHECK ADD FOREIGN KEY([ID_Prod])
REFERENCES [dbo].[Products] ([ID])
GO
