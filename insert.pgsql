

ALTER SEQUENCE "course_offering_sec_id_seq" RESTART;
ALTER SEQUENCE "enrols_sec_id_seq" RESTART;

ALTER SEQUENCE "teaches_sec_id_seq" RESTART;
ALTER SEQUENCE "student_id_seq" RESTART;
ALTER SEQUENCE "course_id_seq" RESTART;
--esto da el error de null
--DROP SEQUENCE IF EXISTS "course_id_seq" CASCADE;
--DROP SEQUENCE IF EXISTS "student_id_seq" CASCADE;
TRUNCATE "student","instructor","course","course_offering", "enrols", "teaches", "requires" CASCADE;--funciona sin esto



INSERT INTO student (name,program)
VALUES
  ('Noah Cotton','Math'),
  ('Deborah Ewing','physics'),
  ('Kelly Colon','CS'),
  ('Reese Woodard','CS'),
  ('Igor Smith','Electrical Engineering');

SELECT * FROM "student";

INSERT INTO instructor (instructor_id, name, dept, title) 
VALUES 
    (8813011, 'Janean', 'Research and Development', 'Desktop Support Technician'),
    (3707630, 'Vivienne', 'Business Development', 'Research Assistant III'),
    (1169176, 'Auberta', 'Training', 'Marketing Assistant'),
    (3772342, 'Rossy', 'Accounting', 'Assistant Professor'),
    (0974263, 'Jarrett', 'Product Management', 'Desktop Support Technician');

SELECT * FROM "instructor";

INSERT INTO course (title,syllabus,credits)
VALUES
  ('Statistics','pensum 2010',3),
  ('Operative Systems','pensum 2020',2),
  ('Databases','pensum 2010',4),
  ('Sport','pensum 2020',3),
  ('Complexity','pensum 2020',4);
  
SELECT * FROM "course";  

INSERT INTO course_offering (course_id,year,semester,time,classroom)
VALUES
  (837827, 1902,7,'11:53 PM','240B'),
  (837850, 1897,2,'4:58 PM','240c'),
  (837873,1902,7,'11:11 AM','240a'),
  (837896,1901,6,'12:01 AM','240Bx'),
  (837919, 1898,3,'4:23 PM','240Bd');

SELECT * FROM "course_offering";

INSERT INTO enrols (student_id,course_id,semester,year,grade)
VALUES
  (7488,837827,7,1902, 4.23),
  (7656, 837850,2,1897,4.56),
  (7824,837873 ,7,1902,2.9),
  (7992,837896 ,6,1901,3.23),
  (8160, 837919,3,1898,1.19);

SELECT * FROM "enrols";
 
INSERT INTO teaches (course_id,semester,year,instructor_id)
VALUES
  (837827,7,1902,8813011),
  (837850,2,1897,3707630),
  (837873,7,1902,1169176),
  (837896,6,1901,3772342),
  (837919,3,1898,0974263);

SELECT * FROM "teaches";

INSERT INTO requires (main_course,prerequisite)
VALUES
  (837827, 837850),
  (837919, 837896),
  (837850, 837827),
  (837873, 837919),
  (837919, 837873);
SELECT * FROM "requires";
