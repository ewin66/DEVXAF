USE [CMSOnDemand]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 10/27/2016 11:20:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[Routing] [nvarchar](max) NOT NULL,
	[URL] [nvarchar](max) NOT NULL,
	[ContentType] [nvarchar](16) NOT NULL,
	[Language] [nvarchar](2) NOT NULL,
	[ContentData] [nvarchar](max) NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime2](7) NOT NULL,
	[ChangedBy] [int] NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Content_Code] ON [dbo].[Content] 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Content_Type] ON [dbo].[Content] 
(
	[ContentType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 10/27/2016 11:20:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DeviceType] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime2](7) NOT NULL,
	[ChangedBy] [int] NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Album_Name] ON [dbo].[Album] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserComment]    Script Date: 10/27/2016 11:20:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentedOn] [datetime2](7) NOT NULL,
	[CommentedBy] [nvarchar](128) NULL,
	[Email] [nvarchar](128) NULL,
	[Phone] [nvarchar](128) NULL,
	[WhatId] [int] NOT NULL,
	[ContentType] [int] NOT NULL,
	[CommentData] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime2](7) NOT NULL,
	[ChangedBy] [int] NULL,
 CONSTRAINT [PK_UserComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserComment_CommentOn] ON [dbo].[UserComment] 
(
	[CommentedOn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserComment_Type_WhatId] ON [dbo].[UserComment] 
(
	[ContentType] ASC,
	[WhatId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 10/27/2016 11:20:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SettingValue] [nvarchar](max) NOT NULL,
	[Category] [nvarchar](16) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime2](7) NOT NULL,
	[ChangedBy] [int] NULL,
 CONSTRAINT [PK_SETTING] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Setting_Name_Category] ON [dbo].[Setting] 
(
	[Name] ASC,
	[Category] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Website]    Script Date: 10/27/2016 11:20:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Website](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[URL] [nvarchar](max) NOT NULL,
	[Language] [nvarchar](2) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime2](7) NOT NULL,
	[ChangedBy] [int] NULL,
 CONSTRAINT [PK_Website] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Website_Code] ON [dbo].[Website] 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageRepository]    Script Date: 10/27/2016 11:20:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageRepository](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AlbumId] [int] NOT NULL,
	[Code] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Routing] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[URL] [nvarchar](max) NOT NULL,
	[DeviceType] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime2](7) NOT NULL,
	[ChangedBy] [int] NULL,
 CONSTRAINT [PK_ImageRepository] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ImageRepository_AlbumId] ON [dbo].[ImageRepository] 
(
	[AlbumId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ImageRepository_Code] ON [dbo].[ImageRepository] 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ImageRepository_Name] ON [dbo].[ImageRepository] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Webpage]    Script Date: 10/27/2016 11:20:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Webpage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WebsiteId] [int] NOT NULL,
	[Code] [nvarchar](128) NOT NULL,
	[Tiltle] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[URL] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime2](7) NOT NULL,
	[ChangedBy] [int] NULL,
 CONSTRAINT [PK_Webpage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Webpage_Code] ON [dbo].[Webpage] 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Webpage_WebsiteId] ON [dbo].[Webpage] 
(
	[WebsiteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageComponent]    Script Date: 10/27/2016 11:20:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageComponent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WebPageId] [int] NOT NULL,
	[Code] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[ContentType] [nvarchar](16) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime2](7) NOT NULL,
	[ChangedBy] [int] NULL,
 CONSTRAINT [PK_PageComponent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_PageComponent_Code] ON [dbo].[PageComponent] 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PageComponent_PageId] ON [dbo].[PageComponent] 
(
	[WebPageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublicationContent]    Script Date: 10/27/2016 11:20:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicationContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[PageComponentId] [int] NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[URL] [nvarchar](max) NOT NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidUntil] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime2](7) NOT NULL,
	[ChangedBy] [int] NULL,
 CONSTRAINT [PK_PublicationContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_PublicationContent_Component_Content] ON [dbo].[PublicationContent] 
