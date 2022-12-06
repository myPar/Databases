--- create database
CREATE TABLE Teachers
(
    id INT,
    teacher_name VARCHAR2(20) NOT NULL,
    teacher_surname VARCHAR2(20) NOT NULL,
    teacher_pathronimic VARCHAR2(20) NOT NULL,
    teacher_phone VARCHAR2(20) NOT NULL,
    CONSTRAINT check_phone CHECK (REGEXP_LIKE(teacher_phone, '8-[0-9]{3}-[0-9]{3}-[0-9]{2}-[0-9]{2}')),
    CONSTRAINT check_t_id PRIMARY KEY (id)
);

CREATE TABLE Subjects
(
    id INT,
    subject_name VARCHAR2(20) NOT NULL,
    CONSTRAINT check_s_id PRIMARY KEY (id)
);

CREATE TABLE Lessons
(
    id INT,
    lesson_type VARCHAR2(20) NOT NULL,
    subject_id INT,
    teacher_id INT,
    CONSTRAINT check_l_id PRIMARY KEY (id),
    CONSTRAINT check_subj_fk FOREIGN KEY (subject_id) REFERENCES Subjects(id),
    CONSTRAINT check_tech_fk FOREIGN KEY (teacher_id) REFERENCES Teachers(id)
);

--- fill database

INSERT INTO Teachers (id, teacher_name, teacher_surname, teacher_pathronimic, teacher_phone) 
VALUES(1, 'Pavel', 'Fedorov', 'Sergeevich', '8-352-999-99-92')
INSERT INTO Teachers (id, teacher_name, teacher_surname, teacher_pathronimic, teacher_phone) 
VALUES(2, 'Vladimir', 'Odenko', 'Anatolievich', '8-302-432-01-10')
INSERT INTO Teachers (id, teacher_name, teacher_surname, teacher_pathronimic, teacher_phone)
VALUES(3, 'Petr', 'Mezuyskiy', 'Andreevich', '8-320-307-88-00')
INSERT INTO Teachers (id, teacher_name, teacher_surname, teacher_pathronimic, teacher_phone)
 VALUES(4, 'Andrey', 'Demidov', 'Alexandrovich', '8-352-450-95-75')
INSERT INTO Teachers (id, teacher_name, teacher_surname, teacher_pathronimic, teacher_phone)
 VALUES(5, 'Maxim', 'Kemirskiy', 'Valerievich', '8-302-777-11-30')


INSERT INTO Subjects (id, subject_name) VALUES (1, 'Calculus')
INSERT INTO Subjects (id, subject_name) VALUES (2, 'Linear Algebra')
INSERT INTO Subjects (id, subject_name) VALUES (3, 'Programming')
INSERT INTO Subjects (id, subject_name) VALUES (4, 'Phisics')
INSERT INTO Subjects (id, subject_name) VALUES (5, 'Philosophy')

INSERT INTO Lessons (id, lesson_type, subject_id, teacher_id) VALUES(1, 'lect', 1, 1)
INSERT INTO Lessons (id, lesson_type, subject_id, teacher_id) VALUES(2, 'sem', 2, 2)
INSERT INTO Lessons (id, lesson_type, subject_id, teacher_id) VALUES(3, 'lab', 3, 3)
INSERT INTO Lessons (id, lesson_type, subject_id, teacher_id) VALUES(4, 'sem', 4, 4)
INSERT INTO Lessons (id, lesson_type, subject_id, teacher_id) VALUES(5, 'lect', 5, 5)

UPDATE Teachers SET teacher_phone = '8-913-905-01-01'
WHERE Teachers.id = 3

UPDATE Subjects SET id = 10, subject_name = 'Databases'
WHERE Subjects.id = 5

ALTER TABLE Teachers add degree VARCHAR2(20) DEFAULT ''

DROP TABLE Teachers