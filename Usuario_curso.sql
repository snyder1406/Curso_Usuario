CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "last_name" varchar(100) NOT NULL,
  "email" varchar(150) NOT NULL,
  "password" varchar(30) NOT NULL,
  "age" integer NOT null,
  "rol" integer
);

CREATE TABLE "courses" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar(150) UNIQUE NOT NULL,
  "description" text NOT NULL,
  "level" varchar(30) NOT NULL,
  "teacher" uuid,
  "duration_time" decimal(4,2) NOT NULL
);

CREATE TABLE "course_videos" (
  "id" SERIAL PRIMARY KEY,
  "id_curso" integer,
  "title" varchar(150) NOT NULL,
  "URL" text UNIQUE NOT NULL,
  "duration_time" decimal(4,2) NOT NULL,
  "creation_date" date NOT NULL,
  "is_completed" boolean NOT NULL DEFAULT false
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(60) UNIQUE NOT NULL
);

CREATE TABLE "roles" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(60) UNIQUE NOT NULL
);

CREATE TABLE "users_courses" (
  "id_user" uuid,
  "id_course" integer,
  "percent_complete" decimal(2,2) NOT NULL,
  "review" text NOT NULL
);

CREATE TABLE "course_categories" (
  "id_course" integer,
  "id_categories" integer
);

ALTER TABLE "users" ADD FOREIGN KEY ("rol") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher") REFERENCES "users" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("id_categories") REFERENCES "categories" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("id_curso") REFERENCES "courses" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id");


-- isert data roles
insert into roles (name) values 
('Teacher'),
('Student');

-- isert data users
insert into users  (id, "name", last_name, email, "password", age, rol) values
('cbf08c6c-f6f7-4b2a-ab29-80d3dabae7af', 'Javier', 'C', 'v.pseudo.11@gmail.com', '12345', 21, 2),
('b784a9ff-94c5-4747-a89d-e14e34edbd1d', 'María', 'Gómez', 'mariagomez1@gmail.com', '5683', 22, 2),
('60c83384-5843-40b8-9079-f3e01c5a66c7', 'Cristina', 'M', 'cristina.c@gmail.com', '1128', 25, 1),
('0a560d65-d8a7-477d-993b-9ede46b94eec', 'Diego', 'G', 'diego.j.g@gmail.com', 'pseudo11', 19, 1),
('57d5069f-6a06-4d8b-aebd-1c59fe62b76e', 'Erika', 'López', 'erika.lopez@gmail.com', 'lopez5683', 23, 2),
('0bc30c90-56bc-405e-9b0f-c3944c5993f1', 'Nadia', 'White', 'nadia.11.w@gmail.com', 'nadia56', 24, 1);

--insert data categories
insert into categories ("name") values 
('Programming'),
('ui ux design'),
('English'),
('Espanish'),
('databases');

-- insert data courses
insert into courses (title, description, "level", teacher, duration_time) values 
('introduction to databases', 'introduction to databases related to postgre SQL', 'easy', '60c83384-5843-40b8-9079-f3e01c5a66c7', 10.30),
('web interface design', 'Introduction to web interface design with ui and ux', 'intermediate', '0a560d65-d8a7-477d-993b-9ede46b94eec', 15.30),
('database programming', 'advanced relational database programming', 'advanced', '0bc30c90-56bc-405e-9b0f-c3944c5993f1', 30.30);

--insert data course_categories
insert into course_categories values 
(1, 3),
(1, 5),
(2, 2),
(2, 4),
(3, 1),
(3, 4),
(3, 5);

--insert data course_videos
insert into course_videos (id_curso, title, "URL", duration_time, creation_date, is_completed) values
(1, 'clase 2', 'https://curso1/clase2/url123.com', 30.30, '2022/09/22', true),
(1, 'clase 3', 'https://curso1/clase3/url123.com', 30.30, '2022/09/22', true),
(1, 'clase 4', 'https://curso1/clase4/url123.com', 30.30, '2022/09/22', false),
(1, 'clase 5', 'https://curso1/clase5/url123.com', 30.30, '2022/09/22', false),
(1, 'clase 6', 'https://curso1/clase6/url123.com', 30.30, '2022/09/22', false),
(2, 'clase 1', 'https://curso2/clase1/url123.com', 30.30, '2022/09/22', true),
(2, 'clase 2', 'https://curso2/clase2/url123.com', 30.30, '2022/09/22', false),
(2, 'clase 3', 'https://curso2/clase3/url123.com', 30.30, '2022/09/22', false),
(2, 'clase 4', 'https://curso2/clase4/url123.com', 30.30, '2022/09/22', false),
(3, 'clase 1', 'https://curso3/clase1/url123.com', 30.30, '2022/09/22', false),
(3, 'clase 2', 'https://curso3/clase2/url123.com', 30.30, '2022/09/22', false),
(3, 'clase 3', 'https://curso3/clase3/url123.com', 30.30, '2022/09/22', false);


--insert data users_courses
insert into users_courses (id_user, id_course, percent_complete, review) values
('cbf08c6c-f6f7-4b2a-ab29-80d3dabae7af', 1, 0.15, 'very good'),
('cbf08c6c-f6f7-4b2a-ab29-80d3dabae7af', 2, 0.20, 'very good'),
('cbf08c6c-f6f7-4b2a-ab29-80d3dabae7af', 3, 0.25, 'very good'),
('b784a9ff-94c5-4747-a89d-e14e34edbd1d', 1, 0.15, 'very good'),
('b784a9ff-94c5-4747-a89d-e14e34edbd1d', 2, 0.10, 'very good'),
('b784a9ff-94c5-4747-a89d-e14e34edbd1d', 3, 0.10, 'very good'),
('57d5069f-6a06-4d8b-aebd-1c59fe62b76e', 1, 0.1, 'very good'),
('57d5069f-6a06-4d8b-aebd-1c59fe62b76e', 2, 0.15, 'very good'),
('57d5069f-6a06-4d8b-aebd-1c59fe62b76e', 3, 0.1, 'very good');

-- join
select title, description, "level", U."name" as name_user, last_name, Ca."name" as categorie from courses as C inner join users as U on C.teacher = U.id inner join course_categories as Cc on Cc.id_course = C.id join categories as Ca on Ca.id = Cc.id_categories;

select C.title as title_course, description, "level", CV.title as title_video, CV."URL", CV.duration_time, CV.creation_date, CV.is_completed  from courses as C join course_videos as CV on C.id = CV.id_curso; 