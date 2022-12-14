USE [master]
GO
/****** Object:  Database [Social_Network]    Script Date: 11/8/2022 10:59:12 AM ******/
CREATE DATABASE [Social_Network]
GO
ALTER DATABASE [Social_Network] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Social_Network].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Social_Network] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Social_Network] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Social_Network] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Social_Network] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Social_Network] SET ARITHABORT OFF 
GO
ALTER DATABASE [Social_Network] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Social_Network] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Social_Network] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Social_Network] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Social_Network] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Social_Network] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Social_Network] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Social_Network] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Social_Network] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Social_Network] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Social_Network] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Social_Network] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Social_Network] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Social_Network] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Social_Network] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Social_Network] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Social_Network] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Social_Network] SET RECOVERY FULL 
GO
ALTER DATABASE [Social_Network] SET  MULTI_USER 
GO
ALTER DATABASE [Social_Network] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Social_Network] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Social_Network] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Social_Network] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Social_Network] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Social_Network] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Social_Network', N'ON'
GO
ALTER DATABASE [Social_Network] SET QUERY_STORE = OFF
GO
USE [Social_Network]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 11/8/2022 10:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[commentId] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](500) NULL,
	[userId] [int] NULL,
	[postId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friend_Requests]    Script Date: 11/8/2022 10:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friend_Requests](
	[friend_requests_id] [int] IDENTITY(1,1) NOT NULL,
	[user_request_id] [int] NULL,
	[user_be_request_id] [int] NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[friend_requests_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 11/8/2022 10:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[groupId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NULL,
	[userId] [int] NULL,
	[avatar_path] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[groupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JoinGroup]    Script Date: 11/8/2022 10:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoinGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[memberId] [int] NULL,
	[group_id] [int] NULL,
	[status] [varchar](15) NULL,
	[dateJoin] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Like_Comments]    Script Date: 11/8/2022 10:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like_Comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[post_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessagesUser]    Script Date: 11/8/2022 10:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessagesUser](
	[messageId] [int] IDENTITY(1,1) NOT NULL,
	[messageContent] [varchar](1000) NULL,
	[user_send_id] [int] NULL,
	[user_receive_id] [int] NULL,
	[date_created] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[messageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nofications]    Script Date: 11/8/2022 10:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nofications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[postId] [int] NULL,
	[userId] [int] NULL,
	[message] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostGroup]    Script Date: 11/8/2022 10:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[groupId] [int] NULL,
	[postId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 11/8/2022 10:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[postId] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](2000) NULL,
	[userId] [int] NULL,
	[dateCreated] [varchar](100) NULL,
	[image_path] [varchar](2000) NULL,
	[status] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[postId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/8/2022 10:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[admin] [int] NULL,
	[avatar_path] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (7, N'Hello2', 1, 14)
INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (53, N'Yeah, it should be !', 1, 14)
INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (54, N'Hey, I always be here with you.', 1, 18)
INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (56, N'Haha', 1, 18)
INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (57, N'I love you too, hehe!!', 1, 28)
INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (58, N'Second waifu xD', 1, 29)
INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (59, N'Haha, you are wibu ? I will block you !', 11, 30)
INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (61, N'My darling, hehehe', 22, 34)
INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (62, N'.', 1, 46)
INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (63, N'Hehe', 23, 52)
INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (64, N'Haha', 24, 52)
INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (65, N'Hello friends, I''m fan one piece, too hehe', 23, 33)
INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (66, N'The thi khoc di, ai bao gi dau', 23, 27)
INSERT [dbo].[Comments] ([commentId], [content], [userId], [postId]) VALUES (67, N'?', 11, 30)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Friend_Requests] ON 

INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (2, 1, 11, N'accepted')
INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (3, 15, 11, N'accepted')
INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (4, 15, 1, N'accepted')
INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (5, 19, 1, N'accepted')
INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (8, 21, 11, N'pending')
INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (9, 21, 1, N'accepted')
INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (10, 22, 1, N'accepted')
INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (11, 12, 1, N'accepted')
INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (12, 1, 23, N'accepted')
INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (13, 1, 24, N'accepted')
INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (14, 11, 24, N'accepted')
INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (16, 10, 1, N'pending')
INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (17, 25, 1, N'pending')
INSERT [dbo].[Friend_Requests] ([friend_requests_id], [user_request_id], [user_be_request_id], [status]) VALUES (18, 26, 1, N'pending')
SET IDENTITY_INSERT [dbo].[Friend_Requests] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([groupId], [name], [userId], [avatar_path]) VALUES (1, N'Hoi nhung nguoi tin T1 se vo dich 2022', 1, N'images/group-icon.png')
INSERT [dbo].[Groups] ([groupId], [name], [userId], [avatar_path]) VALUES (2, N'Hang MU', 1, N'uploads/groups/30b54999b098050158ed13a1ecdcaab0.jpg')
INSERT [dbo].[Groups] ([groupId], [name], [userId], [avatar_path]) VALUES (3, N'Hoi anh em tin trai dat hinh khung long', 1, N'uploads/groups/EehmGzNXgAISOZ8.jpg')
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[JoinGroup] ON 

INSERT [dbo].[JoinGroup] ([id], [memberId], [group_id], [status], [dateJoin]) VALUES (1, 3, 1, N'accepted', NULL)
INSERT [dbo].[JoinGroup] ([id], [memberId], [group_id], [status], [dateJoin]) VALUES (6, 12, 1, N'accepted', NULL)
INSERT [dbo].[JoinGroup] ([id], [memberId], [group_id], [status], [dateJoin]) VALUES (9, 11, 1, N'accepted', N'2022/11/08 09:10:05')
INSERT [dbo].[JoinGroup] ([id], [memberId], [group_id], [status], [dateJoin]) VALUES (10, 23, 1, N'accepted', NULL)
INSERT [dbo].[JoinGroup] ([id], [memberId], [group_id], [status], [dateJoin]) VALUES (11, 24, 1, N'accepted', NULL)
SET IDENTITY_INSERT [dbo].[JoinGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[Like_Comments] ON 

INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (1, 1, 14)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (4, 1, 18)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (8, 1, 24)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (13, 1, 25)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (15, 1, 27)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (43, 1, 30)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (23, 1, 31)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (26, 1, 34)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (30, 1, 42)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (35, 1, 53)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (36, 1, 56)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (20, 11, 14)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (9, 11, 24)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (10, 11, 25)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (18, 11, 27)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (17, 11, 28)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (39, 11, 29)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (19, 11, 30)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (21, 11, 31)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (38, 11, 33)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (29, 12, 43)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (28, 13, 42)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (24, 22, 34)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (42, 23, 29)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (41, 23, 30)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (40, 23, 33)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (31, 23, 52)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (34, 23, 55)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (33, 24, 46)
INSERT [dbo].[Like_Comments] ([id], [user_id], [post_id]) VALUES (32, 24, 52)
SET IDENTITY_INSERT [dbo].[Like_Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[MessagesUser] ON 

INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (1, N'Hello', 1, 11, N'2022/10/28 21:55:21')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (2, N'hi', 11, 1, N'2022/10/28 21:58:21')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (3, N'What do you want?', 11, 1, N'2022/10/28 21:59:21')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (4, N'I want to talk with you', 1, 11, N'2022/11/01 22:04:09')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (5, N'Are you eating?', 1, 11, N'2022/11/01 22:28:30')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (6, N'Yeah, i just ate rice, hihi!', 11, 1, N'2022/11/01 22:30:13')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (7, N'Are you eating?', 11, 1, N'2022/11/01 22:31:14')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (8, N'Yeah, me too', 1, 11, N'2022/11/01 22:32:41')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (9, N'Hmm, interesting', 11, 1, N'2022/11/01 22:32:57')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (10, N'Except food, what do you think ?', 11, 1, N'2022/11/01 22:33:07')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (11, N'I think we should go out together hehe', 1, 11, N'2022/11/01 22:41:28')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (12, N'It''s awesome, isn''t it?', 1, 11, N'2022/11/01 22:41:53')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (13, N'I don''t know xD', 11, 1, N'2022/11/01 22:42:01')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (14, N'Maybe it''s will be good ', 11, 1, N'2022/11/01 22:42:10')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (15, N'Maybe not ...', 11, 1, N'2022/11/01 22:42:15')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (16, N'Don''t be scared', 11, 1, N'2022/11/01 22:42:25')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (17, N'Yeah', 1, 11, N'2022/11/01 22:42:31')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (18, N'You should not scare', 1, 11, N'2022/11/01 22:42:36')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (19, N'...', 1, 11, N'2022/11/01 22:42:53')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (20, N'I think so', 1, 11, N'2022/11/01 22:42:57')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (21, N'Right?', 1, 11, N'2022/11/01 22:43:02')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (22, N'So ...', 1, 11, N'2022/11/01 22:45:01')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (23, N'Yeah, let''s go out <3', 11, 1, N'2022/11/01 22:45:11')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (24, N'Hey', 1, 15, N'2022/11/01 22:46:00')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (25, N'How are you, bro?', 1, 15, N'2022/11/01 22:46:09')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (26, N'Halo', 1, 22, N'2022/11/01 23:16:52')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (28, N'Ok ', 1, 11, N'2022/11/02 21:32:13')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (29, N'e', 23, 13, N'2022/11/03 09:56:58')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (30, N'Hello', 24, 1, N'2022/11/03 10:03:09')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (31, N'Hello', 1, 24, N'2022/11/03 10:03:32')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (32, N'cau bao gi the', 1, 24, N'2022/11/03 10:03:39')
INSERT [dbo].[MessagesUser] ([messageId], [messageContent], [user_send_id], [user_receive_id], [date_created]) VALUES (33, N'ko co gi', 24, 1, N'2022/11/03 10:03:48')
SET IDENTITY_INSERT [dbo].[MessagesUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Nofications] ON 

INSERT [dbo].[Nofications] ([id], [postId], [userId], [message]) VALUES (4, 33, 11, N'Like')
INSERT [dbo].[Nofications] ([id], [postId], [userId], [message]) VALUES (5, 29, 11, N'Like')
INSERT [dbo].[Nofications] ([id], [postId], [userId], [message]) VALUES (6, 33, 23, N'Comment')
INSERT [dbo].[Nofications] ([id], [postId], [userId], [message]) VALUES (7, 33, 23, N'Like')
INSERT [dbo].[Nofications] ([id], [postId], [userId], [message]) VALUES (8, 30, 23, N'Like')
INSERT [dbo].[Nofications] ([id], [postId], [userId], [message]) VALUES (9, 29, 23, N'Like')
INSERT [dbo].[Nofications] ([id], [postId], [userId], [message]) VALUES (10, 27, 23, N'Comment')
INSERT [dbo].[Nofications] ([id], [postId], [userId], [message]) VALUES (11, 30, 11, N'Comment')
INSERT [dbo].[Nofications] ([id], [postId], [userId], [message]) VALUES (12, 30, 1, N'Like')
SET IDENTITY_INSERT [dbo].[Nofications] OFF
GO
SET IDENTITY_INSERT [dbo].[PostGroup] ON 

INSERT [dbo].[PostGroup] ([id], [groupId], [postId]) VALUES (2, 1, 45)
INSERT [dbo].[PostGroup] ([id], [groupId], [postId]) VALUES (3, 1, 46)
INSERT [dbo].[PostGroup] ([id], [groupId], [postId]) VALUES (8, 1, 54)
INSERT [dbo].[PostGroup] ([id], [groupId], [postId]) VALUES (6, 2, 50)
INSERT [dbo].[PostGroup] ([id], [groupId], [postId]) VALUES (4, 3, 48)
INSERT [dbo].[PostGroup] ([id], [groupId], [postId]) VALUES (5, 3, 49)
INSERT [dbo].[PostGroup] ([id], [groupId], [postId]) VALUES (7, 3, 51)
SET IDENTITY_INSERT [dbo].[PostGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (14, N'Hello, hope you is the first post!', 1, N'2022/10/23 22:44:28', NULL, N'public')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (18, N'Hmm, everything will be ok!', 1, N'2022/10/28 21:56:21', NULL, N'private')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (24, N'Test Like', 1, N'2022/10/28 23:10:06', NULL, N'public')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (25, N'Something', 1, N'2022/10/28 23:31:41', NULL, N'private')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (26, N'<p>dsa</p>
', 1, N'2022/10/29 19:44:58', NULL, N'public')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (27, N'<p>Toi muon <span style="color:#c0392b">khoc </span>that to</p>
', 1, N'2022/10/29 19:45:16', NULL, N'public')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (28, N'<p>I love <strong>you baby</strong></p>
', 1, N'2022/10/29 20:43:01', NULL, N'public')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (29, N'<p>Hello</p>
', 1, N'2022/10/30 17:46:48', N'uploads/baal_raiden_shogun_hd_genshin_impact_7-1920x1080.jpg', N'public')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (30, N'<p>This is my waifu UwU</p>
', 1, N'2022/10/30 17:55:46', N'uploads/anime-anime-girls-long-hair-smiling-wallpaper-8b46fcada3117fc9d594bbc92dcc9c60.jpg', N'public')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (31, N'<p>My Darling&nbsp;<img alt="heart" src="http://localhost:9999/socialnetwork/libraries/ckeditor/plugins/smiley/images/heart.png" style="height:23px; width:23px" title="heart" /></p>
', 11, N'2022/10/30 18:33:18', N'uploads/04ebbe2de0592b6d99180f2d77389413.jpg', N'public')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (33, N'<p>I am fan of one piece, UwU</p>
', 1, N'2022/11/01 11:58:07', N'uploads/hd-one-piece-wallpaper-whatspaper-16.jpg', N'public')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (34, N'<p>I love sasuke haha</p>
', 22, N'2022/11/01 23:08:39', N'uploads/naruto-sasuke.jpg', N'public')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (42, N'<p>Hmm, Anyone want to play LoL ?</p>
', 13, N'2022/11/02 23:49:51', NULL, N'private')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (43, N'<p>Test something</p>
', 12, N'2022/11/02 23:58:25', NULL, N'private')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (44, N'Hello Everyone', 13, N'2022/11/03 06:13:52', NULL, N'private')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (45, N'<p>Faker will be have 5th cup hehe</p>
', 1, N'2022/11/03 06:16:52', N'uploads/groups/396f586db22a4638a56209bdaf9f3e89.jpg', N'group')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (46, N'<p>Loc mem nha anh em!!</p>
', 1, N'2022/11/03 06:27:16', NULL, N'group')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (48, N'<p>Bao trai dat hinh khung long nhung khong ai tin :(</p>
', 1, N'2022/11/03 06:59:41', N'uploads/DuoS2uSXgAAjWqp.jpg', N'group')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (49, N'<p>test</p>
', 1, N'2022/11/03 07:00:55', NULL, N'group')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (50, N'<p>Sao trong nay toi the</p>
', 1, N'2022/11/03 07:03:27', NULL, N'group')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (51, N'<p>test2</p>
', 1, N'2022/11/03 07:07:44', NULL, N'group')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (52, N'<p>I am fan of Manchester United !!</p>
', 23, N'2022/11/03 09:54:47', NULL, N'public')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (53, N'<p>Hello</p>
', 24, N'2022/11/03 10:02:36', N'uploads/04ebbe2de0592b6d99180f2d77389413.jpg', N'public')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (54, N'<p>Hello</p>
', 24, N'2022/11/03 10:12:48', NULL, N'group')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (55, N'<p>Glory Glory Man United</p>
', 23, N'2022/11/03 11:18:45', N'uploads/tieu-su-harry-maguire-trung-ve-dat-gia-nhat-the-gioi-20221031210318.jpg', N'public')
INSERT [dbo].[Posts] ([postId], [content], [userId], [dateCreated], [image_path], [status]) VALUES (56, N'<p>hehe</p>
', 26, N'2022/11/07 21:59:54', N'uploads/aventador-svj-roadster-vov.jpg', N'public')
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (1, N'Trung', N't@gmail.com', N'123456', 2, N'uploads/avatar/anime-anime-girls-long-hair-smiling-wallpaper-8b46fcada3117fc9d594bbc92dcc9c60.jpg')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (2, N'trungnq@gmail.com', N'ngo quang trung', N'1234', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (3, N'ducgo', N'no1chemloc@yahoo.com', N'1234', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (10, N'Trung', N'promega0907@gmail.com', N'123456', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (11, N'Xuan', N'xuan@gmail.com', N'123456', 2, N'uploads/avatar/04ebbe2de0592b6d99180f2d77389413.jpg')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (12, N'Huy', N'huy@gmail.com', N'123456', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (13, N'Nokia2', N'nokia@gmail.com', N'123456', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (14, N'Xiao Mi', N'xiaomi@gmail.com', N'123456', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (15, N'Nokia2', N'ngoquangtrung2047@gmail.com', N'123456', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (16, N'Minami', N'minami@gmail.com', N'123456', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (17, N'Nokia2', N'nokia2@gmai.com', N'123456', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (18, N'Nokia2', N'321@gmail.com', N'1234567', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (19, N'Mimi', N'mimi@gmail.com', N'123456', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (20, N'Nobita', N'nobita@gmail.com', N'123456', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (21, N'Micheal', N'micheal@gmail.com', N'123456', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (22, N'Sakura', N'sakura@gmail.com', N'123456', 2, N'uploads/avatar/657234ec69ee7d580f9fecedfd8544b3.jpg')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (23, N'Fan MU', N'mu@gmail.com', N'123456', 2, N'uploads/avatar/logo-manchester-united-4.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (24, N'Trung3', N'trung3@gmail.com', N'123456', 2, N'uploads/avatar/2583035.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (25, N'baby', N'baby@gmail.com', N'123456', 2, N'images/default_image.png')
INSERT [dbo].[Users] ([userId], [name], [email], [password], [admin], [avatar_path]) VALUES (26, N'Son LamBo', N'lambo@gmail.com', N'123456', 2, N'images/default_image.png')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [UQ__Friend_R__2A26358A446D87DA]    Script Date: 11/8/2022 10:59:12 AM ******/
ALTER TABLE [dbo].[Friend_Requests] ADD UNIQUE NONCLUSTERED 
(
	[user_request_id] ASC,
	[user_be_request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__JoinGrou__6280B64D797A0ACF]    Script Date: 11/8/2022 10:59:12 AM ******/
ALTER TABLE [dbo].[JoinGroup] ADD UNIQUE NONCLUSTERED 
(
	[memberId] ASC,
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Like_Com__CA534F78B0D319B8]    Script Date: 11/8/2022 10:59:12 AM ******/
ALTER TABLE [dbo].[Like_Comments] ADD UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__PostGrou__3511C4752760B19A]    Script Date: 11/8/2022 10:59:12 AM ******/
ALTER TABLE [dbo].[PostGroup] ADD UNIQUE NONCLUSTERED 
(
	[groupId] ASC,
	[postId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E616457E08CB6]    Script Date: 11/8/2022 10:59:12 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([postId])
REFERENCES [dbo].[Posts] ([postId])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Friend_Requests]  WITH CHECK ADD FOREIGN KEY([user_request_id])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Friend_Requests]  WITH CHECK ADD FOREIGN KEY([user_be_request_id])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[JoinGroup]  WITH CHECK ADD FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([groupId])
GO
ALTER TABLE [dbo].[JoinGroup]  WITH CHECK ADD FOREIGN KEY([memberId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Like_Comments]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Posts] ([postId])
GO
ALTER TABLE [dbo].[Like_Comments]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[MessagesUser]  WITH CHECK ADD FOREIGN KEY([user_send_id])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[MessagesUser]  WITH CHECK ADD FOREIGN KEY([user_receive_id])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Nofications]  WITH CHECK ADD FOREIGN KEY([postId])
REFERENCES [dbo].[Posts] ([postId])
GO
ALTER TABLE [dbo].[Nofications]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[PostGroup]  WITH CHECK ADD FOREIGN KEY([groupId])
REFERENCES [dbo].[Groups] ([groupId])
GO
ALTER TABLE [dbo].[PostGroup]  WITH CHECK ADD FOREIGN KEY([postId])
REFERENCES [dbo].[Posts] ([postId])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
USE [master]
GO
ALTER DATABASE [Social_Network] SET  READ_WRITE 
GO
