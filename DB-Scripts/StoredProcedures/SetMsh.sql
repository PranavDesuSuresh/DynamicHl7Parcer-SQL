SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
IF NOT EXISTS(SELECT 1	FROM      [INFORMATION_SCHEMA].[ROUTINES]
						WHERE     [ROUTINE_TYPE] = 'PROCEDURE'
						 AND	  [ROUTINE_SCHEMA]= 'dbo'
						 AND      [ROUTINE_NAME]= 'SetMsh'
                   )

      EXECUTE('CREATE PROCEDURE [dbo].[SetMsh] AS BEGIN SELECT ''This procedure is being rebuilt'' END')
GO
ALTER PROCEDURE [dbo].[SetMsh] 
(
	@ID				INT,
	@MSH_1			VARCHAR(100),	--fieldSeparator
	@MSH_2			VARCHAR(100),	--encodingCharacters
	@MSH_3_1		VARCHAR(100),	--sendingApplication.namespaceId
	@MSH_3_2		VARCHAR(100),	--sendingApplication.universalId
	@MSH_3_3		VARCHAR(100),	--sendingApplication.universalIdType
	@MSH_4_1		VARCHAR(100),	--sendingFacility.namespaceId
	@MSH_4_2		VARCHAR(100),	--sendingFacility.universalId
	@MSH_4_3		VARCHAR(100),	--sendingFacility.universalIdType
	@MSH_5_1		VARCHAR(100),	--receivingApplication.namespaceId
	@MSH_5_2		VARCHAR(100),	--receivingApplication.universalId
	@MSH_5_3		VARCHAR(100),	--receivingApplication.universalIdType
	@MSH_6_1		VARCHAR(100),	--receivingFacility.namespaceId
	@MSH_6_2		VARCHAR(100),	--receivingFacility.universalId
	@MSH_6_3		VARCHAR(100),	--receivingFacility.universalIdType
	@MSH_7			VARCHAR(100),	--dateTimeOfMessage
	@MSH_8			VARCHAR(100),	--security
	@MSH_9_1		VARCHAR(100),	--messageType.messageType
	@MSH_9_2		VARCHAR(100),	--messageType.triggerEvent
	@MSH_10			VARCHAR(100),	--messageControlID
	@MSH_11_1		VARCHAR(100),	--processingID.processingID
	@MSH_11_2		VARCHAR(100),	--processingID.processingMode
	@MSH_12			VARCHAR(100),	--versionID
	@MSH_13			VARCHAR(100),	--sequenceNumber
	@MSH_14			VARCHAR(100),	--continuationPointer
	@MSH_15			VARCHAR(100),	--acceptAcknowledgmentType
	@MSH_16			VARCHAR(100),	--applicationAcknowledgmentType
	@MSH_17			VARCHAR(100),	--countryCode
	@MSH_18			VARCHAR(100),	--characterSet
	@MSH_19			VARCHAR(100)	--principalLanguageOfMessage
)
AS
/********************************************************    
Name   : dbo].[SetMsh] 
Author : Pranav
Date   : 01/11/2018
EXE    : EXEC SetMsh ------------
Change History :     
Date   Name     Description    
*********************************************************/    
BEGIN
SET NOCOUNT ON;     

