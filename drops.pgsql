--Borrar tablas
--Drop constraints antes de drop tables, porque no puedo usar cascade
ALTER TABLE course_offering DROP CONSTRAINT "FK_course_offering.course_id";
ALTER TABLE enrols DROP CONSTRAINT "FK_enrols.student_id";
ALTER TABLE enrols DROP CONSTRAINT "FK_enrols_offering.course_id";
ALTER TABLE teaches DROP CONSTRAINT "FK_teaches.course_id";
ALTER TABLE teaches DROP CONSTRAINT "FK_teaches.instructor_id";
ALTER TABLE requires DROP CONSTRAINT "FK_requires.main_course";
ALTER TABLE requires DROP CONSTRAINT "FK_requires.prerequisite";

--Drop tables
DROP TABLE IF EXISTS "student";
DROP TABLE IF EXISTS "instructor";
DROP TABLE IF EXISTS "course";
DROP TABLE IF EXISTS "course_offering";
DROP TABLE IF EXISTS "enrols";
DROP TABLE IF EXISTS "teaches";
DROP TABLE IF EXISTS "requires";

-- Borrar registros TRUNCATE "student","instructor","course","course_offering", "enrols", "teaches", "requires" CASCADE;
--Borrar secuencias
DROP SEQUENCE IF EXISTS "student_id_seq";
DROP SEQUENCE IF EXISTS "course_id_seq";

--Borrar disparadores
DROP TRIGGER IF EXISTS grade_check ON enrols;
DROP TRIGGER IF EXISTS grade_check_up ON enrols;

--Borrar View
DROP VIEW IF EXISTS better_students;

--Borrar Procedures
DROP PROCEDURE IF EXISTS create_teaches(instructor_idp INT, course_idp INT);
