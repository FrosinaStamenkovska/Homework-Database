--WORKSHOP 02.2
-- Create new procedure called CreateGradeDetail
-- Procedure should add details for specific Grade (new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade)
-- Output from this procedure should be resultset with SUM of GradePoints calculated with formula:
-- AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade

CREATE PROCEDURE dbo.CreateGradeDetail
(
	@GradeId int,
	@AchievementTypeId int,
	@AchievementPoints int,
	@AchievementMaxPoints int
)
AS
BEGIN
	INSERT INTO dbo.GradeDetails
	(GradeID,
	AchievementTypeID,
	AchievementPoints,
	AchievementMaxPoints,
	AchievementDate)
	VALUES
	(@GradeId, 
	@AchievementTypeId,
	@AchievementPoints,
	@AchievementMaxPoints,
	GETDATE())

	Select SUM (CAST(g.AchievementPoints AS DECIMAL(18,2)) / CAST (g.AchievementMaxPoints AS DECIMAL(18,2)) * ac.ParticipationRate) AS TotalPoints
	From dbo.GradeDetails g
	INNER JOIN dbo.AchievementType ac ON ac.Id = g.AchievementTypeID
	Where g.GradeID = @GradeId 
	Group By g.GradeID	

END
