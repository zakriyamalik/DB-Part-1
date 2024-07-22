create database lab8_7986

use lab8_7986



go
create table Students
(RollNo varchar(7) primary key
,Name varchar(30)
,WarningCount int
,Department varchar(15)
)
GO
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'1', N'Ali', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'2', N'Bilal', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'3', N'Ayesha', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'4', N'Ahmed', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'5', N'Sara', 0, N'EE')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'6', N'Salman', 1, N'EE')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'7', N'Zainab', 2, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'8', N'Danial', 1, N'CS')

go
create table Courses
(
CourseID int primary key,
CourseName varchar(40),
PrerequiteCourseID int,
CreditHours int
) 
GO
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (10, N'Database Systems', 20, 3)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (20, N'Data Structures', 30,3)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (30, N'Programing', NULL,3)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (40, N'Basic Electronics', NULL,3)
go

go
Create table Instructors 
(
InstructorID int Primary key,
Name varchar(30),
Department varchar(7) ,
)
GO
INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (100, N'Ishaq Raza', N'CS')
INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (200, N'Zareen Alamgir', N'CS')
INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (300, N'Saima Zafar', N'EE')
go
Create table Semester
(
Semester varchar(15) Primary key,
[Status] varchar(10),
)
GO
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Fall2016', N'Complete')
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Spring2016', N'Complete')
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Spring2017', N'InProgress')
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Summer2016', N'Cancelled')
go
Create table Courses_Semester
(
InstructorID int Foreign key References Instructors(InstructorID),
CourseID int Foreign key References Courses(CourseID),
Semester varchar(15) Foreign key References Semester(Semester), 
Section varchar(1) ,
AvailableSeats int,
Department varchar(2)
)
GO
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2017', N'D', 45, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2017', N'C', 0, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (100, 10, N'Spring2017', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (300, 40, N'Spring2017', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (300, 40, N'Spring2016', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2016', N'A', 0, N'CS')

go



create table Registration
(
Semester varchar(15) Foreign key References Semester(Semester),
RollNumber  varchar(7) Foreign key References Students(RollNo),
CourseID int Foreign key References Courses(CourseID), 
Section varchar(1),
GPA float
)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'1', 20, N'A', 3.3)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'2', 20, N'B', 4)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Spring2016', N'1', 30, N'A', 1.0)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'6', 40, N'D',0.0)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Spring2017', N'6', 40, N'D',1)


go

Create table ChallanForm
(Semester varchar(15) Foreign key References Semester(Semester),
RollNumber  varchar(7) Foreign key References Students(RollNo),
TotalDues int,
[Status] varchar(10)
)
GO
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'1', 100000, N'Paid')
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'2', 13333, N'Paid')
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'3', 5000, N'Paid')
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'4', 20000, N'Pending')


select * from Students
select * from Courses
select * from Instructors
select * from Registration
select * from Semester
select * from Courses_Semester
select * from ChallanForm



--Functionality 1:

-- [Q1]

CREATE TRIGGER prevent_delete_student
ON Students
AFTER DELETE
AS
BEGIN
  PRINT 'You don''t have permission to delete the student.'
  ROLLBACK TRANSACTION;
END;


delete from Students where RollNo=3;


--[2]


--Functionality 2: Prevent Inserting Courses

CREATE TRIGGER prevent_insert_course
ON Courses
AFTER INSERT
AS
BEGIN
  PRINT 'You don''t have permission to Insert a new Course'
  ROLLBACK TRANSACTION;
END;





--[3]




CREATE TABLE Notify (
    NotificationID int IDENTITY(1,1) PRIMARY KEY,
    StudentID varchar(7) FOREIGN KEY REFERENCES Students(RollNo),
    Notification varchar(255)
);

CREATE TRIGGER notify_on_registration
AFTER INSERT
ON Registration
AS
DECLARE @prerequisitePassed int, @seatsAvailable int
BEGIN
  -- Check prerequisite passed
  SELECT @prerequisitePassed = COUNT(*)
  FROM Registration r1
  WHERE r1.RollNumber = INSERTED.RollNumber
    AND r1.CourseID = (SELECT PrerequiteCourseID FROM Courses WHERE CourseID = INSERTED.CourseID)
    AND r1.GPA >= 2.0;  -- Assuming passing GPA is 2.0

  -- Check seats available
  SELECT @seatsAvailable = AvailableSeats
  FROM Courses_Semester
  WHERE CourseID = INSERTED.CourseID
    AND Semester = INSERTED.Semester
    AND Section = INSERTED.Section;

  IF @prerequisitePassed > 0 AND @seatsAvailable > 0
  BEGIN
    INSERT INTO Notify (StudentID, Notification)
    VALUES (INSERTED.RollNumber, 'Your registration for course '+CAST(INSERTED.CourseID AS varchar(5))+' is successful!');
  ELSE
    INSERT INTO Notify (StudentID, Notification)
    VALUES (INSERTED.RollNumber, 'Your registration for course '+CAST(INSERTED.CourseID AS varchar(5))+' is unsuccessful.');
  END
END;










--[4]


