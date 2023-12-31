USE [master]
GO
/****** Object:  Database [KisiselWebDb]    Script Date: 10.06.2023 13:19:34 ******/
CREATE DATABASE [KisiselWebDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KisiselWebDb', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.WINCC\MSSQL\DATA\KisiselWebDb.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KisiselWebDb_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.WINCC\MSSQL\DATA\KisiselWebDb_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KisiselWebDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KisiselWebDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KisiselWebDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KisiselWebDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KisiselWebDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KisiselWebDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KisiselWebDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [KisiselWebDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KisiselWebDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KisiselWebDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KisiselWebDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KisiselWebDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KisiselWebDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KisiselWebDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KisiselWebDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KisiselWebDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KisiselWebDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KisiselWebDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KisiselWebDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KisiselWebDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KisiselWebDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KisiselWebDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KisiselWebDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [KisiselWebDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KisiselWebDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KisiselWebDb] SET  MULTI_USER 
GO
ALTER DATABASE [KisiselWebDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KisiselWebDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KisiselWebDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KisiselWebDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [KisiselWebDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [KisiselWebDb]
GO
/****** Object:  User [SIMATIC HMI VIEWER User]    Script Date: 10.06.2023 13:19:34 ******/
CREATE USER [SIMATIC HMI VIEWER User] FOR LOGIN [DESKTOP-NIJEM97\SIMATIC HMI VIEWER]
GO
/****** Object:  User [SIMATIC HMI User]    Script Date: 10.06.2023 13:19:34 ******/
CREATE USER [SIMATIC HMI User] FOR LOGIN [DESKTOP-NIJEM97\SIMATIC HMI]
GO
/****** Object:  DatabaseRole [SIMATIC HMI VIEWER role]    Script Date: 10.06.2023 13:19:34 ******/
CREATE ROLE [SIMATIC HMI VIEWER role]
GO
/****** Object:  DatabaseRole [SIMATIC HMI role]    Script Date: 10.06.2023 13:19:34 ******/
CREATE ROLE [SIMATIC HMI role]
GO
ALTER ROLE [SIMATIC HMI VIEWER role] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [SIMATIC HMI role] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER role]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI role]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10.06.2023 13:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 10.06.2023 13:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](max) NULL,
	[Sifre] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Admins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnaSayfas]    Script Date: 10.06.2023 13:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnaSayfas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Profil] [nvarchar](max) NULL,
	[Unvan] [nvarchar](max) NULL,
	[Aciklama] [nvarchar](max) NULL,
	[Iletisim] [nvarchar](max) NULL,
	[Isim] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AnaSayfas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ikonlars]    Script Date: 10.06.2023 13:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ikonlars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ikon] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Ikonlars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202305171415088_AutomaticMigration', N'KisiselWebSitesi.Migrations.Configuration', 0x1F8B0800000000000400ED59CD6EE33610BE17E83B083AB540D6B4934B1BC8BB709DA430F28B55B23DD3D2C8214251AA4805F663EDB9875EFA3EFB0A3B94A85FFFC9719C6E8B852F1635F3CD7066487E437DF9EB6FE7C33CE4D63324924562680F7A7DDB02E1453E13B3A19DAAE0DD2FF687F73FFEE09CFBE1DCFA54C89D6839D41472683F2A159F1222BD4708A9EC85CC4B221905AAE74521A17E448EFBFD5FC9604000216CC4B22CE7632A140B217BC0C771243C88554AF975E40397661CDFB819AA7543439031F560685F32C924F03F60EA320592F572959ECB040B384D6C6BC41945BF5CE0816D51212245157A7DFA20C1554924666E8C0394DF2F6240B98072096636A79578D789F58FF5C448A5584079A95451B823E0E0C4448AB4D55F146FBB8C24C6F21C63AE167AD6593C87F6C80F19E2B62D9D8E79A2A5B6C7BA97211C596DB9A3B252B0A0F4EFC81AA75CA5090C05A42AA1FCC8BA4BA79C7997B0B88F9E400C45CA79DD5BF417DF350670E82E896248D4E22304660E13DFB648538FB4154BB59A4E3EC1895027C7B67583C6E99443590CB560B82A4AE07710905005FE1D550A12A131200BE792F596AD4B0D2D98C7463E2BAC6215E2F2B2AD6B3ABF0231538F431BFFDAD6059B835F8C184F1E5017833EB45592C236632E0B1278652B0EA9EA66733509EAD24540F72B2803F2BDA636D8C2C780F18357D38378A6E2E056461E7BE234A4073734E1A0B0A6C27F6B7D4C9E22919D4F7B2C0F83F17D756CB2F5141DBE6AAF98787AD342428AA428C3981807F433CCD58A6A429A630A4A1A33CD99E4782EA83A0B90B65559CFB953CFD003B245DDECD82B11CA23610BC83F9FF3C25E0552AE9B55C12AC35251469273C6825B9235E4D2B9A6718C79AB914D3362B939D31CBF7377275D618E413CB9827B95DE9696B0D4E90C5A6F75767DB86089546754D129D59533F6C315627911AC096E61A591E7F602AFE25D88EBFF86BC74E27F6DC82A921738B910576D364F28FD2A98E7925E46F82902AFD83EC6114F43B16E0BDAA4DDA460759CE69BEE888667D5A1CCD03286435AC16827802C65A0B5B9B6F3D92DDBE5B27CDD84172BFA05395FAB7A98B4172CA98E508C75473124A80E6286BA635414A70E538D7647AA384C232EE5E837537ED586FEAAE5579C05BB57DF5ACDC3145F4E421AFAD94877849C61D411F291374EF1D241DB1629AD97076EEB6075CC21B7FD6A67E9D4CB456C0B43F3CC7C7DE2B90BA920EC69819EFB271F7386F3AD04AE71370F40AA9CE1DAC7FDC171EB3EE8DBB99B2152FABCCB05CD9B7374A643BA95852F51F8DD2F4270234DBC479AFC14D2F9CF75C49D2F3B7640DAFD42E3FF9180E6ADC15EA16FDC0CEC85D4EEFEF7026B77F887288A95E7C87FB626EABDF25EA1AFF7C3AF16F6E59EB7DD1575E86CD737B6F9E932B4FD6984AEE72E16CD70C7A67763CFBB12BFEA96B79828DBDEF50DF12A0393B2917E61BBBC7C5A3BA4FEB9C639436236AB20F4C71B019E3E062BD042662282A8A8149C5ADDA342A45548D7A0A88FE91D258A05D453F8DA0329B30B964F94A728721E4EC19F88DB54C5A91A4909E194376E851CB2D97E7627D0F4D9B98DF5937C8D29A09B0CA700B7E2B79471BFF4FB627945AE83D0956E96397AE52ABDDC678B12E926121D814CF8CE2006A137897B08638E60F256B8F4195EE2DB83842B98516F5190AEF520DB13D10CBB73C6E82CA1A1341895BEFE0449F437C8F75F01C7CBD9F9B51C0000, N'6.4.4')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202305191610545_AutomaticMigration', N'KisiselWebSitesi.Migrations.Configuration', 0x1F8B0800000000000400ED594B6FE33610BE17E87F10746A81AC192797369077E13A4961E48955B23DD3D2C8214C51AA4805F6CFEAB9875EFA7FFA173A94A8A75F726C07DB62914B4471BE7970A8F966FCCF9F7F399FE621B75E21912C1203BBDF3BB52D105EE433311DD8A90A3EFC647FFAF8FD77CE951FCEAD2FC5BE73BD0F25851CD82F4AC5178448EF05422A7B21F392484681EA795148A81F91B3D3D39F49BF4F00216CC4B22CE7732A140B217BC0C751243C88554AF95DE40397661DDFB819AA754F439031F56060DF30C924F0DF60E2320592F572919ECB040B384D6C6BC81945BB5CE0816D51212245155A7DF12CC1554924A66E8C0B943F2D62C07D01E5128C3717D5F6AE8E9D9E69C74825584079A95451B82360FFDC448AB4C5DF146FBB8C24C6F20A63AE16DAEB2C9E037BE8870C71DB9A2E463CD1BBB6C7BA97219C58ED7D2765A66042E9BF136B94729526301090AA84F213EB319D70E6DDC0E2299A81188894F3BAB5682FBE6B2CE0D26312C590A8C567088C0F63DFB648538EB4054BB19A4CEEE058A8F333DBBA47E574C2A14C865A305C1525F02B0848A802FF912A0589D018908573497B4BD78D8616CC63439F155A310BF17AD9D61D9DDF8298AA97818DFFDAD6359B835FAC184B9E5116833EB05592C236652E0B1238B016875479B3399B0475E922A0FB259401F996531B74E163C0F8D1B3692C59787425CFE2958AA36B197A6CC669488F1F330E8A1D3E6E9D2FE1781689AC08EE71070DC6B72BB849D72C3A7ED6DE32317BD744421EA628C3981803F433CCD58A6C422E65124A1A354D4F723C17549D6A48DBAAB4E704AD673808D9226ECAC24A84B2EE6C01F9FB8F3CB1578194F76655B0CAB054BC94E4C4B420B0640D8375EE681CE3B9D518AD59B1DC9CCE8E3EB8BB33BB30C7209E5C41F04A6B4B4D98EA740AADB7FA747DB86689549754D109D59933F2C315DBF2245813DC424BE39CDB17BC8A77B15DFF6F18522792D986AC22798DCE85786B333FA1B4ABA0B74B725957411178C5E76314F13414EB3E419BA49B3CAF8ED37CD31DD190B93A94595AC670482B18ED03204B27D0FAB8B6CFB3DB6997D7F2B0075EDCE8379CF95AD1E31C7B41C5EA08C55A77949C6935ACC856BA23181A5587304BDD312A925487A95677F0A764410D9FCAD5AF2681AB9270D0042EAAC9EEF9BB56F238E99BD398867CB6D21D21E72875847CE59D8F78A954B7B794DACB92DD2ACD8E2993DB27504B7533DF625B189A57E6EB9AE92EA482B0A737F4DCDFF98833F4B7DA7087F52000A9728E6C9F9DF6CF5A63ABAF678444A4F4799739D2BBB37CA643BA95C72F3501BBCF6BF0439A782F34F921A4F31FEB883BCF647640DA7DEEF2FF3880E67063AFD0D707187B013586147B21B50711FBF9D71A361C23BB5616A4FF6C72D5DBF6BD425F6FCD0F16F6E5F6BBDDA07568B2D7F7D879991AD8FE2442D373138BBEBC63FFBDB1FD5E895F35EE5B54941DF8FADE7C958271D9D3BFB1735F2EFB0EA9FF3CE55C22C39B5610FAC72A019EAEA71568B1672C82A8C81474AD6E51B1A5954877A0A88FC73B4C140BA8A7F0B5075266B39E2F94A7B8E52A9C803F160FA98A53359412C2096F0CA81CB2597F369E68DAEC3CC4FA491EC2053493A10BF0207E4919F74BBBAF976FE43A089DE9E69AA355AED2D77DBA2891EE23D111C884EF126210FA23F10461CC114C3E0897BEC25B6C7B96700B53EA2D0AF6B61E64FB4134C3EE5C323A4D68280D4625AF7F7225FA37D78FFF02E73921F3A51D0000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([Id], [KullaniciAdi], [Sifre]) VALUES (1, N'admin', N'1234')
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[AnaSayfas] ON 

