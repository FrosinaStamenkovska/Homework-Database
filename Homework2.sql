-- Find all Students with FirstName = Antonio

SELECT *
FROM dbo.Student
Where FirstName = 'Antonio'

-- Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT *
FROM dbo.Student
Where DateOfBirth > '01.01.1999'

-- Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT *
FROM dbo.Student
Where LastName LIKE 'J%'
		AND EnrolledDate >= '1998.01.01'
		AND EnrolledDate <= '1998.01.31'

-- List all Students ordered by FirstName
SELECT *
FROM dbo.Student
Order By FirstName

-- List all Teacher Last Names and Student Last Names in single result set. Remove duplicates

SELECT LastName
FROM dbo.Student
INTERSECT
SELECT LastName
FROM dbo.Teacher

--Create Foreign key constraints from diagram or with script

ALTER TABLE [dbo].[Grade] WITH CHECK
ADD CONSTRAINT [FK_Grade_Student]
FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO

ALTER TABLE [dbo].[Grade] WITH CHECK
ADD CONSTRAINT [FK_Grade_Teacher]
FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
GO

ALTER TABLE [dbo].[Grade] WITH CHECK
ADD CONSTRAINT [FK_Grade_Course]
FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO

ALTER TABLE [dbo].[GradeDetails] WITH CHECK
ADD CONSTRAINT [FK_GradeDetails_Grade]
FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([ID])
GO

ALTER TABLE [dbo].[GradeDetails] WITH CHECK
ADD CONSTRAINT [FK_GradeDetails_AchievementType]
FOREIGN KEY([AchievementTypeID])
REFERENCES [dbo].[AchievementType] ([ID])
GO

-- List all possible combinations of Courses names and AchievementType names that can be passed by student

Select c.[Name], a.[Name]
From Course c
Cross Join AchievementType a

-- List all Teachers without exam Grade

-- way 1
SELECT g.TeacherID, t.[FirstName] + ' ' + t.[LastName] as TeacherName, g.Grade
FROM Grade g
Inner Join Teacher t ON g.TeacherID = t.ID
Where g.Grade IS NULL

--way 2
SELECT TeacherID,  Grade
FROM Grade 
Where Grade IS NULL

