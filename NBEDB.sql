USE [NamolyBookingEngineDb]
GO
/****** Object:  Table [dbo].[ArticlePage]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticlePage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NULL,
	[Description] [nvarchar](1024) NULL,
	[Id_WebPageComponent] [int] NULL,
	[CreateDate] [datetime2](7) NULL,
 CONSTRAINT [PK_ArticlePage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessEntity]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessEntity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](32) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Address] [nvarchar](256) NULL,
	[Website] [nvarchar](256) NULL,
	[Email] [nvarchar](64) NULL,
	[Fax] [nvarchar](32) NULL,
	[Phone] [nvarchar](32) NOT NULL,
	[TaxCode] [nvarchar](16) NULL,
	[Type] [int] NOT NULL,
	[IsHotel] [bit] NOT NULL,
	[IsRestaurant] [bit] NOT NULL,
	[IsSpa] [bit] NOT NULL,
	[IsOta] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_BusinessEntity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[Code] [nvarchar](16) NULL,
	[Name] [nvarchar](32) NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComponentType]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_ComponentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] NOT NULL,
	[Code] [nvarchar](16) NULL,
	[Name] [nvarchar](32) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Documentation]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documentation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TitlePageVN] [nvarchar](max) NULL,
	[TitlePageEN] [nvarchar](max) NULL,
	[MetaDescriptionVN] [nvarchar](max) NULL,
	[MetaDescriptionEN] [nvarchar](max) NULL,
	[TitleVN] [nvarchar](max) NULL,
	[TitleEN] [nvarchar](max) NULL,
	[ImageAvatarUrlVN] [nvarchar](max) NULL,
	[ImageAvatarUrlEN] [nvarchar](max) NULL,
	[DescriptionVN] [nvarchar](max) NULL,
	[DescriptionEN] [nvarchar](max) NULL,
	[ContentVN] [nvarchar](max) NULL,
	[ContentEN] [nvarchar](max) NULL,
	[RoutingVN] [nvarchar](max) NULL,
	[RoutingEN] [nvarchar](max) NULL,
	[Category] [nvarchar](max) NULL,
	[PageComponent] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[Level] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[ParentId] [int] NULL,
	[IsLeaf] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelAllotment]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelAllotment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AllotmentForEntityId] [int] NOT NULL,
	[IssueByEntityId] [int] NOT NULL,
	[Code] [nvarchar](8) NOT NULL,
	[StandardPrice] [decimal](18, 0) NOT NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[FromDate] [datetime2](7) NULL,
	[ToDate] [datetime2](7) NULL,
 CONSTRAINT [PK_HotelAllotment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelAllotmentDetail]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelAllotmentDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AllotmentId] [int] NULL,
	[AccommodationTypeId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_HotelAllotmentDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelAvailabilityOverride]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelAvailabilityOverride](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AvailabilityChangedId] [int] NULL,
	[ItemId] [int] NULL,
	[EntityId] [int] NULL,
	[OverrideValue] [int] NULL,
	[OverrideDate] [datetime2](7) NULL,
 CONSTRAINT [PK_HotelAvailabilityOverride] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelPromotionPriceOverride]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelPromotionPriceOverride](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[EntityId] [int] NULL,
	[OverrideValue] [decimal](18, 0) NULL,
	[OverrideDate] [datetime2](7) NULL,
 CONSTRAINT [PK_HotelPromotionPriceOverride] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelReservation]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelReservation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityId] [int] NULL,
	[AgentId] [int] NULL,
	[Code] [nvarchar](8) NULL,
	[IssueDate] [datetime2](7) NULL,
	[ArrivalDate] [datetime2](7) NULL,
	[DepartureDate] [datetime2](7) NULL,
	[Nights] [int] NULL,
	[Guests] [int] NULL,
	[Adults] [int] NULL,
	[Childs] [int] NULL,
	[Infants] [int] NULL,
	[WhereDidYouHearAboutUs] [nvarchar](512) NULL,
	[ReservationNotes] [nvarchar](1024) NULL,
	[CrmNotes] [nvarchar](1024) NULL,
	[HouseKeepingNotes] [nvarchar](1024) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_HotelReservation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelReservationAccommondation]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelReservationAccommondation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReservationId] [int] NULL,
	[RoomTypeId] [int] NULL,
	[NumOfRooms] [int] NULL,
 CONSTRAINT [PK_HotelReservationAccommondation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelReservationCartItem]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelReservationCartItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReservationId] [int] NULL,
	[ItemId] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Price] [decimal](18, 0) NULL,
	[Amount] [decimal](18, 2) NULL,
	[SpecialPromotion] [decimal](18, 2) NULL,
	[Tax] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
 CONSTRAINT [PK_HotelReservationCartItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelReservationExtra]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelReservationExtra](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReservationId] [int] NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [decimal](18, 0) NULL,
 CONSTRAINT [PK_HotelReservationExtra] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelReservationGuest]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelReservationGuest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReservationId] [int] NULL,
	[CityId] [int] NULL,
	[CountryId] [int] NULL,
	[Salutation] [nvarchar](32) NULL,
	[FirstName] [nvarchar](64) NULL,
	[LastName] [nvarchar](64) NULL,
	[FullName] [nvarchar](128) NULL,
	[BusinessName] [nvarchar](128) NULL,
	[Email] [nvarchar](128) NULL,
	[Phone] [nvarchar](32) NULL,
	[Mobile] [nvarchar](32) NULL,
	[Fax] [nvarchar](32) NULL,
	[TaxCode] [nvarchar](32) NULL,
	[Address] [nvarchar](128) NULL,
 CONSTRAINT [PK_HotelReservationGuest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelReservationPayment]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelReservationPayment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReservationId] [int] NULL,
	[Date] [datetime2](7) NULL,
	[PaymentNo] [nvarchar](128) NULL,
	[PaymentType] [int] NULL,
	[Amount] [decimal](18, 0) NULL,
	[Balance] [decimal](18, 0) NULL,
 CONSTRAINT [PK_HotelReservationPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelSoldOutOverride]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelSoldOutOverride](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[EntityId] [int] NULL,
	[OverrideValue] [bit] NULL,
	[OverrideDate] [datetime2](7) NULL,
 CONSTRAINT [PK_HotelSoldOutOverride] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityId] [int] NOT NULL,
	[DefaultUomId] [int] NOT NULL,
	[Code] [nvarchar](16) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[DefaultPrice] [decimal](18, 0) NULL,
	[IsProduct] [bit] NOT NULL,
	[IsService] [bit] NOT NULL,
	[IsBookable] [bit] NOT NULL,
	[AppliedToHotel] [bit] NOT NULL,
	[AppliedToRestaurant] [bit] NOT NULL,
	[AppliedToSpa] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemAttribute]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[ItemAttributeType] [int] NOT NULL,
	[Value] [nvarchar](128) NULL,
 CONSTRAINT [PK_ItemAttribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemAvailabilityChanged]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemAvailabilityChanged](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[BusinessEntityId] [int] NULL,
	[ChangedQuantity] [int] NULL,
	[TargetDate] [datetime2](7) NULL,
	[IssueDate] [datetime2](7) NULL,
	[Description] [nvarchar](128) NULL,
 CONSTRAINT [PK_ItemAvailability] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Uom]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](8) NOT NULL,
	[Name] [nvarchar](16) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Uom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityId] [int] NULL,
	[Email] [nvarchar](128) NULL,
	[Password] [nvarchar](512) NULL,
	[Roles] [nvarchar](512) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WebPage]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebPage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteId] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[ParentWebPageId] [int] NULL,
 CONSTRAINT [PK_WebPage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WebPageComponent]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebPageComponent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ComponentId] [nvarchar](1024) NULL,
	[WebPageId] [int] NULL,
 CONSTRAINT [PK_WebPageComponent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WebPageComponentProperty]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebPageComponentProperty](
	[Id] [int] NOT NULL,
	[WebPageComponentId] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Language] [int] NOT NULL,
 CONSTRAINT [PK_WebPageComponentProperty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WebPageProperty]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebPageProperty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WebPageId] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Language] [int] NOT NULL,
 CONSTRAINT [PK_WebPageProperty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WebSite]    Script Date: 1/25/2017 11:08:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebSite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_WebSite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ArticlePage] ON 

INSERT [dbo].[ArticlePage] ([Id], [Title], [Description], [Id_WebPageComponent], [CreateDate]) VALUES (1, N'asdf', N'sdf', 1, CAST(N'2017-01-21T11:23:12.1470000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ArticlePage] OFF
SET IDENTITY_INSERT [dbo].[BusinessEntity] ON 

INSERT [dbo].[BusinessEntity] ([Id], [Code], [Name], [Address], [Website], [Email], [Fax], [Phone], [TaxCode], [Type], [IsHotel], [IsRestaurant], [IsSpa], [IsOta], [IsActive]) VALUES (1, N'NAAN01', N'NAAN Solution Hotel 01', N'358/2B Điện Biên Phủ', N'naansolution.com', N'support@naansolution.com', N'000213123', N'342543534', NULL, 0, 1, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[BusinessEntity] OFF
SET IDENTITY_INSERT [dbo].[Documentation] ON 

INSERT [dbo].[Documentation] ([Id], [TitlePageVN], [TitlePageEN], [MetaDescriptionVN], [MetaDescriptionEN], [TitleVN], [TitleEN], [ImageAvatarUrlVN], [ImageAvatarUrlEN], [DescriptionVN], [DescriptionEN], [ContentVN], [ContentEN], [RoutingVN], [RoutingEN], [Category], [PageComponent], [DisplayOrder], [Level], [IsActive], [ParentId], [IsLeaf]) VALUES (1, N'testvn', N'testendsfsdfsd', N'testvn', N'testen', N'testvn', N'testen', NULL, NULL, NULL, NULL, N'<p>
	testvn</p>
', N'<p>
	testen</p>
', NULL, NULL, NULL, N'DOCSEO', NULL, NULL, 0, NULL, 0)
INSERT [dbo].[Documentation] ([Id], [TitlePageVN], [TitlePageEN], [MetaDescriptionVN], [MetaDescriptionEN], [TitleVN], [TitleEN], [ImageAvatarUrlVN], [ImageAvatarUrlEN], [DescriptionVN], [DescriptionEN], [ContentVN], [ContentEN], [RoutingVN], [RoutingEN], [Category], [PageComponent], [DisplayOrder], [Level], [IsActive], [ParentId], [IsLeaf]) VALUES (2, N'testvn1', N'testen1', N'testvn1', N'testen1', N'testvn1', N'testen1', N'/Content/images/Documentation/app.jpg', NULL, N'testvn1', N'testen1', N'<p>
	testvn1</p>
', N'<p>
	testen1</p>
', N'testvn1', N'testen1', NULL, N'ListDocument', 1, 0, 1, NULL, 0)
INSERT [dbo].[Documentation] ([Id], [TitlePageVN], [TitlePageEN], [MetaDescriptionVN], [MetaDescriptionEN], [TitleVN], [TitleEN], [ImageAvatarUrlVN], [ImageAvatarUrlEN], [DescriptionVN], [DescriptionEN], [ContentVN], [ContentEN], [RoutingVN], [RoutingEN], [Category], [PageComponent], [DisplayOrder], [Level], [IsActive], [ParentId], [IsLeaf]) VALUES (3, N'testvn11', N'testen11', N'testvn11', N'testen11', N'testvn11', N'testen11', N'/Content/images/imgres3.png', NULL, N'testvn11', N'testen11', N'<p>
	testvn11</p>
', N'<p>
	testen11</p>
', N'testvn11', N'testen11', NULL, N'ListDocument', 2, 1, 1, 2, 0)
INSERT [dbo].[Documentation] ([Id], [TitlePageVN], [TitlePageEN], [MetaDescriptionVN], [MetaDescriptionEN], [TitleVN], [TitleEN], [ImageAvatarUrlVN], [ImageAvatarUrlEN], [DescriptionVN], [DescriptionEN], [ContentVN], [ContentEN], [RoutingVN], [RoutingEN], [Category], [PageComponent], [DisplayOrder], [Level], [IsActive], [ParentId], [IsLeaf]) VALUES (4, N'testvn111', N'testen111', N'testvn111', N'testen111', N'testvn111', N'testen111', N'/Content/images/Documentation/logo.png', NULL, N'testvn111', N'testen111', N'<p>
	testvn111</p>
', N'<p>
	testen111</p>
', N'testvn111', N'testen111', NULL, N'ListDocument', 1, 2, 1, 3, 0)
INSERT [dbo].[Documentation] ([Id], [TitlePageVN], [TitlePageEN], [MetaDescriptionVN], [MetaDescriptionEN], [TitleVN], [TitleEN], [ImageAvatarUrlVN], [ImageAvatarUrlEN], [DescriptionVN], [DescriptionEN], [ContentVN], [ContentEN], [RoutingVN], [RoutingEN], [Category], [PageComponent], [DisplayOrder], [Level], [IsActive], [ParentId], [IsLeaf]) VALUES (8, N'Home', NULL, N'Home', NULL, N'Home', NULL, NULL, NULL, N'Home', NULL, N'<p>
	Home</p>
', NULL, N'Home', NULL, NULL, N'ListDocument', 1, 1, 1, 2, 0)
SET IDENTITY_INSERT [dbo].[Documentation] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [BusinessEntityId], [DefaultUomId], [Code], [Name], [DefaultPrice], [IsProduct], [IsService], [IsBookable], [AppliedToHotel], [AppliedToRestaurant], [AppliedToSpa], [IsActive]) VALUES (1, 1, 1, N'RT01', N'Phòng KS 01', CAST(800000 AS Decimal(18, 0)), 0, 1, 1, 1, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[ItemAttribute] ON 

INSERT [dbo].[ItemAttribute] ([Id], [ItemId], [ItemAttributeType], [Value]) VALUES (1, 1, 3, N'30')
SET IDENTITY_INSERT [dbo].[ItemAttribute] OFF
SET IDENTITY_INSERT [dbo].[ItemAvailabilityChanged] ON 

INSERT [dbo].[ItemAvailabilityChanged] ([Id], [ItemId], [BusinessEntityId], [ChangedQuantity], [TargetDate], [IssueDate], [Description]) VALUES (1, 1, 1, 30, CAST(N'1753-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2017-01-24T13:49:10.5100000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[ItemAvailabilityChanged] OFF
SET IDENTITY_INSERT [dbo].[Uom] ON 

INSERT [dbo].[Uom] ([Id], [Code], [Name], [IsActive]) VALUES (1, N'NI', N'Đêm', 1)
SET IDENTITY_INSERT [dbo].[Uom] OFF
SET IDENTITY_INSERT [dbo].[WebPage] ON 

INSERT [dbo].[WebPage] ([Id], [WebSiteId], [Name], [Description], [IsActive], [ParentWebPageId]) VALUES (3, 1, N'Home', N'home Description', 1, NULL)
INSERT [dbo].[WebPage] ([Id], [WebSiteId], [Name], [Description], [IsActive], [ParentWebPageId]) VALUES (4, 1, N'Home Child', N'home child', 1, 3)
INSERT [dbo].[WebPage] ([Id], [WebSiteId], [Name], [Description], [IsActive], [ParentWebPageId]) VALUES (5, 1, N'home child 2', N'home child 2', 1, 4)
INSERT [dbo].[WebPage] ([Id], [WebSiteId], [Name], [Description], [IsActive], [ParentWebPageId]) VALUES (6, 1, N'Contact Us', N'contact', 1, NULL)
INSERT [dbo].[WebPage] ([Id], [WebSiteId], [Name], [Description], [IsActive], [ParentWebPageId]) VALUES (7, 1, N'Child Contact Us', N'Child Contact Us', 1, 6)
SET IDENTITY_INSERT [dbo].[WebPage] OFF
SET IDENTITY_INSERT [dbo].[WebPageProperty] ON 

INSERT [dbo].[WebPageProperty] ([Id], [WebPageId], [Name], [Value], [Type], [IsActive], [Language]) VALUES (2, 3, N'Title', N'Home', 0, 0, 0)
INSERT [dbo].[WebPageProperty] ([Id], [WebPageId], [Name], [Value], [Type], [IsActive], [Language]) VALUES (3, 3, N'PageTitle', N'home page title', 0, 0, 0)
INSERT [dbo].[WebPageProperty] ([Id], [WebPageId], [Name], [Value], [Type], [IsActive], [Language]) VALUES (4, 3, N'MetaTitle', N'meta title', 0, 0, 0)
INSERT [dbo].[WebPageProperty] ([Id], [WebPageId], [Name], [Value], [Type], [IsActive], [Language]) VALUES (5, 3, N'MetaDescription', N'Meta Description', 0, 0, 0)
INSERT [dbo].[WebPageProperty] ([Id], [WebPageId], [Name], [Value], [Type], [IsActive], [Language]) VALUES (6, 3, N'Routing', N'home', 0, 0, 0)
SET IDENTITY_INSERT [dbo].[WebPageProperty] OFF
SET IDENTITY_INSERT [dbo].[WebSite] ON 

INSERT [dbo].[WebSite] ([Id], [Name]) VALUES (1, N'domain.com')
SET IDENTITY_INSERT [dbo].[WebSite] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_BusinessEntity_Code]    Script Date: 1/25/2017 11:08:28 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BusinessEntity_Code] ON [dbo].[BusinessEntity]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_BusinessEntity_Name]    Script Date: 1/25/2017 11:08:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_BusinessEntity_Name] ON [dbo].[BusinessEntity]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HotelAllotment]    Script Date: 1/25/2017 11:08:28 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_HotelAllotment] ON [dbo].[HotelAllotment]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HotelReservation]    Script Date: 1/25/2017 11:08:28 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_HotelReservation] ON [dbo].[HotelReservation]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Item_Code]    Script Date: 1/25/2017 11:08:28 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Item_Code] ON [dbo].[Item]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Item_Name]    Script Date: 1/25/2017 11:08:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_Item_Name] ON [dbo].[Item]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemAttribute]    Script Date: 1/25/2017 11:08:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemAttribute] ON [dbo].[ItemAttribute]
(
	[ItemId] ASC,
	[ItemAttributeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemAvailabilityChanged]    Script Date: 1/25/2017 11:08:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemAvailabilityChanged] ON [dbo].[ItemAvailabilityChanged]
(
	[BusinessEntityId] ASC,
	[TargetDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Uom_Code]    Script Date: 1/25/2017 11:08:28 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Uom_Code] ON [dbo].[Uom]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Uom_Name]    Script Date: 1/25/2017 11:08:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_Uom_Name] ON [dbo].[Uom]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User]    Script Date: 1/25/2017 11:08:28 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_User] ON [dbo].[User]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_WebPage_Name]    Script Date: 1/25/2017 11:08:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_WebPage_Name] ON [dbo].[WebPage]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_WebPageProperty_Name]    Script Date: 1/25/2017 11:08:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_WebPageProperty_Name] ON [dbo].[WebPageProperty]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArticlePage] ADD  CONSTRAINT [DF_ArticlePage_Id_WebPageComponent]  DEFAULT ((-1)) FOR [Id_WebPageComponent]
GO
ALTER TABLE [dbo].[ArticlePage] ADD  CONSTRAINT [DF_ArticlePage_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[WebPage] ADD  CONSTRAINT [DF_WebPage_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[WebPageComponentProperty] ADD  CONSTRAINT [DF_WebPageComponentProperty_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[WebPageProperty] ADD  CONSTRAINT [DF_WebPageProperty_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[HotelAllotment]  WITH CHECK ADD  CONSTRAINT [FK_HotelAllotment_BusinessEntity] FOREIGN KEY([AllotmentForEntityId])
REFERENCES [dbo].[BusinessEntity] ([Id])
GO
ALTER TABLE [dbo].[HotelAllotment] CHECK CONSTRAINT [FK_HotelAllotment_BusinessEntity]
GO
ALTER TABLE [dbo].[HotelAllotment]  WITH CHECK ADD  CONSTRAINT [FK_HotelAllotment_BusinessEntity1] FOREIGN KEY([IssueByEntityId])
REFERENCES [dbo].[BusinessEntity] ([Id])
GO
ALTER TABLE [dbo].[HotelAllotment] CHECK CONSTRAINT [FK_HotelAllotment_BusinessEntity1]
GO
ALTER TABLE [dbo].[HotelAllotmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_HotelAllotmentDetail_HotelAllotment] FOREIGN KEY([AllotmentId])
REFERENCES [dbo].[HotelAllotment] ([Id])
GO
ALTER TABLE [dbo].[HotelAllotmentDetail] CHECK CONSTRAINT [FK_HotelAllotmentDetail_HotelAllotment]
GO
ALTER TABLE [dbo].[HotelAllotmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_HotelAllotmentDetail_Item] FOREIGN KEY([AccommodationTypeId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[HotelAllotmentDetail] CHECK CONSTRAINT [FK_HotelAllotmentDetail_Item]
GO
ALTER TABLE [dbo].[HotelAvailabilityOverride]  WITH CHECK ADD  CONSTRAINT [FK_HotelAvailabilityOverride_BusinessEntity] FOREIGN KEY([EntityId])
REFERENCES [dbo].[BusinessEntity] ([Id])
GO
ALTER TABLE [dbo].[HotelAvailabilityOverride] CHECK CONSTRAINT [FK_HotelAvailabilityOverride_BusinessEntity]
GO
ALTER TABLE [dbo].[HotelAvailabilityOverride]  WITH CHECK ADD  CONSTRAINT [FK_HotelAvailabilityOverride_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[HotelAvailabilityOverride] CHECK CONSTRAINT [FK_HotelAvailabilityOverride_Item]
GO
ALTER TABLE [dbo].[HotelAvailabilityOverride]  WITH CHECK ADD  CONSTRAINT [FK_HotelAvailabilityOverride_ItemAvailabilityChanged] FOREIGN KEY([AvailabilityChangedId])
REFERENCES [dbo].[ItemAvailabilityChanged] ([Id])
GO
ALTER TABLE [dbo].[HotelAvailabilityOverride] CHECK CONSTRAINT [FK_HotelAvailabilityOverride_ItemAvailabilityChanged]
GO
ALTER TABLE [dbo].[HotelPromotionPriceOverride]  WITH CHECK ADD  CONSTRAINT [FK_HotelPromotionPriceOverride_BusinessEntity] FOREIGN KEY([EntityId])
REFERENCES [dbo].[BusinessEntity] ([Id])
GO
ALTER TABLE [dbo].[HotelPromotionPriceOverride] CHECK CONSTRAINT [FK_HotelPromotionPriceOverride_BusinessEntity]
GO
ALTER TABLE [dbo].[HotelPromotionPriceOverride]  WITH CHECK ADD  CONSTRAINT [FK_HotelPromotionPriceOverride_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[HotelPromotionPriceOverride] CHECK CONSTRAINT [FK_HotelPromotionPriceOverride_Item]
GO
ALTER TABLE [dbo].[HotelReservation]  WITH CHECK ADD  CONSTRAINT [FK_HotelReservation_BusinessEntity] FOREIGN KEY([BusinessEntityId])
REFERENCES [dbo].[BusinessEntity] ([Id])
GO
ALTER TABLE [dbo].[HotelReservation] CHECK CONSTRAINT [FK_HotelReservation_BusinessEntity]
GO
ALTER TABLE [dbo].[HotelReservation]  WITH CHECK ADD  CONSTRAINT [FK_HotelReservation_BusinessEntity1] FOREIGN KEY([AgentId])
REFERENCES [dbo].[BusinessEntity] ([Id])
GO
ALTER TABLE [dbo].[HotelReservation] CHECK CONSTRAINT [FK_HotelReservation_BusinessEntity1]
GO
ALTER TABLE [dbo].[HotelReservationAccommondation]  WITH CHECK ADD  CONSTRAINT [FK_HotelReservationAccommondation_HotelReservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[HotelReservation] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HotelReservationAccommondation] CHECK CONSTRAINT [FK_HotelReservationAccommondation_HotelReservation]
GO
ALTER TABLE [dbo].[HotelReservationAccommondation]  WITH CHECK ADD  CONSTRAINT [FK_HotelReservationAccommondation_Item] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[HotelReservationAccommondation] CHECK CONSTRAINT [FK_HotelReservationAccommondation_Item]
GO
ALTER TABLE [dbo].[HotelReservationCartItem]  WITH CHECK ADD  CONSTRAINT [FK_HotelReservationCartItem_HotelReservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[HotelReservation] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HotelReservationCartItem] CHECK CONSTRAINT [FK_HotelReservationCartItem_HotelReservation]
GO
ALTER TABLE [dbo].[HotelReservationExtra]  WITH CHECK ADD  CONSTRAINT [FK_HotelReservationExtra_HotelReservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[HotelReservation] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HotelReservationExtra] CHECK CONSTRAINT [FK_HotelReservationExtra_HotelReservation]
GO
ALTER TABLE [dbo].[HotelReservationExtra]  WITH CHECK ADD  CONSTRAINT [FK_HotelReservationExtra_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[HotelReservationExtra] CHECK CONSTRAINT [FK_HotelReservationExtra_Item]
GO
ALTER TABLE [dbo].[HotelReservationGuest]  WITH CHECK ADD  CONSTRAINT [FK_HotelReservationGuest_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[HotelReservationGuest] CHECK CONSTRAINT [FK_HotelReservationGuest_City]
GO
ALTER TABLE [dbo].[HotelReservationGuest]  WITH CHECK ADD  CONSTRAINT [FK_HotelReservationGuest_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[HotelReservationGuest] CHECK CONSTRAINT [FK_HotelReservationGuest_Country]
GO
ALTER TABLE [dbo].[HotelReservationGuest]  WITH CHECK ADD  CONSTRAINT [FK_HotelReservationGuest_HotelReservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[HotelReservation] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HotelReservationGuest] CHECK CONSTRAINT [FK_HotelReservationGuest_HotelReservation]
GO
ALTER TABLE [dbo].[HotelReservationPayment]  WITH CHECK ADD  CONSTRAINT [FK_HotelReservationPayment_HotelReservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[HotelReservation] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HotelReservationPayment] CHECK CONSTRAINT [FK_HotelReservationPayment_HotelReservation]
GO
ALTER TABLE [dbo].[HotelSoldOutOverride]  WITH CHECK ADD  CONSTRAINT [FK_HotelSoldOutOverride_BusinessEntity] FOREIGN KEY([EntityId])
REFERENCES [dbo].[BusinessEntity] ([Id])
GO
ALTER TABLE [dbo].[HotelSoldOutOverride] CHECK CONSTRAINT [FK_HotelSoldOutOverride_BusinessEntity]
GO
ALTER TABLE [dbo].[HotelSoldOutOverride]  WITH CHECK ADD  CONSTRAINT [FK_HotelSoldOutOverride_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[HotelSoldOutOverride] CHECK CONSTRAINT [FK_HotelSoldOutOverride_Item]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_BusinessEntity] FOREIGN KEY([BusinessEntityId])
REFERENCES [dbo].[BusinessEntity] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_BusinessEntity]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Uom] FOREIGN KEY([DefaultUomId])
REFERENCES [dbo].[Uom] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Uom]
GO
ALTER TABLE [dbo].[ItemAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ItemAttribute_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[ItemAttribute] CHECK CONSTRAINT [FK_ItemAttribute_Item]
GO
ALTER TABLE [dbo].[ItemAvailabilityChanged]  WITH CHECK ADD  CONSTRAINT [FK_ItemAvailability_BusinessEntity] FOREIGN KEY([BusinessEntityId])
REFERENCES [dbo].[BusinessEntity] ([Id])
GO
ALTER TABLE [dbo].[ItemAvailabilityChanged] CHECK CONSTRAINT [FK_ItemAvailability_BusinessEntity]
GO
ALTER TABLE [dbo].[ItemAvailabilityChanged]  WITH CHECK ADD  CONSTRAINT [FK_ItemAvailability_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemAvailabilityChanged] CHECK CONSTRAINT [FK_ItemAvailability_Item]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_BusinessEntity] FOREIGN KEY([BusinessEntityId])
REFERENCES [dbo].[BusinessEntity] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_BusinessEntity]
GO
ALTER TABLE [dbo].[WebPage]  WITH CHECK ADD  CONSTRAINT [FK_WebSite_WebPage] FOREIGN KEY([WebSiteId])
REFERENCES [dbo].[WebSite] ([Id])
GO
ALTER TABLE [dbo].[WebPage] CHECK CONSTRAINT [FK_WebSite_WebPage]
GO
ALTER TABLE [dbo].[WebPageComponent]  WITH CHECK ADD  CONSTRAINT [FK_WebPageComponent_WebPage] FOREIGN KEY([WebPageId])
REFERENCES [dbo].[WebPage] ([Id])
GO
ALTER TABLE [dbo].[WebPageComponent] CHECK CONSTRAINT [FK_WebPageComponent_WebPage]
GO
ALTER TABLE [dbo].[WebPageComponentProperty]  WITH CHECK ADD  CONSTRAINT [FK_WebPageComponentProperty_WebPageComponent] FOREIGN KEY([WebPageComponentId])
REFERENCES [dbo].[WebPageComponent] ([Id])
GO
ALTER TABLE [dbo].[WebPageComponentProperty] CHECK CONSTRAINT [FK_WebPageComponentProperty_WebPageComponent]
GO
ALTER TABLE [dbo].[WebPageProperty]  WITH CHECK ADD  CONSTRAINT [FK_WebPageProperty_WebPage] FOREIGN KEY([WebPageId])
REFERENCES [dbo].[WebPage] ([Id])
GO
ALTER TABLE [dbo].[WebPageProperty] CHECK CONSTRAINT [FK_WebPageProperty_WebPage]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'enum {ServiceProvider, Agent}' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BusinessEntity', @level2type=N'COLUMN',@level2name=N'Type'
GO
