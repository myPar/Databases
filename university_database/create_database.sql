CREATE TABLE Students
(
id COUNTER PRIMARY KEY,
student_name TEXT(50) NOT NULL,
student_surname TEXT(50) NOT NULL,
student_pathronimic TEXT(50),
student_group INT NOT NULL
);
ALTER TABLE Students ADD CONSTRAINT group_fk FOREIGN KEY (student_group)
REFERENCES Groups(group_number);
---

CREATE TABLE Groups
(
group_number INT PRIMARY KEY,
headman_id INT,
faculty_id INT NOT NULL,

CONSTRAINT faculty_id_fk FOREIGN KEY (faculty_id) REFERENCES Faculties(id)
);

ALTER TABLE Groups ADD CONSTRAINT headman_fk FOREIGN KEY (headman_id)
REFERENCES Students(id);
---

CREATE TABLE Faculties
(
id COUNTER PRIMARY KEY,
faculty_name TEXT(100) NOT NULL,
faculty_description LONGTEXT
);
---

CREATE TABLE Subjects
(
id COUNTER PRIMARY KEY,
subject_name TEXT(50) NOT NULL,
subject_description LONGTEXT
);
---

CREATE TABLE TimetableSubjects
(
id COUNTER PRIMARY KEY,
subject_id INT NOT NULL,
subject_type_id INT NOT NULL,

CONSTRAINT subject_id_fk FOREIGN KEY (subject_id) REFERENCES Subjects(id),
CONSTRAINT subject_type_id_fk FOREIGN KEY (subject_type_id) REFERENCES SubjectTypes(id)
);
---

CREATE TABLE SubjectTypes
(
id COUNTER PRIMARY KEY,
subject_type TEXT(25) NOT NULL
);
---

CREATE TABLE Teachers
(
id COUNTER PRIMARY KEY,
teacher_name TEXT(25) NOT NULL,
teacher_surname TEXT(25) NOT NULL,
teacher_pathronimic TEXT(25),
scientific_title TEXT(50)
);
---

CREATE TABLE TeachersSpecialization
(
id COUNTER PRIMARY KEY,
teacher_id INT NOT NULL,
timetable_subject_id INT NOT NULL,

CONSTRAINT teacher_id_fk FOREIGN KEY (teacher_id) REFERENCES Teachers(id),
CONSTRAINT timetable_subject_id_fk FOREIGN KEY (timetable_subject_id) REFERENCES TimetableSubjects(id)
);
---

CREATE TABLE Classrooms
(
id COUNTER PRIMARY KEY,
class_name TEXT(25) NOT NULL,
class_description LONGTEXT
);
---

CREATE TABLE Timetable
(
id COUNTER PRIMARY KEY,
semester BIT NOT NULL,
lesson_number BYTE NOT NULL,
day_number BYTE NOT NULL,
classroom_id INT NOT NULL,
group_number INT NOT NULL,
subject_data_id INT NOT NULL,

CONSTRAINT classroom_id_fk FOREIGN KEY (classroom_id) REFERENCES Classrooms(id),
CONSTRAINT group_number_fk FOREIGN KEY (group_number) REFERENCES Groups(group_number),
CONSTRAINT subject_data_id_fk FOREIGN KEY (subject_data_id) REFERENCES TeachersSpecialization(id)
);

---

CREATE TABLE Grades
(
id COUNTER PRIMARY KEY,
students_id INT NOT NULL,
subject_id INT NOT NULL,
grade BYTE,

CONSTRAINT students_id_fk2 FOREIGN KEY (students_id) REFERENCES Students(id),
CONSTRAINT subject_id_fk2 FOREIGN KEY (subject_id) REFERENCES Subjects(id)
);

CREATE TABLE TeachersPhones
(
id COUNTER PRIMARY KEY,
teacher_id INT NOT NULL,
phonen_number TEXT(30) NOT NULL,

CONSTRAINT teacher_id_fk_phones FOREIGN KEY (teacher_id) REFERENCES Teachers(id)
);

CREATE TABLE Workplaces
(
id COUNTER PRIMARY KEY,
place_name TEXT(25) NOT NULL,
place_description TEXT(150)
);