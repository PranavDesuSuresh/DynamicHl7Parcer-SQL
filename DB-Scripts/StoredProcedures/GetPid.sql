SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
IF NOT EXISTS(SELECT 1	FROM      [INFORMATION_SCHEMA].[ROUTINES]
						WHERE     [ROUTINE_TYPE] = 'PROCEDURE'
						 AND	  [ROUTINE_SCHEMA]= 'dbo'
						 AND      [ROUTINE_NAME]= 'GetPid'
                   )

      EXECUTE('CREATE PROCEDURE [dbo].[GetPid] AS BEGIN SELECT ''This procedure is being rebuilt'' END')
GO
ALTER PROCEDURE [dbo].[GetPid] 
(
	@ID				INT
)
AS
/********************************************************    
Name   : dbo].[GetPid] 
Author : Pranav
Date   : 01/11/2018
EXE    : EXEC GetPid ------------
Change History :     
Date   Name     Description    
*********************************************************/    
BEGIN
SET NOCOUNT ON;     

 BEGIN TRY 
	IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WITH (NOLOCK) WHERE Name = 'PID_Data')
	BEGIN
		EXEC CreatePID;
	END

	SELECT TOP 1
		 PatientID
		,PID_1
		,PID_2
		,PID_3
		,PID_4
		,PID_5_1
		,PID_5_2
		,PID_5_3
		,PID_5_4
		,PID_5_5
		,PID_5_6
		,PID_6_1
		,PID_6_2
		,PID_6_3
		,PID_6_4
		,PID_6_5
		,PID_6_6
		,PID_6_7
		,PID_7
		,PID_8
		,PID_9_1
		,PID_9_2
		,PID_9_3
		,PID_9_4
		,PID_9_5
		,PID_9_6
		,PID_9_7
		,PID_10
		,PID_11_1
		,PID_11_2
		,PID_11_3
		,PID_11_4
		,PID_11_5
		,PID_11_6
		,PID_11_7
		,PID_11_8
		,PID_11_9
		,PID_12
		,PID_13_1
		,PID_13_2
		,PID_13_3
		,PID_13_4
		,PID_14_1
		,PID_14_2
		,PID_14_3
		,PID_14_4
		,PID_15_1
		,PID_15_2
		,PID_16
		,PID_17
		,PID_18
		,PID_19
		,PID_20
		,PID_21
		,PID_22
		,PID_23
		,PID_24
		,PID_25
		,PID_26
		,PID_27
		,PID_28
		,PID_29
		,PID_30
	FROM PID_Data 
		WHERE PatientID=@ID
		ORDER BY ID DESC;
 END TRY
 BEGIN CATCH
  SELECT 'SQL Exception: [GetPid]: '+ ' Procedure = ' + ISNULL(ERROR_PROCEDURE(),'')      
						+ ' Line = ' + ISNULL(CONVERT(NVARCHAR,ERROR_LINE()),'') + 'Error = ' + ISNULL(ERROR_MESSAGE(),'') 
 END CATCH
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO
