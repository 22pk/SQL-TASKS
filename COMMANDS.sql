
-- DDL commands
ALTER TABLE students ADD email VARCHAR(100);
DROP TABLE IF EXISTS old_students;
TRUNCATE TABLE results;

-- DML commands
UPDATE students SET age = 22 WHERE student_id = 2;
DELETE FROM enrollment WHERE student_id = 1;
