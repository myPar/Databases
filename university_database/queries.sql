--- get specializaiton info of the specified teacher:

SELECT teacher_id, teacher_name, teacher_surname, scientific_title,
       subject_name, subject_type, TeachersSpecialization.id AS specialization_id
FROM
((
    (
    (TeachersSpecialization INNER JOIN
        (SELECT Teachers.id, Teachers.teacher_name, Teachers.teacher_surname, Teachers.scientific_title FROM Teachers WHERE Teachers.id = [enter the teacher id:]) AS teachers_f
    ON TeachersSpecialization.teacher_id = teachers_f.id)

    INNER JOIN TimetableSubjects

    ON TimetableSubjects.id = TeachersSpecialization.timetable_subject_id
    )
    INNER JOIN (SELECT Subjects.id, Subjects.subject_name FROM Subjects) AS subjects_f
    ON subjects_f.id = TimetableSubjects.subject_id
)
INNER JOIN SubjectTypes 
ON SubjectTypes.id = TimetableSubjects.subject_type_id);

--- get teachers specialization info:

SELECT TeachersSpecialization.id, Teachers.teacher_name, Teachers.teacher_surname, Subjects.subject_name, SubjectTypes.subject_type FROM 

(((TeachersSpecialization INNER JOIN Teachers 
ON Teachers.id = TeachersSpecialization.teacher_id)
INNER JOIN TimetableSubjects ON TimetableSubjects.id = TeachersSpecialization.timetable_subject_id)
INNER JOIN SubjectTypes ON SubjectTypes.id = TimetableSubjects.subject_type_id)
INNER JOIN Subjects ON Subjects.id = TimetableSubjects.subject_id

--- get specified teacher workload:

SELECT teacher_data.teacher_name, teacher_data.teacher_surname, teacher_data.teacher_pathronimic, COUNT(*) AS teacher_workload FROM
((SELECT Teachers.id, Teachers.teacher_name, Teachers.teacher_surname, Teachers.teacher_pathronimic FROM Teachers
WHERE Teachers.id = [enter the teacher id:]) AS teacher_data

INNER JOIN TeachersSpecialization ON TeachersSpecialization.teacher_id = teacher_data.id)
INNER JOIN (SELECT * FROM Timetable WHERE Timetable.semester = [enter the semester number:]) AS semester_timetable
ON TeachersSpecialization.id = semester_timetable.subject_data_id

GROUP BY teacher_data.teacher_name, teacher_data.teacher_surname, teacher_data.teacher_pathronimic

--- get group lessons count in the most free day:

--first subquery (name = 'get_group_week_workload')
SELECT group_lessons.group_number, group_lessons.day_value, COUNT(*) AS day_workload
FROM (SELECT t.group_number, WeekDays.day_value 
FROM (SELECT * FROM Timetable WHERE Timetable.group_number = [enter the group number:] 
AND Timetable.semester = [enter the semester number:])  
AS t INNER JOIN WeekDays ON WeekDays.day_id = t.day_number)  AS group_lessons
GROUP BY day_value, group_number;

--second subquery
SELECT TOP 1 * FROM
(SELECT * FROM get_group_week_workload
WHERE day_workload = (SELECT MIN(get_group_week_workload.day_workload) FROM get_group_week_workload))

--count of teacher's students
SELECT teacher.teacher_surname, teacher.teacher_name, teacher.teacher_pathronimic, COUNT(*) AS students_count FROM
((
(SELECT Teachers.id, Teachers.teacher_name, Teachers.teacher_surname, Teachers.teacher_pathronimic 
FROM Teachers WHERE Teachers.id = [enter the teacher id:]) AS teacher
INNER JOIN TeachersSpecialization ON TeachersSpecialization.teacher_id = teacher.id)
INNER JOIN Timetable ON Timetable.subject_data_id = TeachersSpecialization.id)
INNER JOIN Students ON Students.student_group = Timetable.group_number
GROUP BY teacher.teacher_name, teacher.teacher_surname, teacher_pathronimic
