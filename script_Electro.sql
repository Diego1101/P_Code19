USE master
go

DROP DATABASE BD_ELECTRO
GO

CREATE DATABASE BD_ELECTRO
GO

USE BD_ELECTRO
go
--------------------------------------------------------------TABLAS------------------------------------------------

CREATE TABLE USUARIO
(
   USU_ID		INT	PRIMARY KEY IDENTITY NOT NULL,
   USU_ROL		INT				NOT NULL,
   USU_FOTO		VARCHAR(1000)	NOT NULL,
   USU_NOMBRE	NVARCHAR(50)	NOT NULL,
   USU_APE_PAT	NVARCHAR(50)	NOT NULL,
   USU_APA_MAT	NVARCHAR(50)	NULL,  --PUEDE O NO TENER DATOS
   USU_SEXO		INT				NOT NULL,
   USU_EDAD		VARCHAR(3)				NOT NULL,
   USU_DIRECCION NVARCHAR(250)	NOT NULL,
   USU_TEL_CASA	NVARCHAR(20)	NULL,
   USU_CORREO	NVARCHAR(150)	NULL,
   USU_USUARIO	NVARCHAR(15)		NOT NULL,
   USU_PASWORD	NVARCHAR(15)	NOT NULL,
   USU_ESTATUS	INT				NOT NULL,
   USU_FECHA_REG DATETIME		NOT NULL
)
GO

CREATE TABLE ROL_USU
(
	ROL_ID	INT PRIMARY KEY IDENTITY NOT NULL,
	ROL_NOMBRE NVARCHAR(20) NOT NULL
)
GO

CREATE TABLE PRODUCTO
(
	PRO_ID				INT IDENTITY(1,1) NOT NULL,
	PRO_CODIGO			VARCHAR(15) NOT NULL,
	PRO_TIPO			INT NOT NULL,
	PRO_NOMBRE			VARCHAR(60) NOT NULL,
	PRO_MARCA			VARCHAR(50) NOT NULL,
	PRO_DESC			VARCHAR(250) NOT NULL,
	PRO_UNIDADES		INT NOT NULL,
	PRO_COSTO			FLOAT NOT NULL,
	PRO_IMAGEN			VARCHAR(250) NULL,
	PRO_BAJA			INT NOT NULL,
	PRO_FECHA_REG		VARCHAR(50) NOT NULL
)
GO

CREATE TABLE SEXO_EMPLEADO
(
  SEXO_CVE				INT IDENTITY(1,1) NOT NULL,
  SEXO_EMPLEADO			VARCHAR(10) NOT  NULL,
)
GO

CREATE TABLE TIPO_PRODUCTO
(
	TPR_CVE_TIPO	INT IDENTITY(1,1) NOT NULL,
	TPR_PRODUCTO	VARCHAR(200) NOT NULL,	
)
GO


CREATE TABLE TVENTA
(
	VEN_CVE_VENTA	INT IDENTITY(1,1) NOT NULL,
	VEN_CVE_CLIENTE	INT NOT NULL,
	VEN_SUBTOTAL_VENTA FLOAT NULL,
	VEN_IVA_VENTA FLOAT NULL,
	VEN_TOTAL_VENTA	FLOAT NULL,
	VEN_BAJA_VENTA	CHAR NOT NULL,
	VEN_FECHA_REGISTRO VARCHAR(60) NOT NULL	
)
GO
CREATE TABLE TDETALLE_vENTA
(
	DET_CVE_VENTA		INT NOT NULL,
	DET_CVE_PRODUCTO	INT NOT NULL,
	DET_CANTIDAD		INT NOT NULL,
	DET_TOT				FLOAT NULL
)
GO

CREATE TABLE METODO_PAGO
(
	MET_CVE				INT IDENTITY(1,1) NOT NULL,
	MET_CVE_VENTA		INT NOT NULL,
	MET_CVE_TIPO		INT NOT NULL,
	MET_NOMBRE			VARCHAR(60) NOT NULL,
	MET_TARJETA			NVARCHAR(60) NULL,
	MET_MONTO			FLOAT NOT NULL,
	MET_DIG				NVARCHAR(60) NULL,
	MET_FECHA			VARCHAR(60) NOT NULL
)
GO



CREATE PROCEDURE TSP_ValidarAcceso
(
@USU NVARCHAR(8),
@PAS NVARCHAR(15)
)
AS
BEGIN
--VALIDAR SI EXISTE EL USUARIO Y PASSWORD
	IF EXISTS(SELECT USU_ID
	FROM USUARIO
	WHERE USU_USUARIO=@USU AND USU_PASWORD=@PAS)
	BEGIN
	SELECT USU_ID,USU_ROL,USU_USUARIO=@USU, USU_PASWORD =@PAS, USU_NOMBRE + ' ' + USU_APE_PAT+' '+USU_APA_MAT [Nombre]
	FROM USUARIO
	WHERE USU_USUARIO=@USU  
	AND USU_PASWORD=@PAS
	END
	ELSE
		SELECT '0' --REGISTRO NO ENCONTRADO
END
GO


