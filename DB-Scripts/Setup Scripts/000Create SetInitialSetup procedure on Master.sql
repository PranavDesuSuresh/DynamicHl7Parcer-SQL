GO
USE master
IF  EXISTS(SELECT 1	FROM      [INFORMATION_SCHEMA].[ROUTINES]
						WHERE     [ROUTINE_TYPE] = 'PROCEDURE'
						 AND	  [ROUTINE_SCHEMA]= 'dbo'
						 AND      [ROUTINE_NAME]= 'SetInitialSetup'
                   )

DROP PROCEDURE SetInitialSetup
GO 
CREATE PROCEDURE [dbo].[SetInitialSetup]  
(  
           @DataBaseName   VARCHAR(200)=''          
)  
as  
/********************************************************  
Name		: SetInitialSetup.prc  
Author		: Pranav
Date		: 01/11/2018  
Description :   
This script will create database.
Change History :   
Date			Name			Description
*********************************************************/  
BEGIN  
DECLARE @CreateDatabase NVARCHAR(MAX)
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name =@DataBaseName)   
  BEGIN  
   SET @CreateDatabase = ' USE MASTER ; 
							CREATE DATABASE ' + QUOTENAME(@DataBaseName) 
   EXEC (@CreateDatabase)  
   --SELECT @CreateDatabase  
  END  
END  
  
