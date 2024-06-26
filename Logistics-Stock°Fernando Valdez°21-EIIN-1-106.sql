USE [master]
GO
/****** Object:  Database [Logistics-Stock ]    Script Date: 18/04/2024 10:24:34 p. m. ******/
CREATE DATABASE [Logistics-Stock ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Stock Logistics', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Stock Logistics.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Stock Logistics_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Stock Logistics_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Logistics-Stock ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Logistics-Stock ].[dbo].[sp_fulltext_database] @action = 'enable'
end

ALTER DATABASE [Logistics-Stock ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Logistics-Stock ]
GO
/****** Object:  Table [dbo].[ClientesId]    Script Date: 18/04/2024 10:24:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientesId](
	[ClientesId] [int] NOT NULL,
	[Nombre] [nchar](70) NULL,
	[Telefono] [nchar](20) NULL,
	[Direccion] [nchar](150) NULL,
	[Correo electronico] [nchar](30) NULL,
	[Historial de ventas] [nchar](200) NULL,
	[Producto] [int] NULL,
 CONSTRAINT [PK_ClientesId] PRIMARY KEY CLUSTERED 
(
	[ClientesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntradasId]    Script Date: 18/04/2024 10:24:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntradasId](
	[EntradasId] [int] NOT NULL,
	[Nombre] [nchar](40) NULL,
	[Fecha] [nchar](18) NULL,
	[Productos] [int] NOT NULL,
	[Proveedores] [int] NOT NULL,
	[Precio de compra] [varchar](5000) NULL,
	[Numero de lote] [nchar](15) NULL,
 CONSTRAINT [PK_EntradasId_1] PRIMARY KEY CLUSTERED 
(
	[EntradasId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductosId]    Script Date: 18/04/2024 10:24:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductosId](
	[ProductosId] [int] NOT NULL,
	[Nombre] [nchar](80) NULL,
	[Proveedor] [int] NOT NULL,
	[Categoria] [nchar](30) NULL,
	[Unidad] [nchar](30) NULL,
	[Descripcion] [nchar](500) NULL,
	[Precio de compra] [varchar](5000) NULL,
	[Precio de venta] [varchar](5000) NULL,
	[Stock actual] [varchar](5000) NULL,
	[Stock minimo] [varchar](5000) NULL,
	[Stock maximo] [varchar](5000) NULL,
	[Fecha de vencimiento] [nchar](15) NULL,
	[Ubicacion] [nchar](150) NULL,
	[Entradas] [int] NULL,
	[Salidas] [int] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[ProductosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProveedoresId]    Script Date: 18/04/2024 10:24:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProveedoresId](
	[ProveedoresId] [int] NOT NULL,
	[Nombre] [nchar](50) NULL,
	[Direccion] [nchar](150) NULL,
	[Telefono] [nchar](20) NULL,
	[Sitio web] [nchar](50) NULL,
	[Historial de compras] [nchar](500) NULL,
	[Entradas] [int] NULL,
	[Producto] [int] NULL,
 CONSTRAINT [PK_ProveedoresId] PRIMARY KEY CLUSTERED 
(
	[ProveedoresId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalidasId]    Script Date: 18/04/2024 10:24:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalidasId](
	[SalidasId] [int] NOT NULL,
	[Fecha] [nchar](18) NULL,
	[Producto] [int] NULL,
	[Cliente] [int] NULL,
	[Cantidad] [varchar](5000) NULL,
	[Precio de venta] [varchar](5000) NULL,
	[Numero de factura] [nchar](20) NULL,
 CONSTRAINT [PK_SalidasId] PRIMARY KEY CLUSTERED 
(
	[SalidasId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ClientesId] ([ClientesId], [Nombre], [Telefono], [Direccion], [Correo electronico], [Historial de ventas], [Producto]) VALUES (1, N'Juan                                                                  ', N'829123456           ', N'Sabana palenque                                                                                                                                       ', NULL, N'2                                                                                                                                                                                                       ', 10)
INSERT [dbo].[ClientesId] ([ClientesId], [Nombre], [Telefono], [Direccion], [Correo electronico], [Historial de ventas], [Producto]) VALUES (2, N'Carlos                                                                ', N'829456123           ', N'Nizao                                                                                                                                                 ', NULL, N'5                                                                                                                                                                                                       ', 9)
INSERT [dbo].[ClientesId] ([ClientesId], [Nombre], [Telefono], [Direccion], [Correo electronico], [Historial de ventas], [Producto]) VALUES (3, N'Jose                                                                  ', N'829789456           ', N'Sabana Palenque                                                                                                                                       ', N'valdez@gmail.com              ', N'12                                                                                                                                                                                                      ', 8)
INSERT [dbo].[ClientesId] ([ClientesId], [Nombre], [Telefono], [Direccion], [Correo electronico], [Historial de ventas], [Producto]) VALUES (4, N'Perez                                                                 ', N'809258147           ', N'Haina                                                                                                                                                 ', NULL, N'33                                                                                                                                                                                                      ', 7)
INSERT [dbo].[ClientesId] ([ClientesId], [Nombre], [Telefono], [Direccion], [Correo electronico], [Historial de ventas], [Producto]) VALUES (5, N'Raul                                                                  ', N'809963258           ', N'Haina                                                                                                                                                 ', N'Placencio22@gmail.com         ', N'3                                                                                                                                                                                                       ', 6)
INSERT [dbo].[ClientesId] ([ClientesId], [Nombre], [Telefono], [Direccion], [Correo electronico], [Historial de ventas], [Producto]) VALUES (6, N'Carola                                                                ', N'849147852           ', N'Sabana Palenque                                                                                                                                       ', N'Baez@gmail.com                ', N'8                                                                                                                                                                                                       ', 5)
INSERT [dbo].[ClientesId] ([ClientesId], [Nombre], [Telefono], [Direccion], [Correo electronico], [Historial de ventas], [Producto]) VALUES (7, N'Yanna                                                                 ', N'809159258           ', N'Don gregorio                                                                                                                                          ', N'Kamel@gmail.com               ', N'7                                                                                                                                                                                                       ', 4)
INSERT [dbo].[ClientesId] ([ClientesId], [Nombre], [Telefono], [Direccion], [Correo electronico], [Historial de ventas], [Producto]) VALUES (8, N'Yula                                                                  ', N'849357741           ', N'San cristobal                                                                                                                                         ', NULL, N'50                                                                                                                                                                                                      ', 3)
INSERT [dbo].[ClientesId] ([ClientesId], [Nombre], [Telefono], [Direccion], [Correo electronico], [Historial de ventas], [Producto]) VALUES (9, N'Corazon                                                               ', N'829741258           ', N'Haina                                                                                                                                                 ', NULL, N'1                                                                                                                                                                                                       ', 2)
INSERT [dbo].[ClientesId] ([ClientesId], [Nombre], [Telefono], [Direccion], [Correo electronico], [Historial de ventas], [Producto]) VALUES (10, N'Noemi                                                                 ', N'8092432645          ', N'Nizao                                                                                                                                                 ', NULL, N'6                                                                                                                                                                                                       ', 1)
GO
INSERT [dbo].[EntradasId] ([EntradasId], [Nombre], [Fecha], [Productos], [Proveedores], [Precio de compra], [Numero de lote]) VALUES (1, N'Mero                                    ', N'10/1/24           ', 1, 1, N'250', N'158            ')
INSERT [dbo].[EntradasId] ([EntradasId], [Nombre], [Fecha], [Productos], [Proveedores], [Precio de compra], [Numero de lote]) VALUES (2, N'Silla                                   ', N'11/21/24          ', 2, 2, N'3500', N'528            ')
INSERT [dbo].[EntradasId] ([EntradasId], [Nombre], [Fecha], [Productos], [Proveedores], [Precio de compra], [Numero de lote]) VALUES (3, N'Mueble                                  ', N'12/1/24           ', 3, 3, N'5000', N'456            ')
INSERT [dbo].[EntradasId] ([EntradasId], [Nombre], [Fecha], [Productos], [Proveedores], [Precio de compra], [Numero de lote]) VALUES (4, N'Comedor                                 ', N'13/1/24           ', 4, 4, N'10000', N'258            ')
INSERT [dbo].[EntradasId] ([EntradasId], [Nombre], [Fecha], [Productos], [Proveedores], [Precio de compra], [Numero de lote]) VALUES (5, N'Mesa                                    ', N'14/1/24           ', 5, 5, N'9000', N'259            ')
INSERT [dbo].[EntradasId] ([EntradasId], [Nombre], [Fecha], [Productos], [Proveedores], [Precio de compra], [Numero de lote]) VALUES (6, N'Peluca Riza                             ', N'15/1/24           ', 6, 6, N'1500', N'257            ')
INSERT [dbo].[EntradasId] ([EntradasId], [Nombre], [Fecha], [Productos], [Proveedores], [Precio de compra], [Numero de lote]) VALUES (7, N'Cabello sintetico                       ', N'16/124            ', 7, 7, N'800', N'246            ')
INSERT [dbo].[EntradasId] ([EntradasId], [Nombre], [Fecha], [Productos], [Proveedores], [Precio de compra], [Numero de lote]) VALUES (8, N'Gelatina                                ', N'18/1/24           ', 8, 8, N'350', N'165            ')
INSERT [dbo].[EntradasId] ([EntradasId], [Nombre], [Fecha], [Productos], [Proveedores], [Precio de compra], [Numero de lote]) VALUES (9, N'Peine                                   ', N'22/1/24           ', 9, 9, N'75', N'426            ')
INSERT [dbo].[EntradasId] ([EntradasId], [Nombre], [Fecha], [Productos], [Proveedores], [Precio de compra], [Numero de lote]) VALUES (10, N'Hojas                                   ', N'25/1/24           ', 10, 10, N'15', N'357            ')
GO
INSERT [dbo].[ProductosId] ([ProductosId], [Nombre], [Proveedor], [Categoria], [Unidad], [Descripcion], [Precio de compra], [Precio de venta], [Stock actual], [Stock minimo], [Stock maximo], [Fecha de vencimiento], [Ubicacion], [Entradas], [Salidas]) VALUES (1, N'Mero                                                                            ', 1, N'Comida                        ', N'Libras                        ', N'Pescado Mero sin espinas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'250', N'325', N'375', N'300', N'1000', N'3//24          ', N'RACK 3                                                                                                                                                ', NULL, NULL)
INSERT [dbo].[ProductosId] ([ProductosId], [Nombre], [Proveedor], [Categoria], [Unidad], [Descripcion], [Precio de compra], [Precio de venta], [Stock actual], [Stock minimo], [Stock maximo], [Fecha de vencimiento], [Ubicacion], [Entradas], [Salidas]) VALUES (2, N'Silla                                                                           ', 2, N'Muebles                       ', N'Unidad                        ', N'Muebles de caoba                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'3500', N'4000', N'20', N'10', N'30', NULL, N'RACKS 2                                                                                                                                               ', NULL, NULL)
INSERT [dbo].[ProductosId] ([ProductosId], [Nombre], [Proveedor], [Categoria], [Unidad], [Descripcion], [Precio de compra], [Precio de venta], [Stock actual], [Stock minimo], [Stock maximo], [Fecha de vencimiento], [Ubicacion], [Entradas], [Salidas]) VALUES (3, N'Mueble                                                                          ', 3, N'Muebles                       ', N'Unidad                        ', N'Muebles de caoba                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'5000', N'6500', N'15', N'5', N'20', NULL, N'RACKS 2                                                                                                                                               ', NULL, NULL)
INSERT [dbo].[ProductosId] ([ProductosId], [Nombre], [Proveedor], [Categoria], [Unidad], [Descripcion], [Precio de compra], [Precio de venta], [Stock actual], [Stock minimo], [Stock maximo], [Fecha de vencimiento], [Ubicacion], [Entradas], [Salidas]) VALUES (4, N'Comedor                                                                         ', 4, N'Muebles                       ', N'Unidad                        ', N'Muebles de caoba                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'10000', N'12500', N'10', N'10', N'25', NULL, N'RACKS 2                                                                                                                                               ', NULL, NULL)
INSERT [dbo].[ProductosId] ([ProductosId], [Nombre], [Proveedor], [Categoria], [Unidad], [Descripcion], [Precio de compra], [Precio de venta], [Stock actual], [Stock minimo], [Stock maximo], [Fecha de vencimiento], [Ubicacion], [Entradas], [Salidas]) VALUES (5, N'Mesa                                                                            ', 5, N'Muebles                       ', N'Unidad                        ', N'Muebles de caoba                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'9000', N'10500', N'10', N'5', N'20', NULL, N'RACKS 2                                                                                                                                               ', NULL, NULL)
INSERT [dbo].[ProductosId] ([ProductosId], [Nombre], [Proveedor], [Categoria], [Unidad], [Descripcion], [Precio de compra], [Precio de venta], [Stock actual], [Stock minimo], [Stock maximo], [Fecha de vencimiento], [Ubicacion], [Entradas], [Salidas]) VALUES (6, N'Peluca riza                                                                     ', 6, N'Cabellos                      ', N'Unidad                        ', N'Pelucas de cabello rizado                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'1500', N'2500', N'15', N'10', N'25', NULL, N'RACKS 4                                                                                                                                               ', NULL, NULL)
INSERT [dbo].[ProductosId] ([ProductosId], [Nombre], [Proveedor], [Categoria], [Unidad], [Descripcion], [Precio de compra], [Precio de venta], [Stock actual], [Stock minimo], [Stock maximo], [Fecha de vencimiento], [Ubicacion], [Entradas], [Salidas]) VALUES (7, N'Cabello sintetico                                                               ', 7, N'Cabellos                      ', N'Unidad                        ', N'Pelo para trenzas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', N'800', N'950', N'28', N'20', N'40', NULL, N'RACKS 4                                                                                                                                               ', NULL, NULL)
INSERT [dbo].[ProductosId] ([ProductosId], [Nombre], [Proveedor], [Categoria], [Unidad], [Descripcion], [Precio de compra], [Precio de venta], [Stock actual], [Stock minimo], [Stock maximo], [Fecha de vencimiento], [Ubicacion], [Entradas], [Salidas]) VALUES (8, N'Gelatina                                                                        ', 8, N'Cabellos                      ', N'Unidad                        ', N'Gelatina para peinados                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'350', N'400', N'30', N'20', N'50', NULL, N'RACKS 4                                                                                                                                               ', NULL, NULL)
INSERT [dbo].[ProductosId] ([ProductosId], [Nombre], [Proveedor], [Categoria], [Unidad], [Descripcion], [Precio de compra], [Precio de venta], [Stock actual], [Stock minimo], [Stock maximo], [Fecha de vencimiento], [Ubicacion], [Entradas], [Salidas]) VALUES (9, N'Peine                                                                           ', 9, N'Cabellos                      ', N'Unidad                        ', N'Peine para cabello rizos                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'50', N'75', N'12', N'10', N'20', NULL, N'RACKS 4                                                                                                                                               ', NULL, NULL)
INSERT [dbo].[ProductosId] ([ProductosId], [Nombre], [Proveedor], [Categoria], [Unidad], [Descripcion], [Precio de compra], [Precio de venta], [Stock actual], [Stock minimo], [Stock maximo], [Fecha de vencimiento], [Ubicacion], [Entradas], [Salidas]) VALUES (10, N'Hojas                                                                           ', 10, N'Impresoras                    ', N'Unidad                        ', N'Hojas para impresoras                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'15', N'20', N'120', N'100', N'200', NULL, N'RACKS 6                                                                                                                                               ', NULL, NULL)
INSERT [dbo].[ProductosId] ([ProductosId], [Nombre], [Proveedor], [Categoria], [Unidad], [Descripcion], [Precio de compra], [Precio de venta], [Stock actual], [Stock minimo], [Stock maximo], [Fecha de vencimiento], [Ubicacion], [Entradas], [Salidas]) VALUES (11, N'Pizarra                                                                         ', 11, N'Apuntes                       ', N'Unidad                        ', N'Pizarra de pared                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'1250', N'1700', N'10', N'20', N'40', NULL, N'RACKS 5                                                                                                                                               ', NULL, NULL)
INSERT [dbo].[ProductosId] ([ProductosId], [Nombre], [Proveedor], [Categoria], [Unidad], [Descripcion], [Precio de compra], [Precio de venta], [Stock actual], [Stock minimo], [Stock maximo], [Fecha de vencimiento], [Ubicacion], [Entradas], [Salidas]) VALUES (12, N'Marcadores                                                                      ', 31, N'Apuntes                       ', N'Unidad                        ', N'Macadores borrables                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'80', N'110', N'18', N'10', N'20', NULL, N'RACKS 5                                                                                                                                               ', NULL, NULL)
GO
INSERT [dbo].[ProveedoresId] ([ProveedoresId], [Nombre], [Direccion], [Telefono], [Sitio web], [Historial de compras], [Entradas], [Producto]) VALUES (1, N'Pescaderia Playa palenque                         ', N'Sabana Palenque                                                                                                                                       ', N'8092432544          ', NULL, N'82                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', NULL, NULL)
INSERT [dbo].[ProveedoresId] ([ProveedoresId], [Nombre], [Direccion], [Telefono], [Sitio web], [Historial de compras], [Entradas], [Producto]) VALUES (2, N'Muebleria Palenque                                ', N'Sabana grande                                                                                                                                         ', N'8092432545          ', NULL, N'86                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', NULL, NULL)
INSERT [dbo].[ProveedoresId] ([ProveedoresId], [Nombre], [Direccion], [Telefono], [Sitio web], [Historial de compras], [Entradas], [Producto]) VALUES (3, N'Salon mi Belleza                                  ', N'Nizao                                                                                                                                                 ', N'8092432546          ', NULL, N'47                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', NULL, NULL)
INSERT [dbo].[ProveedoresId] ([ProveedoresId], [Nombre], [Direccion], [Telefono], [Sitio web], [Historial de compras], [Entradas], [Producto]) VALUES (4, N'dealer Nizao                                      ', N'Nizao                                                                                                                                                 ', N'8092432547          ', NULL, N'85                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', NULL, NULL)
INSERT [dbo].[ProveedoresId] ([ProveedoresId], [Nombre], [Direccion], [Telefono], [Sitio web], [Historial de compras], [Entradas], [Producto]) VALUES (5, N'Frank sport                                       ', N'Sabana palemque                                                                                                                                       ', N'8092432548          ', NULL, N'94                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', NULL, NULL)
INSERT [dbo].[ProveedoresId] ([ProveedoresId], [Nombre], [Direccion], [Telefono], [Sitio web], [Historial de compras], [Entradas], [Producto]) VALUES (6, N'Amandy Art                                        ', N'sabana grand. palenque                                                                                                                                ', N'8092432549          ', NULL, N'62                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', NULL, NULL)
INSERT [dbo].[ProveedoresId] ([ProveedoresId], [Nombre], [Direccion], [Telefono], [Sitio web], [Historial de compras], [Entradas], [Producto]) VALUES (7, N'Jose tech                                         ', N'Don gregorio                                                                                                                                          ', N'8092432541          ', NULL, N'64                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', NULL, NULL)
INSERT [dbo].[ProveedoresId] ([ProveedoresId], [Nombre], [Direccion], [Telefono], [Sitio web], [Historial de compras], [Entradas], [Producto]) VALUES (8, N'Mario car wash                                    ', N'Haina                                                                                                                                                 ', N'8092432542          ', NULL, N'54                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', NULL, NULL)
INSERT [dbo].[ProveedoresId] ([ProveedoresId], [Nombre], [Direccion], [Telefono], [Sitio web], [Historial de compras], [Entradas], [Producto]) VALUES (9, N'Yulisa Braids                                     ', N'San cristobal                                                                                                                                         ', N'8092432543          ', NULL, N'64                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', NULL, NULL)
INSERT [dbo].[ProveedoresId] ([ProveedoresId], [Nombre], [Direccion], [Telefono], [Sitio web], [Historial de compras], [Entradas], [Producto]) VALUES (10, N'D''Clara dulces                                    ', N'Haina                                                                                                                                                 ', N'8092432522          ', NULL, N'25                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', NULL, NULL)
GO
INSERT [dbo].[SalidasId] ([SalidasId], [Fecha], [Producto], [Cliente], [Cantidad], [Precio de venta], [Numero de factura]) VALUES (1, N'10/2/24           ', 2, 1, N'2', N'4000', N'102242              ')
INSERT [dbo].[SalidasId] ([SalidasId], [Fecha], [Producto], [Cliente], [Cantidad], [Precio de venta], [Numero de factura]) VALUES (2, N'15/2/24           ', 2, 2, N'5', N'4000', N'152242              ')
INSERT [dbo].[SalidasId] ([SalidasId], [Fecha], [Producto], [Cliente], [Cantidad], [Precio de venta], [Numero de factura]) VALUES (3, N'17/2/24           ', 5, 3, N'3', N'10500', N'172245              ')
INSERT [dbo].[SalidasId] ([SalidasId], [Fecha], [Producto], [Cliente], [Cantidad], [Precio de venta], [Numero de factura]) VALUES (4, N'18/2/24           ', 9, 4, N'2', N'75', N'182249              ')
INSERT [dbo].[SalidasId] ([SalidasId], [Fecha], [Producto], [Cliente], [Cantidad], [Precio de venta], [Numero de factura]) VALUES (5, N'20/2/24           ', 8, 5, N'3', N'400', N'202248              ')
INSERT [dbo].[SalidasId] ([SalidasId], [Fecha], [Producto], [Cliente], [Cantidad], [Precio de venta], [Numero de factura]) VALUES (6, N'22/2/24           ', 6, 6, N'8', N'2500', N'222246              ')
INSERT [dbo].[SalidasId] ([SalidasId], [Fecha], [Producto], [Cliente], [Cantidad], [Precio de venta], [Numero de factura]) VALUES (7, N'3/3/24            ', 2, 7, N'3', N'4000', N'33242               ')
INSERT [dbo].[SalidasId] ([SalidasId], [Fecha], [Producto], [Cliente], [Cantidad], [Precio de venta], [Numero de factura]) VALUES (8, N'5/3/24            ', 10, 8, N'50', N'20', N'532410              ')
INSERT [dbo].[SalidasId] ([SalidasId], [Fecha], [Producto], [Cliente], [Cantidad], [Precio de venta], [Numero de factura]) VALUES (9, N'7/3/24            ', 2, 7, N'3', N'6500', N'73243               ')
INSERT [dbo].[SalidasId] ([SalidasId], [Fecha], [Producto], [Cliente], [Cantidad], [Precio de venta], [Numero de factura]) VALUES (10, N'8/3/24            ', 7, 10, N'2', N'950', N'83247               ')
GO
ALTER TABLE [dbo].[ClientesId]  WITH CHECK ADD  CONSTRAINT [FK_ClientesId_SalidasId] FOREIGN KEY([ClientesId])
REFERENCES [dbo].[SalidasId] ([SalidasId])
GO
ALTER TABLE [dbo].[ClientesId] CHECK CONSTRAINT [FK_ClientesId_SalidasId]
GO
ALTER TABLE [dbo].[EntradasId]  WITH CHECK ADD  CONSTRAINT [FK_EntradasId_ProductosId] FOREIGN KEY([Productos])
REFERENCES [dbo].[ProductosId] ([ProductosId])
GO
ALTER TABLE [dbo].[EntradasId] CHECK CONSTRAINT [FK_EntradasId_ProductosId]
GO
ALTER TABLE [dbo].[EntradasId]  WITH CHECK ADD  CONSTRAINT [FK_EntradasId_ProveedoresId] FOREIGN KEY([EntradasId])
REFERENCES [dbo].[ProveedoresId] ([ProveedoresId])
GO
ALTER TABLE [dbo].[EntradasId] CHECK CONSTRAINT [FK_EntradasId_ProveedoresId]
GO
ALTER TABLE [dbo].[ProductosId]  WITH CHECK ADD  CONSTRAINT [FK_ProductosId_SalidasId] FOREIGN KEY([Salidas])
REFERENCES [dbo].[SalidasId] ([SalidasId])
GO
ALTER TABLE [dbo].[ProductosId] CHECK CONSTRAINT [FK_ProductosId_SalidasId]
GO
ALTER TABLE [dbo].[SalidasId]  WITH CHECK ADD  CONSTRAINT [FK_SalidasId_ProductosId] FOREIGN KEY([Cliente])
REFERENCES [dbo].[ProductosId] ([ProductosId])
GO
ALTER TABLE [dbo].[SalidasId] CHECK CONSTRAINT [FK_SalidasId_ProductosId]
GO
USE [master]
GO
ALTER DATABASE [Logistics-Stock ] SET  READ_WRITE 
GO
