USE [master]
GO

/****** Object:  Database [SimpleBank]    Script Date: 12/28/2015 8:02:47 PM ******/
CREATE DATABASE [SimpleBank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SimpleBank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SimpleBank.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SimpleBank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SimpleBank_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [SimpleBank] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SimpleBank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [SimpleBank] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [SimpleBank] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [SimpleBank] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [SimpleBank] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [SimpleBank] SET ARITHABORT OFF 
GO

ALTER DATABASE [SimpleBank] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [SimpleBank] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [SimpleBank] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [SimpleBank] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [SimpleBank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [SimpleBank] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [SimpleBank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [SimpleBank] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [SimpleBank] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [SimpleBank] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [SimpleBank] SET  ENABLE_BROKER 
GO

ALTER DATABASE [SimpleBank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [SimpleBank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [SimpleBank] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [SimpleBank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [SimpleBank] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [SimpleBank] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [SimpleBank] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [SimpleBank] SET RECOVERY FULL 
GO

ALTER DATABASE [SimpleBank] SET  MULTI_USER 
GO

ALTER DATABASE [SimpleBank] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [SimpleBank] SET DB_CHAINING OFF 
GO

ALTER DATABASE [SimpleBank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [SimpleBank] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [SimpleBank] SET  READ_WRITE 
GO


USE [SimpleBank]
GO

/****** Object:  Table [dbo].[BankAccount]    Script Date: 12/28/2015 8:00:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BankAccount](
	[UserName] [nvarchar](50) NOT NULL,
	[AcNumber] [numeric](15, 0) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[Mobile] [numeric](10, 0) NULL,
	[Email] [nvarchar](200) NULL,
	[CreatedDateTime] [datetime] NULL,
	[AccountType] [numeric](2, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [SimpleBank]
GO

/****** Object:  Table [dbo].[TransactionDetails]    Script Date: 12/28/2015 8:02:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TransactionDetails](
	[TransactionId] [numeric](15, 0) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[TransactionMode] [numeric](2, 0) NOT NULL,
	[Amount] [numeric](15, 2) NOT NULL,
	[DepositorName] [nvarchar](100) NULL,
	[TransactionDateTime] [datetime] NULL,
	[TransferFromUserName] [nvarchar](50) NULL,
	[TransferToUserName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[TransactionDetails]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[BankAccount] ([UserName])
GO