(
	[PageComponentId] ASC,
	[ContentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Default [DF_Album_Description]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Album] ADD  CONSTRAINT [DF_Album_Description]  DEFAULT (N'N/A') FOR [Description]
GO
/****** Object:  Default [DF_Album_DeviceType]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Album] ADD  CONSTRAINT [DF_Album_DeviceType]  DEFAULT ((0)) FOR [DeviceType]
GO
/****** Object:  Default [DF__Album__Created__0BC6C43E]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Album] ADD  CONSTRAINT [DF__Album__Created__0BC6C43E]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF__Album__Changed__0CBAE877]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Album] ADD  CONSTRAINT [DF__Album__Changed__0CBAE877]  DEFAULT (getdate()) FOR [ChangedOn]
GO
/****** Object:  Default [DF_Content_Description]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Content_Routing]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Routing]  DEFAULT ('') FOR [Routing]
GO
/****** Object:  Default [DF_Content_Type]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Type]  DEFAULT (N'N/A') FOR [ContentType]
GO
/****** Object:  Default [DF_Content_Language]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Language]  DEFAULT (N'VN') FOR [Language]
GO
/****** Object:  Default [DF_Content_CreatedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Content_ChangedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_ChangedOn]  DEFAULT (getdate()) FOR [ChangedOn]
GO
/****** Object:  Default [DF_ImageRepository_Routing]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[ImageRepository] ADD  CONSTRAINT [DF_ImageRepository_Routing]  DEFAULT ('') FOR [Routing]
GO
/****** Object:  Default [DF_ImageRepository_Description]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[ImageRepository] ADD  CONSTRAINT [DF_ImageRepository_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_ImageRepository_DeviceType]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[ImageRepository] ADD  CONSTRAINT [DF_ImageRepository_DeviceType]  DEFAULT ((0)) FOR [DeviceType]
GO
/****** Object:  Default [DF_ImageRepository_CreatedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[ImageRepository] ADD  CONSTRAINT [DF_ImageRepository_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_ImageRepository_ChangedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[ImageRepository] ADD  CONSTRAINT [DF_ImageRepository_ChangedOn]  DEFAULT (getdate()) FOR [ChangedOn]
GO
/****** Object:  Default [DF_PageComponent_Description]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[PageComponent] ADD  CONSTRAINT [DF_PageComponent_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_PageComponent_CreatedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[PageComponent] ADD  CONSTRAINT [DF_PageComponent_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_PageComponent_ChangedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[PageComponent] ADD  CONSTRAINT [DF_PageComponent_ChangedOn]  DEFAULT (getdate()) FOR [ChangedOn]
GO
/****** Object:  Default [DF_PublicationContent_Description]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[PublicationContent] ADD  CONSTRAINT [DF_PublicationContent_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_PublicationContent_IsActive]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[PublicationContent] ADD  CONSTRAINT [DF_PublicationContent_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_PublicationContent_CreatedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[PublicationContent] ADD  CONSTRAINT [DF_PublicationContent_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_PublicationContent_ChangedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[PublicationContent] ADD  CONSTRAINT [DF_PublicationContent_ChangedOn]  DEFAULT (getdate()) FOR [ChangedOn]
GO
/****** Object:  Default [DF_Setting_Description]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Setting] ADD  CONSTRAINT [DF_Setting_Description]  DEFAULT (N'N/A') FOR [Description]
GO
/****** Object:  Default [DF__Setting__Created__0BC6C43E]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Setting] ADD  CONSTRAINT [DF__Setting__Created__0BC6C43E]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF__Setting__Changed__0CBAE877]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Setting] ADD  CONSTRAINT [DF__Setting__Changed__0CBAE877]  DEFAULT (getdate()) FOR [ChangedOn]
GO
/****** Object:  Default [DF_UserComment_CommentedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[UserComment] ADD  CONSTRAINT [DF_UserComment_CommentedOn]  DEFAULT (getdate()) FOR [CommentedOn]
GO
/****** Object:  Default [DF_UserComment_Description]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[UserComment] ADD  CONSTRAINT [DF_UserComment_Description]  DEFAULT (N'N/A') FOR [CommentData]
GO
/****** Object:  Default [DF__UserComment__CreatedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[UserComment] ADD  CONSTRAINT [DF__UserComment__CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF__UserComment__ChangedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[UserComment] ADD  CONSTRAINT [DF__UserComment__ChangedOn]  DEFAULT (getdate()) FOR [ChangedOn]
GO
/****** Object:  Default [DF_Webpage_Description]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Webpage] ADD  CONSTRAINT [DF_Webpage_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Webpage_CreatedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Webpage] ADD  CONSTRAINT [DF_Webpage_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Webpage_ChangedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Webpage] ADD  CONSTRAINT [DF_Webpage_ChangedOn]  DEFAULT (getdate()) FOR [ChangedOn]
GO
/****** Object:  Default [DF_Website_Description]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Website] ADD  CONSTRAINT [DF_Website_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Website_Language]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Website] ADD  CONSTRAINT [DF_Website_Language]  DEFAULT (N'VN') FOR [Language]
GO
/****** Object:  Default [DF_Website_CreatedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Website] ADD  CONSTRAINT [DF_Website_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Website_ChangedOn]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Website] ADD  CONSTRAINT [DF_Website_ChangedOn]  DEFAULT (getdate()) FOR [ChangedOn]
GO
/****** Object:  ForeignKey [FK_ImageRepository_Album]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[ImageRepository]  WITH CHECK ADD  CONSTRAINT [FK_ImageRepository_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Album] ([Id])
GO
ALTER TABLE [dbo].[ImageRepository] CHECK CONSTRAINT [FK_ImageRepository_Album]
GO
/****** Object:  ForeignKey [FK_PageComponent_Webpage]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[PageComponent]  WITH CHECK ADD  CONSTRAINT [FK_PageComponent_Webpage] FOREIGN KEY([WebPageId])
REFERENCES [dbo].[Webpage] ([Id])
GO
ALTER TABLE [dbo].[PageComponent] CHECK CONSTRAINT [FK_PageComponent_Webpage]
GO
/****** Object:  ForeignKey [FK_PublicationContent_Content]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[PublicationContent]  WITH CHECK ADD  CONSTRAINT [FK_PublicationContent_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PublicationContent] CHECK CONSTRAINT [FK_PublicationContent_Content]
GO
/****** Object:  ForeignKey [FK_PublicationContent_PageComponent]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[PublicationContent]  WITH CHECK ADD  CONSTRAINT [FK_PublicationContent_PageComponent] FOREIGN KEY([PageComponentId])
REFERENCES [dbo].[PageComponent] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PublicationContent] CHECK CONSTRAINT [FK_PublicationContent_PageComponent]
GO
/****** Object:  ForeignKey [FK_Webpage_Website]    Script Date: 10/27/2016 11:20:20 ******/
ALTER TABLE [dbo].[Webpage]  WITH CHECK ADD  CONSTRAINT [FK_Webpage_Website] FOREIGN KEY([WebsiteId])
REFERENCES [dbo].[Website] ([Id])
GO
ALTER TABLE [dbo].[Webpage] CHECK CONSTRAINT [FK_Webpage_Website]
GO
