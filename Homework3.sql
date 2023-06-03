Use SEDCACADEMYDB

--Calculate the count of all grades per Teacher in the system
SELECT  Count (*) as GradesCount
FROM Grade
Group By TeacherID

--● Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT Count (*) as GradesCount
FROM Grade
Where StudentID < 100
Group By TeacherID

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT MAX(Grade) as MaximalGrade,
	   AVG(Grade) as AverageGrade
FROM Grade
Group By StudentID

--● Calculate the count of all grades per Teacher in the system and filter only grade count greater than 200
SELECT  Count (*) as GradesCount
FROM Grade 
Group By TeacherID
Having Count(*) > 200

--● Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system.
-- Filter only records where Maximal Grade is equal to Average Grade
SELECT Count(Grade) as GradesCount,
	   MAX(Grade) as MaximalGrade,
	   AVG(Grade) as AverageGrade
FROM Grade
Group By StudentID
Having MAX(Grade) = AVG(Grade)

--● List Student First Name and Last Name next to the other details from previous query
SELECT s.FirstName,
	   s.LastName,
       Count(g.Grade) as GradesCount,
	   MAX(g.Grade) as MaximalGrade,
	   AVG(g.Grade) as AverageGrade
FROM Grade g
Inner Join Student s ON s.ID = g.StudentID
Group By StudentID, s.FirstName, s.LastName
Having MAX(g.Grade) = AVG(g.Grade)
Go

--● Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

Create View vv_StudentGrades
AS
SELECT StudentId, Count(Grade) as GradesCount
FROM Grade
Group By StudentId
GO

--● Change the view to show Student First and Last Names instead of StudentID
ALTER View vv_StudentGrades
AS
SELECT  s.FirstName,
		s.LastName,
		Count(g.Grade) as GradesCount
FROM Grade g
Inner Join Student s ON s.ID = g.StudentID
Group By StudentId, s.FirstName, s.LastName
GO

--● List all rows from view ordered by biggest Grade Count
Select * 
From vv_StudentGrades
Order By GradesCount DESC
