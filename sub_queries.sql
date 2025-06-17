
-- Sub-query to get students with marks above average
SELECT name FROM students
WHERE student_id IN (
    SELECT student_id FROM results
    WHERE marks > (SELECT AVG(marks) FROM results)
);

-- Sub-query to get course names for a specific student
SELECT course_name FROM courses
WHERE course_id IN (
    SELECT course_id FROM enrollment
    WHERE student_id = 1
);

-- Correlated subquery to find students with highest marks in their courses
SELECT name FROM students s
WHERE EXISTS (
    SELECT 1 FROM results r
    WHERE r.student_id = s.student_id
    AND r.marks = (
        SELECT MAX(marks) FROM results r2
        WHERE r2.course_id = r.course_id
    )
);
