USE [AKWLib]
GO

/****** Object:  UserDefinedFunction [dbo].[Halve_Spaced_String]    Script Date: 10/18/2022 6:07:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE
FUNCTION [dbo].[Halve_Spaced_String] (
@str	VARCHAR(MAX)
,@half	INT	= 1	--1 or 2 (1 = default)
)
RETURNS VARCHAR(MAX)
/*
--purpose/description
Returns the sepecificed half of a string (1 or 2), split evenly by the space in the center.
If there is an even number of spaces (no center space), the second (2) half will contain the extra word.
Spaces at the beginning and end of the string will be ignored.
*/
AS
BEGIN
/*
--testing
DECLARE @str	VARCHAR(MAX) = 'Rad C M & Lai L D Fam L & T'
		,@half	INT = 1
*/
SET @str = TRIM(@str)

DECLARE @result		VARCHAR(MAX) = ''
		,@spaces	INT = LEN(@str) - LEN(REPLACE(@str, ' ', ''))

DECLARE @split		INT = IIF(@spaces % 2 = 0, ROUND(@spaces / 2, 0), ROUND(@spaces / 2, 0) + 1)

IF @half <> 2
BEGIN
SET @half = 1
END
IF @spaces <= 0
BEGIN
SET @result = @str
END
ELSE
IF @spaces > 0
BEGIN
DECLARE	@words TABLE (
		word	VARCHAR(MAX)
		,id		INT IDENTITY(1, 1)
		)
BEGIN
INSERT
INTO	@words (
		word
		)
SELECT	[value]
FROM	STRING_SPLIT(@str, ' ')
END
IF @half = 1
BEGIN
SELECT	@result = COALESCE(@result + ' ', '') + word
FROM	@words
WHERE	id <= @split
END
ELSE
IF @half = 2
BEGIN
SELECT	@result = COALESCE(@result + ' ', '') + word
FROM	@words
WHERE	id > @split
END
END
/*
--testing
SELECT TRIM(@result) AS [result], @str AS [string], @half AS [half], @spaces AS [spaces], @split AS [split]
*/
RETURN TRIM(@result)
END
GO