CREATE DATABASE [WikiDog]
GO
USE [WikiDog]
GO
/****** Object:  Table [dbo].[Sesion]    Script Date: 09/24/2017 22:52:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sesion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sesion](
	[IdSesion] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](150) NOT NULL,
	[Fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSesion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Sesion] ON
INSERT [dbo].[Sesion] ([IdSesion], [Usuario], [Fecha]) VALUES (1, N'Sebasq72', CAST(0x0000A7F801406F27 AS DateTime))
SET IDENTITY_INSERT [dbo].[Sesion] OFF
/****** Object:  Table [dbo].[Diagnostico]    Script Date: 09/24/2017 22:52:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Diagnostico]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Diagnostico](
	[IdDiagnostico] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDiagnostico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Diagnostico] ON
INSERT [dbo].[Diagnostico] ([IdDiagnostico], [Descripcion]) VALUES (1, N'GRIPA')
SET IDENTITY_INSERT [dbo].[Diagnostico] OFF
/****** Object:  StoredProcedure [dbo].[CrearSesion]    Script Date: 09/24/2017 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CrearSesion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CrearSesion](
@Usuario VARCHAR(150)
)
AS
BEGIN

	INSERT INTO SESION(Usuario, Fecha) VALUES(@Usuario, GETDATE())
	
	SELECT CAST(SCOPE_IDENTITY() AS INT)
	
END' 
END
GO
/****** Object:  Table [dbo].[Sintomas]    Script Date: 09/24/2017 22:52:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sintomas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sintomas](
	[IdSintoma] [int] IDENTITY(1,1) NOT NULL,
	[IdDiagnostico] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSintoma] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Sintomas] ON
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (1, 1, N'ESCALOFRIOS')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (2, 1, N'OJOS LLOROSOS')
SET IDENTITY_INSERT [dbo].[Sintomas] OFF
/****** Object:  StoredProcedure [dbo].[BuscarSesion]    Script Date: 09/24/2017 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuscarSesion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[BuscarSesion](
@IdSesion INT
)
AS
BEGIN

	SELECT IdSesion, Usuario, Fecha
	FROM Sesion
	WHERE IdSesion = @IdSesion

END' 
END
GO
/****** Object:  Table [dbo].[Inferencias]    Script Date: 09/24/2017 22:52:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inferencias]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Inferencias](
	[IdInferencia] [int] IDENTITY(1,1) NOT NULL,
	[IdRecurso] [int] NULL,
	[IdSintoma] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdInferencia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Inferencias] ON
INSERT [dbo].[Inferencias] ([IdInferencia], [IdRecurso], [IdSintoma]) VALUES (1, NULL, 1)
INSERT [dbo].[Inferencias] ([IdInferencia], [IdRecurso], [IdSintoma]) VALUES (2, 1, 2)
SET IDENTITY_INSERT [dbo].[Inferencias] OFF
/****** Object:  Table [dbo].[HistoricoSintomas]    Script Date: 09/24/2017 22:52:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HistoricoSintomas](
	[IdHistorico] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[IdInferencia] [int] NOT NULL,
	[IdSesion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHistorico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[BuscarInferencias]    Script Date: 09/24/2017 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuscarInferencias]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[BuscarInferencias](
@IdInferencia INT = NULL,
@IdRecurso	  INT = NULL
)
AS
BEGIN
	
	SELECT I.IdInferencia, I.IdRecurso, S.IdSintoma, S.Descripcion AS DescripcionSintoma, D.IdDiagnostico, D.Descripcion AS DescripcionDiagnostico		
	FROM Inferencias I
	INNER JOIN Sintomas S ON I.IdSintoma = S.IdSintoma	
	INNER JOIN Diagnostico D ON S.IdDiagnostico = D.IdDiagnostico
	WHERE 
		I.IdInferencia = ISNULL(@IdInferencia, I.IdInferencia)
	AND I.IdRecurso = ISNULL(@IdRecurso, I.IdRecurso)			

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[CrearHistoricoSintomas]    Script Date: 09/24/2017 22:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CrearHistoricoSintomas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CrearHistoricoSintomas](
@IdInferencia INT,
@IdSesion	  INT
)
AS
BEGIN

	INSERT INTO HistoricoSintomas(IdInferencia, IdSesion)
	VALUES(@IdInferencia, @IdSesion)

END' 
END
GO
/****** Object:  ForeignKey [FK_HistoricoSintomas_Inferencia]    Script Date: 09/24/2017 22:52:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoricoSintomas_Inferencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]'))
ALTER TABLE [dbo].[HistoricoSintomas]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoSintomas_Inferencia] FOREIGN KEY([IdInferencia])
REFERENCES [dbo].[Inferencias] ([IdInferencia])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoricoSintomas_Inferencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]'))
ALTER TABLE [dbo].[HistoricoSintomas] CHECK CONSTRAINT [FK_HistoricoSintomas_Inferencia]
GO
/****** Object:  ForeignKey [FK_HistoricoSintomas_Sesion]    Script Date: 09/24/2017 22:52:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoricoSintomas_Sesion]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]'))
ALTER TABLE [dbo].[HistoricoSintomas]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoSintomas_Sesion] FOREIGN KEY([IdSesion])
REFERENCES [dbo].[Sesion] ([IdSesion])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoricoSintomas_Sesion]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]'))
ALTER TABLE [dbo].[HistoricoSintomas] CHECK CONSTRAINT [FK_HistoricoSintomas_Sesion]
GO
/****** Object:  ForeignKey [FK_Inferencias_Sintoma]    Script Date: 09/24/2017 22:52:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inferencias_Sintoma]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inferencias]'))
ALTER TABLE [dbo].[Inferencias]  WITH CHECK ADD  CONSTRAINT [FK_Inferencias_Sintoma] FOREIGN KEY([IdSintoma])
REFERENCES [dbo].[Sintomas] ([IdSintoma])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inferencias_Sintoma]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inferencias]'))
ALTER TABLE [dbo].[Inferencias] CHECK CONSTRAINT [FK_Inferencias_Sintoma]
GO
/****** Object:  ForeignKey [FK_Sintomas_Diagnostico]    Script Date: 09/24/2017 22:52:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sintomas_Diagnostico]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sintomas]'))
ALTER TABLE [dbo].[Sintomas]  WITH CHECK ADD  CONSTRAINT [FK_Sintomas_Diagnostico] FOREIGN KEY([IdDiagnostico])
REFERENCES [dbo].[Diagnostico] ([IdDiagnostico])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sintomas_Diagnostico]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sintomas]'))
ALTER TABLE [dbo].[Sintomas] CHECK CONSTRAINT [FK_Sintomas_Diagnostico]
GO
