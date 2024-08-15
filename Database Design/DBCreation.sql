CREATE TABLE Program
(
    ProgramCode VARCHAR(4) PRIMARY KEY,
    ProgramName VARCHAR(255) NOT NULL,
    MainCredit NUMBER(3) NOT NULL,
    ElectiveCredit NUMBER(3) NOT NULL,
    SecondaryCredit NUMBER(3) NOT NULL
);

BEGIN
INSERT INTO Program VALUES ('NULL','NULL', 0,0,0);
INSERT INTO Program VALUES ('SE','SOFTWARE ENGINEERING', 126, 120,50);
INSERT INTO Program VALUES ('FC','FORENSIC CYBER', 123, 118,49);
END
CREATE TABLE Student
(
    StudentID Number(7) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    MiddleName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    StudentEmail VARCHAR(18) UNIQUE,
    Password VARCHAR(50) NOT NULL,
    MajorProgram VARCHAR(4),
    MinorProgram VARCHAR(4) DEFAULT NULL,
    BirthDate DATE,
    FOREIGN KEY(MajorProgram) REFERENCES Program(ProgramCode),
    FOREIGN KEY(MinorProgram)  REFERENCES Program(ProgramCode)
);

BEGIN
-- Students Names Are Deleted For Privacy
INSERT INTO Student VALUES (3822250, 'SARA', 'AHMED', 'KHALED' ,'3822250@UPM.EDU.SA','M$ABCff','SE','FC', '06/30/2001');
END

CREATE TABLE Course
(
    CourseCode VARCHAR(8) NOT NULL PRIMARY KEY,
    CourseName VARCHAR(200),
);

