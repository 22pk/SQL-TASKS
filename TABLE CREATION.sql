
-- Creating basic tables
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    course VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE results (
    result_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT
);

-- Insert data
INSERT INTO students VALUES (1, 'Alice', 20, 'BCA');
INSERT INTO students VALUES (2, 'Bob', 21, 'BBA');

INSERT INTO courses VALUES (101, 'Maths', 3);
INSERT INTO courses VALUES (102, 'DBMS', 4);

INSERT INTO departments VALUES (1, 'Science');
INSERT INTO departments VALUES (2, 'Commerce');

INSERT INTO faculty VALUES (10, 'Dr. Smith', 1);
INSERT INTO faculty VALUES (11, 'Dr. Raj', 2);

INSERT INTO enrollment VALUES (1001, 1, 101);
INSERT INTO enrollment VALUES (1002, 2, 102);

INSERT INTO results VALUES (201, 1, 101, 85);
INSERT INTO results VALUES (202, 2, 102, 90);