CREATE PROCEDURE TSP_buscarProductos
(
@BUSC	NVARCHAR(50),
@ID		INT
)AS
BEGIN
	IF(@ID=0)
	BEGIN
	SET @BUSC = CONCAT('%',@BUSC,'%')
	IF EXISTS(SELECT PRO_ID FROM PRODUCTO, TIPO_PRODUCTO WHERE PRO_BAJA='1' AND TPR_CVE_TIPO=PRO_TIPO AND (PRO_CODIGO LIKE @BUSC OR PRO_MARCA LIKE @BUSC OR PRO_DESC LIKE @BUSC OR PRO_COSTO LIKE @BUSC OR PRO_FECHA_REG LIKE @BUSC OR TPR_PRODUCTO LIKE @BUSC))
	BEGIN
		SELECT PRO_ID [ID], PRO_CODIGO [CODIGO], PRO_NOMBRE [NOMBRE], PRO_MARCA [MARCA], PRO_DESC [DESC], PRO_UNIDADES [UNIDADES], PRO_COSTO [COSTO], PRO_IMAGEN [IMAGEN], TPR_PRODUCTO [CAT] 
		FROM PRODUCTO, TIPO_PRODUCTO 
		WHERE PRO_BAJA=1 AND TPR_CVE_TIPO=PRO_TIPO AND (PRO_CODIGO LIKE @BUSC OR PRO_MARCA LIKE @BUSC OR PRO_DESC LIKE @BUSC OR PRO_COSTO LIKE @BUSC OR PRO_FECHA_REG LIKE @BUSC OR TPR_PRODUCTO LIKE @BUSC)
	END
	ELSE
	BEGIN
		SELECT '0' [ID]
	END
	END
	ELSE
	BEGIN
		IF EXISTS(SELECT PRO_ID FROM PRODUCTO WHERE PRO_CODIGO=@BUSC AND PRO_BAJA=1)
		BEGIN
			SELECT PRO_ID [ID], PRO_CODIGO [CODIGO], PRO_NOMBRE [NOMBRE], PRO_MARCA [MARCA], PRO_DESC [DESC], PRO_UNIDADES [UNIDADES], PRO_COSTO [COSTO], PRO_IMAGEN [IMAGEN], PRO_TIPO [CAT] 
			FROM PRODUCTO, TIPO_PRODUCTO 
			WHERE PRO_CODIGO=@BUSC AND PRO_BAJA=1 AND TPR_CVE_TIPO=PRO_TIPO
		END
		ELSE
		BEGIN
			SELECT '0' [ID]
		END
	END
END
GO

CREATE PROCEDURE TSP_tipoProducto
AS
BEGIN
	SELECT TPR_CVE_TIPO [CLAVE], TPR_PRODUCTO [NOMBRE] FROM TIPO_PRODUCTO
END
GO

---HORA, CITA, NOTA cada hora
CREATE PROCEDURE TSP_ListarUsuario
AS
BEGIN
SELECT USU_FECHA_REG FECHA, USU_NOMBRE +' '+ USU_APE_PAT +' '+ USU_APA_MAT NOMBRE, USU_CORREO CORREO, USU_TEL_CASA [TELEFONO], USU_FOTO [FOTO]
FROM USUARIO
WHERE USU_ROL != 1
END
GO

INSERT INTO USUARIO VALUES(1,'', 'DIEGO', 'MENDOZA', 'REYES', 1, 20,'LA CALLE', '5521399556','D@MAIL.COM','DIG','DIG',1,GETDATE())
GO

INSERT INTO USUARIO VALUES(2,'usu1.jpg', 'GEOVANA', 'G�MEZ', 'CRUZ', 2, 21,'LA AVENIDA', '5549416690','G@MAIL.COM','GEO','GEO',1,GETDATE())
GO

INSERT INTO USUARIO VALUES(3,'usu2.jpg', 'ADALEYSI', 'LARA', 'FELICIANO', 2, 22,'LA CERRADA', '7721186179','A@MAIL.COM','ADA','ADA',1,GETDATE())
GO

INSERT INTO ROL_USU (ROL_NOMBRE) VALUES ('ADMINISTRADOR'),('EMPLEADO'),('CLIENTE')

INSERT INTO TIPO_PRODUCTO (TPR_PRODUCTO) VALUES
	('Laptop'),
	('Accesorio'),
	('Camara'),
	('Smartphone'),
	('Tablet')

INSERT INTO PRODUCTO (PRO_CODIGO,PRO_TIPO, PRO_NOMBRE, PRO_MARCA, PRO_DESC, PRO_UNIDADES, PRO_COSTO, PRO_IMAGEN, PRO_BAJA, PRO_FECHA_REG) VALUES
	(101, 1, 'Laptop HP', 'HP','4 GB RAM, 1 TB HDD, Windows 10', 10, 4000, 'product01.png', 1, GETDATE()),
	(102, 2, 'Headset Logitech', 'Logitech','Microfono, plug 3mm', 15, 700, 'product02.png', 1, GETDATE()),
	(103, 1, 'Laptop Acer', 'Acer','8 GB RAM, 500 SSD', 6, 7000, 'product03.png', 1, GETDATE()),
	(104, 5, 'Tablet samsung','Samsung', 'Andriod Kit kat', 20, 3000, 'product04.png', 1, GETDATE()),
	(105, 2, 'Headset SONY','SONY', 'Stereo, 2 m de cable', 7, 1100, 'product05.png', 1, GETDATE()),
	(106, 1, 'Laptop Alien','Alien', 'Color negro', 2, 5000, 'product06.png', 1, GETDATE()),
	(107, 4, 'Samsung S9','Samsung', '32 GB Interno', 19, 8000, 'product07.png', 1, GETDATE()),
	(108, 1, 'Laptop ASUS','ASUS', 'Windows 10', 4, 4000, 'product08.png', 1, GETDATE()),
	(109, 3, 'Presio','Rekam' ,'1.6 pulgadas', 2, 300, 'product09.png', 1, GETDATE())



EXEC TSP_ValidarAcceso 'DIDI', 'DIDI'
GO

EXEC TSP_buscarProductos '104', 1

SELECT * FROM USUARIO 
GO

SELECT * FROM ROL_USU
GO

EXEC TSP_ListarUsuario
GO