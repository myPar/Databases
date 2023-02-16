---create sequence, by default: NOMAXVALUE (10^27), INCREMENT BY = 1, NOCYCLE
CREATE SEQUENCE teachers_id_seq
MINVALUE 3
ORDER

CREATE SEQUENCE students_id_seq
MINVALUE 6
ORDER

CREATE OR REPLACE 
TRIGGER teacher_id_incr_trigger
BEFORE INSERT ON teacher
FOR EACH ROW
BEGIN
    SELECT teachers_id_seq.NEXTVAL INTO :NEW.id FROM dual;
END;

CREATE OR REPLACE 
TRIGGER student_id_incr_trigger
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
    SELECT students_id_seq.NEXTVAL INTO :NEW.id FROM dual;
END;

CREATE OR REPLACE
TRIGGER check_insert_students
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM teacher WHERE :NEW.name = teacher.name 
    AND :NEW.last_name = teacher.last_name)
    THEN
        RAISE_APPLICATION_ERROR(-1, 'student can not be a teacher');
    END IF;
END;

CREATE OR REPLACE
TRIGGER cascade_delete_teacher
BEFORE DELETE ON teacher
FOR EACH ROW
BEGIN
    delete from st_teac WHERE st_teac.id_teac = :OLD.id;
END;
