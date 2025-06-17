
-- String functions
SELECT UPPER(name) AS uppercase_name FROM students;
SELECT LOWER(course) AS lowercase_course FROM students;
SELECT LENGTH(name) AS name_length FROM students;
SELECT CONCAT(name, ' - ', course) AS student_info FROM students;

-- Date functions (Assuming a sample_date column exists or use NOW())
SELECT NOW() AS current_datetime;
SELECT CURDATE() AS current_date;
SELECT CURTIME() AS current_time;
SELECT DAY(CURDATE()) AS day_part;
SELECT MONTH(CURDATE()) AS month_part;
SELECT YEAR(CURDATE()) AS year_part;
