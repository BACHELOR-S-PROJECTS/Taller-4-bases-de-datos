--actividad 3.3.a
SELECT dept, title FROM instructor;

--actividad 3.3.b
SELECT name, program FROM student WHERE student.student_id = 7656;

--actividad 3.3.c
SELECT name from student s INNER JOIN enrols e on s.student_id = e.student_id where course_id = 837837;

--actividad 3.3.d
SELECT name, grade, semester, year FROM
(SELECT e.student_id, e.grade, e.semester, e.year from
(SELECT max(grade) as grade1, semester, year
from student s INNER JOIN enrols e on s.student_id = e.student_id
where year >= 1900 and year <= 2018
GROUP by semester,year) as a LEFT join enrols e on (a.year = e.year and a.grade1 = e.grade and a.semester = e.semester))
as best_student_id
INNER join student as s on (best_student_id.student_id = s.student_id);


