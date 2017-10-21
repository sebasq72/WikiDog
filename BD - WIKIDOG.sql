﻿CREATE DATABASE [WikiDog]
GO
USE [WikiDog]
GO
/****** Object:  ForeignKey [FK_Sintomas_Diagnostico]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sintomas_Diagnostico]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sintomas]'))
ALTER TABLE [dbo].[Sintomas] DROP CONSTRAINT [FK_Sintomas_Diagnostico]
GO
/****** Object:  ForeignKey [FK_Inferencias_Sintoma]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inferencias_Sintoma]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inferencias]'))
ALTER TABLE [dbo].[Inferencias] DROP CONSTRAINT [FK_Inferencias_Sintoma]
GO
/****** Object:  ForeignKey [FK_HistoricoSintomas_Inferencia]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoricoSintomas_Inferencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]'))
ALTER TABLE [dbo].[HistoricoSintomas] DROP CONSTRAINT [FK_HistoricoSintomas_Inferencia]
GO
/****** Object:  ForeignKey [FK_HistoricoSintomas_Sesion]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoricoSintomas_Sesion]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]'))
ALTER TABLE [dbo].[HistoricoSintomas] DROP CONSTRAINT [FK_HistoricoSintomas_Sesion]
GO
/****** Object:  StoredProcedure [dbo].[CrearHistoricoSintomas]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CrearHistoricoSintomas]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CrearHistoricoSintomas]
GO
/****** Object:  StoredProcedure [dbo].[BuscarInferencias]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuscarInferencias]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BuscarInferencias]
GO
/****** Object:  Table [dbo].[HistoricoSintomas]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoricoSintomas_Inferencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]'))
ALTER TABLE [dbo].[HistoricoSintomas] DROP CONSTRAINT [FK_HistoricoSintomas_Inferencia]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoricoSintomas_Sesion]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]'))
ALTER TABLE [dbo].[HistoricoSintomas] DROP CONSTRAINT [FK_HistoricoSintomas_Sesion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]') AND type in (N'U'))
DROP TABLE [dbo].[HistoricoSintomas]
GO
/****** Object:  Table [dbo].[Inferencias]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inferencias_Sintoma]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inferencias]'))
ALTER TABLE [dbo].[Inferencias] DROP CONSTRAINT [FK_Inferencias_Sintoma]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inferencias]') AND type in (N'U'))
DROP TABLE [dbo].[Inferencias]
GO
/****** Object:  StoredProcedure [dbo].[CrearSintoma]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CrearSintoma]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CrearSintoma]
GO
/****** Object:  StoredProcedure [dbo].[BuscarSesion]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuscarSesion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BuscarSesion]
GO
/****** Object:  StoredProcedure [dbo].[CrearDiagnostico]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CrearDiagnostico]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CrearDiagnostico]
GO
/****** Object:  StoredProcedure [dbo].[CrearSesion]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CrearSesion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CrearSesion]
GO
/****** Object:  Table [dbo].[Sintomas]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sintomas_Diagnostico]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sintomas]'))
ALTER TABLE [dbo].[Sintomas] DROP CONSTRAINT [FK_Sintomas_Diagnostico]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sintomas]') AND type in (N'U'))
DROP TABLE [dbo].[Sintomas]
GO
/****** Object:  StoredProcedure [dbo].[BuscarDiagnostico]    Script Date: 10/21/2017 02:35:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuscarDiagnostico]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BuscarDiagnostico]
GO
/****** Object:  Table [dbo].[Diagnostico]    Script Date: 10/21/2017 02:35:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Diagnostico]') AND type in (N'U'))
DROP TABLE [dbo].[Diagnostico]
GO
/****** Object:  Table [dbo].[Sesion]    Script Date: 10/21/2017 02:35:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sesion]') AND type in (N'U'))
DROP TABLE [dbo].[Sesion]
GO
/****** Object:  Table [dbo].[Sesion]    Script Date: 10/21/2017 02:35:40 ******/
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
INSERT [dbo].[Sesion] ([IdSesion], [Usuario], [Fecha]) VALUES (2, N'72', CAST(0x0000A7F80157CFA8 AS DateTime))
INSERT [dbo].[Sesion] ([IdSesion], [Usuario], [Fecha]) VALUES (3, N'72', CAST(0x0000A7F8015872A5 AS DateTime))
INSERT [dbo].[Sesion] ([IdSesion], [Usuario], [Fecha]) VALUES (4, N'pepe', CAST(0x0000A7F80166675B AS DateTime))
INSERT [dbo].[Sesion] ([IdSesion], [Usuario], [Fecha]) VALUES (5, N'xxx', CAST(0x0000A7F80166B1A5 AS DateTime))
INSERT [dbo].[Sesion] ([IdSesion], [Usuario], [Fecha]) VALUES (6, N'xxx4', CAST(0x0000A7F801672003 AS DateTime))
INSERT [dbo].[Sesion] ([IdSesion], [Usuario], [Fecha]) VALUES (7, N'pepedos', CAST(0x0000A7F801672E46 AS DateTime))
SET IDENTITY_INSERT [dbo].[Sesion] OFF
/****** Object:  Table [dbo].[Diagnostico]    Script Date: 10/21/2017 02:35:40 ******/
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
INSERT [dbo].[Diagnostico] ([IdDiagnostico], [Descripcion]) VALUES (2, N'MOQUILLO')
INSERT [dbo].[Diagnostico] ([IdDiagnostico], [Descripcion]) VALUES (3, N'PARVOVIRUS')
INSERT [dbo].[Diagnostico] ([IdDiagnostico], [Descripcion]) VALUES (4, N'HEPATITIS VÍRICA')
INSERT [dbo].[Diagnostico] ([IdDiagnostico], [Descripcion]) VALUES (5, N'PIOMETRA')
INSERT [dbo].[Diagnostico] ([IdDiagnostico], [Descripcion]) VALUES (11, N'test')
INSERT [dbo].[Diagnostico] ([IdDiagnostico], [Descripcion]) VALUES (12, N'test2')
SET IDENTITY_INSERT [dbo].[Diagnostico] OFF
/****** Object:  StoredProcedure [dbo].[BuscarDiagnostico]    Script Date: 10/21/2017 02:35:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuscarDiagnostico]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[BuscarDiagnostico](
@IdDiagnostico INT = NULL
)
AS
BEGIN

	SELECT IdDiagnostico, Descripcion
	FROM Diagnostico
	WHERE IdDiagnostico = isnull(@IdDiagnostico, IdDiagnostico)
	
END' 
END
GO
/****** Object:  Table [dbo].[Sintomas]    Script Date: 10/21/2017 02:35:41 ******/
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
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (3, 2, N'TOS O ESTORNUDO')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (4, 2, N'SECRECIONES NASALES')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (5, 2, N'FALTA DE APETITO')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (6, 3, N'VOMITOS')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (7, 3, N'DIARREA')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (8, 3, N'POPO CON SANGRE')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (9, 4, N'DUERME MUCHO')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (10, 4, N'ESTA APATICO')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (11, 4, N'INFLAMACION DE LAS AMIGDALAS')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (12, 5, N'FLUJO VAGINAL')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (13, 5, N'DEPRESION')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (14, 5, N'COJERA EN LAS PATAS TRASERAS')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (16, 11, N'PEDOS')
INSERT [dbo].[Sintomas] ([IdSintoma], [IdDiagnostico], [Descripcion]) VALUES (17, 12, N'DD')
SET IDENTITY_INSERT [dbo].[Sintomas] OFF
/****** Object:  StoredProcedure [dbo].[CrearSesion]    Script Date: 10/21/2017 02:35:41 ******/
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
/****** Object:  StoredProcedure [dbo].[CrearDiagnostico]    Script Date: 10/21/2017 02:35:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CrearDiagnostico]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CrearDiagnostico](
@Descripcion VARCHAR(150)
)
AS
BEGIN

	INSERT INTO Diagnostico(Descripcion) VALUES(@Descripcion)
	
	SELECT CAST(SCOPE_IDENTITY() AS INT)
	
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarSesion]    Script Date: 10/21/2017 02:35:41 ******/
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
/****** Object:  StoredProcedure [dbo].[CrearSintoma]    Script Date: 10/21/2017 02:35:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CrearSintoma]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CrearSintoma](
@IdDiagnostico INT,
@Descripcion VARCHAR(150)
)
AS
BEGIN

	INSERT INTO Sintomas(IdDiagnostico, Descripcion) VALUES(@IdDiagnostico, @Descripcion)
	
	SELECT CAST(SCOPE_IDENTITY() AS INT)
	
END' 
END
GO
/****** Object:  Table [dbo].[Inferencias]    Script Date: 10/21/2017 02:35:41 ******/
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
INSERT [dbo].[Inferencias] ([IdInferencia], [IdRecurso], [IdSintoma]) VALUES (3, NULL, 3)
INSERT [dbo].[Inferencias] ([IdInferencia], [IdRecurso], [IdSintoma]) VALUES (4, 3, 4)
INSERT [dbo].[Inferencias] ([IdInferencia], [IdRecurso], [IdSintoma]) VALUES (5, 3, 5)
INSERT [dbo].[Inferencias] ([IdInferencia], [IdRecurso], [IdSintoma]) VALUES (6, NULL, 6)
INSERT [dbo].[Inferencias] ([IdInferencia], [IdRecurso], [IdSintoma]) VALUES (7, 6, 7)
INSERT [dbo].[Inferencias] ([IdInferencia], [IdRecurso], [IdSintoma]) VALUES (8, 6, 8)
SET IDENTITY_INSERT [dbo].[Inferencias] OFF
/****** Object:  Table [dbo].[HistoricoSintomas]    Script Date: 10/21/2017 02:35:41 ******/
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
/****** Object:  StoredProcedure [dbo].[BuscarInferencias]    Script Date: 10/21/2017 02:35:41 ******/
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
	I.IdRecurso = ISNULL(@IdRecurso, I.IdRecurso)			

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[CrearHistoricoSintomas]    Script Date: 10/21/2017 02:35:41 ******/
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
/****** Object:  ForeignKey [FK_Sintomas_Diagnostico]    Script Date: 10/21/2017 02:35:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sintomas_Diagnostico]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sintomas]'))
ALTER TABLE [dbo].[Sintomas]  WITH CHECK ADD  CONSTRAINT [FK_Sintomas_Diagnostico] FOREIGN KEY([IdDiagnostico])
REFERENCES [dbo].[Diagnostico] ([IdDiagnostico])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sintomas_Diagnostico]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sintomas]'))
ALTER TABLE [dbo].[Sintomas] CHECK CONSTRAINT [FK_Sintomas_Diagnostico]
GO
/****** Object:  ForeignKey [FK_Inferencias_Sintoma]    Script Date: 10/21/2017 02:35:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inferencias_Sintoma]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inferencias]'))
ALTER TABLE [dbo].[Inferencias]  WITH CHECK ADD  CONSTRAINT [FK_Inferencias_Sintoma] FOREIGN KEY([IdSintoma])
REFERENCES [dbo].[Sintomas] ([IdSintoma])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inferencias_Sintoma]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inferencias]'))
ALTER TABLE [dbo].[Inferencias] CHECK CONSTRAINT [FK_Inferencias_Sintoma]
GO
/****** Object:  ForeignKey [FK_HistoricoSintomas_Inferencia]    Script Date: 10/21/2017 02:35:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoricoSintomas_Inferencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]'))
ALTER TABLE [dbo].[HistoricoSintomas]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoSintomas_Inferencia] FOREIGN KEY([IdInferencia])
REFERENCES [dbo].[Inferencias] ([IdInferencia])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoricoSintomas_Inferencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]'))
ALTER TABLE [dbo].[HistoricoSintomas] CHECK CONSTRAINT [FK_HistoricoSintomas_Inferencia]
GO
/****** Object:  ForeignKey [FK_HistoricoSintomas_Sesion]    Script Date: 10/21/2017 02:35:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoricoSintomas_Sesion]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]'))
ALTER TABLE [dbo].[HistoricoSintomas]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoSintomas_Sesion] FOREIGN KEY([IdSesion])
REFERENCES [dbo].[Sesion] ([IdSesion])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoricoSintomas_Sesion]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoricoSintomas]'))
ALTER TABLE [dbo].[HistoricoSintomas] CHECK CONSTRAINT [FK_HistoricoSintomas_Sesion]
GO