BEGIN
INSERT INTO Course VALUES ('MATH 001', 'Preparatory Math for Science I');
    INSERT INTO Course VALUES ('MATH 002', 'Preparatory Math for Science II');
    INSERT INTO Course VALUES ('ENGL 000', 'English for Beginners');
    INSERT INTO Course VALUES ('ENGL 001', 'Preparatory English  I');
    INSERT INTO Course VALUES ('ENGL 002', 'Preparatory English II');
    INSERT INTO Course VALUES ('ENGL 003', 'Preparatory English III');
    INSERT INTO Course VALUES ('ENGL 004', 'Preparatory English IV');
    INSERT INTO Course VALUES ('ENGL 005', 'Preparatory English V');
    INSERT INTO Course VALUES ('PCS 001', 'Preparatory Computer Skills');

    INSERT INTO Course VALUES ('ENGL 101', 'First Year Composition');
    INSERT INTO Course VALUES ('PHYS 101', 'General Physics I');
    INSERT INTO Course VALUES ('MATH 101', 'Calculus I');
    INSERT INTO Course VALUES ('GHAL xx1', 'General Chemistry I');
    INSERT INTO Course VALUES ('GHAL xx2', 'Humanities, Arts, and Languages Elective');
    INSERT INTO Course VALUES ('CS 111', 'Introduction to Computing and Programming');

    INSERT INTO Course VALUES ('ENGL 102', 'Introduction to Report Writing');
    INSERT INTO Course VALUES ('PHYS 102', 'General Physics II');
    INSERT INTO Course VALUES ('MATH 102', 'Calculus II');
    INSERT INTO Course VALUES ('CS 112', 'Object Oriented Programming');
    INSERT INTO Course VALUES ('GSOS xxx', 'Social Sciences Elective');

    INSERT INTO Course VALUES ('CS 351', 'Fundamentals of Database Systems');
    INSERT INTO Course VALUES ('CS 201', 'Introduction to Discrete Systems');
    INSERT INTO Course VALUES ('CS 211', 'Data Structures and Algorithms');
    INSERT INTO Course VALUES ('CS 221', 'Fundamentals of Operating Systems');
    INSERT INTO Course VALUES ('GIAS 101', 'Islamic Culture');
    INSERT INTO Course VALUES ('ENGL 201', 'Technical Writing');

    INSERT INTO Course VALUES ('STAT 232', 'Probability and Statistics');
    INSERT INTO Course VALUES ('GIAS 102', 'Arabic Language Skills');

    INSERT INTO Course VALUES ('MATH 202', 'Calculus III');
    INSERT INTO Course VALUES ('CS 224', 'Computer Architecture and Organization');
    INSERT INTO Course VALUES ('SE 262', 'Software Engineering');
    INSERT INTO Course VALUES ('MATH 204', 'Linear Algebra');
    INSERT INTO Course VALUES ('CS 321', 'Operating Systems');
    INSERT INTO Course VALUES ('CS 464', 'Software Project Management');
    INSERT INTO Course VALUES ('SE 311', 'Software Requirements Engineering');
    INSERT INTO Course VALUES ('SE 323', 'Software Process and Modeling');

    INSERT INTO Course VALUES ('SE 342', 'Software Architecture and Design');
    INSERT INTO Course VALUES ('CS 332', 'Computer Networks & Data Communications');
    INSERT INTO Course VALUES ('SE 463', 'Software Testing and Quality Assurance');
    INSERT INTO Course VALUES ('SE 324', 'Software Construction');
    INSERT INTO Course VALUES ('FC 372', 'Ethics and Professionalism');

    INSERT INTO Course VALUES ('SE 491', 'Capstone Project I');
    INSERT INTO Course VALUES ('SE 431', 'Software Maintenance and Evolution');
    INSERT INTO Course VALUES ('SE xxx1', 'Professional Elective I');
    INSERT INTO Course VALUES ('SE xxx2', 'Professional Elective II');

    INSERT INTO Course VALUES ('SE 492', 'Capstone Project II');
    INSERT INTO Course VALUES ('SE 472', 'Software Security');
    INSERT INTO Course VALUES ('SE xxx3', 'Professional Elective III');
    INSERT INTO Course VALUES ('SE xxx4', 'Professional Elective IV');

    INSERT INTO Course VALUES ('GDMC xxx', 'Diversity and Multiculturalism Elective');
    INSERT INTO Course VALUES ('GIAS xxx', 'Islamic Studies');


    INSERT INTO Course VALUES ('CS 262', 'System Analysis and Design');
    INSERT INTO Course VALUES ('CS 314', 'Web Application Development');
    INSERT INTO Course VALUES ('CS 232', 'Computer Networks');
    INSERT INTO Course VALUES ('FC 381', 'Ethical Hacking');
    INSERT INTO Course VALUES ('FC 313', 'Cyber Security');
    INSERT INTO Course VALUES ('FC 353', 'Operating System Security');
    INSERT INTO Course VALUES ('FC 311', 'Web Security');
    INSERT INTO Course VALUES ('FC 302', 'Computer Forensics and Investigations');
    INSERT INTO Course VALUES ('FC 332', 'Secure Software Design');
    INSERT INTO Course VALUES ('FC 382', 'Defense Mechanisms');
    INSERT INTO Course VALUES ('FC 304', 'Digital Forensic Tools and Techniques');


    INSERT INTO Course VALUES ('FC 491', 'Capstone Project I');
    INSERT INTO Course VALUES ('FC 411', 'Secure Network Design');
    INSERT INTO Course VALUES ('FC xxx1', 'Professional Elective I');
    INSERT INTO Course VALUES ('FC 421', 'Applied Cryptography');

    INSERT INTO Course VALUES ('FC 492', 'Capstone Project II');
    INSERT INTO Course VALUES ('FC 472', 'Security and Privacy Policies');
    INSERT INTO Course VALUES ('FC xxx2', 'Professional Elective II');
    INSERT INTO Course VALUES ('FC 462', 'Security Risk Management');

    INSERT INTO Course VALUES ('SE 394', 'Summer Training');
    INSERT INTO Course VALUES ('FC 394', 'Summer Training');
END

CREATE TABLE StudentGoal
(
    GoalNo NUMBER(4) PRIMARY KEY,
    StudentID Number(7) NOT NULL,
    StudentGoal NUMBER(5,2) NOT NULL,
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID)
);
BEGIN
    INSERT INTO StudentGoal VALUES (01, 4010064, 3.8);
    INSERT INTO StudentGoal VALUES (02, 3910221, 2.5);
    INSERT INTO StudentGoal VALUES (03, 3940022, 4.0);
END

CREATE TABLE CoursesInProgram
(
    ProgramCode VARCHAR(5) NOT NULL,
    CourseCodeInProgram VARCHAR(8) NOT NULL,
    ProgramLevel NUMBER(2),
    CreditHours NUMBER(3),
    Prerequisite VARCHAR(8),
    FOREIGN KEY(Prerequisite) REFERENCES Course(CourseCode),
    FOREIGN KEY(ProgramCode) REFERENCES Program(ProgramCode) ON DELETE CASCADE,
    FOREIGN KEY(CourseCodeInProgram) REFERENCES Course(CourseCode) ON DELETE CASCADE,
    PRIMARY KEY (CourseCodeInProgram, ProgramCode)
);
BEGIN
    --SE L01
    INSERT INTO CoursesInProgram VALUES ('SE', 'MATH 101', 1, 4, 'MATH 002');
    INSERT INTO CoursesInProgram VALUES ('SE', 'ENGL 101', 1, 3, 'ENGL 005');
    INSERT INTO CoursesInProgram VALUES ('SE', 'PHYS 101', 1, 4, 'MATH 002');
    INSERT INTO CoursesInProgram VALUES ('SE', 'CS 111', 1, 4, 'PCS 001');
    --SE L02    
    INSERT INTO CoursesInProgram VALUES ('SE', 'MATH 102', 2, 4, 'MATH 101');
    INSERT INTO CoursesInProgram VALUES ('SE', 'PHYS 102', 2, 4, 'PHYS 101');
    INSERT INTO CoursesInProgram VALUES ('SE', 'CS 112', 2, 4, 'CS 111');
    INSERT INTO CoursesInProgram VALUES ('SE', 'ENGL 102', 2, 3, 'ENGL 101');
    --SE L03    
    INSERT INTO CoursesInProgram VALUES ('SE', 'CS 351', 3, 4, 'CS 112');
    INSERT INTO CoursesInProgram VALUES ('SE', 'CS 201', 3, 3, 'MATH 102');
    INSERT INTO CoursesInProgram VALUES ('SE', 'CS 211', 3, 4, 'CS 112');
    INSERT INTO CoursesInProgram VALUES ('SE', 'ENGL 201', 3, 3, 'ENGL 102');
    --SE L04    
    INSERT INTO CoursesInProgram VALUES ('SE', 'STAT 232', 4, 3, 'MATH 101');
    INSERT INTO CoursesInProgram VALUES ('SE', 'MATH 202', 4, 4, 'MATH 102');
    INSERT INTO CoursesInProgram VALUES ('SE', 'CS 224', 4, 3, 'CS 201');
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE 262', 4, 3, 'CS 201');
    --SE L05   
    INSERT INTO CoursesInProgram VALUES ('SE', 'MATH 204', 5, 3, 'MATH 102');
    INSERT INTO CoursesInProgram VALUES ('SE', 'CS 321', 5, 4, 'CS 224');
    INSERT INTO CoursesInProgram VALUES ('SE', 'CS 464', 5, 3, 'SE 262');
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE 311', 5, 3, 'SE 262');
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE 323', 5, 3, 'SE 262');
    --SE L06    
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE 342', 6, 3, 'SE 323');
    INSERT INTO CoursesInProgram VALUES ('SE', 'CS 332', 6, 4, 'CS 112');
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE 463', 6, 3, 'SE 311');
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE 324', 6, 3, 'SE 323');
    INSERT INTO CoursesInProgram VALUES ('SE', 'FC 372', 6, 3, NULL);
    --SE L07    
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE 394', NULL, 1, NULL);

    INSERT INTO CoursesInProgram VALUES ('SE', 'SE 491', 7, 3, 'SE 394');
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE 431', 7, 3, 'SE 262');
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE xxx1', 7, 3, NULL);
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE xxx2', 7, 3, NULL);
    --SE L08    
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE 492', 8, 3, 'SE 491');
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE 472', 8, 3, 'CS 332');
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE xxx3', 8, 3, NULL);
    INSERT INTO CoursesInProgram VALUES ('SE', 'SE xxx4', 8, 3, NULL);


    --FC L01
    INSERT INTO CoursesInProgram VALUES ('FC',  'CS 111', 1, 4, 'PCS 001');
    INSERT INTO CoursesInProgram VALUES ('FC', 'PHYS 101', 1, 4, 'MATH 002');
    INSERT INTO CoursesInProgram VALUES ('FC', 'ENGL 101', 1, 3, 'ENGL 005');
    INSERT INTO CoursesInProgram VALUES ('FC', 'MATH 101', 1, 4, 'MATH 002');
    --FC L02
    INSERT INTO CoursesInProgram VALUES ('FC', 'PHYS 102', 2, 4, 'PHYS 101');
    INSERT INTO CoursesInProgram VALUES ('FC', 'MATH 102', 2, 4, 'MATH 101');
    INSERT INTO CoursesInProgram VALUES ('FC', 'CS 112', 2, 4, 'CS 111');
    INSERT INTO CoursesInProgram VALUES ('FC', 'ENGL 102', 2, 3, 'ENGL 101');
    --FC L03    
    INSERT INTO CoursesInProgram VALUES ('FC', 'CS 351', 3, 4, 'CS 112');
    INSERT INTO CoursesInProgram VALUES ('FC', 'CS 201', 3, 3, 'MATH 102');
    INSERT INTO CoursesInProgram VALUES ('FC', 'CS 211', 3, 4, 'CS 112');
    INSERT INTO CoursesInProgram VALUES ('FC', 'CS 221', 3, 4, NULL);
    --FC L04
    INSERT INTO CoursesInProgram  VALUES ('FC', 'STAT 232', 4, 3,'MATH 102');
    INSERT INTO CoursesInProgram  VALUES ('FC', 'CS 262', 4, 4, 'CS 351');
    INSERT INTO CoursesInProgram  VALUES ('FC', 'CS 314', 4, 3, 'CS 112');
    INSERT INTO CoursesInProgram VALUES ('FC', 'CS 232', 4, 4, 'CS 221');
    --FC L05
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 381', 5, 3, 'CS 232');
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 313', 5, 3, 'CS 232');
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 353', 5, 3, 'CS 221');
    INSERT INTO CoursesInProgram  VALUES ('FC', 'ENGL 201', 5, 3, 'ENGL 102');
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 311', 5, 3, 'CS 314');
    --FC L06
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 302', 6, 3, 'CS 232');
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 332', 6, 3, 'FC 353');
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 382', 6, 3, 'FC 313');
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 372', 6, 3, NULL);
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 304', 6, 4, 'CS 232');

    --FC L07
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 394', NULL, 1, NULL);

    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 491', 7, 3, 'FC 394');
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 411', 7, 3, 'FC 313');
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC xxx1', 7, 3, NULL);
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 421', 7, 3, 'CS 201');
    --FC L08
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 492', 8, 3, 'FC 491');
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 472', 8, 3, 'FC 313');
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC xxx2', 8, 3, NULL);
    INSERT INTO CoursesInProgram  VALUES ('FC', 'FC 462', 8, 3, 'FC 313');
END

CREATE TABLE StudentCompleted
(
    StudentID NUMBER(7),
    CompletedCourseCode VARCHAR(8),
    CourseMark NUMBER(5,2),
    CompInLevel NUMBER(2),
    CourseGrade VARCHAR(2),
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY(CompletedCourseCode) REFERENCES Course(CourseCode) ON DELETE CASCADE,
    PRIMARY KEY (StudentID, CompletedCourseCode)
);
BEGIN
INSERT INTO StudentCompleted  VALUES (4010064, 'MATH 001', 95, 0, 'A+');
INSERT INTO StudentCompleted  VALUES (4010064, 'MATH 002', 95, 0, 'A+');
INSERT INTO StudentCompleted  VALUES (4010064, 'MATH 101', 95, 1, 'A+');
INSERT INTO StudentCompleted  VALUES (4010064, 'MATH 102', 96, 2, 'A+');
INSERT INTO StudentCompleted  VALUES (4010064, 'PCS 001', 95, 0, 'A+');
INSERT INTO StudentCompleted  VALUES (4010064, 'CS 111', 93, 1, 'A');
INSERT INTO StudentCompleted  VALUES (4010064, 'CS 112', 100, 2, 'A+');
INSERT INTO StudentCompleted  VALUES (4010064, 'ENGL 101', 96, 1, 'A+');
INSERT INTO StudentCompleted  VALUES (4010064, 'ENGL 102', 98, 2, 'A+');

INSERT INTO StudentCompleted  VALUES (4010024, 'MATH 001', 92, 0, 'A');
INSERT INTO StudentCompleted  VALUES (4010024, 'MATH 002', 93, 0, 'A');
INSERT INTO StudentCompleted  VALUES (4010024, 'MATH 101', 80, 1, 'B');
INSERT INTO StudentCompleted  VALUES (4010024, 'MATH 102', 96, 2, 'A+');
INSERT INTO StudentCompleted  VALUES (4010024, 'PCS 001', 85, 0, 'B+');
INSERT INTO StudentCompleted  VALUES (4010024, 'CS 111', 93, 1, 'A');
INSERT INTO StudentCompleted  VALUES (4010024, 'CS 112', 98, 2, 'A+');
INSERT INTO StudentCompleted  VALUES (4010024, 'ENGL 101', 96, 1, 'A+');
INSERT INTO StudentCompleted  VALUES (4010024, 'ENGL 102', 88, 2, 'B+');

INSERT INTO StudentCompleted  VALUES (3910221, 'MATH 001', 92, 0, 'A');
INSERT INTO StudentCompleted  VALUES (3910221, 'MATH 002', 93, 0, 'A');
INSERT INTO StudentCompleted  VALUES (3910221, 'MATH 101', 80, 1, 'B');
INSERT INTO StudentCompleted  VALUES (3910221, 'MATH 102', 96, 2, 'A+');
INSERT INTO StudentCompleted  VALUES (3910221, 'PCS 001', 85, 0, 'B+');
INSERT INTO StudentCompleted  VALUES (3910221, 'CS 111', 93, 1, 'A');
INSERT INTO StudentCompleted  VALUES (3910221, 'CS 112', 98, 2, 'A+');
INSERT INTO StudentCompleted  VALUES (3910221, 'ENGL 101', 96, 1, 'A+');
INSERT INTO StudentCompleted  VALUES (3910221, 'ENGL 102', 88, 2, 'B+');

INSERT INTO StudentCompleted  VALUES (3910022, 'MATH 001', 95, 0, 'A+');
INSERT INTO StudentCompleted  VALUES (3910022, 'MATH 002', 93, 0, 'A');
INSERT INTO StudentCompleted  VALUES (3910022, 'MATH 101', 80, 1, 'B');
INSERT INTO StudentCompleted  VALUES (3910022, 'MATH 102', 96, 2, 'A+');
INSERT INTO StudentCompleted  VALUES (3910022, 'PCS 001', 89, 0, 'B+');
INSERT INTO StudentCompleted  VALUES (3910022, 'CS 111', 93, 1, 'A');
INSERT INTO StudentCompleted  VALUES (3910022, 'CS 112', 98, 2, 'A+');
INSERT INTO StudentCompleted  VALUES (3910022, 'ENGL 101', 100, 1, 'A+');
INSERT INTO StudentCompleted  VALUES (3910022, 'ENGL 102', 85, 2, 'B+');
END

CREATE TABLE CourseGoalByStudent
(
    StudentID NUMBER(7),
    GoaledCourses VARCHAR(8),
    GradesToGet VARCHAR(2), -- A, A+, B, B+ etc.--
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY(GoaledCourses) REFERENCES Course(CourseCode) ON DELETE CASCADE,
    PRIMARY KEY (StudentID, GoaledCourses)
);
BEGIN
    INSERT INTO CourseGoalByStudent VALUES (4010064, 'MATH 202','A+');
    INSERT INTO CourseGoalByStudent VALUES (4010064, 'CS 224','A');
    INSERT INTO CourseGoalByStudent VALUES (4010064, 'SE 262','B+');
    INSERT INTO CourseGoalByStudent VALUES (4010064, 'STAT 232','A');

    INSERT INTO CourseGoalByStudent VALUES (3910221, 'MATH 202','B');
    INSERT INTO CourseGoalByStudent VALUES (3910221, 'CS 351','B');
    INSERT INTO CourseGoalByStudent VALUES (3910221, 'CS 201','C+');
    INSERT INTO CourseGoalByStudent VALUES (3910221, 'CS 211','B');

    INSERT INTO CourseGoalByStudent VALUES (3940022, 'MATH 101','A+');
    INSERT INTO CourseGoalByStudent VALUES (3940022, 'CS 111','A+');
    INSERT INTO CourseGoalByStudent VALUES (3940022, 'ENGL 101','A+');
