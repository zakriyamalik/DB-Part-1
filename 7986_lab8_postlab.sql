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


