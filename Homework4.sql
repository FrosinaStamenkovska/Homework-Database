use SEDCACADEMYDB

--● Declare scalar variable for storing FirstName values
--• Assign value ‘Antonio’ to the FirstName variable
--• Find all Students having FirstName same as the variable
DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Antonio'
Select * 
FROM Student
Where FirstName = @FirstName

--● Declare table variable that will contain StudentId, StudentName and DateOfBirth
--• Fill the table variable with all Female students
DECLARE @FemaleStudents TABLE
(StudentId int NOT NULL, StudentName nvarchar(100) NOT NULL, DateOfBirth date NOT NULL)

INSERT INTO @FemaleStudents(StudentId, StudentName, DateOfBirth)
SELECT ID, FirstName, DateOfBirth
FROM dbo.Student
Where Gender = 'F'

Select * from @FemaleStudents

--● Declare temp table that will contain LastName and EnrolledDate columns
--• Fill the temp table with all Male students having First Name starting with ‘A’
--• Retrieve the students from the table which last name is with 7 characters
CREATE TABLE #MaleStudentsOnA (LastName nvarchar(100) NOT NULL, EnrolledDate date NOT NULL)

INSERT INTO #MaleStudentsOnA(LastName, EnrolledDate)
Select LastName, EnrolledDate
From dbo.Student
Where Gender = 'M' AND FirstName LIKE 'A%'

Select *
From #MaleStudentsOnA
Where LEN(LastName) = 7

--● Find all teachers whose FirstName length is less than 5 and
--• the first 3 characters of their FirstName and LastName are the same

Select*
From Teacher
Where LEN(FirstName) < 5 AND SUBSTRING(FirstName,1,3) = SUBSTRING(LastName, 1,3)

DROP TABLE #MaleStudentsOnA
