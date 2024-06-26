USE [master]
GO
/****** Object:  Database [FPT_Attended]    Script Date: 10/30/2023 6:11:25 AM ******/
CREATE DATABASE [FPT_Attended]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPT_Attended', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FPT_Attended.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPT_Attended_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FPT_Attended_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FPT_Attended] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPT_Attended].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPT_Attended] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPT_Attended] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPT_Attended] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPT_Attended] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPT_Attended] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPT_Attended] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FPT_Attended] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPT_Attended] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPT_Attended] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPT_Attended] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPT_Attended] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPT_Attended] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPT_Attended] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPT_Attended] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPT_Attended] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FPT_Attended] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPT_Attended] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPT_Attended] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPT_Attended] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPT_Attended] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPT_Attended] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPT_Attended] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPT_Attended] SET RECOVERY FULL 
GO
ALTER DATABASE [FPT_Attended] SET  MULTI_USER 
GO
ALTER DATABASE [FPT_Attended] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPT_Attended] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPT_Attended] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPT_Attended] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPT_Attended] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FPT_Attended] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FPT_Attended', N'ON'
GO
ALTER DATABASE [FPT_Attended] SET QUERY_STORE = OFF
GO
USE [FPT_Attended]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/30/2023 6:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[isTeacher] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Class]    Script Date: 10/30/2023 6:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Class](
	[CourseID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_Account_Class] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[AccountID] ASC,
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attended]    Script Date: 10/30/2023 6:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attended](
	[roomid] [int] NOT NULL,
	[slotid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[studentid] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Attended] PRIMARY KEY CLUSTERED 
(
	[roomid] ASC,
	[slotid] ASC,
	[date] ASC,
	[studentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 10/30/2023 6:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/30/2023 6:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 10/30/2023 6:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 10/30/2023 6:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[roomid] [int] NOT NULL,
	[slotid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[courseid] [int] NOT NULL,
	[teacherId] [int] NOT NULL,
	[classID] [int] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[roomid] ASC,
	[slotid] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 10/30/2023 6:11:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password], [isTeacher]) VALUES (1, N'student', N'123', 0)
INSERT [dbo].[Account] ([id], [username], [password], [isTeacher]) VALUES (2, N'teacher', N'123', 1)
INSERT [dbo].[Account] ([id], [username], [password], [isTeacher]) VALUES (3, N'user', N'123', 0)
INSERT [dbo].[Account] ([id], [username], [password], [isTeacher]) VALUES (4, N'user1', N'123', 0)
INSERT [dbo].[Account] ([id], [username], [password], [isTeacher]) VALUES (5, N'teacher1', N'123', 1)
INSERT [dbo].[Account] ([id], [username], [password], [isTeacher]) VALUES (6, N'abc', N'123', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Account_Class] ([CourseID], [AccountID], [ClassID]) VALUES (1, 1, 1)
INSERT [dbo].[Account_Class] ([CourseID], [AccountID], [ClassID]) VALUES (1, 3, 1)
INSERT [dbo].[Account_Class] ([CourseID], [AccountID], [ClassID]) VALUES (1, 4, 2)
INSERT [dbo].[Account_Class] ([CourseID], [AccountID], [ClassID]) VALUES (2, 3, 2)
INSERT [dbo].[Account_Class] ([CourseID], [AccountID], [ClassID]) VALUES (2, 4, 2)
INSERT [dbo].[Account_Class] ([CourseID], [AccountID], [ClassID]) VALUES (3, 6, 4)
GO
INSERT [dbo].[Attended] ([roomid], [slotid], [date], [studentid], [status]) VALUES (1, 1, CAST(N'2023-07-04' AS Date), 1, 0)
INSERT [dbo].[Attended] ([roomid], [slotid], [date], [studentid], [status]) VALUES (2, 1, CAST(N'2023-07-04' AS Date), 1, 0)
INSERT [dbo].[Attended] ([roomid], [slotid], [date], [studentid], [status]) VALUES (2, 1, CAST(N'2023-07-04' AS Date), 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([id], [name]) VALUES (1, N'SE001')
INSERT [dbo].[Class] ([id], [name]) VALUES (2, N'S002')
INSERT [dbo].[Class] ([id], [name]) VALUES (3, N'Bl5-M01')
INSERT [dbo].[Class] ([id], [name]) VALUES (4, N'Bl5-M02')
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([id], [name]) VALUES (1, N'PRO192')
INSERT [dbo].[Course] ([id], [name]) VALUES (2, N'PRF192')
INSERT [dbo].[Course] ([id], [name]) VALUES (3, N'PRJ301')
INSERT [dbo].[Course] ([id], [name]) VALUES (4, N'SWP391')
INSERT [dbo].[Course] ([id], [name]) VALUES (5, N'WED201c')
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([id], [name]) VALUES (1, N'DE207')
INSERT [dbo].[Room] ([id], [name]) VALUES (2, N'BE101')
INSERT [dbo].[Room] ([id], [name]) VALUES (3, N'BE201')
INSERT [dbo].[Room] ([id], [name]) VALUES (4, N'DE303')
INSERT [dbo].[Room] ([id], [name]) VALUES (5, N'DE307')
INSERT [dbo].[Room] ([id], [name]) VALUES (6, N'AL-502R')
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
INSERT [dbo].[Session] ([roomid], [slotid], [date], [courseid], [teacherId], [classID]) VALUES (1, 1, CAST(N'2023-07-04' AS Date), 1, 2, 1)
INSERT [dbo].[Session] ([roomid], [slotid], [date], [courseid], [teacherId], [classID]) VALUES (1, 1, CAST(N'2023-08-07' AS Date), 3, 5, 3)
INSERT [dbo].[Session] ([roomid], [slotid], [date], [courseid], [teacherId], [classID]) VALUES (1, 1, CAST(N'2023-08-08' AS Date), 3, 5, 3)
INSERT [dbo].[Session] ([roomid], [slotid], [date], [courseid], [teacherId], [classID]) VALUES (1, 1, CAST(N'2023-08-09' AS Date), 3, 5, 3)
INSERT [dbo].[Session] ([roomid], [slotid], [date], [courseid], [teacherId], [classID]) VALUES (1, 1, CAST(N'2023-08-10' AS Date), 3, 5, 3)
INSERT [dbo].[Session] ([roomid], [slotid], [date], [courseid], [teacherId], [classID]) VALUES (2, 1, CAST(N'2023-07-04' AS Date), 1, 5, 1)
INSERT [dbo].[Session] ([roomid], [slotid], [date], [courseid], [teacherId], [classID]) VALUES (2, 3, CAST(N'2023-08-09' AS Date), 3, 2, 4)
INSERT [dbo].[Session] ([roomid], [slotid], [date], [courseid], [teacherId], [classID]) VALUES (2, 4, CAST(N'2023-08-07' AS Date), 3, 2, 4)
INSERT [dbo].[Session] ([roomid], [slotid], [date], [courseid], [teacherId], [classID]) VALUES (2, 4, CAST(N'2023-08-08' AS Date), 3, 2, 4)
INSERT [dbo].[Session] ([roomid], [slotid], [date], [courseid], [teacherId], [classID]) VALUES (2, 4, CAST(N'2023-08-09' AS Date), 3, 2, 4)
INSERT [dbo].[Session] ([roomid], [slotid], [date], [courseid], [teacherId], [classID]) VALUES (3, 1, CAST(N'2023-05-06' AS Date), 1, 2, 2)
INSERT [dbo].[Session] ([roomid], [slotid], [date], [courseid], [teacherId], [classID]) VALUES (4, 3, CAST(N'2023-10-10' AS Date), 3, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Slot] ON 

INSERT [dbo].[Slot] ([id], [name]) VALUES (1, N'Slot 1')
INSERT [dbo].[Slot] ([id], [name]) VALUES (2, N'Slot 2')
INSERT [dbo].[Slot] ([id], [name]) VALUES (3, N'Slot 3')
INSERT [dbo].[Slot] ([id], [name]) VALUES (4, N'Slot 4')
INSERT [dbo].[Slot] ([id], [name]) VALUES (5, N'Slot 5')
INSERT [dbo].[Slot] ([id], [name]) VALUES (6, N'Slot 6')
INSERT [dbo].[Slot] ([id], [name]) VALUES (7, N'Slot 7')
INSERT [dbo].[Slot] ([id], [name]) VALUES (8, N'Slot 8')
INSERT [dbo].[Slot] ([id], [name]) VALUES (9, N'Slot 9')
SET IDENTITY_INSERT [dbo].[Slot] OFF
GO
ALTER TABLE [dbo].[Account_Class]  WITH CHECK ADD  CONSTRAINT [FK_Account_Class_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Account_Class] CHECK CONSTRAINT [FK_Account_Class_Account]
GO
ALTER TABLE [dbo].[Account_Class]  WITH CHECK ADD  CONSTRAINT [FK_Account_Class_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([id])
GO
ALTER TABLE [dbo].[Account_Class] CHECK CONSTRAINT [FK_Account_Class_Class]
GO
ALTER TABLE [dbo].[Account_Class]  WITH CHECK ADD  CONSTRAINT [FK_Account_Class_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Account_Class] CHECK CONSTRAINT [FK_Account_Class_Course]
GO
ALTER TABLE [dbo].[Attended]  WITH CHECK ADD  CONSTRAINT [FK_Attended_Account] FOREIGN KEY([studentid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Attended] CHECK CONSTRAINT [FK_Attended_Account]
GO
ALTER TABLE [dbo].[Attended]  WITH CHECK ADD  CONSTRAINT [FK_Attended_Session] FOREIGN KEY([roomid], [slotid], [date])
REFERENCES [dbo].[Session] ([roomid], [slotid], [date])
GO
ALTER TABLE [dbo].[Attended] CHECK CONSTRAINT [FK_Attended_Session]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Account] FOREIGN KEY([teacherId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Account]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Class] FOREIGN KEY([classID])
REFERENCES [dbo].[Class] ([id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Class]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Course] FOREIGN KEY([courseid])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Course]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Room] FOREIGN KEY([roomid])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Slot] FOREIGN KEY([slotid])
REFERENCES [dbo].[Slot] ([id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Slot]
GO
USE [master]
GO
ALTER DATABASE [FPT_Attended] SET  READ_WRITE 
GO