DECLARE @MSH_Id BIGINT;
 BEGIN TRY 
	IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WITH (NOLOCK) WHERE Name = 'MSH_Data')
	BEGIN
		EXEC CreateMSH;
	END

	IF NOT EXISTS (SELECT 1 FROM [dbo].[MSH_Data] WITH(NOLOCK) WHERE ID = @ID) AND @ID>0           
	BEGIN        
	print '1' 
	INSERT INTO [dbo].[MSH_Data]
					( MSH_1
					 ,MSH_2
					 ,MSH_3_1
					 ,MSH_3_2
					 ,MSH_3_3
					 ,MSH_4_1
					 ,MSH_4_2
					 ,MSH_4_3
					 ,MSH_5_1
					 ,MSH_5_2
					 ,MSH_5_3
					 ,MSH_6_1
					 ,MSH_6_2
					 ,MSH_6_3
					 ,MSH_7
					 ,MSH_8
					 ,MSH_9_1
					 ,MSH_9_2
					 ,MSH_10
					 ,MSH_11_1
					 ,MSH_11_2
					 ,MSH_12
					 ,MSH_13
					 ,MSH_14
					 ,MSH_15
					 ,MSH_16
					 ,MSH_17
					 ,MSH_18
					 ,MSH_19)  
			VALUES  
				    ( @MSH_1
					 ,@MSH_2
					 ,@MSH_3_1
					 ,@MSH_3_2
					 ,@MSH_3_3
					 ,@MSH_4_1
					 ,@MSH_4_2
					 ,@MSH_4_3
					 ,@MSH_5_1
					 ,@MSH_5_2
					 ,@MSH_5_3
					 ,@MSH_6_1
					 ,@MSH_6_2
					 ,@MSH_6_3
					 ,@MSH_7
					 ,@MSH_8
					 ,@MSH_9_1
					 ,@MSH_9_2
					 ,@MSH_10
					 ,@MSH_11_1
					 ,@MSH_11_2
					 ,@MSH_12
					 ,@MSH_13
					 ,@MSH_14
					 ,@MSH_15
					 ,@MSH_16
					 ,@MSH_17
					 ,@MSH_18
					 ,@MSH_19)  
		SET @MSH_Id = SCOPE_IDENTITY();  
				
			--UPDATE [dbo].[OTP] 
			-- SET IsExpired=1,
			--	 ModifiedBy=@RequestBy,
			--	 ModifiedDate=@Now
			--WHERE SessionID=@SessionID 
			-- AND TransactionId <> @TrasactionID      
	 END 
	 ELSE IF @ID>0 
	 BEGIN
		UPDATE [dbo].[MSH_Data] 
		SET
			 MSH_1		  =	  @MSH_1
			,MSH_2		  =	  @MSH_2
			,MSH_3_1	  =	  @MSH_3_1
			,MSH_3_2	  =	  @MSH_3_2
			,MSH_3_3	  =	  @MSH_3_3
			,MSH_4_1	  =	  @MSH_4_1
			,MSH_4_2	  =	  @MSH_4_2
			,MSH_4_3	  =	  @MSH_4_3
			,MSH_5_1	  =	  @MSH_5_1
			,MSH_5_2	  =	  @MSH_5_2
			,MSH_5_3	  =	  @MSH_5_3
			,MSH_6_1	  =	  @MSH_6_1
			,MSH_6_2	  =	  @MSH_6_2
			,MSH_6_3	  =	  @MSH_6_3
			,MSH_7		  =	  @MSH_7
			,MSH_8		  =	  @MSH_8
			,MSH_9_1	  =	  @MSH_9_1
			,MSH_9_2	  =	  @MSH_9_2
			,MSH_10		  =	  @MSH_10
			,MSH_11_1	  =	  @MSH_11_1
			,MSH_11_2	  =	  @MSH_11_2
			,MSH_12		  =	  @MSH_12
			,MSH_13		  =	  @MSH_13
			,MSH_14		  =	  @MSH_14
			,MSH_15		  =	  @MSH_15
			,MSH_16		  =	  @MSH_16
			,MSH_17		  =	  @MSH_17
			,MSH_18		  =	  @MSH_18
			,MSH_19		  =	  @MSH_19
		WHERE @ID=ID;
	 END

 END TRY
 BEGIN CATCH
  SELECT 'SQL Exception: [SetMsh]: '+ ' Procedure = ' + ISNULL(ERROR_PROCEDURE(),'')      
						+ ' Line = ' + ISNULL(CONVERT(NVARCHAR,ERROR_LINE()),'') + 'Error = ' + ISNULL(ERROR_MESSAGE(),'') 
 END CATCH
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO
