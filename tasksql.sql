USE [master]
GO
/****** Object:  Database [MessagesDB]    Script Date: 9/17/2017 11:34:06 AM ******/
CREATE DATABASE [MessagesDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MessagesDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.USAF\MSSQL\DATA\MessagesDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MessagesDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.USAF\MSSQL\DATA\MessagesDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MessagesDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MessagesDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MessagesDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MessagesDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MessagesDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MessagesDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MessagesDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MessagesDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MessagesDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MessagesDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MessagesDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MessagesDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MessagesDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MessagesDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MessagesDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MessagesDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MessagesDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MessagesDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MessagesDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MessagesDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MessagesDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MessagesDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MessagesDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MessagesDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MessagesDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MessagesDB] SET  MULTI_USER 
GO
ALTER DATABASE [MessagesDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MessagesDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MessagesDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MessagesDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MessagesDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MessagesDB]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 9/17/2017 11:34:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](160) NOT NULL,
	[SendDate] [date] NOT NULL,
	[SendTime] [time](7) NOT NULL,
	[UserFile] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[AddMessages]    Script Date: 9/17/2017 11:34:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddMessages]  
(  
   @Message nvarchar (160),  
   @SendDate date,  
   @SendTime time,  
   @UserFile nvarchar (50)  
)  
as  
begin  
   Insert into Messages values(@Message,@SendDate,@SendTime,@UserFile)  
End
GO
/****** Object:  StoredProcedure [dbo].[GetMessages]    Script Date: 9/17/2017 11:34:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetMessages]  
as  
begin  
   select * from Messages;
End
GO
/****** Object:  StoredProcedure [dbo].[MessageCount]    Script Date: 9/17/2017 11:34:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[MessageCount]  
(  
   @Message nvarchar(160),
   @SendDate date  
)  
as   
begin  
   select count(id) from dbo.Messages
    where 
	Message=@Message
  AND SendDate=@SendDate
End
GO
USE [master]
GO
ALTER DATABASE [MessagesDB] SET  READ_WRITE 
GO