INSERT [dbo].[AnaSayfas] ([Id], [Profil], [Unvan], [Aciklama], [Iletisim], [Isim]) VALUES (1, N'https://i.hizliresim.com/iy4izlc.jpeg', N'Elektrik-Elektronik Mühendisi (Jr. Software Developer)', N'Mezun olmadan önce kısa tatil dönemlerinde, olduktan sonra uzun süreler boyunca kendi alanında çalışmış ve iş  tecrübesi kazanmış bir mühendisim. Bu çalışma dönemleri boyunca yazılıma ilgimin daha fazla olduğunu fark  ettim ve kariyerime yazılım sektöründe devam etme kararı aldım. Şu anda hali hazırda İŞKUR''un, Kadıköy''de  bulunan BİLİŞİM EĞİTİM MERKEZİ''nde verdiği yazılım kursuna devam etmekteyim. Hedefim uzun yıllar boyunca  yazılım alanında çalışmaktır.
', N'İletişim', N'İlker Şenel')
SET IDENTITY_INSERT [dbo].[AnaSayfas] OFF
GO
SET IDENTITY_INSERT [dbo].[Ikonlars] ON 

INSERT [dbo].[Ikonlars] ([Id], [Ikon], [Link]) VALUES (1, N'fa-brands fa-linkedin', N'https://www.linkedin.com/in/ilker-%C5%9Fenel-112363221/')
INSERT [dbo].[Ikonlars] ([Id], [Ikon], [Link]) VALUES (2, N'fa-brands fa-github', N'https://github.com/illkkeerr')
INSERT [dbo].[Ikonlars] ([Id], [Ikon], [Link]) VALUES (4, N'fa-sharp fa-regular fa-envelope', N'mailto:ilkersenel5797@gmail.com')
INSERT [dbo].[Ikonlars] ([Id], [Ikon], [Link]) VALUES (7, N'fa-regular fa-file', N'https://drive.google.com/drive/folders/1G7LP9Yf1wslF16Ts1oNLrKcuduWqq3DG')
SET IDENTITY_INSERT [dbo].[Ikonlars] OFF
GO
/****** Object:  DdlTrigger [OnTriggerDboSchema]    Script Date: 10.06.2023 13:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [OnTriggerDboSchema] ON database FOR create_table, create_view AS BEGIN   DECLARE @xmlEventData xml   SELECT    @xmlEventData = eventdata()   DECLARE @schemaName nvarchar(max)   DECLARE @objectName nvarchar(max)   DECLARE @DynSql nvarchar(max)      SET @schemaName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/SchemaName/text()'))   SET @objectName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/ObjectName/text()'))   IF(@schemaName='')   BEGIN     SET @DynSql = N'alter schema [dbo] transfer [' + @schemaName + N'].[' + @objectName + N']'     EXEC sp_executesql @statement=@DynSql   END END SET QUOTED_IDENTIFIER ON SET ANSI_NULLS ON 
GO
ENABLE TRIGGER [OnTriggerDboSchema] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [KisiselWebDb] SET  READ_WRITE 
GO
