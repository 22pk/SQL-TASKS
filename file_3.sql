
-- TCL commands
START TRANSACTION;
UPDATE results SET marks = 95 WHERE student_id = 2;
SAVEPOINT sp1;
UPDATE results SET marks = 60 WHERE student_id = 1;
ROLLBACK TO sp1;
COMMIT;

-- DCL commands
GRANT SELECT, INSERT ON students TO 'user1'@'localhost';
REVOKE INSERT ON students FROM 'user1'@'localhost';
