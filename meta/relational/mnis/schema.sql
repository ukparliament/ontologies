

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressTypes](
	[AddressType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsPhysicalAddress] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[DisplayOrder] [int] NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_AddressTypes] PRIMARY KEY CLUSTERED 
(
	[AddressType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnsweringBodies](
	[AnsweringBody_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](1000) NOT NULL,
	[SortName] [varchar](1000) NOT NULL,
	[Target] [varchar](1000) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[OralDaysNotice] [int] NOT NULL,
	[AnswersSubstantive] [bit] NOT NULL,
	[AnswersTopical] [bit] NOT NULL,
	[AnswersOrdinary] [bit] NOT NULL,
	[NamedDay] [bit] NOT NULL,
	[Department_Id] [int] NULL,
	[ShowName] [varchar](255) NULL,
	[ShowInTitle] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[ShortName] [varchar](1000) NULL,
	[NumberOfAllowedSubstantiveAnswers] [int] NULL,
	[NumberOfAllowedTopicalAnswers] [int] NULL,
	[TermId] [int] NULL,
 CONSTRAINT [PK_AnsweringBodies] PRIMARY KEY CLUSTERED 
(
	[AnsweringBody_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[Area_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[OnsAreaId] [nvarchar](255) NULL,
	[AreaType_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK__Areas__425676CE6FE99F9F] PRIMARY KEY CLUSTERED 
(
	[Area_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreaTypes](
	[AreaType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK__AreaType__FB9175E408EA5793] PRIMARY KEY CLUSTERED 
(
	[AreaType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BiographyCategories](
	[BiographyCategory_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsCommons] [bit] NOT NULL,
	[IsLords] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_BiographyCategories] PRIMARY KEY CLUSTERED 
(
	[BiographyCategory_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cabinets](
	[Cabinet_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Ordinal] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsGovernment] [bit] NOT NULL,
	[IsOpposition] [bit] NOT NULL,
 CONSTRAINT [PK_Cabinets] PRIMARY KEY CLUSTERED 
(
	[Cabinet_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommitteeClerks](
	[CommitteeClerk_Id] [int] IDENTITY(1,1) NOT NULL,
	[Committee_Id] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_CommitteeClerks] PRIMARY KEY CLUSTERED 
(
	[CommitteeClerk_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommitteeLayMembers](
	[CommitteeLayMember_Id] [int] IDENTITY(1,1) NOT NULL,
	[Committee_Id] [int] NOT NULL,
	[Title_Id] [int] NULL,
	[Forename] [nvarchar](255) NULL,
	[MiddleNames] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NULL,
	[Suffix] [nvarchar](255) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[Notes] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[PhotoContent] [varbinary](max) NULL,
	[PhotoMIMEType] [varchar](255) NULL,
	[PhotoFileName] [nvarchar](255) NULL,
	[Gender] [varchar](1) NOT NULL,
 CONSTRAINT [PK_CommitteeLayMembers] PRIMARY KEY CLUSTERED 
(
	[CommitteeLayMember_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Committees](
	[Committee_Id] [int] IDENTITY(1,1) NOT NULL,
	[CommitteeType_Id] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[ParentCommittee_Id] [int] NULL,
	[DateLordsAppointed] [datetime] NULL,
	[DateCommonsAppointed] [datetime] NULL,
	[Phone] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[CreatedFromCommittee_Id] [int] NULL,
	[IsCommons] [bit] NOT NULL,
	[IsLords] [bit] NOT NULL,
 CONSTRAINT [PK__Committe__291758A747DBAE45] PRIMARY KEY CLUSTERED 
(
	[Committee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommitteeTypes](
	[CommitteeType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_CommitteeTypes] PRIMARY KEY CLUSTERED 
(
	[CommitteeType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommonsRegisterPublications](
	[CommonsRegisterPublication_Id] [int] NOT NULL,
	[PublicationDate] [datetime] NOT NULL,
	[Notes] [nvarchar](255) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_CommonsRegisterPublications] PRIMARY KEY CLUSTERED 
(
	[CommonsRegisterPublication_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Constituencies](
	[Constituency_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[AlphaName] [nvarchar](255) NULL,
	[ConstituencyType_Id] [int] NULL,
	[LocataId] [int] NULL,
	[PrevConstituencyId] [nvarchar](255) NULL,
	[OldDodsId] [int] NULL,
	[OldDisId] [int] NULL,
	[ClerksConstituencyId] [int] NULL,
	[ClerksConstituencyName] [nvarchar](255) NULL,
	[GisId] [int] NULL,
	[PcaCode] [int] NULL,
	[PconName] [nvarchar](255) NULL,
	[OsName] [nvarchar](255) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[CreatedFromConstituency_Id] [int] NULL,
	[ONSCode] [nvarchar](50) NULL,
	[Geometry] [varchar](max) NULL,
	[SchoolsSubsidyBand] [nvarchar](10) NULL,
 CONSTRAINT [PK_Constituencies] PRIMARY KEY CLUSTERED 
(
	[Constituency_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConstituencyAreas](
	[ConstituencyAreas_Id] [int] IDENTITY(1,1) NOT NULL,
	[Constituency_Id] [int] NOT NULL,
	[Area_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_ConstituencyAreas] PRIMARY KEY CLUSTERED 
(
	[ConstituencyAreas_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConstituencyCandidates](
	[ConstituencyCandidate_Id] [int] IDENTITY(1,1) NOT NULL,
	[ConstituencyResult_Id] [int] NOT NULL,
	[Candidate] [nvarchar](255) NOT NULL,
	[Member_Id] [int] NULL,
	[Party] [nvarchar](255) NOT NULL,
	[Party_Id] [int] NULL,
	[Votes] [int] NOT NULL,
	[ResultChange] [varchar](10) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedWhen] [datetime] NULL,
	[RankOrder] [int] NULL,
	[VoteShare] [float] NULL,
 CONSTRAINT [PK_ConstituencyCandidates] PRIMARY KEY CLUSTERED 
(
	[ConstituencyCandidate_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConstituencyResults](
	[ConstituencyResult_Id] [int] IDENTITY(1,1) NOT NULL,
	[Constituency_Id] [int] NOT NULL,
	[Election_Id] [int] NOT NULL,
	[Electorate] [int] NOT NULL,
	[Result] [nvarchar](255) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNotional] [bit] NOT NULL,
	[Turnout] [int] NULL,
	[Majority] [int] NULL,
	[WinningPartyId] [int] NULL,
 CONSTRAINT [PK_ConstituencyResults] PRIMARY KEY CLUSTERED 
(
	[ConstituencyResult_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConstituencyTypes](
	[ConstituencyType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_ConsituencyTypes] PRIMARY KEY CLUSTERED 
(
	[ConstituencyType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Country_Id] [int] IDENTITY(1,1) NOT NULL,
	[IsUnitedKingdom] [bit] NULL,
	[Name] [nvarchar](255) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK__Countrie__8036CBAE03317E3D] PRIMARY KEY CLUSTERED 
(
	[Country_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Department_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[AlphaName] [nvarchar](1000) NULL,
	[Acronym] [nvarchar](50) NULL,
	[SortOrder] [int] NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[Address3] [nvarchar](255) NULL,
	[Address4] [nvarchar](255) NULL,
	[Address5] [nvarchar](255) NULL,
	[Postcode] [nvarchar](50) NULL,
	[OtherAddress] [nvarchar](max) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[Minister] [bit] NOT NULL,
	[Secretary] [bit] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[SortOrderOpposition] [int] NULL,
	[SesId] [int] NULL,
	[Logo] [varbinary](max) NULL,
	[LogoMIMEType] [varchar](255) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Department_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisqualificationTypes](
	[DisqualificationType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[DisplayTextOnHoLOverview] [nvarchar](1000) NULL,
 CONSTRAINT [PK_DisqualificationTypes] PRIMARY KEY CLUSTERED 
(
	[DisqualificationType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dissolutions](
	[Dissolution_Id] [int] IDENTITY(1,1) NOT NULL,
	[DissolutionDate] [date] NOT NULL,
 CONSTRAINT [PK_Dissolutions] PRIMARY KEY CLUSTERED 
(
	[Dissolution_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberAddresses](
	[EditMemberAddress_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[AddressType_Id] [int] NOT NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[Address3] [nvarchar](255) NULL,
	[Address4] [nvarchar](255) NULL,
	[Address5] [nvarchar](255) NULL,
	[Postcode] [nvarchar](50) NULL,
	[OtherAddress] [nvarchar](max) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[IsPreferred] [bit] NOT NULL,
	[IsWeb] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
	[Fax] [varchar](50) NULL,
 CONSTRAINT [PK_EditMemberAddresses] PRIMARY KEY CLUSTERED 
(
	[EditMemberAddress_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberBiographies](
	[EditMemberBiography_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[BiographyCategory_Id] [int] NOT NULL,
	[Entry] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberBiographies] PRIMARY KEY CLUSTERED 
(
	[EditMemberBiography_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberCommitteeChairs](
	[EditMemberCommitteeChair_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMemberCommittee_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberCommitteeChairs] PRIMARY KEY CLUSTERED 
(
	[EditMemberCommitteeChair_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberCommittees](
	[EditMemberCommittee_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[Committee_Id] [int] NOT NULL,
	[ExOfficio] [bit] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[EndNote] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
	[IsAlternate] [bit] NOT NULL,
	[IsCoOpted] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberCommittees] PRIMARY KEY CLUSTERED 
(
	[EditMemberCommittee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberConstituencies](
	[EditMemberConstituency_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[Constituency_Id] [int] NOT NULL,
	[EntryType_Id] [int] NOT NULL,
	[EndType_Id] [int] NULL,
	[Election_Id] [int] NOT NULL,
	[SwearInOrder] [int] NULL,
	[Title_Id] [int] NULL,
	[Forename] [nvarchar](255) NULL,
	[Middlenames] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[Notes] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
	[IsStandingDown] [bit] NOT NULL,
	[OathDate] [date] NULL,
	[BatchId] [int] NULL,
	[OathType] [int] NOT NULL,
 CONSTRAINT [PK_EditMemberConstituencies] PRIMARY KEY CLUSTERED 
(
	[EditMemberConstituency_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberDisqualifications](
	[EditMemberDisqualification_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMemberStatus_Id] [int] NOT NULL,
	[DisqualificationType_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberDisqualification] PRIMARY KEY CLUSTERED 
(
	[EditMemberDisqualification_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberElectionsContested](
	[EditMemberElectionContested_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[Constituency_Id] [int] NOT NULL,
	[Election_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberElectionsContested] PRIMARY KEY CLUSTERED 
(
	[EditMemberElectionContested_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberExperiences](
	[EditMemberExperience_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[Experience_Id] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Organisation] [nvarchar](255) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
	[StartDateDay] [int] NULL,
	[StartDateMonth] [int] NULL,
	[StartDateYear] [int] NULL,
	[EndDateDay] [int] NULL,
	[EndDateMonth] [int] NULL,
	[EndDateYear] [int] NULL,
 CONSTRAINT [PK_EditMemberExperiences] PRIMARY KEY CLUSTERED 
(
	[EditMemberExperience_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberGovernmentPosts](
	[EditMemberGovernmentPost_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[GovernmentPost_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[EndNote] [nvarchar](max) NULL,
	[IsUnpaid] [bit] NOT NULL,
	[IsJoint] [bit] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
	[LayingMinisterName] [nvarchar](255) NULL,
	[Department_Id] [int] NULL,
 CONSTRAINT [PK_EditMemberGovernmentPosts] PRIMARY KEY CLUSTERED 
(
	[EditMemberGovernmentPost_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberHonours](
	[EditMemberHonour_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[Honour_Id] [int] NOT NULL,
	[HonourList_Id] [int] NULL,
	[OtherHonour] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberHonours] PRIMARY KEY CLUSTERED 
(
	[EditMemberHonour_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberHouseMemberships](
	[EditMemberHouseMembership_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[House_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[EndReason_Id] [int] NULL,
	[EndNotes] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberHouseMemberships] PRIMARY KEY CLUSTERED 
(
	[EditMemberHouseMembership_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberInterests](
	[EditMemberInterest_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[InterestCategory_Id] [int] NOT NULL,
	[Interest] [nvarchar](max) NULL,
	[InterestCreated] [datetime] NULL,
	[InterestAmended] [datetime] NULL,
	[InterestDeleted] [datetime] NULL,
	[RegisteredLate] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
	[LastAmendment] [datetime] NULL,
	[LastAmendmentType] [char](1) NULL,
	[IsCorrection] [bit] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[CommonsRegisterPublication_Id] [int] NULL,
	[ParentEditMemberInterest_Id] [int] NULL,
	[ShowCreatedDate] [bit] NOT NULL,
	[RMFIAppId] [int] NULL,
	[HighlightAmendment] [bit] NULL,
 CONSTRAINT [PK_EditMemberInterests] PRIMARY KEY CLUSTERED 
(
	[EditMemberInterest_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberKnownAs](
	[EditMemberKnownAs_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[MiddleNames] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberKnownAs] PRIMARY KEY CLUSTERED 
(
	[EditMemberKnownAs_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberLeaveOfAbsence](
	[EditMemberLeaveOfAbsence_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMemberStatus_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberLeaveOfAbsence] PRIMARY KEY CLUSTERED 
(
	[EditMemberLeaveOfAbsence_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberLordsMembershipTypes](
	[EditMemberLordsMembershipType_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[LordsMembershipType_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberLordsMembershipTypes] PRIMARY KEY CLUSTERED 
(
	[EditMemberLordsMembershipType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberLordsPreferredNames](
	[LordsPreferredName_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMemberPreferredName_Id] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[LordsRank_Id] [int] NOT NULL,
	[UseOf] [bit] NOT NULL,
	[UseThe] [bit] NOT NULL,
	[Prenominal] [nvarchar](50) NULL,
	[Cardinality] [int] NULL,
	[IsPrimaryTitle] [bit] NOT NULL,
	[IsKnownAs] [bit] NOT NULL,
	[IsByVirtue] [bit] NOT NULL,
	[SitsAs] [nvarchar](255) NULL,
	[IsOtherTitle] [bit] NOT NULL,
	[OtherTitle] [nvarchar](255) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
	[DateOfAnnouncement] [date] NULL,
	[DateOfIntroduction] [date] NULL,
	[DateOfWrit] [date] NULL,
	[IsWritAM] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberLordsPreferredNames] PRIMARY KEY CLUSTERED 
(
	[LordsPreferredName_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberMaidenSpeeches](
	[EditMemberMaidenSpeech_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[SpeechDate] [date] NOT NULL,
	[Hansard] [nvarchar](255) NULL,
	[Subject] [nvarchar](max) NULL,
	[House_Id] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
	[Url] [varchar](256) NULL,
 CONSTRAINT [PK_EditMemberMaidenSpeeches] PRIMARY KEY CLUSTERED 
(
	[EditMemberMaidenSpeech_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberOaths](
	[LordsOath_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[OathDate] [date] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
	[SwearInOrder] [int] NULL,
	[BatchId] [int] NULL,
	[OathType] [int] NOT NULL,
 CONSTRAINT [PK_EditMemberOaths] PRIMARY KEY CLUSTERED 
(
	[LordsOath_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberObituaries](
	[EditMemberObituary_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[ObituaryUrl] [nvarchar](255) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberObituaries] PRIMARY KEY CLUSTERED 
(
	[EditMemberObituary_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberOppositionPosts](
	[EditMemberOppositionPost_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[OppositionPost_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[EndNote] [nvarchar](max) NULL,
	[IsUnpaid] [bit] NOT NULL,
	[IsJoint] [bit] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberOppositionPosts] PRIMARY KEY CLUSTERED 
(
	[EditMemberOppositionPost_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberOtherParliaments](
	[EditMemberOtherParliament_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[OtherParliament_Id] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberOtherParliaments] PRIMARY KEY CLUSTERED 
(
	[EditMemberOtherParliament_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberParliamentaryPosts](
	[EditMemberParliamentaryPost_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[ParliamentaryPost_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[EndNote] [nvarchar](max) NULL,
	[IsUnpaid] [bit] NOT NULL,
	[IsJoint] [bit] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
	[LayingMinisterName] [nvarchar](255) NULL,
 CONSTRAINT [PK_EditMemberParliamentaryPosts] PRIMARY KEY CLUSTERED 
(
	[EditMemberParliamentaryPost_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberParties](
	[EditMemberParty_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[Party_Id] [int] NOT NULL,
	[PartySubType_Id] [int] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[Notes] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
	[SitsOppositeSideToParty] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberParties] PRIMARY KEY CLUSTERED 
(
	[EditMemberParty_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberPhotoContent](
	[EditMemberPhotoContent_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMemberPhoto_Id] [int] NOT NULL,
	[Photo] [varbinary](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
	[PhotoFileName] [nvarchar](255) NULL,
	[PhotoMIMEType] [nvarchar](255) NULL,
 CONSTRAINT [PK_EditMemberPhotoContent] PRIMARY KEY CLUSTERED 
(
	[EditMemberPhotoContent_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberPhotoOutputs](
	[EditMemberPhotoOutput_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMemberPhoto_Id] [int] NOT NULL,
	[PhotoOutput_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberPhotoOutputs] PRIMARY KEY CLUSTERED 
(
	[EditMemberPhotoOutput_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberPhotos](
	[EditMemberPhoto_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[PhotoSource] [nvarchar](255) NULL,
	[Copyright] [nvarchar](255) NULL,
	[Attribution] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[IsDefault] [bit] NOT NULL,
	[IsHiRes] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
	[PublishExternally] [bit] NOT NULL,
	[UsePortraits] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberPhotos] PRIMARY KEY CLUSTERED 
(
	[EditMemberPhoto_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberPreferredNameHonouraryPrefixes](
	[EditMemberPreferredNameHonouraryPrefix_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMemberPreferredName_Id] [int] NOT NULL,
	[HonouraryPrefix_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberPreferredNameHonouraryPrefixes] PRIMARY KEY CLUSTERED 
(
	[EditMemberPreferredNameHonouraryPrefix_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberPreferredNames](
	[EditMemberPreferredName_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[Title_Id] [int] NULL,
	[Forename] [nvarchar](255) NULL,
	[MiddleNames] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NULL,
	[Suffix] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[AddressAs] [nvarchar](500) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[NameDisplayAs] [nvarchar](4000) NULL,
	[NameListAs] [nvarchar](4000) NULL,
	[NameFullTitle] [nvarchar](4000) NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberPreferredNames] PRIMARY KEY CLUSTERED 
(
	[EditMemberPreferredName_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberReferences](
	[EditMemberReference_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[ReferenceType_Id] [int] NOT NULL,
	[Reference] [nvarchar](255) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberReferences] PRIMARY KEY CLUSTERED 
(
	[EditMemberReference_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMembers](
	[EditMember_Id] [int] IDENTITY(1,1) NOT NULL,
	[Forename] [nvarchar](255) NOT NULL,
	[MiddleNames] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NOT NULL,
	[DateOfBirth] [date] NULL,
	[DateOfRetirement] [date] NULL,
	[DateOfDeath] [date] NULL,
	[TownOfBirth] [nvarchar](255) NULL,
	[BirthCountry_Id] [int] NULL,
	[Gender] [char](1) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[LockedBy] [nvarchar](255) NULL,
	[LockedWhen] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[NameDisplayAs] [nvarchar](4000) NULL,
	[NameListAs] [nvarchar](4000) NULL,
	[NameFullTitle] [nvarchar](4000) NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMember] PRIMARY KEY CLUSTERED 
(
	[EditMember_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberStaff](
	[EditMemberStaff_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[Title_Id] [int] NULL,
	[Forename] [nvarchar](255) NULL,
	[Middlenames] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[AddedWhen] [datetime] NOT NULL,
	[RemovedWhen] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberStaff] PRIMARY KEY CLUSTERED 
(
	[EditMemberStaff_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberStatuses](
	[EditMemberStatus_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMember_Id] [int] NOT NULL,
	[Status_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK_EditMemberExclusions] PRIMARY KEY CLUSTERED 
(
	[EditMemberStatus_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditMemberSuspensions](
	[EditMemberSuspension_Id] [int] IDENTITY(1,1) NOT NULL,
	[EditMemberStatus_Id] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Sitting] [bit] NOT NULL,
	[ReasonUrl] [nvarchar](255) NULL,
	[Reason] [nvarchar](max) NULL,
	[HansardUrl] [nvarchar](255) NULL,
	[Hansard] [nvarchar](255) NULL,
	[SittingDays] [int] NOT NULL,
	[CalendarDays] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsNewRow] [bit] NOT NULL,
 CONSTRAINT [PK__EditMemberSu__3F9406AF54CB950F] PRIMARY KEY CLUSTERED 
(
	[EditMemberSuspension_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Elections](
	[Election_Id] [int] IDENTITY(1,1) NOT NULL,
	[ElectionType_Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ElectionDate] [date] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_Elections] PRIMARY KEY CLUSTERED 
(
	[Election_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElectionTypes](
	[ElectionType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_ElectionTypes] PRIMARY KEY CLUSTERED 
(
	[ElectionType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EndReasons](
	[EndReason_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[EndDuringSession] [bit] NOT NULL,
	[IsCommons] [bit] NOT NULL,
	[IsLords] [bit] NOT NULL,
 CONSTRAINT [PK_EndReasons] PRIMARY KEY CLUSTERED 
(
	[EndReason_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntryTypes](
	[EntryType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_EntryTypes] PRIMARY KEY CLUSTERED 
(
	[EntryType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExperienceTypes](
	[ExperienceType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_ExperienceTypes] PRIMARY KEY CLUSTERED 
(
	[ExperienceType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GovernmentPostDepartments](
	[GovernmentPostDepartment_Id] [int] IDENTITY(1,1) NOT NULL,
	[GovernmentPost_Id] [int] NOT NULL,
	[Department_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_GovernmentPostDepartments] PRIMARY KEY CLUSTERED 
(
	[GovernmentPostDepartment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GovernmentPosts](
	[GovernmentPost_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[GovernmentRank_Id] [int] NULL,
	[Promoted] [bit] NOT NULL,
	[CabinetRank] [int] NULL,
	[Cabinet_Id] [int] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[HansardName] [nvarchar](max) NULL,
	[IsLayingMinister] [bit] NOT NULL,
	[CapitaliseForYellowList] [bit] NOT NULL,
	[YellowListName] [nvarchar](255) NULL,
 CONSTRAINT [PK_GovernmentPosts] PRIMARY KEY CLUSTERED 
(
	[GovernmentPost_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GovernmentRanks](
	[GovernmentRank_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[MinisterialRank] [int] NULL,
	[StatsRank] [nvarchar](255) NULL,
	[ClerksRank] [nvarchar](255) NULL,
	[OrderRank] [int] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK__Governme__C14A28471DE57479] PRIMARY KEY CLUSTERED 
(
	[GovernmentRank_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HonouraryPrefixes](
	[HonouraryPrefix_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[IsCommons] [bit] NOT NULL,
	[IsLords] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[Prefix] [nvarchar](50) NULL,
	[PrefixOrder] [int] NULL,
	[PrefixAsSuffix] [bit] NOT NULL,
 CONSTRAINT [PK_HonouraryPrefixes] PRIMARY KEY CLUSTERED 
(
	[HonouraryPrefix_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HonouraryPrefixExcludeTitles](
	[HonouraryPrefixExcludeTitle_Id] [int] IDENTITY(1,1) NOT NULL,
	[HonouraryPrefix_Id] [int] NOT NULL,
	[Title_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_HonouraryPrefixExcludeTitles] PRIMARY KEY CLUSTERED 
(
	[HonouraryPrefixExcludeTitle_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HonourLists](
	[HonourList_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_HonourLists] PRIMARY KEY CLUSTERED 
(
	[HonourList_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Honours](
	[Honour_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Abbreviation] [nvarchar](255) NULL,
	[HonourType_Id] [int] NULL,
	[Rank] [int] NOT NULL,
	[IsPromoted] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_Honours] PRIMARY KEY CLUSTERED 
(
	[Honour_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HonourTypes](
	[HonourType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_HonourTypes] PRIMARY KEY CLUSTERED 
(
	[HonourType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Houses](
	[House_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_Houses] PRIMARY KEY CLUSTERED 
(
	[House_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterestCategories](
	[InterestCategory_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[SortOrder] [int] NOT NULL,
	[IsCommons] [bit] NOT NULL,
	[IsLords] [bit] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[CanHaveChildren] [bit] NOT NULL,
 CONSTRAINT [PK_InterestCategories] PRIMARY KEY CLUSTERED 
(
	[InterestCategory_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LordsMembershipTypes](
	[LordsMembershipType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Abbreviation] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[TypeDescriptor] [nvarchar](255) NULL,
	[OverviewDisplayOrder] [int] NULL,
 CONSTRAINT [PK_LordsTypes] PRIMARY KEY CLUSTERED 
(
	[LordsMembershipType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LordsRanks](
	[LordsRank_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Abbreviation] [nvarchar](10) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_LordsRanks] PRIMARY KEY CLUSTERED 
(
	[LordsRank_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberAddresses](
	[MemberAddress_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[AddressType_Id] [int] NOT NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[Address3] [nvarchar](255) NULL,
	[Address4] [nvarchar](255) NULL,
	[Address5] [nvarchar](255) NULL,
	[Postcode] [nvarchar](50) NULL,
	[OtherAddress] [nvarchar](max) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[IsPreferred] [bit] NOT NULL,
	[IsWeb] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[Fax] [varchar](50) NULL,
 CONSTRAINT [PK_MemberAddresses] PRIMARY KEY CLUSTERED 
(
	[MemberAddress_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberBiographies](
	[MemberBiography_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[BiographyCategory_Id] [int] NOT NULL,
	[Entry] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberBiographies] PRIMARY KEY CLUSTERED 
(
	[MemberBiography_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberCommitteeChairs](
	[MemberCommitteeChair_Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberCommittee_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberCommitteeChairs] PRIMARY KEY CLUSTERED 
(
	[MemberCommitteeChair_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberCommittees](
	[MemberCommittee_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[Committee_Id] [int] NOT NULL,
	[ExOfficio] [bit] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[EndNote] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsAlternate] [bit] NOT NULL,
	[IsCoOpted] [bit] NOT NULL,
 CONSTRAINT [PK_MemberCommittees] PRIMARY KEY CLUSTERED 
(
	[MemberCommittee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberConstituencies](
	[MemberConstituency_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[Constituency_Id] [int] NOT NULL,
	[EntryType_Id] [int] NOT NULL,
	[EndType_Id] [int] NULL,
	[Election_Id] [int] NOT NULL,
	[SwearInOrder] [int] NULL,
	[Title_Id] [int] NULL,
	[Forename] [nvarchar](255) NULL,
	[Middlenames] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[Notes] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsStandingDown] [bit] NOT NULL,
	[OathType] [int] NOT NULL,
	[OathDate] [date] NULL,
	[BatchId] [int] NULL,
 CONSTRAINT [PK_MemberConstituencies] PRIMARY KEY CLUSTERED 
(
	[MemberConstituency_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberDisqualifications](
	[MemberDisqualification_Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberStatus_Id] [int] NOT NULL,
	[DisqualificationType_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberDisqualification] PRIMARY KEY CLUSTERED 
(
	[MemberDisqualification_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberElectionsContested](
	[MemberElectionContested_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[Constituency_Id] [int] NOT NULL,
	[Election_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberElectionsContested] PRIMARY KEY CLUSTERED 
(
	[MemberElectionContested_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberExperiences](
	[MemberExperience_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[Experience_Id] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Organisation] [nvarchar](255) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[StartDateDay] [int] NULL,
	[StartDateMonth] [int] NULL,
	[StartDateYear] [int] NULL,
	[EndDateDay] [int] NULL,
	[EndDateMonth] [int] NULL,
	[EndDateYear] [int] NULL,
 CONSTRAINT [PK_MemberExperiences] PRIMARY KEY CLUSTERED 
(
	[MemberExperience_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberGovernmentPosts](
	[MemberGovernmentPost_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[GovernmentPost_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[EndNote] [nvarchar](max) NULL,
	[IsUnpaid] [bit] NOT NULL,
	[IsJoint] [bit] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[LayingMinisterName] [nvarchar](255) NULL,
	[Department_Id] [int] NULL,
 CONSTRAINT [PK_MemberGovernmentPosts] PRIMARY KEY CLUSTERED 
(
	[MemberGovernmentPost_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberHonours](
	[MemberHonour_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[Honour_Id] [int] NOT NULL,
	[HonourList_Id] [int] NULL,
	[OtherHonour] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberHonours] PRIMARY KEY CLUSTERED 
(
	[MemberHonour_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberHouseMemberships](
	[MemberHouseMembership_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[House_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[EndReason_Id] [int] NULL,
	[EndNotes] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberHouseMemberships] PRIMARY KEY CLUSTERED 
(
	[MemberHouseMembership_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberInterests](
	[MemberInterest_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[InterestCategory_Id] [int] NOT NULL,
	[Interest] [nvarchar](max) NULL,
	[InterestCreated] [datetime] NOT NULL,
	[InterestAmended] [datetime] NULL,
	[InterestDeleted] [datetime] NULL,
	[RegisteredLate] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[LastAmendment] [datetime] NULL,
	[LastAmendmentType] [char](1) NULL,
	[IsCorrection] [bit] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[CommonsRegisterPublication_Id] [int] NULL,
	[ParentMemberInterest_Id] [int] NULL,
	[ShowCreatedDate] [bit] NOT NULL,
	[RMFIAppId] [int] NULL,
	[HighlightAmendment] [bit] NULL,
 CONSTRAINT [PK_MemberInterests] PRIMARY KEY CLUSTERED 
(
	[MemberInterest_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberInterestsPending](
	[MemberInterestPending_Id] [int] NOT NULL,
	[Member_Id] [int] NOT NULL,
	[InterestCategory_Id] [int] NOT NULL,
	[Interest] [nvarchar](max) NULL,
	[InterestCreated] [datetime] NOT NULL,
	[InterestAmended] [datetime] NULL,
	[InterestDeleted] [datetime] NULL,
	[RegisteredLate] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[LastAmendment] [datetime] NULL,
	[LastAmendmentType] [char](1) NULL,
	[IsCorrection] [bit] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[IsNewInterest] [bit] NOT NULL,
	[CommonsRegisterPublication_Id] [int] NULL,
	[ParentMemberInterestPending_Id] [int] NULL,
	[ShowCreatedDate] [bit] NOT NULL,
 CONSTRAINT [PK_MemberInterestsPending] PRIMARY KEY CLUSTERED 
(
	[MemberInterestPending_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberKnownAs](
	[MemberKnownAs_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[MiddleNames] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberKnownAs] PRIMARY KEY CLUSTERED 
(
	[MemberKnownAs_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberLeaveOfAbsence](
	[MemberLeaveOfAbsence_Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberStatus_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberLeaveOfAbsence] PRIMARY KEY CLUSTERED 
(
	[MemberLeaveOfAbsence_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberLordsMembershipTypes](
	[MemberLordsMembershipType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[LordsMembershipType_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberLordsMembershipTypes] PRIMARY KEY CLUSTERED 
(
	[MemberLordsMembershipType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberLordsPreferredNames](
	[LordsPreferredName_Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberPreferredName_Id] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[LordsRank_Id] [int] NOT NULL,
	[UseOf] [bit] NOT NULL,
	[UseThe] [bit] NOT NULL,
	[Prenominal] [nvarchar](50) NULL,
	[Cardinality] [int] NULL,
	[IsPrimaryTitle] [bit] NOT NULL,
	[IsKnownAs] [bit] NOT NULL,
	[IsByVirtue] [bit] NOT NULL,
	[SitsAs] [nvarchar](255) NULL,
	[IsOtherTitle] [bit] NOT NULL,
	[OtherTitle] [nvarchar](255) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[DateOfAnnouncement] [date] NULL,
	[DateOfIntroduction] [date] NULL,
	[DateOfWrit] [date] NULL,
	[IsWritAM] [bit] NOT NULL,
 CONSTRAINT [PK_LordsPreferredNames] PRIMARY KEY CLUSTERED 
(
	[LordsPreferredName_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberMaidenSpeeches](
	[MemberMaidenSpeech_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[SpeechDate] [date] NOT NULL,
	[Hansard] [nvarchar](255) NULL,
	[Subject] [nvarchar](max) NULL,
	[House_Id] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[Url] [varchar](256) NULL,
 CONSTRAINT [PK_MemberMaidenSpeeches] PRIMARY KEY CLUSTERED 
(
	[MemberMaidenSpeech_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberOaths](
	[LordsOath_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[OathDate] [date] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[OathType] [int] NOT NULL,
	[SwearInOrder] [int] NULL,
	[BatchId] [int] NULL,
 CONSTRAINT [PK_LordsOaths] PRIMARY KEY CLUSTERED 
(
	[LordsOath_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberObituaries](
	[MemberObituary_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[ObituaryUrl] [nvarchar](255) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberObituaries] PRIMARY KEY CLUSTERED 
(
	[MemberObituary_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberOppositionPosts](
	[MemberOppositionPost_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[OppositionPost_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[EndNote] [nvarchar](max) NULL,
	[IsUnpaid] [bit] NOT NULL,
	[IsJoint] [bit] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberOppositionPosts] PRIMARY KEY CLUSTERED 
(
	[MemberOppositionPost_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberOtherParliaments](
	[MemberOtherParliament_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[OtherParliament_Id] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberOtherParliaments] PRIMARY KEY CLUSTERED 
(
	[MemberOtherParliament_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberParliamentaryPosts](
	[MemberParliamentaryPost_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[ParliamentaryPost_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[EndNote] [nvarchar](max) NULL,
	[IsUnpaid] [bit] NOT NULL,
	[IsJoint] [bit] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[LayingMinisterName] [nvarchar](255) NULL,
 CONSTRAINT [PK_MemberParliamentaryPosts] PRIMARY KEY CLUSTERED 
(
	[MemberParliamentaryPost_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberParties](
	[MemberParty_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[Party_Id] [int] NOT NULL,
	[PartySubType_Id] [int] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[Notes] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[SitsOppositeSideToParty] [bit] NOT NULL,
 CONSTRAINT [PK_MemberParties] PRIMARY KEY CLUSTERED 
(
	[MemberParty_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPhotoContent](
	[MemberPhotoContent_Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberPhoto_Id] [int] NOT NULL,
	[Photo] [varbinary](max) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[PhotoMIMEType] [nvarchar](255) NULL,
	[PhotoFileName] [nvarchar](255) NULL,
 CONSTRAINT [PK_MemberPhotoContent] PRIMARY KEY CLUSTERED 
(
	[MemberPhotoContent_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPhotoOutputs](
	[MemberPhotoOutput_Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberPhoto_Id] [int] NOT NULL,
	[PhotoOutput_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberPhotoOutputs] PRIMARY KEY CLUSTERED 
(
	[MemberPhotoOutput_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPhotos](
	[MemberPhoto_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[PhotoSource] [nvarchar](255) NULL,
	[Copyright] [nvarchar](255) NULL,
	[Attribution] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[IsDefault] [bit] NOT NULL,
	[IsHiRes] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[PublishExternally] [bit] NOT NULL,
	[UsePortraits] [bit] NOT NULL,
 CONSTRAINT [PK_MemberPhotos] PRIMARY KEY CLUSTERED 
(
	[MemberPhoto_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPreferredNameHonouraryPrefixes](
	[MemberPreferredNameHonouraryPrefix_Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberPreferredName_Id] [int] NOT NULL,
	[HonouraryPrefix_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_CommonsPreferredNameHonouraryPrefixes] PRIMARY KEY CLUSTERED 
(
	[MemberPreferredNameHonouraryPrefix_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPreferredNames](
	[MemberPreferredName_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[Title_Id] [int] NULL,
	[Forename] [nvarchar](255) NULL,
	[MiddleNames] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NULL,
	[Suffix] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[AddressAs] [nvarchar](500) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[NameDisplayAs] [nvarchar](4000) NULL,
	[NameListAs] [nvarchar](4000) NULL,
	[NameFullTitle] [nvarchar](4000) NULL,
 CONSTRAINT [PK_CommonsPreferredNames] PRIMARY KEY CLUSTERED 
(
	[MemberPreferredName_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberReferences](
	[MemberReference_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[ReferenceType_Id] [int] NOT NULL,
	[Reference] [nvarchar](255) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberReferences] PRIMARY KEY CLUSTERED 
(
	[MemberReference_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Member_Id] [int] IDENTITY(1,1) NOT NULL,
	[Forename] [nvarchar](255) NOT NULL,
	[MiddleNames] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NOT NULL,
	[DateOfBirth] [date] NULL,
	[DateOfRetirement] [date] NULL,
	[DateOfDeath] [date] NULL,
	[TownOfBirth] [nvarchar](255) NULL,
	[BirthCountry_Id] [int] NULL,
	[Gender] [char](1) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[LockedBy] [nvarchar](255) NULL,
	[LockedWhen] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[NameDisplayAs] [nvarchar](4000) NULL,
	[NameListAs] [nvarchar](4000) NULL,
	[NameFullTitle] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[Member_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberStaff](
	[MemberStaff_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[Title_Id] [int] NULL,
	[Forename] [nvarchar](255) NULL,
	[Middlenames] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
	[AddedWhen] [datetime] NOT NULL,
	[RemovedWhen] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberStaff] PRIMARY KEY CLUSTERED 
(
	[MemberStaff_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberStatuses](
	[MemberStatus_Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_Id] [int] NOT NULL,
	[Status_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_MemberExclusions] PRIMARY KEY CLUSTERED 
(
	[MemberStatus_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberSuspensions](
	[MemberSuspension_Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberStatus_Id] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Sitting] [bit] NOT NULL,
	[ReasonUrl] [nvarchar](255) NULL,
	[Reason] [nvarchar](max) NULL,
	[HansardUrl] [nvarchar](255) NULL,
	[Hansard] [nvarchar](255) NULL,
	[SittingDays] [int] NOT NULL,
	[CalendarDays] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK__MemberSu__3F9406AF54CB950F] PRIMARY KEY CLUSTERED 
(
	[MemberSuspension_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OppositionPostDepartments](
	[OppositionPostDepartment_Id] [int] IDENTITY(1,1) NOT NULL,
	[OppositionPost_Id] [int] NOT NULL,
	[Department_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_OppositionPostDepartments] PRIMARY KEY CLUSTERED 
(
	[OppositionPostDepartment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OppositionPosts](
	[OppositionPost_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CabinetRank] [int] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[Promoted] [bit] NOT NULL,
	[Cabinet_Id] [int] NULL,
	[OppositionRank_Id] [int] NULL,
	[HansardName] [nvarchar](max) NULL,
	[CapitaliseForYellowList] [bit] NOT NULL,
	[YellowListName] [nvarchar](255) NULL,
 CONSTRAINT [PK_OppositionPosts] PRIMARY KEY CLUSTERED 
(
	[OppositionPost_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OppositionRanks](
	[OppositionRank_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[MinisterialRank] [int] NULL,
	[StatsRank] [nvarchar](255) NULL,
	[ClerksRank] [nvarchar](255) NULL,
	[OrderRank] [int] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK__Oppositi__39705AD325A75D29] PRIMARY KEY CLUSTERED 
(
	[OppositionRank_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtherParliaments](
	[OtherParliament_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ParliamentType_Id] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[Country_Id] [int] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_OtherParliaments] PRIMARY KEY CLUSTERED 
(
	[OtherParliament_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParliamentaryPosts](
	[ParliamentaryPost_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[ParliamentaryRank_Id] [int] NULL,
	[ExcludeFromCount] [bit] NOT NULL,
	[Promoted] [bit] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[IsCommons] [bit] NOT NULL,
	[IsLords] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[HansardName] [nvarchar](max) NULL,
	[IsLayingMinister] [bit] NOT NULL,
	[CapitaliseForYellowList] [bit] NOT NULL,
	[YellowListName] [nvarchar](255) NULL,
 CONSTRAINT [PK_ParliamentaryPosts] PRIMARY KEY CLUSTERED 
(
	[ParliamentaryPost_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParliamentaryRanks](
	[ParliamentaryRank_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[IsPromoted] [bit] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK__Parliame__3BBF9FB136B12243] PRIMARY KEY CLUSTERED 
(
	[ParliamentaryRank_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParliamentTypes](
	[ParliamentType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_ParliamentTypes] PRIMARY KEY CLUSTERED 
(
	[ParliamentType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parties](
	[Party_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Abbreviation] [nvarchar](50) NULL,
	[Initials] [nvarchar](50) NULL,
	[Colour] [nvarchar](10) NULL,
	[TextColour] [nvarchar](10) NULL,
	[LowResLogo] [varbinary](max) NULL,
	[HighResLogo] [varbinary](max) NULL,
	[IsCommons] [bit] NOT NULL,
	[IsLords] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[OldDISId] [int] NULL,
	[HoLMainParty] [bit] NOT NULL,
	[HoLOrder] [int] NULL,
	[HighResMIMEType] [varchar](255) NULL,
	[LowResMIMEType] [varchar](255) NULL,
	[HoL_IsSpiritualSide] [bit] NOT NULL,
	[IsGovernment] [bit] NOT NULL,
	[SupportGovernment] [bit] NOT NULL,
 CONSTRAINT [PK_Parties] PRIMARY KEY CLUSTERED 
(
	[Party_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartiesOfGovernment](
	[PartyGovernment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Party_Id] [int] NOT NULL,
	[GovernmentType] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_PartiesOfGovernment] PRIMARY KEY CLUSTERED 
(
	[PartyGovernment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartySubTypes](
	[PartySubType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Party_Id] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_PartySubTypes] PRIMARY KEY CLUSTERED 
(
	[PartySubType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotoOutputs](
	[PhotoOutput_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_PhotoOutputs] PRIMARY KEY CLUSTERED 
(
	[PhotoOutput_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceTypes](
	[ReferenceType_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_ReferenceTypes] PRIMARY KEY CLUSTERED 
(
	[ReferenceType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[Section_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED 
(
	[Section_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsSuspension] [bit] NOT NULL,
	[IsLeave] [bit] NOT NULL,
	[IsDisqualification] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[ChangePartyTo_Id] [int] NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[Subscription_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Frequency] [char](1) NOT NULL,
	[Day] [smallint] NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](512) NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[Subscription_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionTabList](
	[SubscriptionTabList_Id] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[IsCommons] [bit] NOT NULL,
	[IsLords] [bit] NOT NULL,
 CONSTRAINT [PK_SubscriptionTabList] PRIMARY KEY CLUSTERED 
(
	[SubscriptionTabList_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionTabs](
	[SubscriptionTab_Id] [int] IDENTITY(1,1) NOT NULL,
	[Subscription_Id] [int] NOT NULL,
	[SubscriptionTabList_Id] [int] NOT NULL,
	[IsCommons] [bit] NOT NULL,
	[IsLords] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_SubscriptionTabs] PRIMARY KEY CLUSTERED 
(
	[SubscriptionTab_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SwearingBatches](
	[SwearingBatch_Id] [int] IDENTITY(1,1) NOT NULL,
	[House_Id] [int] NOT NULL,
	[BatchDate] [date] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[IsSubmitted] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_SwearingBatches] PRIMARY KEY CLUSTERED 
(
	[SwearingBatch_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SwearingMembers](
	[SwearingMember_Id] [int] IDENTITY(1,1) NOT NULL,
	[SwearingBatch_Id] [int] NOT NULL,
	[Member_Id] [int] NOT NULL,
	[SwearingOrder] [int] NOT NULL,
	[OathType] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_SwearingMembers] PRIMARY KEY CLUSTERED 
(
	[SwearingMember_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[Title_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[Title_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[UserLogin_Id] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](255) NOT NULL,
	[UserRole_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[UserLogin_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPermissions](
	[UserPermission_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_UserPermissions] PRIMARY KEY CLUSTERED 
(
	[UserPermission_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRolePermissions](
	[UserRolePermission_Id] [int] IDENTITY(1,1) NOT NULL,
	[UserRole_Id] [int] NOT NULL,
	[UserPermission_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_UserRolePermissions] PRIMARY KEY CLUSTERED 
(
	[UserRolePermission_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRole_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRole_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleSections](
	[UserRoleSection_Id] [int] IDENTITY(1,1) NOT NULL,
	[UserRole_Id] [int] NOT NULL,
	[Section_Id] [int] NOT NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedWhen] [datetime] NULL,
 CONSTRAINT [PK_UserRoleSections] PRIMARY KEY CLUSTERED 
(
	[UserRoleSection_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AddressTypes] ADD  CONSTRAINT [DF_Table_1_SimpleFormat]  DEFAULT ((0)) FOR [IsPhysicalAddress]
GO
ALTER TABLE [dbo].[BiographyCategories] ADD  CONSTRAINT [DF_BiographyCategories_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[BiographyCategories] ADD  CONSTRAINT [DF_BiographyCategories_IsCommons]  DEFAULT ((0)) FOR [IsCommons]
GO
ALTER TABLE [dbo].[BiographyCategories] ADD  CONSTRAINT [DF_BiographyCategories_IsLords]  DEFAULT ((0)) FOR [IsLords]
GO
ALTER TABLE [dbo].[Cabinets] ADD  CONSTRAINT [DF__Cabinets__IsGove__7D996BCF]  DEFAULT ((1)) FOR [IsGovernment]
GO
ALTER TABLE [dbo].[Cabinets] ADD  CONSTRAINT [DF__Cabinets__IsOppo__7E8D9008]  DEFAULT ((1)) FOR [IsOpposition]
GO
ALTER TABLE [dbo].[Committees] ADD  CONSTRAINT [DF__Committee__IsCom__172433A8]  DEFAULT ((0)) FOR [IsCommons]
GO
ALTER TABLE [dbo].[Committees] ADD  CONSTRAINT [DF__Committee__IsLor__181857E1]  DEFAULT ((0)) FOR [IsLords]
GO
ALTER TABLE [dbo].[ConstituencyResults] ADD  CONSTRAINT [DF__Constitue__IsNot__5F34E040]  DEFAULT ((0)) FOR [IsNotional]
GO
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [DF_Departments_Dep_Minister]  DEFAULT ((0)) FOR [Minister]
GO
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [DF_Departments_Dep_Secretary]  DEFAULT ((0)) FOR [Secretary]
GO
ALTER TABLE [dbo].[EditMemberAddresses] ADD  CONSTRAINT [DF_EditMemberAddresses_IsPreferred]  DEFAULT ((0)) FOR [IsPreferred]
GO
ALTER TABLE [dbo].[EditMemberAddresses] ADD  CONSTRAINT [DF_EditMemberAddresses_IsWeb]  DEFAULT ((1)) FOR [IsWeb]
GO
ALTER TABLE [dbo].[EditMemberAddresses] ADD  CONSTRAINT [DF__EditMembe__IsNew__2A962F78]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberBiographies] ADD  CONSTRAINT [DF__EditMembe__IsNew__2B8A53B1]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberCommitteeChairs] ADD  CONSTRAINT [DF__EditMembe__IsNew__2C7E77EA]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberCommittees] ADD  CONSTRAINT [DF_EditMemberCommittees_ExOfficio]  DEFAULT ((0)) FOR [ExOfficio]
GO
ALTER TABLE [dbo].[EditMemberCommittees] ADD  CONSTRAINT [DF__EditMembe__IsNew__2D729C23]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberCommittees] ADD  CONSTRAINT [DF__EditMembe__IsAlt__5E40BC07]  DEFAULT ((0)) FOR [IsAlternate]
GO
ALTER TABLE [dbo].[EditMemberCommittees] ADD  CONSTRAINT [DF__EditMembe__IsCoO__6E7723D0]  DEFAULT ((0)) FOR [IsCoOpted]
GO
ALTER TABLE [dbo].[EditMemberConstituencies] ADD  CONSTRAINT [DF__EditMembe__IsNew__2E66C05C]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberConstituencies] ADD  CONSTRAINT [DF__EditMembe__IsSta__64ADC274]  DEFAULT ((0)) FOR [IsStandingDown]
GO
ALTER TABLE [dbo].[EditMemberConstituencies] ADD  CONSTRAINT [DF__EditMembe__OathT__5A3B20F9]  DEFAULT ((0)) FOR [OathType]
GO
ALTER TABLE [dbo].[EditMemberDisqualifications] ADD  CONSTRAINT [DF__EditMembe__IsNew__2F5AE495]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberElectionsContested] ADD  CONSTRAINT [DF__EditMembe__IsNew__304F08CE]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberExperiences] ADD  CONSTRAINT [DF__EditMembe__IsNew__31432D07]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberGovernmentPosts] ADD  CONSTRAINT [DF__EditMembe__IsUnp__029D4CB7]  DEFAULT ((0)) FOR [IsUnpaid]
GO
ALTER TABLE [dbo].[EditMemberGovernmentPosts] ADD  CONSTRAINT [DF__EditMembe__IsJoi__039170F0]  DEFAULT ((0)) FOR [IsJoint]
GO
ALTER TABLE [dbo].[EditMemberGovernmentPosts] ADD  CONSTRAINT [DF__EditMembe__IsNew__32375140]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberHonours] ADD  CONSTRAINT [DF__EditMembe__IsNew__332B7579]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberHouseMemberships] ADD  CONSTRAINT [DF__EditMembe__IsNew__341F99B2]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberInterests] ADD  CONSTRAINT [DF_EditMemberInterests_RegisteredLate]  DEFAULT ((0)) FOR [RegisteredLate]
GO
ALTER TABLE [dbo].[EditMemberInterests] ADD  CONSTRAINT [DF__EditMembe__IsNew__3513BDEB]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberInterests] ADD  CONSTRAINT [DF__EditMembe__IsCor__3726EEE6]  DEFAULT ((0)) FOR [IsCorrection]
GO
ALTER TABLE [dbo].[EditMemberInterests] ADD  CONSTRAINT [DF__EditMembe__ShowC__4B2DE793]  DEFAULT ((1)) FOR [ShowCreatedDate]
GO
ALTER TABLE [dbo].[EditMemberKnownAs] ADD  CONSTRAINT [DF_EditMemberKnownAs_UpdatedWhen]  DEFAULT (getdate()) FOR [UpdatedWhen]
GO
ALTER TABLE [dbo].[EditMemberKnownAs] ADD  CONSTRAINT [DF_EditMemberKnownAs_IsNewRow]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberLeaveOfAbsence] ADD  CONSTRAINT [DF__EditMembe__IsNew__3607E224]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberLordsMembershipTypes] ADD  CONSTRAINT [DF__EditMembe__IsNew__36FC065D]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberLordsPreferredNames] ADD  CONSTRAINT [DF_EditMemberLordsPreferredNames_UseOf]  DEFAULT ((0)) FOR [UseOf]
GO
ALTER TABLE [dbo].[EditMemberLordsPreferredNames] ADD  CONSTRAINT [DF_EditMemberLordsPreferredNames_UseThe]  DEFAULT ((0)) FOR [UseThe]
GO
ALTER TABLE [dbo].[EditMemberLordsPreferredNames] ADD  CONSTRAINT [DF_EditMemberLordsPreferredNames_IsPrimaryTitle]  DEFAULT ((0)) FOR [IsPrimaryTitle]
GO
ALTER TABLE [dbo].[EditMemberLordsPreferredNames] ADD  CONSTRAINT [DF_EditMemberLordsPreferredNames_IsKnownAd]  DEFAULT ((0)) FOR [IsKnownAs]
GO
ALTER TABLE [dbo].[EditMemberLordsPreferredNames] ADD  CONSTRAINT [DF_EditMemberLordsPreferredNames_IsByVirtue]  DEFAULT ((0)) FOR [IsByVirtue]
GO
ALTER TABLE [dbo].[EditMemberLordsPreferredNames] ADD  CONSTRAINT [DF_EditMemberLordsPreferredNames_IsOtherTitle]  DEFAULT ((0)) FOR [IsOtherTitle]
GO
ALTER TABLE [dbo].[EditMemberLordsPreferredNames] ADD  CONSTRAINT [DF__EditMembe__IsNew__37F02A96]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberLordsPreferredNames] ADD  CONSTRAINT [DF__EditMembe__IsWri__1353A2C4]  DEFAULT ((0)) FOR [IsWritAM]
GO
ALTER TABLE [dbo].[EditMemberMaidenSpeeches] ADD  CONSTRAINT [DF__EditMembe__IsNew__38E44ECF]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberOaths] ADD  CONSTRAINT [DF__EditMembe__IsNew__39D87308]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberOaths] ADD  CONSTRAINT [DF__EditMembe__OathT__5B2F4532]  DEFAULT ((0)) FOR [OathType]
GO
ALTER TABLE [dbo].[EditMemberObituaries] ADD  CONSTRAINT [DF__EditMembe__IsNew__3ACC9741]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberOppositionPosts] ADD  CONSTRAINT [DF__EditMembe__IsUnp__0B3292B8]  DEFAULT ((0)) FOR [IsUnpaid]
GO
ALTER TABLE [dbo].[EditMemberOppositionPosts] ADD  CONSTRAINT [DF__EditMembe__IsJoi__0C26B6F1]  DEFAULT ((0)) FOR [IsJoint]
GO
ALTER TABLE [dbo].[EditMemberOppositionPosts] ADD  CONSTRAINT [DF__EditMembe__IsNew__3BC0BB7A]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberOtherParliaments] ADD  CONSTRAINT [DF__EditMembe__IsNew__3CB4DFB3]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberParliamentaryPosts] ADD  CONSTRAINT [DF__EditMemberPar__IsUnp__5AD97420]  DEFAULT ((0)) FOR [IsUnpaid]
GO
ALTER TABLE [dbo].[EditMemberParliamentaryPosts] ADD  CONSTRAINT [DF__EditMemberPar__IsJoi__5BCD9859]  DEFAULT ((0)) FOR [IsJoint]
GO
ALTER TABLE [dbo].[EditMemberParliamentaryPosts] ADD  CONSTRAINT [DF__EditMembe__IsNew__3DA903EC]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberParties] ADD  CONSTRAINT [DF__EditMembe__IsNew__3E9D2825]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberParties] ADD  CONSTRAINT [DF__EditMembe__SitsO__5887E2B1]  DEFAULT ((0)) FOR [SitsOppositeSideToParty]
GO
ALTER TABLE [dbo].[EditMemberPhotoContent] ADD  CONSTRAINT [DF__EditMembe__IsNew__3F914C5E]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberPhotoOutputs] ADD  CONSTRAINT [DF__EditMembe__IsNew__40857097]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberPhotos] ADD  CONSTRAINT [DF_EditMemberPhotos_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[EditMemberPhotos] ADD  CONSTRAINT [DF_EditMemberPhotos_IsHiRes]  DEFAULT ((1)) FOR [IsHiRes]
GO
ALTER TABLE [dbo].[EditMemberPhotos] ADD  CONSTRAINT [DF__EditMembe__IsNew__417994D0]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberPhotos] ADD  DEFAULT ((0)) FOR [UsePortraits]
GO
ALTER TABLE [dbo].[EditMemberPreferredNameHonouraryPrefixes] ADD  CONSTRAINT [DF__EditMembe__IsNew__426DB909]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberPreferredNames] ADD  CONSTRAINT [DF__EditMembe__IsNew__4361DD42]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberReferences] ADD  CONSTRAINT [DF__EditMembe__IsNew__4456017B]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMembers] ADD  CONSTRAINT [DF__EditMembe__IsNew__454A25B4]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberStaff] ADD  CONSTRAINT [DF_EditMemberStaff_AddedWhen]  DEFAULT (getdate()) FOR [AddedWhen]
GO
ALTER TABLE [dbo].[EditMemberStaff] ADD  CONSTRAINT [DF__EditMembe__IsNew__463E49ED]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberStatuses] ADD  CONSTRAINT [DF__EditMembe__IsNew__47326E26]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EditMemberSuspensions] ADD  CONSTRAINT [DF__EditMembe__IsNew__4826925F]  DEFAULT ((1)) FOR [IsNewRow]
GO
ALTER TABLE [dbo].[EndReasons] ADD  CONSTRAINT [DF__EndReason__EndDu__65A1E6AD]  DEFAULT ((1)) FOR [EndDuringSession]
GO
ALTER TABLE [dbo].[EndReasons] ADD  CONSTRAINT [DF__EndReason__IsCom__0B287117]  DEFAULT ((1)) FOR [IsCommons]
GO
ALTER TABLE [dbo].[EndReasons] ADD  CONSTRAINT [DF__EndReason__IsLor__0C1C9550]  DEFAULT ((1)) FOR [IsLords]
GO
ALTER TABLE [dbo].[GovernmentPosts] ADD  CONSTRAINT [DF_GovernmentPosts_GovPost_Promoted]  DEFAULT ((0)) FOR [Promoted]
GO
ALTER TABLE [dbo].[GovernmentPosts] ADD  CONSTRAINT [DF__Governmen__IsLay__597C06EA]  DEFAULT ((0)) FOR [IsLayingMinister]
GO
ALTER TABLE [dbo].[GovernmentPosts] ADD  CONSTRAINT [DF__Governmen__Capit__6B9AB725]  DEFAULT ((0)) FOR [CapitaliseForYellowList]
GO
ALTER TABLE [dbo].[HonouraryPrefixes] ADD  CONSTRAINT [DF_HonouraryPrefixes_IsCommons]  DEFAULT ((0)) FOR [IsCommons]
GO
ALTER TABLE [dbo].[HonouraryPrefixes] ADD  CONSTRAINT [DF_HonouraryPrefixes_IsLords]  DEFAULT ((0)) FOR [IsLords]
GO
ALTER TABLE [dbo].[HonouraryPrefixes] ADD  CONSTRAINT [DF__Honourary__Prefi__21A1C21B]  DEFAULT ((0)) FOR [PrefixAsSuffix]
GO
ALTER TABLE [dbo].[Honours] ADD  CONSTRAINT [DF_Honours_Rank]  DEFAULT ((0)) FOR [Rank]
GO
ALTER TABLE [dbo].[Honours] ADD  CONSTRAINT [DF_Honours_IsPromoted]  DEFAULT ((0)) FOR [IsPromoted]
GO
ALTER TABLE [dbo].[InterestCategories] ADD  CONSTRAINT [DF_InterestCategories_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[InterestCategories] ADD  CONSTRAINT [DF_InterestCategories_IsCommons]  DEFAULT ((0)) FOR [IsCommons]
GO
ALTER TABLE [dbo].[InterestCategories] ADD  CONSTRAINT [DF_InterestCategories_IsLords]  DEFAULT ((0)) FOR [IsLords]
GO
ALTER TABLE [dbo].[InterestCategories] ADD  CONSTRAINT [DF__InterestC__CanHa__45750E3D]  DEFAULT ((0)) FOR [CanHaveChildren]
GO
ALTER TABLE [dbo].[MemberAddresses] ADD  CONSTRAINT [DF_MemberAddresses_IsPreferred]  DEFAULT ((0)) FOR [IsPreferred]
GO
ALTER TABLE [dbo].[MemberAddresses] ADD  CONSTRAINT [DF_MemberAddresses_IsWeb]  DEFAULT ((1)) FOR [IsWeb]
GO
ALTER TABLE [dbo].[MemberCommittees] ADD  CONSTRAINT [DF_MemberCommittees_ExOfficio]  DEFAULT ((0)) FOR [ExOfficio]
GO
ALTER TABLE [dbo].[MemberCommittees] ADD  CONSTRAINT [DF__MemberCom__IsAlt__5D4C97CE]  DEFAULT ((0)) FOR [IsAlternate]
GO
ALTER TABLE [dbo].[MemberCommittees] ADD  CONSTRAINT [DF__MemberCom__IsCoO__6F6B4809]  DEFAULT ((0)) FOR [IsCoOpted]
GO
ALTER TABLE [dbo].[MemberConstituencies] ADD  CONSTRAINT [DF__MemberCon__IsSta__63B99E3B]  DEFAULT ((0)) FOR [IsStandingDown]
GO
ALTER TABLE [dbo].[MemberConstituencies] ADD  CONSTRAINT [DF__MemberCon__OathT__4DD54A14]  DEFAULT ((0)) FOR [OathType]
GO
ALTER TABLE [dbo].[MemberGovernmentPosts] ADD  CONSTRAINT [DF__MemberGov__IsUnp__5708E33C]  DEFAULT ((0)) FOR [IsUnpaid]
GO
ALTER TABLE [dbo].[MemberGovernmentPosts] ADD  CONSTRAINT [DF__MemberGov__IsJoi__57FD0775]  DEFAULT ((0)) FOR [IsJoint]
GO
ALTER TABLE [dbo].[MemberInterests] ADD  CONSTRAINT [DF_MemberInterests_RegisteredLate]  DEFAULT ((0)) FOR [RegisteredLate]
GO
ALTER TABLE [dbo].[MemberInterests] ADD  CONSTRAINT [DF__MemberInt__IsCor__3632CAAD]  DEFAULT ((0)) FOR [IsCorrection]
GO
ALTER TABLE [dbo].[MemberInterests] ADD  CONSTRAINT [DF__MemberInt__ShowC__4A39C35A]  DEFAULT ((1)) FOR [ShowCreatedDate]
GO
ALTER TABLE [dbo].[MemberInterestsPending] ADD  CONSTRAINT [DF__MemberInt__ShowC__4C220BCC]  DEFAULT ((1)) FOR [ShowCreatedDate]
GO
ALTER TABLE [dbo].[MemberKnownAs] ADD  CONSTRAINT [DF_MemberKnownAs_UpdatedWhen]  DEFAULT (getdate()) FOR [UpdatedWhen]
GO
ALTER TABLE [dbo].[MemberLordsPreferredNames] ADD  CONSTRAINT [DF_LordsPreferredNames_UseOf]  DEFAULT ((0)) FOR [UseOf]
GO
ALTER TABLE [dbo].[MemberLordsPreferredNames] ADD  CONSTRAINT [DF_LordsPreferredNames_UseThe]  DEFAULT ((0)) FOR [UseThe]
GO
ALTER TABLE [dbo].[MemberLordsPreferredNames] ADD  CONSTRAINT [DF_LordsPreferredNames_IsPrimaryTitle]  DEFAULT ((0)) FOR [IsPrimaryTitle]
GO
ALTER TABLE [dbo].[MemberLordsPreferredNames] ADD  CONSTRAINT [DF_Table_1_IsKnownAd]  DEFAULT ((0)) FOR [IsKnownAs]
GO
ALTER TABLE [dbo].[MemberLordsPreferredNames] ADD  CONSTRAINT [DF_LordsPreferredNames_IsByVirtue]  DEFAULT ((0)) FOR [IsByVirtue]
GO
ALTER TABLE [dbo].[MemberLordsPreferredNames] ADD  CONSTRAINT [DF_LordsPreferredNames_IsOtherTitle]  DEFAULT ((0)) FOR [IsOtherTitle]
GO
ALTER TABLE [dbo].[MemberLordsPreferredNames] ADD  CONSTRAINT [DF__MemberLor__IsWri__125F7E8B]  DEFAULT ((0)) FOR [IsWritAM]
GO
ALTER TABLE [dbo].[MemberOaths] ADD  CONSTRAINT [DF__MemberOat__OathT__4EC96E4D]  DEFAULT ((0)) FOR [OathType]
GO
ALTER TABLE [dbo].[MemberOppositionPosts] ADD  CONSTRAINT [DF__MemberOpp__IsUnp__58F12BAE]  DEFAULT ((0)) FOR [IsUnpaid]
GO
ALTER TABLE [dbo].[MemberOppositionPosts] ADD  CONSTRAINT [DF__MemberOpp__IsJoi__59E54FE7]  DEFAULT ((0)) FOR [IsJoint]
GO
ALTER TABLE [dbo].[MemberParliamentaryPosts] ADD  CONSTRAINT [DF__MemberPar__IsUnp__5AD97420]  DEFAULT ((0)) FOR [IsUnpaid]
GO
ALTER TABLE [dbo].[MemberParliamentaryPosts] ADD  CONSTRAINT [DF__MemberPar__IsJoi__5BCD9859]  DEFAULT ((0)) FOR [IsJoint]
GO
ALTER TABLE [dbo].[MemberParties] ADD  CONSTRAINT [DF__MemberPar__SitsO__5793BE78]  DEFAULT ((0)) FOR [SitsOppositeSideToParty]
GO
ALTER TABLE [dbo].[MemberPhotos] ADD  CONSTRAINT [DF_MemberPhotos_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[MemberPhotos] ADD  CONSTRAINT [DF_MemberPhotos_IsHiRes]  DEFAULT ((1)) FOR [IsHiRes]
GO
ALTER TABLE [dbo].[MemberPhotos] ADD  DEFAULT ((0)) FOR [UsePortraits]
GO
ALTER TABLE [dbo].[MemberStaff] ADD  CONSTRAINT [DF_MemberStaff_AddedWhen]  DEFAULT (getdate()) FOR [AddedWhen]
GO
ALTER TABLE [dbo].[OppositionPosts] ADD  CONSTRAINT [DF__Oppositio__Promo__33F4B129]  DEFAULT ((0)) FOR [Promoted]
GO
ALTER TABLE [dbo].[OppositionPosts] ADD  CONSTRAINT [DF__Oppositio__Capit__6C8EDB5E]  DEFAULT ((0)) FOR [CapitaliseForYellowList]
GO
ALTER TABLE [dbo].[ParliamentaryPosts] ADD  CONSTRAINT [DF_ParliamentaryPosts_ParlPost_ExcludeFromCount]  DEFAULT ((0)) FOR [ExcludeFromCount]
GO
ALTER TABLE [dbo].[ParliamentaryPosts] ADD  CONSTRAINT [DF_ParliamentaryPosts_ParlPost_Promoted]  DEFAULT ((0)) FOR [Promoted]
GO
ALTER TABLE [dbo].[ParliamentaryPosts] ADD  CONSTRAINT [DF_ParliamentaryPosts_IsCommons]  DEFAULT ((0)) FOR [IsCommons]
GO
ALTER TABLE [dbo].[ParliamentaryPosts] ADD  CONSTRAINT [DF_ParliamentaryPosts_IsLords]  DEFAULT ((0)) FOR [IsLords]
GO
ALTER TABLE [dbo].[ParliamentaryPosts] ADD  CONSTRAINT [DF__Parliamen__IsLay__62114CEB]  DEFAULT ((0)) FOR [IsLayingMinister]
GO
ALTER TABLE [dbo].[ParliamentaryPosts] ADD  CONSTRAINT [DF__Parliamen__Capit__6D82FF97]  DEFAULT ((0)) FOR [CapitaliseForYellowList]
GO
ALTER TABLE [dbo].[Parties] ADD  CONSTRAINT [DF_Parties_IsCommons]  DEFAULT ((1)) FOR [IsCommons]
GO
ALTER TABLE [dbo].[Parties] ADD  CONSTRAINT [DF_Parties_IsLords]  DEFAULT ((1)) FOR [IsLords]
GO
ALTER TABLE [dbo].[Parties] ADD  CONSTRAINT [DF__Parties__HoLMain__384F51F2]  DEFAULT ((1)) FOR [HoLMainParty]
GO
ALTER TABLE [dbo].[Parties] ADD  CONSTRAINT [DF__Parties__HoL_IsS__569F9A3F]  DEFAULT ((0)) FOR [HoL_IsSpiritualSide]
GO
ALTER TABLE [dbo].[Parties] ADD  DEFAULT ((0)) FOR [IsGovernment]
GO
ALTER TABLE [dbo].[Parties] ADD  DEFAULT ((0)) FOR [SupportGovernment]
GO
ALTER TABLE [dbo].[Statuses] ADD  CONSTRAINT [DF_ExclusionTypes_IsSuspension]  DEFAULT ((0)) FOR [IsSuspension]
GO
ALTER TABLE [dbo].[Statuses] ADD  CONSTRAINT [DF_ExclusionTypes_IsLeave]  DEFAULT ((0)) FOR [IsLeave]
GO
ALTER TABLE [dbo].[Statuses] ADD  CONSTRAINT [DF_ExclusionTypes_IsDisqualification]  DEFAULT ((0)) FOR [IsDisqualification]
GO
ALTER TABLE [dbo].[Statuses] ADD  CONSTRAINT [DF__Statuses__IsActi__26CFC035]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AnsweringBodies]  WITH NOCHECK ADD  CONSTRAINT [FK_AnsweringBodies_Departments] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Departments] ([Department_Id])
GO
ALTER TABLE [dbo].[AnsweringBodies] CHECK CONSTRAINT [FK_AnsweringBodies_Departments]
GO
ALTER TABLE [dbo].[Areas]  WITH NOCHECK ADD  CONSTRAINT [FK_Areas_AreaTypes] FOREIGN KEY([AreaType_Id])
REFERENCES [dbo].[AreaTypes] ([AreaType_Id])
GO
ALTER TABLE [dbo].[Areas] CHECK CONSTRAINT [FK_Areas_AreaTypes]
GO
ALTER TABLE [dbo].[CommitteeClerks]  WITH NOCHECK ADD  CONSTRAINT [FK_CommitteeClerks_Committees] FOREIGN KEY([Committee_Id])
REFERENCES [dbo].[Committees] ([Committee_Id])
GO
ALTER TABLE [dbo].[CommitteeClerks] CHECK CONSTRAINT [FK_CommitteeClerks_Committees]
GO
ALTER TABLE [dbo].[CommitteeLayMembers]  WITH NOCHECK ADD  CONSTRAINT [FK_CommitteeLayMembers_Committees] FOREIGN KEY([Committee_Id])
REFERENCES [dbo].[Committees] ([Committee_Id])
GO
ALTER TABLE [dbo].[CommitteeLayMembers] CHECK CONSTRAINT [FK_CommitteeLayMembers_Committees]
GO
ALTER TABLE [dbo].[CommitteeLayMembers]  WITH NOCHECK ADD  CONSTRAINT [FK_CommitteeLayMembers_Titles] FOREIGN KEY([Title_Id])
REFERENCES [dbo].[Titles] ([Title_Id])
GO
ALTER TABLE [dbo].[CommitteeLayMembers] CHECK CONSTRAINT [FK_CommitteeLayMembers_Titles]
GO
ALTER TABLE [dbo].[Committees]  WITH NOCHECK ADD  CONSTRAINT [FK_Committees_Committees] FOREIGN KEY([ParentCommittee_Id])
REFERENCES [dbo].[Committees] ([Committee_Id])
GO
ALTER TABLE [dbo].[Committees] CHECK CONSTRAINT [FK_Committees_Committees]
GO
ALTER TABLE [dbo].[Committees]  WITH NOCHECK ADD  CONSTRAINT [FK_Committees_Committees1] FOREIGN KEY([CreatedFromCommittee_Id])
REFERENCES [dbo].[Committees] ([Committee_Id])
GO
ALTER TABLE [dbo].[Committees] CHECK CONSTRAINT [FK_Committees_Committees1]
GO
ALTER TABLE [dbo].[Committees]  WITH NOCHECK ADD  CONSTRAINT [FK_Committees_CommitteeTypes] FOREIGN KEY([CommitteeType_Id])
REFERENCES [dbo].[CommitteeTypes] ([CommitteeType_Id])
GO
ALTER TABLE [dbo].[Committees] CHECK CONSTRAINT [FK_Committees_CommitteeTypes]
GO
ALTER TABLE [dbo].[Constituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_Constituencies_Constituencies] FOREIGN KEY([CreatedFromConstituency_Id])
REFERENCES [dbo].[Constituencies] ([Constituency_Id])
GO
ALTER TABLE [dbo].[Constituencies] CHECK CONSTRAINT [FK_Constituencies_Constituencies]
GO
ALTER TABLE [dbo].[Constituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_Constituencies_ConstituencyTypes] FOREIGN KEY([ConstituencyType_Id])
REFERENCES [dbo].[ConstituencyTypes] ([ConstituencyType_Id])
GO
ALTER TABLE [dbo].[Constituencies] CHECK CONSTRAINT [FK_Constituencies_ConstituencyTypes]
GO
ALTER TABLE [dbo].[ConstituencyAreas]  WITH NOCHECK ADD  CONSTRAINT [FK_ConstituencyAreas_Areas] FOREIGN KEY([Area_Id])
REFERENCES [dbo].[Areas] ([Area_Id])
GO
ALTER TABLE [dbo].[ConstituencyAreas] CHECK CONSTRAINT [FK_ConstituencyAreas_Areas]
GO
ALTER TABLE [dbo].[ConstituencyAreas]  WITH NOCHECK ADD  CONSTRAINT [FK_ConstituencyAreas_Constituencies] FOREIGN KEY([Constituency_Id])
REFERENCES [dbo].[Constituencies] ([Constituency_Id])
GO
ALTER TABLE [dbo].[ConstituencyAreas] CHECK CONSTRAINT [FK_ConstituencyAreas_Constituencies]
GO
ALTER TABLE [dbo].[ConstituencyCandidates]  WITH NOCHECK ADD  CONSTRAINT [FK_ConstituencyCandidates_ConstituencyResults] FOREIGN KEY([ConstituencyResult_Id])
REFERENCES [dbo].[ConstituencyResults] ([ConstituencyResult_Id])
GO
ALTER TABLE [dbo].[ConstituencyCandidates] CHECK CONSTRAINT [FK_ConstituencyCandidates_ConstituencyResults]
GO
ALTER TABLE [dbo].[ConstituencyCandidates]  WITH NOCHECK ADD  CONSTRAINT [FK_ConstituencyCandidates_Members] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[ConstituencyCandidates] CHECK CONSTRAINT [FK_ConstituencyCandidates_Members]
GO
ALTER TABLE [dbo].[ConstituencyCandidates]  WITH NOCHECK ADD  CONSTRAINT [FK_ConstituencyCandidates_Parties] FOREIGN KEY([Party_Id])
REFERENCES [dbo].[Parties] ([Party_Id])
GO
ALTER TABLE [dbo].[ConstituencyCandidates] CHECK CONSTRAINT [FK_ConstituencyCandidates_Parties]
GO
ALTER TABLE [dbo].[ConstituencyResults]  WITH NOCHECK ADD  CONSTRAINT [FK_ConstituencyResults_Constituencies] FOREIGN KEY([Constituency_Id])
REFERENCES [dbo].[Constituencies] ([Constituency_Id])
GO
ALTER TABLE [dbo].[ConstituencyResults] CHECK CONSTRAINT [FK_ConstituencyResults_Constituencies]
GO
ALTER TABLE [dbo].[ConstituencyResults]  WITH NOCHECK ADD  CONSTRAINT [FK_ConstituencyResults_Elections] FOREIGN KEY([Election_Id])
REFERENCES [dbo].[Elections] ([Election_Id])
GO
ALTER TABLE [dbo].[ConstituencyResults] CHECK CONSTRAINT [FK_ConstituencyResults_Elections]
GO
ALTER TABLE [dbo].[EditMemberAddresses]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberAddresses_AddressTypes] FOREIGN KEY([AddressType_Id])
REFERENCES [dbo].[AddressTypes] ([AddressType_Id])
GO
ALTER TABLE [dbo].[EditMemberAddresses] CHECK CONSTRAINT [FK_EditMemberAddresses_AddressTypes]
GO
ALTER TABLE [dbo].[EditMemberAddresses]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberAddresses_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberAddresses] CHECK CONSTRAINT [FK_EditMemberAddresses_EditMember]
GO
ALTER TABLE [dbo].[EditMemberBiographies]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberBiographies_BiographyCategories] FOREIGN KEY([BiographyCategory_Id])
REFERENCES [dbo].[BiographyCategories] ([BiographyCategory_Id])
GO
ALTER TABLE [dbo].[EditMemberBiographies] CHECK CONSTRAINT [FK_EditMemberBiographies_BiographyCategories]
GO
ALTER TABLE [dbo].[EditMemberBiographies]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberBiographies_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberBiographies] CHECK CONSTRAINT [FK_EditMemberBiographies_EditMember]
GO
ALTER TABLE [dbo].[EditMemberCommitteeChairs]  WITH CHECK ADD  CONSTRAINT [FK_EditMemberCommitteeChairs_EditMemberCommittees] FOREIGN KEY([EditMemberCommittee_Id])
REFERENCES [dbo].[EditMemberCommittees] ([EditMemberCommittee_Id])
GO
ALTER TABLE [dbo].[EditMemberCommitteeChairs] CHECK CONSTRAINT [FK_EditMemberCommitteeChairs_EditMemberCommittees]
GO
ALTER TABLE [dbo].[EditMemberCommittees]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberCommittees_Committees] FOREIGN KEY([Committee_Id])
REFERENCES [dbo].[Committees] ([Committee_Id])
GO
ALTER TABLE [dbo].[EditMemberCommittees] CHECK CONSTRAINT [FK_EditMemberCommittees_Committees]
GO
ALTER TABLE [dbo].[EditMemberCommittees]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberCommittees_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberCommittees] CHECK CONSTRAINT [FK_EditMemberCommittees_EditMember]
GO
ALTER TABLE [dbo].[EditMemberConstituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberConstituencies_Constituencies] FOREIGN KEY([Constituency_Id])
REFERENCES [dbo].[Constituencies] ([Constituency_Id])
GO
ALTER TABLE [dbo].[EditMemberConstituencies] CHECK CONSTRAINT [FK_EditMemberConstituencies_Constituencies]
GO
ALTER TABLE [dbo].[EditMemberConstituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberConstituencies_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberConstituencies] CHECK CONSTRAINT [FK_EditMemberConstituencies_EditMember]
GO
ALTER TABLE [dbo].[EditMemberConstituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberConstituencies_Elections] FOREIGN KEY([Election_Id])
REFERENCES [dbo].[Elections] ([Election_Id])
GO
ALTER TABLE [dbo].[EditMemberConstituencies] CHECK CONSTRAINT [FK_EditMemberConstituencies_Elections]
GO
ALTER TABLE [dbo].[EditMemberConstituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberConstituencies_EndReasons] FOREIGN KEY([EndType_Id])
REFERENCES [dbo].[EndReasons] ([EndReason_Id])
GO
ALTER TABLE [dbo].[EditMemberConstituencies] CHECK CONSTRAINT [FK_EditMemberConstituencies_EndReasons]
GO
ALTER TABLE [dbo].[EditMemberConstituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberConstituencies_EntryTypes] FOREIGN KEY([EntryType_Id])
REFERENCES [dbo].[EntryTypes] ([EntryType_Id])
GO
ALTER TABLE [dbo].[EditMemberConstituencies] CHECK CONSTRAINT [FK_EditMemberConstituencies_EntryTypes]
GO
ALTER TABLE [dbo].[EditMemberConstituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberConstituencies_Titles] FOREIGN KEY([Title_Id])
REFERENCES [dbo].[Titles] ([Title_Id])
GO
ALTER TABLE [dbo].[EditMemberConstituencies] CHECK CONSTRAINT [FK_EditMemberConstituencies_Titles]
GO
ALTER TABLE [dbo].[EditMemberDisqualifications]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberDisqualification_DisqualificationTypes] FOREIGN KEY([DisqualificationType_Id])
REFERENCES [dbo].[DisqualificationTypes] ([DisqualificationType_Id])
GO
ALTER TABLE [dbo].[EditMemberDisqualifications] CHECK CONSTRAINT [FK_EditMemberDisqualification_DisqualificationTypes]
GO
ALTER TABLE [dbo].[EditMemberDisqualifications]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberDisqualifications_EditMemberStatuses] FOREIGN KEY([EditMemberStatus_Id])
REFERENCES [dbo].[EditMemberStatuses] ([EditMemberStatus_Id])
GO
ALTER TABLE [dbo].[EditMemberDisqualifications] CHECK CONSTRAINT [FK_EditMemberDisqualifications_EditMemberStatuses]
GO
ALTER TABLE [dbo].[EditMemberElectionsContested]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberElectionsContested_Constituencies] FOREIGN KEY([Constituency_Id])
REFERENCES [dbo].[Constituencies] ([Constituency_Id])
GO
ALTER TABLE [dbo].[EditMemberElectionsContested] CHECK CONSTRAINT [FK_EditMemberElectionsContested_Constituencies]
GO
ALTER TABLE [dbo].[EditMemberElectionsContested]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberElectionsContested_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberElectionsContested] CHECK CONSTRAINT [FK_EditMemberElectionsContested_EditMember]
GO
ALTER TABLE [dbo].[EditMemberElectionsContested]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberElectionsContested_Elections] FOREIGN KEY([Election_Id])
REFERENCES [dbo].[Elections] ([Election_Id])
GO
ALTER TABLE [dbo].[EditMemberElectionsContested] CHECK CONSTRAINT [FK_EditMemberElectionsContested_Elections]
GO
ALTER TABLE [dbo].[EditMemberExperiences]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberExperiences_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberExperiences] CHECK CONSTRAINT [FK_EditMemberExperiences_EditMember]
GO
ALTER TABLE [dbo].[EditMemberExperiences]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberExperiences_ExperienceTypes] FOREIGN KEY([Experience_Id])
REFERENCES [dbo].[ExperienceTypes] ([ExperienceType_Id])
GO
ALTER TABLE [dbo].[EditMemberExperiences] CHECK CONSTRAINT [FK_EditMemberExperiences_ExperienceTypes]
GO
ALTER TABLE [dbo].[EditMemberGovernmentPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberGovernmentPosts_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberGovernmentPosts] CHECK CONSTRAINT [FK_EditMemberGovernmentPosts_EditMember]
GO
ALTER TABLE [dbo].[EditMemberGovernmentPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberGovernmentPosts_GovernmentPosts] FOREIGN KEY([GovernmentPost_Id])
REFERENCES [dbo].[GovernmentPosts] ([GovernmentPost_Id])
GO
ALTER TABLE [dbo].[EditMemberGovernmentPosts] CHECK CONSTRAINT [FK_EditMemberGovernmentPosts_GovernmentPosts]
GO
ALTER TABLE [dbo].[EditMemberHonours]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberHonours_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberHonours] CHECK CONSTRAINT [FK_EditMemberHonours_EditMember]
GO
ALTER TABLE [dbo].[EditMemberHonours]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberHonours_HonourLists] FOREIGN KEY([HonourList_Id])
REFERENCES [dbo].[HonourLists] ([HonourList_Id])
GO
ALTER TABLE [dbo].[EditMemberHonours] CHECK CONSTRAINT [FK_EditMemberHonours_HonourLists]
GO
ALTER TABLE [dbo].[EditMemberHonours]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberHonours_Honours] FOREIGN KEY([Honour_Id])
REFERENCES [dbo].[Honours] ([Honour_Id])
GO
ALTER TABLE [dbo].[EditMemberHonours] CHECK CONSTRAINT [FK_EditMemberHonours_Honours]
GO
ALTER TABLE [dbo].[EditMemberHouseMemberships]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberHouseMemberships_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberHouseMemberships] CHECK CONSTRAINT [FK_EditMemberHouseMemberships_EditMember]
GO
ALTER TABLE [dbo].[EditMemberHouseMemberships]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberHouseMemberships_EndReasons] FOREIGN KEY([EndReason_Id])
REFERENCES [dbo].[EndReasons] ([EndReason_Id])
GO
ALTER TABLE [dbo].[EditMemberHouseMemberships] CHECK CONSTRAINT [FK_EditMemberHouseMemberships_EndReasons]
GO
ALTER TABLE [dbo].[EditMemberHouseMemberships]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberHouseMemberships_Houses] FOREIGN KEY([House_Id])
REFERENCES [dbo].[Houses] ([House_Id])
GO
ALTER TABLE [dbo].[EditMemberHouseMemberships] CHECK CONSTRAINT [FK_EditMemberHouseMemberships_Houses]
GO
ALTER TABLE [dbo].[EditMemberInterests]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberInterests_CommonsRegisterPublications] FOREIGN KEY([CommonsRegisterPublication_Id])
REFERENCES [dbo].[CommonsRegisterPublications] ([CommonsRegisterPublication_Id])
GO
ALTER TABLE [dbo].[EditMemberInterests] CHECK CONSTRAINT [FK_EditMemberInterests_CommonsRegisterPublications]
GO
ALTER TABLE [dbo].[EditMemberInterests]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberInterests_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberInterests] CHECK CONSTRAINT [FK_EditMemberInterests_EditMember]
GO
ALTER TABLE [dbo].[EditMemberInterests]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberInterests_EditMemberInterests] FOREIGN KEY([ParentEditMemberInterest_Id])
REFERENCES [dbo].[EditMemberInterests] ([EditMemberInterest_Id])
GO
ALTER TABLE [dbo].[EditMemberInterests] CHECK CONSTRAINT [FK_EditMemberInterests_EditMemberInterests]
GO
ALTER TABLE [dbo].[EditMemberInterests]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberInterests_InterestCategories] FOREIGN KEY([InterestCategory_Id])
REFERENCES [dbo].[InterestCategories] ([InterestCategory_Id])
GO
ALTER TABLE [dbo].[EditMemberInterests] CHECK CONSTRAINT [FK_EditMemberInterests_InterestCategories]
GO
ALTER TABLE [dbo].[EditMemberKnownAs]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberKnownAs_EditMembers] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberKnownAs] CHECK CONSTRAINT [FK_EditMemberKnownAs_EditMembers]
GO
ALTER TABLE [dbo].[EditMemberLeaveOfAbsence]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberLeaveOfAbsence_EditMemberStatuses] FOREIGN KEY([EditMemberStatus_Id])
REFERENCES [dbo].[EditMemberStatuses] ([EditMemberStatus_Id])
GO
ALTER TABLE [dbo].[EditMemberLeaveOfAbsence] CHECK CONSTRAINT [FK_EditMemberLeaveOfAbsence_EditMemberStatuses]
GO
ALTER TABLE [dbo].[EditMemberLordsMembershipTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberLordsMembershipTypes_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberLordsMembershipTypes] CHECK CONSTRAINT [FK_EditMemberLordsMembershipTypes_EditMember]
GO
ALTER TABLE [dbo].[EditMemberLordsMembershipTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberLordsMembershipTypes_LordsMembershipTypes] FOREIGN KEY([LordsMembershipType_Id])
REFERENCES [dbo].[LordsMembershipTypes] ([LordsMembershipType_Id])
GO
ALTER TABLE [dbo].[EditMemberLordsMembershipTypes] CHECK CONSTRAINT [FK_EditMemberLordsMembershipTypes_LordsMembershipTypes]
GO
ALTER TABLE [dbo].[EditMemberLordsPreferredNames]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberLordsPreferredNames_LordsRanks] FOREIGN KEY([LordsRank_Id])
REFERENCES [dbo].[LordsRanks] ([LordsRank_Id])
GO
ALTER TABLE [dbo].[EditMemberLordsPreferredNames] CHECK CONSTRAINT [FK_EditMemberLordsPreferredNames_LordsRanks]
GO
ALTER TABLE [dbo].[EditMemberLordsPreferredNames]  WITH NOCHECK ADD  CONSTRAINT [FK_LordsPreferredNames_EditMemberPreferredNames] FOREIGN KEY([EditMemberPreferredName_Id])
REFERENCES [dbo].[EditMemberPreferredNames] ([EditMemberPreferredName_Id])
GO
ALTER TABLE [dbo].[EditMemberLordsPreferredNames] CHECK CONSTRAINT [FK_LordsPreferredNames_EditMemberPreferredNames]
GO
ALTER TABLE [dbo].[EditMemberMaidenSpeeches]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberMaidenSpeeches_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberMaidenSpeeches] CHECK CONSTRAINT [FK_EditMemberMaidenSpeeches_EditMember]
GO
ALTER TABLE [dbo].[EditMemberMaidenSpeeches]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberMaidenSpeeches_Houses] FOREIGN KEY([House_Id])
REFERENCES [dbo].[Houses] ([House_Id])
GO
ALTER TABLE [dbo].[EditMemberMaidenSpeeches] CHECK CONSTRAINT [FK_EditMemberMaidenSpeeches_Houses]
GO
ALTER TABLE [dbo].[EditMemberOaths]  WITH NOCHECK ADD  CONSTRAINT [FK_LordsOaths_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberOaths] CHECK CONSTRAINT [FK_LordsOaths_EditMember]
GO
ALTER TABLE [dbo].[EditMemberObituaries]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberObituaries_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberObituaries] CHECK CONSTRAINT [FK_EditMemberObituaries_EditMember]
GO
ALTER TABLE [dbo].[EditMemberOppositionPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberOppositionPosts_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberOppositionPosts] CHECK CONSTRAINT [FK_EditMemberOppositionPosts_EditMember]
GO
ALTER TABLE [dbo].[EditMemberOppositionPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberOppositionPosts_OppositionPosts] FOREIGN KEY([OppositionPost_Id])
REFERENCES [dbo].[OppositionPosts] ([OppositionPost_Id])
GO
ALTER TABLE [dbo].[EditMemberOppositionPosts] CHECK CONSTRAINT [FK_EditMemberOppositionPosts_OppositionPosts]
GO
ALTER TABLE [dbo].[EditMemberOtherParliaments]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberOtherParliaments_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberOtherParliaments] CHECK CONSTRAINT [FK_EditMemberOtherParliaments_EditMember]
GO
ALTER TABLE [dbo].[EditMemberOtherParliaments]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberOtherParliaments_OtherParliaments] FOREIGN KEY([OtherParliament_Id])
REFERENCES [dbo].[OtherParliaments] ([OtherParliament_Id])
GO
ALTER TABLE [dbo].[EditMemberOtherParliaments] CHECK CONSTRAINT [FK_EditMemberOtherParliaments_OtherParliaments]
GO
ALTER TABLE [dbo].[EditMemberParliamentaryPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberParliamentaryPosts_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberParliamentaryPosts] CHECK CONSTRAINT [FK_EditMemberParliamentaryPosts_EditMember]
GO
ALTER TABLE [dbo].[EditMemberParliamentaryPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberParliamentaryPosts_ParliamentaryPosts] FOREIGN KEY([ParliamentaryPost_Id])
REFERENCES [dbo].[ParliamentaryPosts] ([ParliamentaryPost_Id])
GO
ALTER TABLE [dbo].[EditMemberParliamentaryPosts] CHECK CONSTRAINT [FK_EditMemberParliamentaryPosts_ParliamentaryPosts]
GO
ALTER TABLE [dbo].[EditMemberParties]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberParties_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberParties] CHECK CONSTRAINT [FK_EditMemberParties_EditMember]
GO
ALTER TABLE [dbo].[EditMemberParties]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberParties_Parties] FOREIGN KEY([Party_Id])
REFERENCES [dbo].[Parties] ([Party_Id])
GO
ALTER TABLE [dbo].[EditMemberParties] CHECK CONSTRAINT [FK_EditMemberParties_Parties]
GO
ALTER TABLE [dbo].[EditMemberParties]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberParties_PartySubTypes] FOREIGN KEY([PartySubType_Id])
REFERENCES [dbo].[PartySubTypes] ([PartySubType_Id])
GO
ALTER TABLE [dbo].[EditMemberParties] CHECK CONSTRAINT [FK_EditMemberParties_PartySubTypes]
GO
ALTER TABLE [dbo].[EditMemberPhotoContent]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberPhotoContent_EditMemberPhotos] FOREIGN KEY([EditMemberPhoto_Id])
REFERENCES [dbo].[EditMemberPhotos] ([EditMemberPhoto_Id])
GO
ALTER TABLE [dbo].[EditMemberPhotoContent] CHECK CONSTRAINT [FK_EditMemberPhotoContent_EditMemberPhotos]
GO
ALTER TABLE [dbo].[EditMemberPhotoOutputs]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberPhotoOutputs_EditMemberPhotos] FOREIGN KEY([EditMemberPhoto_Id])
REFERENCES [dbo].[EditMemberPhotos] ([EditMemberPhoto_Id])
GO
ALTER TABLE [dbo].[EditMemberPhotoOutputs] CHECK CONSTRAINT [FK_EditMemberPhotoOutputs_EditMemberPhotos]
GO
ALTER TABLE [dbo].[EditMemberPhotoOutputs]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberPhotoOutputs_PhotoOutputs] FOREIGN KEY([PhotoOutput_Id])
REFERENCES [dbo].[PhotoOutputs] ([PhotoOutput_Id])
GO
ALTER TABLE [dbo].[EditMemberPhotoOutputs] CHECK CONSTRAINT [FK_EditMemberPhotoOutputs_PhotoOutputs]
GO
ALTER TABLE [dbo].[EditMemberPhotos]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberPhotos_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberPhotos] CHECK CONSTRAINT [FK_EditMemberPhotos_EditMember]
GO
ALTER TABLE [dbo].[EditMemberPreferredNameHonouraryPrefixes]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberPreferredNameHonouraryPrefixes_CommonsPreferredNames] FOREIGN KEY([EditMemberPreferredName_Id])
REFERENCES [dbo].[EditMemberPreferredNames] ([EditMemberPreferredName_Id])
GO
ALTER TABLE [dbo].[EditMemberPreferredNameHonouraryPrefixes] CHECK CONSTRAINT [FK_EditMemberPreferredNameHonouraryPrefixes_CommonsPreferredNames]
GO
ALTER TABLE [dbo].[EditMemberPreferredNameHonouraryPrefixes]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberPreferredNameHonouraryPrefixes_HonouraryPrefixes] FOREIGN KEY([HonouraryPrefix_Id])
REFERENCES [dbo].[HonouraryPrefixes] ([HonouraryPrefix_Id])
GO
ALTER TABLE [dbo].[EditMemberPreferredNameHonouraryPrefixes] CHECK CONSTRAINT [FK_EditMemberPreferredNameHonouraryPrefixes_HonouraryPrefixes]
GO
ALTER TABLE [dbo].[EditMemberPreferredNames]  WITH NOCHECK ADD  CONSTRAINT [FK_CommonsPreferredNames_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberPreferredNames] CHECK CONSTRAINT [FK_CommonsPreferredNames_EditMember]
GO
ALTER TABLE [dbo].[EditMemberPreferredNames]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberPreferredNames_Titles] FOREIGN KEY([Title_Id])
REFERENCES [dbo].[Titles] ([Title_Id])
GO
ALTER TABLE [dbo].[EditMemberPreferredNames] CHECK CONSTRAINT [FK_EditMemberPreferredNames_Titles]
GO
ALTER TABLE [dbo].[EditMemberReferences]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberReferences_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberReferences] CHECK CONSTRAINT [FK_EditMemberReferences_EditMember]
GO
ALTER TABLE [dbo].[EditMemberReferences]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberReferences_ReferenceTypes] FOREIGN KEY([ReferenceType_Id])
REFERENCES [dbo].[ReferenceTypes] ([ReferenceType_Id])
GO
ALTER TABLE [dbo].[EditMemberReferences] CHECK CONSTRAINT [FK_EditMemberReferences_ReferenceTypes]
GO
ALTER TABLE [dbo].[EditMembers]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMembers_Countries] FOREIGN KEY([BirthCountry_Id])
REFERENCES [dbo].[Countries] ([Country_Id])
GO
ALTER TABLE [dbo].[EditMembers] CHECK CONSTRAINT [FK_EditMembers_Countries]
GO
ALTER TABLE [dbo].[EditMemberStaff]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberStaff_EditMembers] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberStaff] CHECK CONSTRAINT [FK_EditMemberStaff_EditMembers]
GO
ALTER TABLE [dbo].[EditMemberStaff]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberStaff_Titles] FOREIGN KEY([Title_Id])
REFERENCES [dbo].[Titles] ([Title_Id])
GO
ALTER TABLE [dbo].[EditMemberStaff] CHECK CONSTRAINT [FK_EditMemberStaff_Titles]
GO
ALTER TABLE [dbo].[EditMemberStatuses]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberExclusions_EditMember] FOREIGN KEY([EditMember_Id])
REFERENCES [dbo].[EditMembers] ([EditMember_Id])
GO
ALTER TABLE [dbo].[EditMemberStatuses] CHECK CONSTRAINT [FK_EditMemberExclusions_EditMember]
GO
ALTER TABLE [dbo].[EditMemberStatuses]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberExclusions_Statuses] FOREIGN KEY([Status_Id])
REFERENCES [dbo].[Statuses] ([Status_Id])
GO
ALTER TABLE [dbo].[EditMemberStatuses] CHECK CONSTRAINT [FK_EditMemberExclusions_Statuses]
GO
ALTER TABLE [dbo].[EditMemberSuspensions]  WITH NOCHECK ADD  CONSTRAINT [FK_EditMemberSuspensions_EditMemberStatuses] FOREIGN KEY([EditMemberStatus_Id])
REFERENCES [dbo].[EditMemberStatuses] ([EditMemberStatus_Id])
GO
ALTER TABLE [dbo].[EditMemberSuspensions] CHECK CONSTRAINT [FK_EditMemberSuspensions_EditMemberStatuses]
GO
ALTER TABLE [dbo].[Elections]  WITH NOCHECK ADD  CONSTRAINT [FK_Elections_ElectionTypes] FOREIGN KEY([ElectionType_Id])
REFERENCES [dbo].[ElectionTypes] ([ElectionType_Id])
GO
ALTER TABLE [dbo].[Elections] CHECK CONSTRAINT [FK_Elections_ElectionTypes]
GO
ALTER TABLE [dbo].[GovernmentPostDepartments]  WITH NOCHECK ADD  CONSTRAINT [FK_GovernmentPostDepartments_Departments] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Departments] ([Department_Id])
GO
ALTER TABLE [dbo].[GovernmentPostDepartments] CHECK CONSTRAINT [FK_GovernmentPostDepartments_Departments]
GO
ALTER TABLE [dbo].[GovernmentPostDepartments]  WITH NOCHECK ADD  CONSTRAINT [FK_GovernmentPostDepartments_GovernmentPosts] FOREIGN KEY([GovernmentPost_Id])
REFERENCES [dbo].[GovernmentPosts] ([GovernmentPost_Id])
GO
ALTER TABLE [dbo].[GovernmentPostDepartments] CHECK CONSTRAINT [FK_GovernmentPostDepartments_GovernmentPosts]
GO
ALTER TABLE [dbo].[GovernmentPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_GovernmentPosts_Cabinets] FOREIGN KEY([Cabinet_Id])
REFERENCES [dbo].[Cabinets] ([Cabinet_Id])
GO
ALTER TABLE [dbo].[GovernmentPosts] CHECK CONSTRAINT [FK_GovernmentPosts_Cabinets]
GO
ALTER TABLE [dbo].[GovernmentPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_GovernmentPosts_GovernmentRanks] FOREIGN KEY([GovernmentRank_Id])
REFERENCES [dbo].[GovernmentRanks] ([GovernmentRank_Id])
GO
ALTER TABLE [dbo].[GovernmentPosts] CHECK CONSTRAINT [FK_GovernmentPosts_GovernmentRanks]
GO
ALTER TABLE [dbo].[HonouraryPrefixExcludeTitles]  WITH NOCHECK ADD  CONSTRAINT [FK_HonouraryPrefixExcludeTitles_HonouraryPrefixes] FOREIGN KEY([HonouraryPrefix_Id])
REFERENCES [dbo].[HonouraryPrefixes] ([HonouraryPrefix_Id])
GO
ALTER TABLE [dbo].[HonouraryPrefixExcludeTitles] CHECK CONSTRAINT [FK_HonouraryPrefixExcludeTitles_HonouraryPrefixes]
GO
ALTER TABLE [dbo].[HonouraryPrefixExcludeTitles]  WITH NOCHECK ADD  CONSTRAINT [FK_HonouraryPrefixExcludeTitles_Titles] FOREIGN KEY([Title_Id])
REFERENCES [dbo].[Titles] ([Title_Id])
GO
ALTER TABLE [dbo].[HonouraryPrefixExcludeTitles] CHECK CONSTRAINT [FK_HonouraryPrefixExcludeTitles_Titles]
GO
ALTER TABLE [dbo].[Honours]  WITH NOCHECK ADD  CONSTRAINT [FK_Honours_HonourTypes] FOREIGN KEY([HonourType_Id])
REFERENCES [dbo].[HonourTypes] ([HonourType_Id])
GO
ALTER TABLE [dbo].[Honours] CHECK CONSTRAINT [FK_Honours_HonourTypes]
GO
ALTER TABLE [dbo].[MemberAddresses]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberAddresses_AddressTypes] FOREIGN KEY([AddressType_Id])
REFERENCES [dbo].[AddressTypes] ([AddressType_Id])
GO
ALTER TABLE [dbo].[MemberAddresses] CHECK CONSTRAINT [FK_MemberAddresses_AddressTypes]
GO
ALTER TABLE [dbo].[MemberAddresses]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberAddresses_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberAddresses] CHECK CONSTRAINT [FK_MemberAddresses_Member]
GO
ALTER TABLE [dbo].[MemberBiographies]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberBiographies_BiographyCategories] FOREIGN KEY([BiographyCategory_Id])
REFERENCES [dbo].[BiographyCategories] ([BiographyCategory_Id])
GO
ALTER TABLE [dbo].[MemberBiographies] CHECK CONSTRAINT [FK_MemberBiographies_BiographyCategories]
GO
ALTER TABLE [dbo].[MemberBiographies]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberBiographies_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberBiographies] CHECK CONSTRAINT [FK_MemberBiographies_Member]
GO
ALTER TABLE [dbo].[MemberCommitteeChairs]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberCommitteeChairs_MemberCommittees] FOREIGN KEY([MemberCommittee_Id])
REFERENCES [dbo].[MemberCommittees] ([MemberCommittee_Id])
GO
ALTER TABLE [dbo].[MemberCommitteeChairs] CHECK CONSTRAINT [FK_MemberCommitteeChairs_MemberCommittees]
GO
ALTER TABLE [dbo].[MemberCommittees]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberCommittees_Committees] FOREIGN KEY([Committee_Id])
REFERENCES [dbo].[Committees] ([Committee_Id])
GO
ALTER TABLE [dbo].[MemberCommittees] CHECK CONSTRAINT [FK_MemberCommittees_Committees]
GO
ALTER TABLE [dbo].[MemberCommittees]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberCommittees_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberCommittees] CHECK CONSTRAINT [FK_MemberCommittees_Member]
GO
ALTER TABLE [dbo].[MemberConstituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberConstituencies_Constituencies] FOREIGN KEY([Constituency_Id])
REFERENCES [dbo].[Constituencies] ([Constituency_Id])
GO
ALTER TABLE [dbo].[MemberConstituencies] CHECK CONSTRAINT [FK_MemberConstituencies_Constituencies]
GO
ALTER TABLE [dbo].[MemberConstituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberConstituencies_Elections] FOREIGN KEY([Election_Id])
REFERENCES [dbo].[Elections] ([Election_Id])
GO
ALTER TABLE [dbo].[MemberConstituencies] CHECK CONSTRAINT [FK_MemberConstituencies_Elections]
GO
ALTER TABLE [dbo].[MemberConstituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberConstituencies_EndReasons] FOREIGN KEY([EndType_Id])
REFERENCES [dbo].[EndReasons] ([EndReason_Id])
GO
ALTER TABLE [dbo].[MemberConstituencies] CHECK CONSTRAINT [FK_MemberConstituencies_EndReasons]
GO
ALTER TABLE [dbo].[MemberConstituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberConstituencies_EntryTypes] FOREIGN KEY([EntryType_Id])
REFERENCES [dbo].[EntryTypes] ([EntryType_Id])
GO
ALTER TABLE [dbo].[MemberConstituencies] CHECK CONSTRAINT [FK_MemberConstituencies_EntryTypes]
GO
ALTER TABLE [dbo].[MemberConstituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberConstituencies_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberConstituencies] CHECK CONSTRAINT [FK_MemberConstituencies_Member]
GO
ALTER TABLE [dbo].[MemberConstituencies]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberConstituencies_Titles] FOREIGN KEY([Title_Id])
REFERENCES [dbo].[Titles] ([Title_Id])
GO
ALTER TABLE [dbo].[MemberConstituencies] CHECK CONSTRAINT [FK_MemberConstituencies_Titles]
GO
ALTER TABLE [dbo].[MemberDisqualifications]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberDisqualification_DisqualificationTypes] FOREIGN KEY([DisqualificationType_Id])
REFERENCES [dbo].[DisqualificationTypes] ([DisqualificationType_Id])
GO
ALTER TABLE [dbo].[MemberDisqualifications] CHECK CONSTRAINT [FK_MemberDisqualification_DisqualificationTypes]
GO
ALTER TABLE [dbo].[MemberDisqualifications]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberDisqualifications_MemberStatuses] FOREIGN KEY([MemberStatus_Id])
REFERENCES [dbo].[MemberStatuses] ([MemberStatus_Id])
GO
ALTER TABLE [dbo].[MemberDisqualifications] CHECK CONSTRAINT [FK_MemberDisqualifications_MemberStatuses]
GO
ALTER TABLE [dbo].[MemberElectionsContested]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberElectionsContested_Constituencies] FOREIGN KEY([Constituency_Id])
REFERENCES [dbo].[Constituencies] ([Constituency_Id])
GO
ALTER TABLE [dbo].[MemberElectionsContested] CHECK CONSTRAINT [FK_MemberElectionsContested_Constituencies]
GO
ALTER TABLE [dbo].[MemberElectionsContested]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberElectionsContested_Elections] FOREIGN KEY([Election_Id])
REFERENCES [dbo].[Elections] ([Election_Id])
GO
ALTER TABLE [dbo].[MemberElectionsContested] CHECK CONSTRAINT [FK_MemberElectionsContested_Elections]
GO
ALTER TABLE [dbo].[MemberElectionsContested]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberElectionsContested_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberElectionsContested] CHECK CONSTRAINT [FK_MemberElectionsContested_Member]
GO
ALTER TABLE [dbo].[MemberExperiences]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberExperiences_ExperienceTypes] FOREIGN KEY([Experience_Id])
REFERENCES [dbo].[ExperienceTypes] ([ExperienceType_Id])
GO
ALTER TABLE [dbo].[MemberExperiences] CHECK CONSTRAINT [FK_MemberExperiences_ExperienceTypes]
GO
ALTER TABLE [dbo].[MemberExperiences]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberExperiences_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberExperiences] CHECK CONSTRAINT [FK_MemberExperiences_Member]
GO
ALTER TABLE [dbo].[MemberGovernmentPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberGovernmentPosts_GovernmentPosts] FOREIGN KEY([GovernmentPost_Id])
REFERENCES [dbo].[GovernmentPosts] ([GovernmentPost_Id])
GO
ALTER TABLE [dbo].[MemberGovernmentPosts] CHECK CONSTRAINT [FK_MemberGovernmentPosts_GovernmentPosts]
GO
ALTER TABLE [dbo].[MemberGovernmentPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberGovernmentPosts_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberGovernmentPosts] CHECK CONSTRAINT [FK_MemberGovernmentPosts_Member]
GO
ALTER TABLE [dbo].[MemberHonours]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberHonours_HonourLists] FOREIGN KEY([HonourList_Id])
REFERENCES [dbo].[HonourLists] ([HonourList_Id])
GO
ALTER TABLE [dbo].[MemberHonours] CHECK CONSTRAINT [FK_MemberHonours_HonourLists]
GO
ALTER TABLE [dbo].[MemberHonours]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberHonours_Honours] FOREIGN KEY([Honour_Id])
REFERENCES [dbo].[Honours] ([Honour_Id])
GO
ALTER TABLE [dbo].[MemberHonours] CHECK CONSTRAINT [FK_MemberHonours_Honours]
GO
ALTER TABLE [dbo].[MemberHonours]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberHonours_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberHonours] CHECK CONSTRAINT [FK_MemberHonours_Member]
GO
ALTER TABLE [dbo].[MemberHouseMemberships]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberHouseMemberships_EndReasons] FOREIGN KEY([EndReason_Id])
REFERENCES [dbo].[EndReasons] ([EndReason_Id])
GO
ALTER TABLE [dbo].[MemberHouseMemberships] CHECK CONSTRAINT [FK_MemberHouseMemberships_EndReasons]
GO
ALTER TABLE [dbo].[MemberHouseMemberships]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberHouseMemberships_Houses] FOREIGN KEY([House_Id])
REFERENCES [dbo].[Houses] ([House_Id])
GO
ALTER TABLE [dbo].[MemberHouseMemberships] CHECK CONSTRAINT [FK_MemberHouseMemberships_Houses]
GO
ALTER TABLE [dbo].[MemberHouseMemberships]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberHouseMemberships_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberHouseMemberships] CHECK CONSTRAINT [FK_MemberHouseMemberships_Member]
GO
ALTER TABLE [dbo].[MemberInterests]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberInterests_CommonsRegisterPublications] FOREIGN KEY([CommonsRegisterPublication_Id])
REFERENCES [dbo].[CommonsRegisterPublications] ([CommonsRegisterPublication_Id])
GO
ALTER TABLE [dbo].[MemberInterests] CHECK CONSTRAINT [FK_MemberInterests_CommonsRegisterPublications]
GO
ALTER TABLE [dbo].[MemberInterests]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberInterests_InterestCategories] FOREIGN KEY([InterestCategory_Id])
REFERENCES [dbo].[InterestCategories] ([InterestCategory_Id])
GO
ALTER TABLE [dbo].[MemberInterests] CHECK CONSTRAINT [FK_MemberInterests_InterestCategories]
GO
ALTER TABLE [dbo].[MemberInterests]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberInterests_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberInterests] CHECK CONSTRAINT [FK_MemberInterests_Member]
GO
ALTER TABLE [dbo].[MemberInterests]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberInterests_MemberInterests] FOREIGN KEY([ParentMemberInterest_Id])
REFERENCES [dbo].[MemberInterests] ([MemberInterest_Id])
GO
ALTER TABLE [dbo].[MemberInterests] CHECK CONSTRAINT [FK_MemberInterests_MemberInterests]
GO
ALTER TABLE [dbo].[MemberInterestsPending]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberInterestsPending_CommonsRegisterPublications] FOREIGN KEY([CommonsRegisterPublication_Id])
REFERENCES [dbo].[CommonsRegisterPublications] ([CommonsRegisterPublication_Id])
GO
ALTER TABLE [dbo].[MemberInterestsPending] CHECK CONSTRAINT [FK_MemberInterestsPending_CommonsRegisterPublications]
GO
ALTER TABLE [dbo].[MemberInterestsPending]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberInterestsPending_InterestCategories] FOREIGN KEY([InterestCategory_Id])
REFERENCES [dbo].[InterestCategories] ([InterestCategory_Id])
GO
ALTER TABLE [dbo].[MemberInterestsPending] CHECK CONSTRAINT [FK_MemberInterestsPending_InterestCategories]
GO
ALTER TABLE [dbo].[MemberInterestsPending]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberInterestsPending_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberInterestsPending] CHECK CONSTRAINT [FK_MemberInterestsPending_Member]
GO
ALTER TABLE [dbo].[MemberInterestsPending]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberInterestsPending_MemberInterests] FOREIGN KEY([ParentMemberInterestPending_Id])
REFERENCES [dbo].[MemberInterestsPending] ([MemberInterestPending_Id])
GO
ALTER TABLE [dbo].[MemberInterestsPending] CHECK CONSTRAINT [FK_MemberInterestsPending_MemberInterests]
GO
ALTER TABLE [dbo].[MemberKnownAs]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberKnownAs_Members] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberKnownAs] CHECK CONSTRAINT [FK_MemberKnownAs_Members]
GO
ALTER TABLE [dbo].[MemberLeaveOfAbsence]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberLeaveOfAbsence_MemberStatuses] FOREIGN KEY([MemberStatus_Id])
REFERENCES [dbo].[MemberStatuses] ([MemberStatus_Id])
GO
ALTER TABLE [dbo].[MemberLeaveOfAbsence] CHECK CONSTRAINT [FK_MemberLeaveOfAbsence_MemberStatuses]
GO
ALTER TABLE [dbo].[MemberLordsMembershipTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberLordsMembershipTypes_LordsMembershipTypes] FOREIGN KEY([LordsMembershipType_Id])
REFERENCES [dbo].[LordsMembershipTypes] ([LordsMembershipType_Id])
GO
ALTER TABLE [dbo].[MemberLordsMembershipTypes] CHECK CONSTRAINT [FK_MemberLordsMembershipTypes_LordsMembershipTypes]
GO
ALTER TABLE [dbo].[MemberLordsMembershipTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberLordsMembershipTypes_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberLordsMembershipTypes] CHECK CONSTRAINT [FK_MemberLordsMembershipTypes_Member]
GO
ALTER TABLE [dbo].[MemberLordsPreferredNames]  WITH NOCHECK ADD  CONSTRAINT [FK_LordsPreferredNames_MemberPreferredNames] FOREIGN KEY([MemberPreferredName_Id])
REFERENCES [dbo].[MemberPreferredNames] ([MemberPreferredName_Id])
GO
ALTER TABLE [dbo].[MemberLordsPreferredNames] CHECK CONSTRAINT [FK_LordsPreferredNames_MemberPreferredNames]
GO
ALTER TABLE [dbo].[MemberLordsPreferredNames]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberLordsPreferredNames_LordsRanks] FOREIGN KEY([LordsRank_Id])
REFERENCES [dbo].[LordsRanks] ([LordsRank_Id])
GO
ALTER TABLE [dbo].[MemberLordsPreferredNames] CHECK CONSTRAINT [FK_MemberLordsPreferredNames_LordsRanks]
GO
ALTER TABLE [dbo].[MemberMaidenSpeeches]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberMaidenSpeeches_Houses] FOREIGN KEY([House_Id])
REFERENCES [dbo].[Houses] ([House_Id])
GO
ALTER TABLE [dbo].[MemberMaidenSpeeches] CHECK CONSTRAINT [FK_MemberMaidenSpeeches_Houses]
GO
ALTER TABLE [dbo].[MemberMaidenSpeeches]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberMaidenSpeeches_Members] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberMaidenSpeeches] CHECK CONSTRAINT [FK_MemberMaidenSpeeches_Members]
GO
ALTER TABLE [dbo].[MemberOaths]  WITH NOCHECK ADD  CONSTRAINT [FK_LordsOaths_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberOaths] CHECK CONSTRAINT [FK_LordsOaths_Member]
GO
ALTER TABLE [dbo].[MemberObituaries]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberObituaries_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberObituaries] CHECK CONSTRAINT [FK_MemberObituaries_Member]
GO
ALTER TABLE [dbo].[MemberOppositionPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberOppositionPosts_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberOppositionPosts] CHECK CONSTRAINT [FK_MemberOppositionPosts_Member]
GO
ALTER TABLE [dbo].[MemberOppositionPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberOppositionPosts_OppositionPosts] FOREIGN KEY([OppositionPost_Id])
REFERENCES [dbo].[OppositionPosts] ([OppositionPost_Id])
GO
ALTER TABLE [dbo].[MemberOppositionPosts] CHECK CONSTRAINT [FK_MemberOppositionPosts_OppositionPosts]
GO
ALTER TABLE [dbo].[MemberOtherParliaments]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberOtherParliaments_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberOtherParliaments] CHECK CONSTRAINT [FK_MemberOtherParliaments_Member]
GO
ALTER TABLE [dbo].[MemberOtherParliaments]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberOtherParliaments_OtherParliaments] FOREIGN KEY([OtherParliament_Id])
REFERENCES [dbo].[OtherParliaments] ([OtherParliament_Id])
GO
ALTER TABLE [dbo].[MemberOtherParliaments] CHECK CONSTRAINT [FK_MemberOtherParliaments_OtherParliaments]
GO
ALTER TABLE [dbo].[MemberParliamentaryPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberParliamentaryPosts_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberParliamentaryPosts] CHECK CONSTRAINT [FK_MemberParliamentaryPosts_Member]
GO
ALTER TABLE [dbo].[MemberParliamentaryPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberParliamentaryPosts_ParliamentaryPosts] FOREIGN KEY([ParliamentaryPost_Id])
REFERENCES [dbo].[ParliamentaryPosts] ([ParliamentaryPost_Id])
GO
ALTER TABLE [dbo].[MemberParliamentaryPosts] CHECK CONSTRAINT [FK_MemberParliamentaryPosts_ParliamentaryPosts]
GO
ALTER TABLE [dbo].[MemberParties]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberParties_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberParties] CHECK CONSTRAINT [FK_MemberParties_Member]
GO
ALTER TABLE [dbo].[MemberParties]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberParties_Parties] FOREIGN KEY([Party_Id])
REFERENCES [dbo].[Parties] ([Party_Id])
GO
ALTER TABLE [dbo].[MemberParties] CHECK CONSTRAINT [FK_MemberParties_Parties]
GO
ALTER TABLE [dbo].[MemberParties]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberParties_PartySubTypes] FOREIGN KEY([PartySubType_Id])
REFERENCES [dbo].[PartySubTypes] ([PartySubType_Id])
GO
ALTER TABLE [dbo].[MemberParties] CHECK CONSTRAINT [FK_MemberParties_PartySubTypes]
GO
ALTER TABLE [dbo].[MemberPhotoContent]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberPhotoContent_MemberPhotos] FOREIGN KEY([MemberPhoto_Id])
REFERENCES [dbo].[MemberPhotos] ([MemberPhoto_Id])
GO
ALTER TABLE [dbo].[MemberPhotoContent] CHECK CONSTRAINT [FK_MemberPhotoContent_MemberPhotos]
GO
ALTER TABLE [dbo].[MemberPhotoOutputs]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberPhotoOutputs_MemberPhotos] FOREIGN KEY([MemberPhoto_Id])
REFERENCES [dbo].[MemberPhotos] ([MemberPhoto_Id])
GO
ALTER TABLE [dbo].[MemberPhotoOutputs] CHECK CONSTRAINT [FK_MemberPhotoOutputs_MemberPhotos]
GO
ALTER TABLE [dbo].[MemberPhotoOutputs]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberPhotoOutputs_PhotoOutputs] FOREIGN KEY([PhotoOutput_Id])
REFERENCES [dbo].[PhotoOutputs] ([PhotoOutput_Id])
GO
ALTER TABLE [dbo].[MemberPhotoOutputs] CHECK CONSTRAINT [FK_MemberPhotoOutputs_PhotoOutputs]
GO
ALTER TABLE [dbo].[MemberPhotos]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberPhotos_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberPhotos] CHECK CONSTRAINT [FK_MemberPhotos_Member]
GO
ALTER TABLE [dbo].[MemberPreferredNameHonouraryPrefixes]  WITH NOCHECK ADD  CONSTRAINT [FK_CommonsPreferredNameHonouraryPrefixes_CommonsPreferredNames] FOREIGN KEY([MemberPreferredName_Id])
REFERENCES [dbo].[MemberPreferredNames] ([MemberPreferredName_Id])
GO
ALTER TABLE [dbo].[MemberPreferredNameHonouraryPrefixes] CHECK CONSTRAINT [FK_CommonsPreferredNameHonouraryPrefixes_CommonsPreferredNames]
GO
ALTER TABLE [dbo].[MemberPreferredNameHonouraryPrefixes]  WITH NOCHECK ADD  CONSTRAINT [FK_CommonsPreferredNameHonouraryPrefixes_HonouraryPrefixes] FOREIGN KEY([HonouraryPrefix_Id])
REFERENCES [dbo].[HonouraryPrefixes] ([HonouraryPrefix_Id])
GO
ALTER TABLE [dbo].[MemberPreferredNameHonouraryPrefixes] CHECK CONSTRAINT [FK_CommonsPreferredNameHonouraryPrefixes_HonouraryPrefixes]
GO
ALTER TABLE [dbo].[MemberPreferredNames]  WITH NOCHECK ADD  CONSTRAINT [FK_CommonsPreferredNames_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberPreferredNames] CHECK CONSTRAINT [FK_CommonsPreferredNames_Member]
GO
ALTER TABLE [dbo].[MemberPreferredNames]  WITH NOCHECK ADD  CONSTRAINT [FK_CommonsPreferredNames_Titles] FOREIGN KEY([Title_Id])
REFERENCES [dbo].[Titles] ([Title_Id])
GO
ALTER TABLE [dbo].[MemberPreferredNames] CHECK CONSTRAINT [FK_CommonsPreferredNames_Titles]
GO
ALTER TABLE [dbo].[MemberReferences]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberReferences_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberReferences] CHECK CONSTRAINT [FK_MemberReferences_Member]
GO
ALTER TABLE [dbo].[MemberReferences]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberReferences_ReferenceTypes] FOREIGN KEY([ReferenceType_Id])
REFERENCES [dbo].[ReferenceTypes] ([ReferenceType_Id])
GO
ALTER TABLE [dbo].[MemberReferences] CHECK CONSTRAINT [FK_MemberReferences_ReferenceTypes]
GO
ALTER TABLE [dbo].[Members]  WITH NOCHECK ADD  CONSTRAINT [FK_Members_Countries] FOREIGN KEY([BirthCountry_Id])
REFERENCES [dbo].[Countries] ([Country_Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Countries]
GO
ALTER TABLE [dbo].[MemberStaff]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberStaff_Members] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberStaff] CHECK CONSTRAINT [FK_MemberStaff_Members]
GO
ALTER TABLE [dbo].[MemberStaff]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberStaff_Titles] FOREIGN KEY([Title_Id])
REFERENCES [dbo].[Titles] ([Title_Id])
GO
ALTER TABLE [dbo].[MemberStaff] CHECK CONSTRAINT [FK_MemberStaff_Titles]
GO
ALTER TABLE [dbo].[MemberStatuses]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberExclusions_ExclusionTypes] FOREIGN KEY([Status_Id])
REFERENCES [dbo].[Statuses] ([Status_Id])
GO
ALTER TABLE [dbo].[MemberStatuses] CHECK CONSTRAINT [FK_MemberExclusions_ExclusionTypes]
GO
ALTER TABLE [dbo].[MemberStatuses]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberExclusions_Member] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[MemberStatuses] CHECK CONSTRAINT [FK_MemberExclusions_Member]
GO
ALTER TABLE [dbo].[MemberSuspensions]  WITH NOCHECK ADD  CONSTRAINT [FK_MemberSuspensions_MemberStatuses] FOREIGN KEY([MemberStatus_Id])
REFERENCES [dbo].[MemberStatuses] ([MemberStatus_Id])
GO
ALTER TABLE [dbo].[MemberSuspensions] CHECK CONSTRAINT [FK_MemberSuspensions_MemberStatuses]
GO
ALTER TABLE [dbo].[OppositionPostDepartments]  WITH NOCHECK ADD  CONSTRAINT [FK_OppositionPostDepartments_Departments] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Departments] ([Department_Id])
GO
ALTER TABLE [dbo].[OppositionPostDepartments] CHECK CONSTRAINT [FK_OppositionPostDepartments_Departments]
GO
ALTER TABLE [dbo].[OppositionPostDepartments]  WITH NOCHECK ADD  CONSTRAINT [FK_OppositionPostDepartments_OppositionPosts] FOREIGN KEY([OppositionPost_Id])
REFERENCES [dbo].[OppositionPosts] ([OppositionPost_Id])
GO
ALTER TABLE [dbo].[OppositionPostDepartments] CHECK CONSTRAINT [FK_OppositionPostDepartments_OppositionPosts]
GO
ALTER TABLE [dbo].[OppositionPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_OppositionPosts_Cabinets] FOREIGN KEY([Cabinet_Id])
REFERENCES [dbo].[Cabinets] ([Cabinet_Id])
GO
ALTER TABLE [dbo].[OppositionPosts] CHECK CONSTRAINT [FK_OppositionPosts_Cabinets]
GO
ALTER TABLE [dbo].[OppositionPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_OppositionPosts_OppositionRanks] FOREIGN KEY([OppositionRank_Id])
REFERENCES [dbo].[OppositionRanks] ([OppositionRank_Id])
GO
ALTER TABLE [dbo].[OppositionPosts] CHECK CONSTRAINT [FK_OppositionPosts_OppositionRanks]
GO
ALTER TABLE [dbo].[OtherParliaments]  WITH NOCHECK ADD  CONSTRAINT [FK_OtherParliaments_Countries] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[Countries] ([Country_Id])
GO
ALTER TABLE [dbo].[OtherParliaments] CHECK CONSTRAINT [FK_OtherParliaments_Countries]
GO
ALTER TABLE [dbo].[OtherParliaments]  WITH NOCHECK ADD  CONSTRAINT [FK_OtherParliaments_ParliamentTypes] FOREIGN KEY([ParliamentType_Id])
REFERENCES [dbo].[ParliamentTypes] ([ParliamentType_Id])
GO
ALTER TABLE [dbo].[OtherParliaments] CHECK CONSTRAINT [FK_OtherParliaments_ParliamentTypes]
GO
ALTER TABLE [dbo].[ParliamentaryPosts]  WITH NOCHECK ADD  CONSTRAINT [FK_ParliamentaryPosts_ParliamentaryRanks] FOREIGN KEY([ParliamentaryRank_Id])
REFERENCES [dbo].[ParliamentaryRanks] ([ParliamentaryRank_Id])
GO
ALTER TABLE [dbo].[ParliamentaryPosts] CHECK CONSTRAINT [FK_ParliamentaryPosts_ParliamentaryRanks]
GO
ALTER TABLE [dbo].[PartiesOfGovernment]  WITH CHECK ADD  CONSTRAINT [FK_PartiesOfGovernment_Parties] FOREIGN KEY([Party_Id])
REFERENCES [dbo].[Parties] ([Party_Id])
GO
ALTER TABLE [dbo].[PartiesOfGovernment] CHECK CONSTRAINT [FK_PartiesOfGovernment_Parties]
GO
ALTER TABLE [dbo].[PartySubTypes]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySubTypes_Parties1] FOREIGN KEY([Party_Id])
REFERENCES [dbo].[Parties] ([Party_Id])
GO
ALTER TABLE [dbo].[PartySubTypes] CHECK CONSTRAINT [FK_PartySubTypes_Parties1]
GO
ALTER TABLE [dbo].[Statuses]  WITH NOCHECK ADD  CONSTRAINT [FK_Statuses_Parties] FOREIGN KEY([ChangePartyTo_Id])
REFERENCES [dbo].[Parties] ([Party_Id])
GO
ALTER TABLE [dbo].[Statuses] CHECK CONSTRAINT [FK_Statuses_Parties]
GO
ALTER TABLE [dbo].[SubscriptionTabs]  WITH NOCHECK ADD  CONSTRAINT [FK_SubscriptionTabs_Subscriptions] FOREIGN KEY([Subscription_Id])
REFERENCES [dbo].[Subscriptions] ([Subscription_Id])
GO
ALTER TABLE [dbo].[SubscriptionTabs] CHECK CONSTRAINT [FK_SubscriptionTabs_Subscriptions]
GO
ALTER TABLE [dbo].[SubscriptionTabs]  WITH NOCHECK ADD  CONSTRAINT [FK_SubscriptionTabs_SubscriptionTabList] FOREIGN KEY([SubscriptionTabList_Id])
REFERENCES [dbo].[SubscriptionTabList] ([SubscriptionTabList_Id])
GO
ALTER TABLE [dbo].[SubscriptionTabs] CHECK CONSTRAINT [FK_SubscriptionTabs_SubscriptionTabList]
GO
ALTER TABLE [dbo].[SwearingMembers]  WITH NOCHECK ADD  CONSTRAINT [FK_SwearingMembers_Members] FOREIGN KEY([Member_Id])
REFERENCES [dbo].[Members] ([Member_Id])
GO
ALTER TABLE [dbo].[SwearingMembers] CHECK CONSTRAINT [FK_SwearingMembers_Members]
GO
ALTER TABLE [dbo].[SwearingMembers]  WITH NOCHECK ADD  CONSTRAINT [FK_SwearingMembers_SwearingBatches] FOREIGN KEY([SwearingBatch_Id])
REFERENCES [dbo].[SwearingBatches] ([SwearingBatch_Id])
GO
ALTER TABLE [dbo].[SwearingMembers] CHECK CONSTRAINT [FK_SwearingMembers_SwearingBatches]
GO
ALTER TABLE [dbo].[UserLogins]  WITH NOCHECK ADD  CONSTRAINT [FK_UserLogins_UserRoles] FOREIGN KEY([UserRole_Id])
REFERENCES [dbo].[UserRoles] ([UserRole_Id])
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_UserRoles]
GO
ALTER TABLE [dbo].[UserRolePermissions]  WITH NOCHECK ADD  CONSTRAINT [FK_UserRolePermissions_UserPermissions] FOREIGN KEY([UserPermission_Id])
REFERENCES [dbo].[UserPermissions] ([UserPermission_Id])
GO
ALTER TABLE [dbo].[UserRolePermissions] CHECK CONSTRAINT [FK_UserRolePermissions_UserPermissions]
GO
ALTER TABLE [dbo].[UserRolePermissions]  WITH NOCHECK ADD  CONSTRAINT [FK_UserRolePermissions_UserRoles] FOREIGN KEY([UserRole_Id])
REFERENCES [dbo].[UserRoles] ([UserRole_Id])
GO
ALTER TABLE [dbo].[UserRolePermissions] CHECK CONSTRAINT [FK_UserRolePermissions_UserRoles]
GO
ALTER TABLE [dbo].[UserRoleSections]  WITH NOCHECK ADD  CONSTRAINT [FK_UserRoleSections_Sections] FOREIGN KEY([Section_Id])
REFERENCES [dbo].[Sections] ([Section_Id])
GO
ALTER TABLE [dbo].[UserRoleSections] CHECK CONSTRAINT [FK_UserRoleSections_Sections]
GO
ALTER TABLE [dbo].[UserRoleSections]  WITH NOCHECK ADD  CONSTRAINT [FK_UserRoleSections_UserRoles] FOREIGN KEY([UserRole_Id])
REFERENCES [dbo].[UserRoles] ([UserRole_Id])
GO
ALTER TABLE [dbo].[UserRoleSections] CHECK CONSTRAINT [FK_UserRoleSections_UserRoles]
GO
