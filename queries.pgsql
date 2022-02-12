--actividad 3.3.a
--Encuentre el dept, title de los instructores registrados en la base de datos.
SELECT dept, title FROM instructor;

--actividad 3.3.b
--Indique el nombre y programa del estudiante con student_id = 7656
SELECT name, program FROM student WHERE student.student_id = 7656;

--actividad 3.3.c
--Encuentre los nombres de todos los estudiantes que se han matriculado en el curso con course_id = 837873
SELECT name FROM student s INNER JOIN enrols e ON s.student_id = e.student_id WHERE course_id = 837873;

--actividad 3.3.d
--Cree una vista llamada better_students que presente los estudiantes que obtuvieron las notas más altas por cada semestre entre los años 1900 y 2018
SELECT name, grade, semester, year FROM
(SELECT e.student_id, e.grade, e.semester, e.year FROM
(SELECT max(grade) AS grade1, semester, year
FROM student s INNER JOIN enrols e ON s.student_id = e.student_id
WHERE year >= 1900 AND year <= 2018
GROUP by semester,year)
AS a LEFT JOIN enrols e ON (a.year = e.year AND a.grade1 = e.grade AND a.semester = e.semester))
AS best_student_id
INNER JOIN student AS s ON (best_student_id.student_id = s.student_id);


