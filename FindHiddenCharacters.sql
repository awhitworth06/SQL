USE [AKWLib]
GO

/****** Object:  UserDefinedFunction [dbo].[FindHiddenCharacters]    Script Date: 6/8/2023 9:42:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[FindHiddenCharacters] (
@Str VARCHAR(MAX)
)
RETURNS VARCHAR(MAX) AS
BEGIN
DECLARE @FindHiddenCharacters VARCHAR(MAX) = '';

SET @FindHiddenCharacters = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
						@Str
						,CHAR(1),'[SOH]')
						,CHAR(2),'[STX]')
						,CHAR(3),'[ETX]')
						,CHAR(4),'[EOT]')
						,CHAR(5),'[ENQ]')
						,CHAR(6),'[ACK]')
						,CHAR(7),'[BEL]')
						,CHAR(8),'[BS]')
						,CHAR(9),'[TAB]')
						,CHAR(10),'[LF]')
						,CHAR(11),'[VT]')
						,CHAR(12),'[FF]')
						,CHAR(13),'[CR]')
						,CHAR(14),'[SO]')
						,CHAR(15),'[SI]')
						,CHAR(16),'[DLE]')
						,CHAR(17),'[DC1]')
						,CHAR(18),'[DC2]')
						,CHAR(19),'[DC3]')
						,CHAR(20),'[DC4]')
						,CHAR(21),'[NAK]')
						,CHAR(22),'[SYN]')
						,CHAR(23),'[ETB]')
						,CHAR(24),'[CAN]')
						,CHAR(25),'[EM]')
						,CHAR(26),'[SUB]')
						,CHAR(27),'[ESC]')
						,CHAR(28),'[FS]')
						,CHAR(29),'[GS]')
						,CHAR(30),'[RS]')
						,CHAR(31),'[US]')
						,CHAR(32),'[?]');

RETURN @FindHiddenCharacters;

END
GO