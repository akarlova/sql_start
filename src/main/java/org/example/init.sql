CREATE TABLE homework
(
    id          BIGSERIAL   NOT NULL PRIMARY KEY,
    name        VARCHAR(30) NOT NULL,
    description VARCHAR(100)
);

CREATE TABLE lesson
(
    id          BIGSERIAL   NOT NULL PRIMARY KEY,
    name        VARCHAR(20) NOT NULL,
    updatedAt   TIMESTAMP   NOT NULL,
    homework_id BIGINT      NOT NULL UNIQUE,
    CONSTRAINT fk_homework
        FOREIGN KEY (homework_id)
            REFERENCES Homework (id)
);

CREATE TABLE schedule
(
    id        BIGSERIAL   NOT NULL PRIMARY KEY,
    name      VARCHAR(20) NOT NULL,
    updatedAt TIMESTAMP   NOT NULL
);

CREATE TABLE schedule_of_lessons
(
    lesson_id   BIGINT NOT NULL,
    schedule_id BIGINT NOT NULL,
    PRIMARY KEY (lesson_id, schedule_id),
    CONSTRAINT fk_lesson
        FOREIGN KEY (lesson_id)
            REFERENCES lesson (id)
            ON DELETE CASCADE,
    CONSTRAINT fk_schedule
        FOREIGN KEY (schedule_id)
            REFERENCES schedule (id)
            ON DELETE CASCADE
);