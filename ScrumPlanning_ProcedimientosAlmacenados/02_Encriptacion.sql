/* =========================================================
   ENCRIPTACION DE CONTRASEÑAS
   ---------------------------------------------------------
   USP_Users necesita estos objetos para guardar la
   contraseña encriptada:
     - Llave maestra de la base de datos
     - Certificado  CERT_SCRUMPLANNING
     - Llave simétrica KEY_HASH
     - Función [SQM_SECURITY].[Fn_EncryptByKey]

   Si el profe les dio su propio script para esto,
   usen el de él en lugar de este.
   ========================================================= */

USE [DB_SCRUM_PLANNING]
GO

-- 1) LLAVE MAESTRA --
IF NOT EXISTS (SELECT 1 FROM sys.symmetric_keys WHERE name = '##MS_DatabaseMasterKey##')
    CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'ScrumPlanning#2026';
GO

-- 2) CERTIFICADO --
IF NOT EXISTS (SELECT 1 FROM sys.certificates WHERE name = 'CERT_SCRUMPLANNING')
    CREATE CERTIFICATE CERT_SCRUMPLANNING
    WITH SUBJECT = 'CERTIFICADO PARA ENCRIPTAR CONTRASEÑAS DE DB_SCRUM_PLANNING';
GO

-- 3) LLAVE SIMETRICA --
IF NOT EXISTS (SELECT 1 FROM sys.symmetric_keys WHERE name = 'KEY_HASH')
    CREATE SYMMETRIC KEY KEY_HASH
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE CERT_SCRUMPLANNING;
GO

-- 4) FUNCION PARA ENCRIPTAR --
-- La llave KEY_HASH debe estar abierta antes de llamarla
-- (USP_Users la abre con OPEN SYMMETRIC KEY)
CREATE OR ALTER FUNCTION [SQM_SECURITY].[Fn_EncryptByKey]
(
    @i_texto VARCHAR(256)
)
RETURNS VARBINARY(256)
AS
BEGIN
    RETURN ENCRYPTBYKEY(KEY_GUID('KEY_HASH'), @i_texto);
END;
GO

-- 5) FUNCION PARA DESENCRIPTAR (servirá para un login) --
CREATE OR ALTER FUNCTION [SQM_SECURITY].[Fn_DecryptByKey]
(
    @i_textoEncriptado VARBINARY(256)
)
RETURNS VARCHAR(256)
AS
BEGIN
    RETURN CONVERT(VARCHAR(256), DECRYPTBYKEY(@i_textoEncriptado));
END;
GO
