--WORKSHOP 02.2
--• Create new procedure called CreateGradeDetail
--• Procedure should add details for specific Grade (new record for new AchievementTypeID,
--Points, MaxPoints, Date for specific Grade)
--• Output from this procedure should be resultset with SUM of GradePoints calculated with
--formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade

CREATE PROCEDURE dbo.CreateGradeDetail
(
	@GradeId int,
	@AchievementTypeId int,
	@AchievementPoints int,
	@AchievementMaxPoints int
)
AS
BEGIN
		DECLARE @AchievementDate date,
				@GradePoints int

		Select @AchievementDate = g.CreatedDate
		From dbo.Grade g
		Where g.Id = @GradeId

		INSERT INTO dbo.GradeDetails(GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
		VALUES(@GradeId, @AchievementTypeId, @AchievementPoints, @AchievementMaxPoints, @AchievementDate)

		Select @GradePoints = SUM(@AchievementPoints / @AchievementMaxPoints * a.ParticipationRate)
		From dbo.AchievementType a
		Where a.ID = @AchievementTypeId

END
