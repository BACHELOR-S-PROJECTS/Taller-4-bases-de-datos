/* Dropping tables for testing */

DROP SEQUENCE IF EXISTS "student_id_seq" CASCADE;
DROP TABLE IF EXISTS "student" CASCADE;
DROP TABLE IF EXISTS "instructor" CASCADE;
DROP SEQUENCE IF EXISTS "course_id_seq" CASCADE;
DROP TABLE IF EXISTS "course" CASCADE;
DROP TABLE IF EXISTS "course_offering" CASCADE;
DROP TABLE IF EXISTS "enrols" CASCADE;
DROP TABLE IF EXISTS "teaches" CASCADE;
DROP TABLE IF EXISTS "requires" CASCADE;
 

/* Table Student */
CREATE SEQUENCE student_id_seq
INCREMENT 168
START 7488;

CREATE TABLE student(
    student_id INT DEFAULT nextval('student_id_seq'),
    name varchar(50) NOT NULL,
    program varchar(50) NOT NULL,
    PRIMARY KEY(student_id)
);

/* Table instructor */
CREATE TABLE instructor(
    instructor_id INT,
    name varchar(50) NOT NULL,
    dept varchar(50) NOT NULL,
    title varchar(50) NOT NULL,
    PRIMARY KEY(instructor_id)
);

/* Table course_id */

CREATE SEQUENCE course_id_seq
INCREMENT 23
START 837827;

CREATE TABLE course(
    course_id INT DEFAULT nextval('course_id_seq'),
    title varchar(50) NOT NULL,
    syllabus varchar(50) NOT NULL,
    credits INT NOT NULL,
    PRIMARY KEY(course_id)
);

/* Table course_offering */
CREATE TABLE course_offering(
    course_id INT,
    sec_id serial,
    year date,
    semester INT,
    time time NOT NULL,
    classroom varchar(50) NOT NULL,
    CONSTRAINT "FK_course_offering.course_id"
      FOREIGN KEY (course_id)
        REFERENCES course(course_id),
    PRIMARY KEY(course_id, sec_id , year, semester)
);


/* Table enrols */
CREATE TABLE enrols(
    student_id INT,
    course_id INT,
    sec_id serial,
    semester INT,
    year date,
    grade NUMERIC(3,2) NOT NULL CHECK (grade>1 AND grade<5),
    CONSTRAINT "FK_enrols.student_id"
      FOREIGN KEY (student_id)
        REFERENCES student(student_id),
    CONSTRAINT "FK_enrols_offering.course_id"
      FOREIGN KEY (course_id)
        REFERENCES course(course_id),
    PRIMARY KEY(student_id,course_id, sec_id , semester,year)
);

/* Table teaches */
CREATE TABLE teaches(
    course_id INT,
    sec_id serial,
    semester INT,
    year date,
    instructor_id INT,
    CONSTRAINT "FK_teaches.course_id"
      FOREIGN KEY (course_id)
        REFERENCES course(course_id),
    CONSTRAINT "FK_teaches.instructor_id"
      FOREIGN KEY (instructor_id)
        REFERENCES instructor(instructor_id),
    PRIMARY KEY(course_id,sec_id, semester , year,instructor_id)
);

/* Table requires */
CREATE TABLE requires(
    main_course INT,
    prerequisite INT,
    CONSTRAINT "FK_requires.main_course"
      FOREIGN KEY (main_course)
        REFERENCES course(course_id),
    CONSTRAINT "FK_requires.prerequisite"
      FOREIGN KEY (prerequisite)
        REFERENCES course(course_id),
    PRIMARY KEY(main_course,prerequisite)
);


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
  (837827, '2022-01-08',7,'11:53 PM','240B'),
  (837850,'2022-01-02',2,'4:58 PM','240c'),
  (837873,'2022-01-10',7,'11:11 AM','240a'),
  (837896,'2022-01-10',6,'12:01 AM','240Bx'),
  (837919, '2022-01-03',3,'4:23 PM','240Bd');

SELECT * FROM "course_offering";

INSERT INTO enrols (student_id,course_id,semester,year,grade)
VALUES
  (7488,837827,7,'2022-01-10', 4.23),
  (7656, 837850,2,'2022-01-10',4.56),
  (7824,837873 ,7,'2022-01-10',2.9),
  (7992,837896 ,6,'2022-01-10',3.23),
  (8160, 837919,3,'2022-01-10',1.19);

SELECT * FROM "enrols";
 
INSERT INTO teaches (course_id,semester,year,instructor_id)
VALUES
  (837827,7,'2022-01-10',8813011),
  (837850,2,'2022-01-10',3707630),
  (837873,7,'2022-01-10',1169176),
  (837896,6,'2022-01-10',3772342),
  (837919,3,'2022-01-10',0974263);

SELECT * FROM "teaches";

INSERT INTO requires (main_course,prerequisite)
VALUES
  (837827, 837850),
  (837919, 837896),
  /*(837827, 837850),ERROR: duplicate key value violates unique constraint "requires_pkey" DETAIL: Key (main_course, prerequisite)=(837827, 837850) already exists.*/
  (837850, 837827),
  (837873, 837919),
  (837919, 837873);
SELECT * FROM "requires";
