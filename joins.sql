
-- Basic INNER JOIN
SELECT s.name, c.course_name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

-- LEFT JOIN example
SELECT s.name, r.marks
FROM students s
LEFT JOIN results r ON s.student_id = r.student_id;

-- RIGHT JOIN example
SELECT f.faculty_name, d.dept_name
FROM departments d
RIGHT JOIN faculty f ON d.dept_id = f.dept_id;
