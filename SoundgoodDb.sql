CREATE TABLE email (
 email_id INT GENERATED ALWAYS AS IDENTITY,
 email_adress VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (email_id);


CREATE TABLE ensemble (
 ensemble_id INT GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(50) UNIQUE NOT NULL,
 min_number_students INT NOT NULL,
 max_number_students INT NOT NULL,
 genre VARCHAR(50) NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (ensemble_id);


CREATE TABLE ensemble_lesson (
 ensemble_lesson_id INT GENERATED ALWAYS AS IDENTITY,
 ensemble_id INT NOT NULL,
 start_time TIMESTAMP NOT NULL,
 end_time TIMESTAMP NOT NULL,
 min_number_students INT NOT NULL,
 max_number_students INT NOT NULL
);

ALTER TABLE ensemble_lesson ADD CONSTRAINT PK_ensemble_lesson PRIMARY KEY (ensemble_lesson_id);


CREATE TABLE instructor_pay_scale (
 instructor_pay_scale_id INT GENERATED ALWAYS AS IDENTITY,
 lesson_type VARCHAR(50) NOT NULL,
 beginner NUMERIC(10,2) NOT NULL,
 intermediate NUMERIC(10,2) NOT NULL,
 advanced NUMERIC(10,2) NOT NULL,
 extra NUMERIC(10,2) NOT NULL
);

ALTER TABLE instructor_pay_scale ADD CONSTRAINT PK_instructor_pay_scale PRIMARY KEY (instructor_pay_scale_id);


CREATE TABLE instrument_type (
 instrument_type_id INT GENERATED ALWAYS AS IDENTITY,
 type_of_instrument VARCHAR(50) UNIQUE NOT NULL,
 category VARCHAR(50)
);

ALTER TABLE instrument_type ADD CONSTRAINT PK_instrument_type PRIMARY KEY (instrument_type_id);


CREATE TABLE person (
 person_id INT GENERATED ALWAYS AS IDENTITY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 personal_identity_number VARCHAR(12) UNIQUE,
 birth_date DATE,
 street VARCHAR(100),
 postal_code VARCHAR(5),
 city VARCHAR(50)
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (person_id);


CREATE TABLE person_email (
 person_id INT NOT NULL,
 email_id INT NOT NULL
);

ALTER TABLE person_email ADD CONSTRAINT PK_person_email PRIMARY KEY (person_id,email_id);


CREATE TABLE price_rate (
 price_rate_id INT GENERATED ALWAYS AS IDENTITY,
 lesson_type VARCHAR(50) UNIQUE NOT NULL,
 beginner NUMERIC(10,2) NOT NULL,
 intermediate NUMERIC(10,2) NOT NULL,
 advanced NUMERIC(10,2) NOT NULL,
 extra NUMERIC(10,2) NOT NULL,
 sibling_discount NUMERIC(10,2) NOT NULL
);

ALTER TABLE price_rate ADD CONSTRAINT PK_price_rate PRIMARY KEY (price_rate_id);


CREATE TABLE rental_instrument (
 rental_instrument_id INT GENERATED ALWAYS AS IDENTITY,
 rental_rate NUMERIC(10,2),
 instrument_serial_number VARCHAR(30) UNIQUE NOT NULL,
 brand VARCHAR(50),
 instrument_type_id INT NOT NULL,
 available VARCHAR(20)
);

ALTER TABLE rental_instrument ADD CONSTRAINT PK_rental_instrument PRIMARY KEY (rental_instrument_id);


CREATE TABLE student (
 student_id INT GENERATED ALWAYS AS IDENTITY,
 person_id INT NOT NULL,
 student_id_number VARCHAR(20) UNIQUE NOT NULL,
 max_rentals INT DEFAULT 2 NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE telephone (
 telephone_id INT GENERATED ALWAYS AS IDENTITY,
 phone_number VARCHAR(15) UNIQUE NOT NULL
);

ALTER TABLE telephone ADD CONSTRAINT PK_telephone PRIMARY KEY (telephone_id);


CREATE TABLE application (
 application_id INT GENERATED ALWAYS AS IDENTITY,
 skill_level VARCHAR(20) NOT NULL,
 keep_application CHAR(10),
 status VARCHAR(20) NOT NULL,
 instrument_type_id INT NOT NULL,
 ensemble_id INT,
 student_id INT NOT NULL
);

ALTER TABLE application ADD CONSTRAINT PK_application PRIMARY KEY (application_id);


CREATE TABLE audition (
 application_id INT NOT NULL,
 status VARCHAR(20)
);

ALTER TABLE audition ADD CONSTRAINT PK_audition PRIMARY KEY (application_id);


CREATE TABLE enesemble_student (
 student_id INT NOT NULL,
 ensemble_id INT NOT NULL
);

ALTER TABLE enesemble_student ADD CONSTRAINT PK_enesemble_student PRIMARY KEY (student_id,ensemble_id);


CREATE TABLE ensemble_lesson_attendance (
 ensemble_lesson_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE ensemble_lesson_attendance ADD CONSTRAINT PK_ensemble_lesson_attendance PRIMARY KEY (ensemble_lesson_id,student_id);


CREATE TABLE ensemble_lesson_booked_students (
 student_id INT NOT NULL,
 ensemble_lesson_id INT NOT NULL
);

ALTER TABLE ensemble_lesson_booked_students ADD CONSTRAINT PK_ensemble_lesson_booked_students PRIMARY KEY (student_id,ensemble_lesson_id);


CREATE TABLE instructor (
 instructor_id INT GENERATED ALWAYS AS IDENTITY,
 person_id INT NOT NULL,
 employe_id VARCHAR(20) UNIQUE NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE parent (
 student_id INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE parent ADD CONSTRAINT PK_parent PRIMARY KEY (student_id,person_id);


CREATE TABLE person_telephone (
 telephone_id INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE person_telephone ADD CONSTRAINT PK_person_telephone PRIMARY KEY (telephone_id,person_id);


CREATE TABLE rentals (
 student_id INT NOT NULL,
 rental_instrument_id INT NOT NULL,
 lease_start TIMESTAMP NOT NULL,
 lease_expiration TIMESTAMP NOT NULL,
 rental_status VARCHAR(20) NOT NULL
);

ALTER TABLE rentals ADD CONSTRAINT PK_rentals PRIMARY KEY (student_id,rental_instrument_id,lease_start);


CREATE TABLE siblings (
 student_id INT NOT NULL,
 sibling_id INT NOT NULL
);

ALTER TABLE siblings ADD CONSTRAINT PK_siblings PRIMARY KEY (student_id,sibling_id);


CREATE TABLE availible_time_for_teaching (
 instructor_id INT NOT NULL,
 start_time TIMESTAMP NOT NULL,
 end_time TIMESTAMP NOT NULL
);

ALTER TABLE availible_time_for_teaching ADD CONSTRAINT PK_availible_time_for_teaching PRIMARY KEY (instructor_id,start_time);


CREATE TABLE ensemble_instructor (
 instructor_id INT NOT NULL,
 ensemble_id INT NOT NULL
);

ALTER TABLE ensemble_instructor ADD CONSTRAINT PK_ensemble_instructor PRIMARY KEY (instructor_id,ensemble_id);


CREATE TABLE ensemble_lesson_instructor (
 instructor_id INT NOT NULL,
 ensemble_lesson_id INT NOT NULL
);

ALTER TABLE ensemble_lesson_instructor ADD CONSTRAINT PK_ensemble_lesson_instructor PRIMARY KEY (instructor_id,ensemble_lesson_id);


CREATE TABLE group_lesson (
 group_lesson_id INT GENERATED ALWAYS AS IDENTITY,
 skill_level VARCHAR(20) NOT NULL,
 min_number_students INT NOT NULL,
 max_number_students INT NOT NULL,
 start_time TIMESTAMP NOT NULL,
 end_time TIMESTAMP NOT NULL,
 instructor_id INT NOT NULL,
 instrument_type_id INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (group_lesson_id);


CREATE TABLE group_lesson_attendance (
 group_lesson_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE group_lesson_attendance ADD CONSTRAINT PK_group_lesson_attendance PRIMARY KEY (group_lesson_id,student_id);


CREATE TABLE group_lesson_booked_students (
 group_lesson_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE group_lesson_booked_students ADD CONSTRAINT PK_group_lesson_booked_students PRIMARY KEY (group_lesson_id,student_id);


CREATE TABLE induvidual_lesson (
 individual_lesson_id INT GENERATED ALWAYS AS IDENTITY,
 skill_level VARCHAR(20),
 start_time TIMESTAMP NOT NULL,
 end_time TIMESTAMP NOT NULL,
 instructor_id INT NOT NULL,
 student_id INT NOT NULL,
 instrument_type_id INT NOT NULL
);

ALTER TABLE induvidual_lesson ADD CONSTRAINT PK_induvidual_lesson PRIMARY KEY (individual_lesson_id);


ALTER TABLE ensemble_lesson ADD CONSTRAINT FK_ensemble_lesson_0 FOREIGN KEY (ensemble_id) REFERENCES ensemble (ensemble_id);


ALTER TABLE person_email ADD CONSTRAINT FK_person_email_0 FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE CASCADE;
ALTER TABLE person_email ADD CONSTRAINT FK_person_email_1 FOREIGN KEY (email_id) REFERENCES email (email_id) ON DELETE CASCADE;


ALTER TABLE rental_instrument ADD CONSTRAINT FK_rental_instrument_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE application ADD CONSTRAINT FK_application_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);
ALTER TABLE application ADD CONSTRAINT FK_application_1 FOREIGN KEY (ensemble_id) REFERENCES ensemble (ensemble_id);
ALTER TABLE application ADD CONSTRAINT FK_application_2 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE audition ADD CONSTRAINT FK_audition_0 FOREIGN KEY (application_id) REFERENCES application (application_id) ON DELETE CASCADE;


ALTER TABLE enesemble_student ADD CONSTRAINT FK_enesemble_student_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE enesemble_student ADD CONSTRAINT FK_enesemble_student_1 FOREIGN KEY (ensemble_id) REFERENCES ensemble (ensemble_id);


ALTER TABLE ensemble_lesson_attendance ADD CONSTRAINT FK_ensemble_lesson_attendance_0 FOREIGN KEY (ensemble_lesson_id) REFERENCES ensemble_lesson (ensemble_lesson_id);
ALTER TABLE ensemble_lesson_attendance ADD CONSTRAINT FK_ensemble_lesson_attendance_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE ensemble_lesson_booked_students ADD CONSTRAINT FK_ensemble_lesson_booked_students_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE ensemble_lesson_booked_students ADD CONSTRAINT FK_ensemble_lesson_booked_students_1 FOREIGN KEY (ensemble_lesson_id) REFERENCES ensemble_lesson (ensemble_lesson_id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE parent ADD CONSTRAINT FK_parent_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE parent ADD CONSTRAINT FK_parent_1 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE person_telephone ADD CONSTRAINT FK_person_telephone_0 FOREIGN KEY (telephone_id) REFERENCES telephone (telephone_id) ON DELETE CASCADE;
ALTER TABLE person_telephone ADD CONSTRAINT FK_person_telephone_1 FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE CASCADE;


ALTER TABLE rentals ADD CONSTRAINT FK_rentals_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE rentals ADD CONSTRAINT FK_rentals_1 FOREIGN KEY (rental_instrument_id) REFERENCES rental_instrument (rental_instrument_id);


ALTER TABLE siblings ADD CONSTRAINT FK_siblings_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE siblings ADD CONSTRAINT FK_siblings_1 FOREIGN KEY (sibling_id) REFERENCES student (student_id);


ALTER TABLE availible_time_for_teaching ADD CONSTRAINT FK_availible_time_for_teaching_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE;


ALTER TABLE ensemble_instructor ADD CONSTRAINT FK_ensemble_instructor_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE ensemble_instructor ADD CONSTRAINT FK_ensemble_instructor_1 FOREIGN KEY (ensemble_id) REFERENCES ensemble (ensemble_id);


ALTER TABLE ensemble_lesson_instructor ADD CONSTRAINT FK_ensemble_lesson_instructor_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE ensemble_lesson_instructor ADD CONSTRAINT FK_ensemble_lesson_instructor_1 FOREIGN KEY (ensemble_lesson_id) REFERENCES ensemble_lesson (ensemble_lesson_id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);


ALTER TABLE group_lesson_attendance ADD CONSTRAINT FK_group_lesson_attendance_0 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (group_lesson_id);
ALTER TABLE group_lesson_attendance ADD CONSTRAINT FK_group_lesson_attendance_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE group_lesson_booked_students ADD CONSTRAINT FK_group_lesson_booked_students_0 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (group_lesson_id);
ALTER TABLE group_lesson_booked_students ADD CONSTRAINT FK_group_lesson_booked_students_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE induvidual_lesson ADD CONSTRAINT FK_induvidual_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE induvidual_lesson ADD CONSTRAINT FK_induvidual_lesson_1 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE induvidual_lesson ADD CONSTRAINT FK_induvidual_lesson_2 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);