CREATE TRIGGER PreventEnrollWithDueCharges ON Registration 
INSTEAD OF INSERT 
AS 
BEGIN 
DECLARE @TotalDues INT; DECLARE @RollNumber VARCHAR(7);
 SELECT @TotalDues = @TotalDues, @RollNumber = RollNumber FROM inserted; 
 IF (@TotalDues <= 20000)
    BEGIN INSERT INTO Registration (Semester, RollNumber, CourseID, Section, GPA) 
   SELECT Semester, RollNumber, CourseID, Section, GPA FROM inserted; 
  END
   ELSE 
    BEGIN RAISERROR('You cannot enroll in a new course with more than 20,000 fee charges due.', 16, 1);
   END; 
   END;



   INSERT INTO Registration (Semester, RollNumber, CourseID, Section) 
   Values
   ('Spring2017','7', '40','C')






--[5]



CREATE TRIGGER PreventDeleteCourseSemester ON Courses_Semester 
INSTEAD OF DELETE
AS
BEGIN DECLARE
@AvailableSeats INT; 
SELECT @AvailableSeats = AvailableSeats FROM deleted; 
IF (@AvailableSeats < 10) BEGIN RAISERROR('Not possible', 16, 1);
END 
ELSE 
BEGIN DELETE FROM Courses_Semester WHERE InstructorID IN 
(SELECT InstructorID FROM deleted) AND CourseID IN (SELECT CourseID FROM deleted) AND Semester IN (SELECT Semester FROM deleted); 
PRINT 'Successfully deleted';
END; 
END;

DELETE FROM Courses_Semester WHERE Courses_Semester.CourseID=10 and
 Courses_Semester.Semester='Spring2016' and Courses_Semester.Section ='A';



 --[6]

CREATE TRIGGER prevent_modify_instructors
ON Instructors
AFTER DELETE, update
AS
BEGIN
  PRINT 'You don''t have permission to modify the Instructors table.';
  ROLLBACK TRANSACTION;
END;

delete from Instructors where Instructors.InstructorID=1;






































SQL
CREATE TRIGGER prevent_delete_student
ON Students
AFTER DELETE
AS
BEGIN
  PRINT 'You don''t have permission to delete the student.'
  ROLLBACK TRANSACTION;
END;
Use code with caution.
content_copy
Functionality 2: Prevent Inserting Courses

SQL
CREATE TRIGGER prevent_insert_course
ON Courses
AFTER INSERT
AS
BEGIN
  PRINT 'You don''t have permission to Insert a new Course'
  ROLLBACK TRANSACTION;
END;
Use code with caution.
content_copy
Functionality 3: Notify Students on Registration

SQL
CREATE TABLE Notify (
    NotificationID int IDENTITY(1,1) PRIMARY KEY,
    StudentID varchar(7) FOREIGN KEY REFERENCES Students(RollNo),
    Notification varchar(255)
);

CREATE TRIGGER notify_on_registration
AFTER INSERT
ON Registration
AS
DECLARE @prerequisitePassed int, @seatsAvailable int
BEGIN
  -- Check prerequisite passed
  SELECT @prerequisitePassed = COUNT(*)
  FROM Registration r1
  WHERE r1.RollNumber = INSERTED.RollNumber
    AND r1.CourseID = (SELECT PrerequiteCourseID FROM Courses WHERE CourseID = INSERTED.CourseID)
    AND r1.GPA >= 2.0;  -- Assuming passing GPA is 2.0

  -- Check seats available
  SELECT @seatsAvailable = AvailableSeats
  FROM Courses_Semester
  WHERE CourseID = INSERTED.CourseID
    AND Semester = INSERTED.Semester
    AND Section = INSERTED.Section;

  IF @prerequisitePassed > 0 AND @seatsAvailable > 0
  BEGIN
    INSERT INTO Notify (StudentID, Notification)
    VALUES (INSERTED.RollNumber, 'Your registration for course '+CAST(INSERTED.CourseID AS varchar(5))+' is successful!');
  ELSE
    INSERT INTO Notify (StudentID, Notification)
    VALUES (INSERTED.RollNumber, 'Your registration for course '+CAST(INSERTED.CourseID AS varchar(5))+' is unsuccessful.');
  END
END;
Use code with caution.
content_copy
Functionality 4: Prevent Registration with Pending Dues

SQL
CREATE TRIGGER check_fee_on_registration
BEFORE INSERT
ON Registration
AS
BEGIN
  DECLARE @feeDue int
  SELECT @feeDue = TotalDues
  FROM ChallanForm
  WHERE RollNumber = INSERTED.RollNumber
    AND [Status] = 'Pending';

  IF @feeDue > 20000
  BEGIN
    PRINT 'Student has pending fees. Registration not allowed.';
    ROLLBACK TRANSACTION;
  END
END;
Use code with caution.
content_copy
Functionality 5: Prevent Deleting Course Semesters with Less Than 10 Seats

SQL
CREATE TRIGGER prevent_delete_course_semester
ON Courses_Semester
AFTER DELETE
AS
BEGIN
  DECLARE @availableSeats int
  SELECT @availableSeats = TOP 1 AvailableSeats
  FROM deleted d
  ORDER BY ROWCOUNT DESC;

  IF @availableSeats < 10
  BEGIN
    PRINT 'Not possible. Course semester cannot be deleted.';
    ROLLBACK TRANSACTION;
  ELSE
    PRINT 'Successfully deleted.';
  END
END;
Use code with caution.
content_copy
Functionality 6: Prevent Modifying Instructors Table

SQL
CREATE TRIGGER prevent_modify_instructors
ON Instructors
AFTER DELETE OR UPDATE
AS
BEGIN
  PRINT 'You don''t have permission to modify the Instructors table.';
  ROLLBACK TRANSACTION;
END;