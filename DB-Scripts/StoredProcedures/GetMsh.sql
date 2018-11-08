SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
IF NOT EXISTS(SELECT 1	FROM      [INFORMATION_SCHEMA].[ROUTINES]
						WHERE     [ROUTINE_TYPE] = 'PROCEDURE'
						 AND	  [ROUTINE_SCHEMA]= 'dbo'
						 AND      [ROUTINE_NAME]= 'GetMsh'
                   )

      EXECUTE('CREATE PROCEDURE [dbo].[GetMsh] AS BEGIN SELECT ''This procedure is being rebuilt'' END')
GO
ALTER PROCEDURE [dbo].[GetMsh] 
(
	@ID				INT
)
AS
/********************************************************    
Name   : dbo].[GetMsh] 
Author : Pranav
Date   : 01/11/2018
EXE    : EXEC GetMsh ------------
Change History :     
Date   Name     Description    
*********************************************************/    
BEGIN
SET NOCOUNT ON;     

 BEGIN TRY 
	IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WITH (NOLOCK) WHERE Name = 'MSH_Data')
	BEGIN
		EXEC CreateMSH;
	END

	SELECT 
		 PatientID
		,MSH_1
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
		,MSH_19
	FROM MSH_Data 
		WHERE ID=@ID;
 END TRY
 BEGIN CATCH
  SELECT 'SQL Exception: [GetMsh]: '+ ' Procedure = ' + ISNULL(ERROR_PROCEDURE(),'')      
						+ ' Line = ' + ISNULL(CONVERT(NVARCHAR,ERROR_LINE()),'') + 'Error = ' + ISNULL(ERROR_MESSAGE(),'') 
 END CATCH
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO
