-- create a table
CREATE TABLE Student (
  studentID INTEGER PRIMARY KEY,
  studentFName VARCHAR(50) NOT NULL,
  studentLName VARCHAR(50) NOT NULL,
    studentDOB DATE NOT NULL,
    studentEmail VARCHAR(50) NOT NULL,
    studentGender VARCHAR(10) NOT NULL,
    international BOOL NOT NULL
);

CREATE TABLE Degree (
    degreeNum INTEGER PRIMARY KEY,
    degreeName VARCHAR(50) NOT NULL
);

CREATE TABLE StudentDegree (
    studentID INTEGER PRIMARY KEY,
    degreeNum INTEGER NOT NULL,
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (degreeNum) REFERENCES Degree(degreeNum)
);

CREATE TABLE PhoneNumber (
    phoneNum VARCHAR(20) NOT NULL,
    studentID INTEGER,
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);

CREATE TABLE EmergencyContact (
    ePhoneNum VARCHAR(20),
    studentID INTEGER,
    eFName VARCHAR(50),
    eLName VARCHAR(50),
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);

CREATE TABLE Address (
    studentID INTEGER NOT NULL,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL,
    postalCode VARCHAR(20) NOT NULL,
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);

CREATE TABLE Department (
    deparmentNum INTEGER PRIMARY KEY,
    deparmentName VARCHAR(50)
);

CREATE TABLE Professor (
    profID INTEGER PRIMARY KEY,
    profName VARCHAR(50) NOT NULL,
    profEmail VARCHAR(50) NOT NULL,
    deparmentNum INTEGER NOT NULL,
    FOREIGN KEY (deparmentNum) REFERENCES Department(deparmentNum)
);

CREATE TABLE Courses (
    courseCode VARCHAR(20) PRIMARY KEY,
    courseName VARCHAR(50) NOT NULL,
    profID INTEGER NOT NULl,
    FOREIGN KEY (profID) REFERENCES Professor(profID)
);

CREATE TABLE gpa (
    GPA FLOAT PRIMARY KEY
);

CREATE TABLE Mark (
    studentID INTEGER NOT NULL,
    courseCode VARCHAR(20) NOT NULL,
    FinalGrade FLOAT,
    GPA FLOAT,
    FOREIGN KEY (studentID) REFERENCES Student(StudentID),
    FOREIGN KEY (courseCode) REFERENCES Courses(courseCode),
    FOREIGN KEY (GPA) REFERENCES gpa(GPA)
);

CREATE TABLE Enrollment (
    courseCode VARCHAR(20) NOT NULL,
    studentID INTEGER NOT NULL,
    profID INTEGER NOT NULL,
    FOREIGN KEY (courseCode) REFERENCES Courses(courseCode),
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (profID) REFERENCES Professor(profID)
);

CREATE TABLE Major (
    majorNum INTEGER PRIMARY KEY,
    majorName VARCHAR(50) NOT NULL
);

CREATE TABLE StudentMinor (
    studentID INTEGER NOT NULL,
    majorNum INTEGER NOT NULL,
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (majorNum) REFERENCES Major(majorNum)
);

CREATE TABLE StudentMajor (
    studentID INTEGER NOT NULL,
    majorNum INTEGER NOT NULL,
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (majorNum) REFERENCES Major(majorNum)
);

