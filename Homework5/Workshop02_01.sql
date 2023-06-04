--WORKSHOP 02.1
--• Create new procedure called CreateGrade
--• Procedure should create only Grade header info (not Grade Details)
--• Procedure should return the total number of grades in the system for the Student on input
--(from the CreateGrade)
--• Procedure should return second resultset with the MAX Grade of all grades for the Student
--and Teacher on input (regardless the Course)

CREATE PROCEDURE dbo.CreateGrade
(
	@StudentId int,
	@CourseId int,
	@TeacherId int,
	@Grade int
)
AS
BEGIN
	INSERT INTO dbo.Grade  (StudentId, CourseId, TeacherId, Grade, CreatedDate)
	VALUES (@StudentId, @CourseId, @TeacherId, @Grade, GETDATE() )

	SELECT COUNT(*) as TotalNumberOfGrades
	FROM Grade
	Where StudentId = @StudentId

	Select MAX(Grade) as MaxGrade
	From Grade
	Where StudentId = @StudentId AND TeacherId = @TeacherId

END