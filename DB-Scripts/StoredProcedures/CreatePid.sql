SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
IF NOT EXISTS(SELECT 1	FROM      [INFORMATION_SCHEMA].[ROUTINES]
						WHERE     [ROUTINE_TYPE] = 'PROCEDURE'
						 AND	  [ROUTINE_SCHEMA]= 'dbo'
						 AND      [ROUTINE_NAME]= 'CreatePid'
                   )

      EXECUTE('CREATE PROCEDURE [dbo].[CreatePid] AS BEGIN SELECT ''This procedure is being rebuilt'' END')
GO
ALTER PROCEDURE [dbo].[CreatePid] 
AS
/********************************************************    
Name   : dbo].[CreatePid] 
Author : Pranav
Date   : 01/11/2018   
EXE    : EXEC CreatePid
Change History :     
Date   Name     Description 
*********************************************************/    
BEGIN
SET NOCOUNT ON;     
 BEGIN TRY 
  
  CREATE TABLE [dbo].[PID_Data](
						[ID]				[BIGINT] IDENTITY(1,1) NOT NULL,
						[PID_1]				VARCHAR(100),	--setId
						[PID_2]				VARCHAR(100),	--externalId
						[PID_3]				VARCHAR(100),	--internalId
						[PID_4]				VARCHAR(100),	--alternateId
						[PID_5_1]			VARCHAR(100),	--patientName.lastName
						[PID_5_2]			VARCHAR(100),	--patientName.firstName
						[PID_5_3]			VARCHAR(100),	--patientName.middleInitOrName
						[PID_5_4]			VARCHAR(100),	--patientName.suffix
						[PID_5_5]			VARCHAR(100),	--patientName.prefix
						[PID_5_6]			VARCHAR(100),	--patientName.degree
						[PID_6_1]			VARCHAR(100),	--mothersMaidenName.lastName
						[PID_6_2]			VARCHAR(100),	--mothersMaidenName.firstName
						[PID_6_3]			VARCHAR(100),	--mothersMaidenName.middleInitOrName
						[PID_6_4]			VARCHAR(100),	--mothersMaidenName.suffix
						[PID_6_5]			VARCHAR(100),	--mothersMaidenName.prefix
						[PID_6_6]			VARCHAR(100),	--mothersMaidenName.degree
						[PID_6_7]			VARCHAR(100),	--mothersMaidenName.nameTypeCode
						[PID_7]				VARCHAR(100),	--dateTimeBirth
						[PID_8]				VARCHAR(100),	--sex
						[PID_9_1]			VARCHAR(100),	--alias.lastName
						[PID_9_2]			VARCHAR(100),	--alias.firstName
						[PID_9_3]			VARCHAR(100),	--alias.middleInitOrName
						[PID_9_4]			VARCHAR(100),	--alias.suffix
						[PID_9_5]			VARCHAR(100),	--alias.prefix
						[PID_9_6]			VARCHAR(100),	--alias.degree
						[PID_9_7]			VARCHAR(100),	--alias.nameTypeCode
						[PID_10]			VARCHAR(100),	--race
						[PID_11_1]			VARCHAR(100),	--address.streetAddress
						[PID_11_2]			VARCHAR(100),	--address.otherDesignation
						[PID_11_3]			VARCHAR(100),	--address.city
						[PID_11_4]			VARCHAR(100),	--address.stateOrProvince
						[PID_11_5]			VARCHAR(100),	--address.zip
						[PID_11_6]			VARCHAR(100),	--address.country
						[PID_11_7]			VARCHAR(100),	--address.addressType
						[PID_11_8]			VARCHAR(100),	--address.otherGeographicDesignation
						[PID_11_9]			VARCHAR(100),	--address.countyOrParishCode
						[PID_12]			VARCHAR(100),	--countyCode
						[PID_13_1]			VARCHAR(100),	--homePhone.number
						[PID_13_2]			VARCHAR(100),	--homePhone.telecommunicationUseCode
						[PID_13_3]			VARCHAR(100),	--homePhone.telecommunicationEquipmentType
						[PID_13_4]			VARCHAR(100),	--emailAddress
						[PID_14_1]			VARCHAR(100),	--businessPhone
						[PID_14_2]			VARCHAR(100),	--businessPhone.telecommunicationUseCode
						[PID_14_3]			VARCHAR(100),	--businessPhone.telecommunicationEquipmentType
						[PID_14_4]			VARCHAR(100),	--businessPhone.emailAddress
						[PID_15_1]			VARCHAR(100),	--primaryLanguage.id
						[PID_15_2]			VARCHAR(100),	--primaryLanguage.text
						[PID_16]			VARCHAR(100),	--maritalStatus
						[PID_17]			VARCHAR(100),	--religion
						[PID_18]			VARCHAR(100),	--patientAccountNumber
						[PID_19]			VARCHAR(100),	--ssn
						[PID_20]			VARCHAR(100),	--driversLicenseNumber
						[PID_21]			VARCHAR(100),	--mothersId
						[PID_22]			VARCHAR(100),	--ethnicGroup
						[PID_23]			VARCHAR(100),	--birthPlace
						[PID_24]			VARCHAR(100),	--multipleBirthIndicator
						[PID_25]			VARCHAR(100),	--birthOrder
						[PID_26]			VARCHAR(100),	--citizenship
						[PID_27]			VARCHAR(100),	--veteranStatus
						[PID_28]			VARCHAR(100),	--nationality
						[PID_29]			VARCHAR(100),	--deathDateTime
						[PID_30]			VARCHAR(100),	--deathIndicator

  CONSTRAINT [PK_PID_Data_ID] PRIMARY KEY NONCLUSTERED
	(
		[ID] ASC
	)) ON [PRIMARY]
  
 END TRY
 BEGIN CATCH
  SELECT 'SQL Exception: [CreatePid]: '+ ' Procedure = ' + ISNULL(ERROR_PROCEDURE(),'')      
						+ ' Line = ' + ISNULL(CONVERT(NVARCHAR,ERROR_LINE()),'') + 'Error = ' + ISNULL(ERROR_MESSAGE(),'') 
 END CATCH
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO
