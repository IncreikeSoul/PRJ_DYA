USE [master]
GO
CREATE DATABASE [BD_DYA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_DYA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BD_DYA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_DYA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BD_DYA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BD_DYA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_DYA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_DYA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_DYA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_DYA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_DYA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_DYA] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_DYA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_DYA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_DYA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_DYA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_DYA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_DYA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_DYA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_DYA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_DYA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_DYA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_DYA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_DYA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_DYA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_DYA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_DYA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_DYA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_DYA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_DYA] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_DYA] SET  MULTI_USER 
GO
ALTER DATABASE [BD_DYA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_DYA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_DYA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_DYA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_DYA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_DYA', N'ON'
GO
ALTER DATABASE [BD_DYA] SET QUERY_STORE = OFF
GO
USE [BD_DYA]
GO
CREATE SCHEMA [DASHBOARD]
GO
CREATE SCHEMA [SEGURIDAD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DASHBOARD].[TBL_DEMOGRAFIA_EDAD](
	[DES_RAN_VC] [varchar](500) NULL,
	[NU_CAN_SI] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DASHBOARD].[TBL_DEMOGRAFIA_SEXO](
	[DES_SEX_VC] [varchar](500) NULL,
	[NU_CAN_SI] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DASHBOARD].[TBL_DEMOGRAFIA_UBICACION](
	[ABR_DEP_VC] [varchar](10) NULL,
	[DES_DEP_VC] [varchar](500) NULL,
	[NU_POB_SI] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DASHBOARD].[TBL_EMPRESAS_ESTADO](
	[DES_EST_VC] [varchar](500) NULL,
	[NU_CAN_SI] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DASHBOARD].[TBL_EMPRESAS_GIRO](
	[DES_GIR_VC] [varchar](500) NULL,
	[NU_CAN_SI] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DASHBOARD].[TBL_EMPRESAS_TIPO](
	[DES_TIP_RUC_VC] [varchar](500) NOT NULL,
	[NU_CAN_SI] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DASHBOARD].[TBL_EMPRESAS_UBICACION](
	[ABR_DEP_VC] [varchar](10) NULL,
	[DES_DEP_VC] [varchar](500) NOT NULL,
	[NU_CAN_SI] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SEGURIDAD].[TBL_USUARIO](
	[ID_USU_IN] [int] IDENTITY(1,1) NOT NULL,
	[ID_ROL_IN] [int] NULL,
	[ID_TIP_CUE_IN] [int] NULL,
	[LOG_USU_VC] [varchar](100) NULL,
	[PAS_USU_VC] [varchar](200) NULL,
	[NRO_DOC_VC] [varchar](20) NULL,
	[NOM_PER_VC] [varchar](100) NULL,
	[APE_PER_VC] [varchar](100) NULL,
	[COR_PER_VC] [varchar](100) NULL,
	[COR_COR_VC] [varchar](100) NULL,
	[TEL_PER_VC] [varchar](20) NULL,
	[CEL_COR_VC] [varchar](20) NULL,
	[FLG_EST_BO] [bit] NULL,
	[USU_CRE_IN] [int] NULL,
	[FEC_CRE_DT] [datetime] NULL,
	[TIP_UPD_IN] [int] NULL,
	[USU_UPD_IN] [int] NULL,
	[FEC_UPD_DT] [datetime] NULL,
 CONSTRAINT [PK_TBL_USUARIO] PRIMARY KEY CLUSTERED 
(
	[ID_USU_IN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SEGURIDAD].[TBL_USUARIO_AREA_INTERES](
	[ID_USU_IN] [int] NOT NULL,
	[ID_ARE_IN] [int] NOT NULL,
	[FLG_EST_BO] [bit] NULL,
	[USU_CRE_IN] [int] NULL,
	[FEC_CRE_DT] [datetime] NULL,
	[TIP_UPD_IN] [int] NULL,
	[FEC_UPD_IN] [int] NULL,
	[USU_UPD_DT] [datetime] NULL,
 CONSTRAINT [PK_TBL_USUARIO_AREA_INTERES] PRIMARY KEY CLUSTERED 
(
	[ID_USU_IN] ASC,
	[ID_ARE_IN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SEGURIDAD].[TRF_AREA_INTERES](
	[ID_ARE_IN] [int] NOT NULL,
	[DES_ARE_VC] [varchar](80) NULL,
	[FLG_EST_BO] [bit] NULL,
 CONSTRAINT [PK_TRF_AREA_INTERES] PRIMARY KEY CLUSTERED 
(
	[ID_ARE_IN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SEGURIDAD].[TRF_MENU](
	[ID_MEN_IN] [int] IDENTITY(1,1) NOT NULL,
	[ID_ROL_IN] [int] NOT NULL,
	[ID_TIP_CUE_IN] [int] NOT NULL,
	[ID_NIV_IN] [int] NOT NULL,
	[DES_IMA_VC] [varchar](60) NOT NULL,
	[DES_URL_VC] [varchar](160) NOT NULL,
	[DES_NOM_VC] [varchar](40) NOT NULL,
	[DES_TIT_VC] [varchar](160) NULL,
	[ID_PAD_IN] [int] NULL,
	[NU_ORD_IN] [int] NULL,
	[FLG_VIS_BO] [bit] NULL,
	[FLG_EST_BO] [bit] NOT NULL,
 CONSTRAINT [PK_TRF_MENU] PRIMARY KEY CLUSTERED 
(
	[ID_MEN_IN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SEGURIDAD].[TRF_ROL](
	[ID_ROL_IN] [int] NOT NULL,
	[DES_ROL_VC] [varchar](40) NULL,
	[FLG_EST_BO] [bit] NULL,
 CONSTRAINT [PK_TRF_ROL] PRIMARY KEY CLUSTERED 
(
	[ID_ROL_IN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SEGURIDAD].[TRF_TIPO_CUENTA](
	[ID_TIP_CUE_IN] [int] NOT NULL,
	[DES_TIP_CUE_VC] [varchar](40) NULL,
	[FLG_EST_BO] [bit] NULL,
 CONSTRAINT [PK_TRF_TIPO_CUENTA] PRIMARY KEY CLUSTERED 
(
	[ID_TIP_CUE_IN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TBL_USUARIO_LOG_USU_VC] ON [SEGURIDAD].[TBL_USUARIO]
(
	[LOG_USU_VC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [SEGURIDAD].[TBL_USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_USUARIO_TRF_ROL] FOREIGN KEY([ID_ROL_IN])
REFERENCES [SEGURIDAD].[TRF_ROL] ([ID_ROL_IN])
GO
ALTER TABLE [SEGURIDAD].[TBL_USUARIO] CHECK CONSTRAINT [FK_TBL_USUARIO_TRF_ROL]
GO
ALTER TABLE [SEGURIDAD].[TBL_USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_USUARIO_TRF_TIPO_CUENTA] FOREIGN KEY([ID_TIP_CUE_IN])
REFERENCES [SEGURIDAD].[TRF_TIPO_CUENTA] ([ID_TIP_CUE_IN])
GO
ALTER TABLE [SEGURIDAD].[TBL_USUARIO] CHECK CONSTRAINT [FK_TBL_USUARIO_TRF_TIPO_CUENTA]
GO
ALTER TABLE [SEGURIDAD].[TBL_USUARIO_AREA_INTERES]  WITH CHECK ADD  CONSTRAINT [FK_TBL_USUARIO_AREA_INTERES_TBL_USUARIO] FOREIGN KEY([ID_USU_IN])
REFERENCES [SEGURIDAD].[TBL_USUARIO] ([ID_USU_IN])
GO
ALTER TABLE [SEGURIDAD].[TBL_USUARIO_AREA_INTERES] CHECK CONSTRAINT [FK_TBL_USUARIO_AREA_INTERES_TBL_USUARIO]
GO
ALTER TABLE [SEGURIDAD].[TBL_USUARIO_AREA_INTERES]  WITH CHECK ADD  CONSTRAINT [FK_TBL_USUARIO_AREA_INTERES_TRF_AREA_INTERES] FOREIGN KEY([ID_ARE_IN])
REFERENCES [SEGURIDAD].[TRF_AREA_INTERES] ([ID_ARE_IN])
GO
ALTER TABLE [SEGURIDAD].[TBL_USUARIO_AREA_INTERES] CHECK CONSTRAINT [FK_TBL_USUARIO_AREA_INTERES_TRF_AREA_INTERES]
GO
ALTER TABLE [SEGURIDAD].[TRF_MENU]  WITH CHECK ADD  CONSTRAINT [FK_TRF_MENU_TRF_ROL] FOREIGN KEY([ID_ROL_IN])
REFERENCES [SEGURIDAD].[TRF_ROL] ([ID_ROL_IN])
GO
ALTER TABLE [SEGURIDAD].[TRF_MENU] CHECK CONSTRAINT [FK_TRF_MENU_TRF_ROL]
GO
ALTER TABLE [SEGURIDAD].[TRF_MENU]  WITH CHECK ADD  CONSTRAINT [FK_TRF_MENU_TRF_TIPO_CUENTA] FOREIGN KEY([ID_TIP_CUE_IN])
REFERENCES [SEGURIDAD].[TRF_TIPO_CUENTA] ([ID_TIP_CUE_IN])
GO
ALTER TABLE [SEGURIDAD].[TRF_MENU] CHECK CONSTRAINT [FK_TRF_MENU_TRF_TIPO_CUENTA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [DASHBOARD].[SP_DEMOGRAFIA_EDAD]
AS
BEGIN
	SELECT T0.DES_RAN_VC,
	ISNULL(T0.NU_CAN_SI,0) AS NU_CAN_SI
	FROM DASHBOARD.TBL_DEMOGRAFIA_EDAD T0
	ORDER BY T0.NU_CAN_SI DESC;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [DASHBOARD].[SP_DEMOGRAFIA_SEXO]
AS
BEGIN
	SELECT T0.DES_SEX_VC,
	ISNULL(T0.NU_CAN_SI,0) AS NU_CAN_SI
	FROM DASHBOARD.TBL_DEMOGRAFIA_SEXO T0
	ORDER BY T0.NU_CAN_SI DESC;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [DASHBOARD].[SP_DEMOGRAFIA_UBICACION]
AS
BEGIN
	SELECT T0.ABR_DEP_VC,
	T0.DES_DEP_VC,
	ISNULL(T0.NU_POB_SI,0) AS NU_POB_SI
	FROM DASHBOARD.TBL_DEMOGRAFIA_UBICACION T0
	ORDER BY T0.NU_POB_SI;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [DASHBOARD].[SP_EMPRESAS_ESTADO]
AS
BEGIN
	SELECT T0.DES_EST_VC,
	T0.NU_CAN_SI
	FROM DASHBOARD.TBL_EMPRESAS_ESTADO T0
	ORDER BY T0.NU_CAN_SI DESC;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DASHBOARD].[SP_EMPRESAS_GIRO]
AS
BEGIN
	SELECT T0.DES_GIR_VC,
	T0.NU_CAN_SI
	FROM DASHBOARD.TBL_EMPRESAS_GIRO T0
	ORDER BY T0.NU_CAN_SI DESC;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DASHBOARD].[SP_EMPRESAS_TIPO]
AS
BEGIN
	SELECT T0.DES_TIP_RUC_VC,
	T0.NU_CAN_SI
	FROM DASHBOARD.TBL_EMPRESAS_TIPO T0
	ORDER BY T0.NU_CAN_SI DESC;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DASHBOARD].[SP_EMPRESAS_UBICACION]
AS
BEGIN
	SELECT T0.ABR_DEP_VC,
	T0.DES_DEP_VC,
	T0.NU_CAN_SI
	FROM DASHBOARD.TBL_EMPRESAS_UBICACION T0
	ORDER BY T0.NU_CAN_SI DESC;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [SEGURIDAD].[SP_AREA_INTERES_LISTAR_COMBO]
AS
BEGIN
	SELECT T0.ID_ARE_IN,
	T0.DES_ARE_VC
	FROM SEGURIDAD.TRF_AREA_INTERES T0
	WHERE T0.FLG_EST_BO=1;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [SEGURIDAD].[SP_MENU_LISTAR]
@ID_ROL_IN INT,
@ID_TIP_CUE_IN INT
AS
BEGIN
	SELECT T0.ID_MEN_IN,
	T0.ID_NIV_IN,
	T0.DES_IMA_VC,
	T0.DES_URL_VC,
	T0.DES_NOM_VC,
	T0.DES_TIT_VC,
	T0.ID_PAD_IN,
	ISNULL(T0.FLG_VIS_BO,0) AS FLG_VIS_BO
	FROM SEGURIDAD.TRF_MENU T0
	WHERE T0.ID_ROL_IN=@ID_ROL_IN
	AND T0.ID_TIP_CUE_IN=@ID_TIP_CUE_IN
	ORDER BY T0.ID_NIV_IN,
	T0.NU_ORD_IN;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [SEGURIDAD].[SP_ROL_LISTAR_COMBO]
AS
BEGIN
	SELECT T0.ID_ROL_IN,
	T0.DES_ROL_VC
	FROM SEGURIDAD.TRF_ROL T0
	WHERE T0.FLG_EST_BO=1;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [SEGURIDAD].[SP_TIPO_CUENTA_LISTAR_COMBO]
AS
BEGIN
	SELECT T0.ID_TIP_CUE_IN,
	T0.DES_TIP_CUE_VC
	FROM SEGURIDAD.TRF_TIPO_CUENTA T0
	WHERE T0.FLG_EST_BO=1;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [SEGURIDAD].[SP_USUARIO_ELIMINAR]
@ID_USU_IN INT,
@USU_UPD_IN INT
AS
BEGIN
	UPDATE SEGURIDAD.TBL_USUARIO
	SET FLG_EST_BO=0,
	TIP_UPD_IN=4,
	FEC_UPD_DT=GETDATE(),
	USU_UPD_IN=@USU_UPD_IN
	WHERE ID_USU_IN=@ID_USU_IN;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [SEGURIDAD].[SP_USUARIO_LISTAR]
@LOG_USU_VC varchar(100),
@NRO_DOC_VC varchar(20),
@NOM_PER_VC varchar(100),
@APE_PER_VC varchar(100),
@COR_COR_VC varchar(100)
AS
BEGIN
	SELECT T0.ID_USU_IN,
	T0.LOG_USU_VC,
	T0.PAS_USU_VC,
	T0.NRO_DOC_VC,
	T0.NOM_PER_VC,
	T0.APE_PER_VC,
	T0.COR_COR_VC,
	T0.TEL_PER_VC,
	T0.CEL_COR_VC,
	T0.FLG_EST_BO,
	CASE WHEN T0.FLG_EST_BO=1 THEN 'ACTIVO' ELSE 'INACTIVO' END AS DES_EST_VC,
	CASE T0.TIP_UPD_IN WHEN 1 THEN 'CREADO'
		WHEN 2 THEN 'MODIFICADO'
		WHEN 3 THEN 'ACTIVADO'
		WHEN 4 THEN 'ELIMINADO' END AS DES_UPD_VC,
	T0.ID_ROL_IN,
	T0.ID_TIP_CUE_IN,
	T1.LOG_USU_VC AS USU_CRE_VC,
	CONVERT(VARCHAR,ISNULL(T0.FEC_UPD_DT,T0.FEC_CRE_DT),103) + ' ' +
	CONVERT(VARCHAR,ISNULL(T0.FEC_UPD_DT,T0.FEC_CRE_DT),108) AS FEC_CRE_VC
	FROM SEGURIDAD.TBL_USUARIO T0
	LEFT JOIN SEGURIDAD.TBL_USUARIO T1
	ON T1.ID_USU_IN=ISNULL(T0.USU_UPD_IN,T0.USU_CRE_IN)
	WHERE T0.FLG_EST_BO=1
	AND (@LOG_USU_VC IS NULL OR T0.LOG_USU_VC LIKE '%' + @LOG_USU_VC + '%')
	AND (@NRO_DOC_VC IS NULL OR T0.NRO_DOC_VC = @NRO_DOC_VC)
	AND (@NOM_PER_VC IS NULL OR T0.NOM_PER_VC LIKE '%' + @NOM_PER_VC + '%')
	AND (@APE_PER_VC IS NULL OR T0.APE_PER_VC LIKE '%' + @APE_PER_VC + '%')
	AND (@COR_COR_VC IS NULL OR T0.COR_COR_VC LIKE '%' + @COR_COR_VC + '%');
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [SEGURIDAD].[SP_USUARIO_LOGIN]
@LOG_USU_VC VARCHAR(100),
@PAS_USU_VC VARCHAR(100)
AS
BEGIN
	SELECT T0.ID_USU_IN
		,T0.ID_ROL_IN
		,T0.ID_TIP_CUE_IN
		,T1.DES_ROL_VC
		,T2.DES_TIP_CUE_VC
		,T0.LOG_USU_VC
	FROM SEGURIDAD.TBL_USUARIO T0
	INNER JOIN SEGURIDAD.TRF_ROL T1
	ON T1.ID_ROL_IN=T0.ID_ROL_IN
	INNER JOIN SEGURIDAD.TRF_TIPO_CUENTA T2
	ON T2.ID_TIP_CUE_IN=T0.ID_TIP_CUE_IN
	WHERE T0.FLG_EST_BO=1 
	AND T0.LOG_USU_VC=@LOG_USU_VC
	AND T0.PAS_USU_VC=@PAS_USU_VC;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [SEGURIDAD].[SP_USUARIO_OBTENER_ID]
@ID_USU_IN INT
AS
BEGIN
	SELECT T0.ID_USU_IN
		,T0.ID_ROL_IN
		,T0.ID_TIP_CUE_IN
		,T1.DES_ROL_VC
		,T2.DES_TIP_CUE_VC
		,T0.LOG_USU_VC
	FROM SEGURIDAD.TBL_USUARIO T0
	INNER JOIN SEGURIDAD.TRF_ROL T1
	ON T1.ID_ROL_IN=T0.ID_ROL_IN
	INNER JOIN SEGURIDAD.TRF_TIPO_CUENTA T2
	ON T2.ID_TIP_CUE_IN=T0.ID_TIP_CUE_IN
	WHERE T0.ID_USU_IN=@ID_USU_IN;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [SEGURIDAD].[SP_USUARIO_REGISTRAR]
@ID_USU_IN int output
,@ID_ROL_IN int
,@ID_TIP_CUE_IN int
,@LOG_USU_VC varchar(100)
,@PAS_USU_VC varchar(200)
,@NRO_DOC_VC  varchar(20)
,@NOM_PER_VC  varchar(100)
,@APE_PER_VC  varchar(100)
,@COR_PER_VC varchar(100)
,@COR_COR_VC varchar(100)
,@TEL_PER_VC varchar(20)
,@CEL_COR_VC varchar(20)
,@USU_CRE_IN int
AS
BEGIN
	IF @ID_USU_IN = 0
	BEGIN
		INSERT INTO SEGURIDAD.TBL_USUARIO
           (ID_ROL_IN
           ,ID_TIP_CUE_IN
           ,LOG_USU_VC
           ,PAS_USU_VC
		   ,NRO_DOC_VC
		   ,NOM_PER_VC
		   ,APE_PER_VC
           ,COR_PER_VC
           ,COR_COR_VC
           ,TEL_PER_VC
           ,CEL_COR_VC
           ,FLG_EST_BO
           ,USU_CRE_IN
           ,FEC_CRE_DT
           ,TIP_UPD_IN)
		VALUES
           (@ID_ROL_IN
           ,@ID_TIP_CUE_IN
           ,@LOG_USU_VC
           ,@PAS_USU_VC
		   ,@NRO_DOC_VC
		   ,@NOM_PER_VC
		   ,@APE_PER_VC
           ,@COR_PER_VC
           ,@COR_COR_VC
           ,@TEL_PER_VC
           ,@CEL_COR_VC
           ,1
           ,@USU_CRE_IN
           ,GETDATE()
           ,1);

		SET @ID_USU_IN = SCOPE_IDENTITY();
	END ELSE BEGIN
		UPDATE SEGURIDAD.TBL_USUARIO
		SET PAS_USU_VC=@PAS_USU_VC
			,NRO_DOC_VC=@NRO_DOC_VC
			,NOM_PER_VC=@NOM_PER_VC
			,APE_PER_VC=@APE_PER_VC
			,COR_PER_VC=@COR_PER_VC
			,COR_COR_VC=@COR_COR_VC
			,TEL_PER_VC=@TEL_PER_VC
			,CEL_COR_VC=@CEL_COR_VC
			,USU_UPD_IN=@USU_CRE_IN
			,FEC_UPD_DT=GETDATE()
			,TIP_UPD_IN=2
		WHERE ID_USU_IN=@ID_USU_IN;
	END;
END;
GO
USE [master]
GO
ALTER DATABASE [BD_DYA] SET  READ_WRITE 
GO