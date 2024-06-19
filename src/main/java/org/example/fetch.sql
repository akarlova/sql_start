SELECT *
FROM homework;

SELECT *
FROM lesson
JOIN homework ON lesson.homework_id = homework.id;

SELECT *
FROM lesson
JOIN homework ON lesson.homework_id = homework.id
ORDER BY Lesson.updatedAT;

SELECT schedule.*, lesson.*
FROM schedule
JOIN schedule_of_lessons ON schedule.id = schedule_of_lessons.schedule_id
JOIN lesson ON schedule_of_lessons.lesson_id = lesson.id;

SELECT schedule.id, schedule.name, COUNT(schedule_of_lessons.lesson_id) AS lessons_count
FROM schedule
LEFT JOIN schedule_of_lessons ON schedule.id = schedule_of_lessons.schedule_id
GROUP BY schedule.id, schedule.name
ORDER BY schedule.id;