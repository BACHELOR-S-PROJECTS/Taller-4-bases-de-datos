--Pto 4
--Cree uno o varios disparadores (triggers) que implemente los siguiente requerimientos para la relación enrolls 

--4.a.i - Al agregar una tupla en enrolls, en caso de que la nota sea negativa, cero (0.0) o mayor de 5.00 se debe generar una excepción indicando que el valor a guardar en grade es incorrecto o invalido.
DROP TRIGGER grade_check ON enrols;

CREATE OR REPLACE FUNCTION grade_check() 
    RETURNS TRIGGER AS $grade_check$
BEGIN
    IF NEW.grade <= 0 OR NEW.grade > 5.0 THEN
        RAISE EXCEPTION 'El valor de grade % es incorrecto o invalido ',NEW.grade;
    END IF;
END;
  $grade_check$ LANGUAGE plpgsql;

CREATE TRIGGER grade_check BEFORE INSERT ON enrols
    FOR EACH ROW 
        EXECUTE PROCEDURE grade_check(); 
--Test
INSERT INTO enrols (student_id,course_id,semester,year,grade)
VALUES
  (7488,837827,1,1937, 6);
  
--4.a.ii - Durante la actualización de un registro si el valor grade es modificado, usando RAISE NOTICE se debe presentar un mensaje indicando el cambio, si es igual al valor grade en la tabla se debe indicar que el valor no ha sido modificado. Si el grade a actualizar es negativo, cero o mayor de cinco use RAISE EXCEPTION.


--4.b