END

CREATE TABLE CoursesStudentEnrolledInto
(
    StudentID NUMBER(7),
    CurrentCourses VARCHAR(8),
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY(CurrentCourses) REFERENCES Course(CourseCode) ON DELETE CASCADE,
    PRIMARY KEY (StudentID, CurrentCourses)
);
BEGIN
INSERT INTO CoursesStudentEnrolledInto  VALUES (4010064, 'CS 351');
INSERT INTO CoursesStudentEnrolledInto  VALUES (4010064, 'CS 201');
INSERT INTO CoursesStudentEnrolledInto  VALUES (4010064, 'CS 211');
INSERT INTO CoursesStudentEnrolledInto  VALUES (4010064, 'CS 351');

INSERT INTO CoursesStudentEnrolledInto  VALUES (4010024, 'CS 351');
INSERT INTO CoursesStudentEnrolledInto  VALUES (4010024, 'CS 201');
INSERT INTO CoursesStudentEnrolledInto  VALUES (4010024, 'CS 211');
INSERT INTO CoursesStudentEnrolledInto  VALUES (4010024, 'CS 351');

INSERT INTO CoursesStudentEnrolledInto  VALUES (3910221, 'CS 351');
INSERT INTO CoursesStudentEnrolledInto  VALUES (3910221, 'CS 201');
INSERT INTO CoursesStudentEnrolledInto  VALUES (3910221, 'CS 211');
INSERT INTO CoursesStudentEnrolledInto  VALUES (3910221, 'CS 351');
END
CREATE TABLE Inquiry 
(
    InquiryNo NUMBER(3) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Message VARCHAR(255) NOT NULL,
    InquiryDate DATE,
    InquiryTime TIMESTAMP,
    StudentID Number(7),
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID)
);
BEGIN
INSERT INTO Inquiry VALUES
    (1, 4010064, 'TRAVEL ABROAD', 'DEAR ALL WE DESIRE TOO TRavel abroad as student, please inform us if there is a chance','03-28-2012' ,'05-DEC-21 04.26.47.090781 PM');
INSERT INTO Inquiry VALUES (2, 4010024, 'Studying Math 205', 'DEAR ALL WE DESIRE TO study math 205 as student, please inform us if there is a chance','03-28-2012' , '05-DEC-21 05.26.47.090781 PM');
INSERT INTO Inquiry VALUES (3, 3910221, 'Complaint letters', 'Good Morning, where I could find Complaint letters, please inform us if there is a chance','09-28-2020' ,'05-DEC-21 05.26.47.090781 PM');
END

CREATE TABLE FAQ
(
    QuestionNo NUMBER(3),
    Question VARCHAR(255),
    Answer VARCHAR(255)
);
BEGIN
INSERT INTO FAQ  VALUES (1, 'DEAR ALL WE DESIRE TOO Know how many departments u have?','Hey! tHEY ARE FOUR DEPARTMENTS');
INSERT INTO FAQ  VALUES (2, 'HEY EVERYONE, MAY WE KNOW IF YOU HAVE OTHER UNI BRANCHES?','We apologizize we only have in Madinah');
INSERT INTO FAQ  VALUES (3, 'Good Morning, How much should i pay to get accepted in the CS field','Hey, There!, Its prob less than a million ;)' );
END

CREATE TABLE ReferenceLinks
(
    ReferenceNo NUMBER(3),
    Title VARCHAR(255),
    RefLink VARCHAR(255)
);
BEGIN
INSERT INTO ReferenceLinks  VALUES (1, 'HISTORY TUTORIAL','https://www.edarabia.com/ar/6-%D8%AD%D9%82%D8%A7%D8%A6%D9%82-%D8%B9%D9%86-%D8%A7%D9%84%D8%A5%D8%B3%D9%83%D9%86%D8%AF%D8%B1-%D8%A7%D9%84%D9%85%D9%82%D8%AF%D9%88%D9%86%D9%8A/');
INSERT INTO ReferenceLinks  VALUES (2, 'CS351 TUTORIAL','https://www.w3schools.com/sql/sql_in.asp');
INSERT INTO ReferenceLinks VALUES (3, 'CS351','https://www.w3schools.com/sql/sql_wildcards.asp' );
END
