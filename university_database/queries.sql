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