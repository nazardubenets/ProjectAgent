-- SQL Manager 2011 Lite for PostgreSQL 5.0.0.3
-- ---------------------------------------
-- Хост         : localhost
-- База данных  : EventsWall
-- Версия       : PostgreSQL 9.1.1, compiled by Visual C++ build 1500, 64-bit



SET check_function_bodies = false;
--
-- Definition for sequence category_sequence (OID = 169284) : 
--
SET search_path = public, pg_catalog;
CREATE SEQUENCE public.category_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table category (OID = 169286) : 
--
CREATE TABLE public.category (
    id bigint DEFAULT nextval('category_sequence'::regclass) NOT NULL,
    parent_id bigint,
    name_id bigint
) WITHOUT OIDS;
--
-- Definition for sequence event_sequence (OID = 169290) : 
--
CREATE SEQUENCE public.event_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table event_attendee (OID = 169299) : 
--
CREATE TABLE public.event_attendee (
    event_id bigint NOT NULL,
    user_id bigint NOT NULL,
    index integer NOT NULL
) WITHOUT OIDS;
--
-- Structure for table event_trainers (OID = 169302) : 
--
CREATE TABLE public.event_trainers (
    event_id bigint NOT NULL,
    user_id bigint NOT NULL,
    index integer NOT NULL
) WITHOUT OIDS;
--
-- Definition for sequence hibernate_sequence (OID = 169305) : 
--
CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence role_sequence (OID = 169307) : 
--
CREATE SEQUENCE public.role_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table roles (OID = 169309) : 
--
CREATE TABLE public.roles (
    id bigint DEFAULT nextval('role_sequence'::regclass) NOT NULL,
    name varchar NOT NULL,
    manage_category boolean NOT NULL,
    manage_event boolean NOT NULL,
    manage_invite boolean
) WITHOUT OIDS;
--
-- Definition for sequence user_sequence (OID = 169316) : 
--
CREATE SEQUENCE public.user_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table users (OID = 169318) : 
--
CREATE TABLE public.users (
    id bigint DEFAULT nextval('user_sequence'::regclass) NOT NULL,
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    level varchar(10) NOT NULL,
    login varchar(50) NOT NULL,
    last_update_time timestamp without time zone,
    role_id integer
) WITHOUT OIDS;
--
-- Structure for table mail_template (OID = 169322) : 
--
CREATE TABLE public.mail_template (
    id bigint NOT NULL,
    description varchar(255) NOT NULL,
    code varchar(255) NOT NULL,
    subject varchar(255) NOT NULL,
    body varchar(500) NOT NULL,
    variables varchar(500)
) WITHOUT OIDS;
--
-- Definition for sequence attachment_sequence (OID = 169328) : 
--
CREATE SEQUENCE public.attachment_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence mail_template_sequence (OID = 169330) : 
--
CREATE SEQUENCE public.mail_template_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table invite (OID = 169332) : 
--
CREATE TABLE public.invite (
    id bigint NOT NULL,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    event_id bigint NOT NULL,
    room_id bigint NOT NULL,
    uuid varchar(255)
) WITHOUT OIDS;
--
-- Structure for table invite_user (OID = 169335) : 
--
CREATE TABLE public.invite_user (
    id bigint NOT NULL,
    invite_id bigint NOT NULL,
    role_id bigint NOT NULL,
    user_id bigint NOT NULL,
    status bigint,
    uuid varchar(255)
) WITHOUT OIDS;
--
-- Structure for table room (OID = 169338) : 
--
CREATE TABLE public.room (
    id bigint NOT NULL,
    capacity integer,
    email varchar(255),
    name varchar(255),
    last_update_time timestamp without time zone
) WITHOUT OIDS;
--
-- Definition for sequence invite_sequence (OID = 169344) : 
--
CREATE SEQUENCE public.invite_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence invite_user_sequence (OID = 169346) : 
--
CREATE SEQUENCE public.invite_user_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence room_sequence (OID = 169348) : 
--
CREATE SEQUENCE public.room_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table setting (OID = 169350) : 
--
CREATE TABLE public.setting (
    id bigint NOT NULL,
    description varchar(255),
    label varchar(255),
    value varchar(255)
) WITHOUT OIDS;
--
-- Structure for table calendar (OID = 169356) : 
--
CREATE TABLE public.calendar (
    id bigint NOT NULL,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    status integer,
    user_id bigint,
    room_id bigint
) WITHOUT OIDS;
--
-- Definition for sequence calendar_sequence (OID = 169359) : 
--
CREATE SEQUENCE public.calendar_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table events_status_log (OID = 169361) : 
--
CREATE TABLE public.events_status_log (
    id bigint NOT NULL,
    date timestamp without time zone NOT NULL,
    event_id bigint,
    status_id bigint
) WITHOUT OIDS;
--
-- Structure for table pending_events (OID = 169364) : 
--
CREATE TABLE public.pending_events (
    uuid varchar(255) NOT NULL,
    guid varchar(255) NOT NULL,
    event_id bigint NOT NULL,
    id bigint NOT NULL
) WITHOUT OIDS;
--
-- Definition for sequence events_status_log_sequense (OID = 169370) : 
--
CREATE SEQUENCE public.events_status_log_sequense
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence language_sequence (OID = 169372) : 
--
CREATE SEQUENCE public.language_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence translation_sequence (OID = 169374) : 
--
CREATE SEQUENCE public.translation_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence translations_sequence (OID = 169376) : 
--
CREATE SEQUENCE public.translations_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence translations_seq (OID = 169378) : 
--
CREATE SEQUENCE public.translations_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table attachments (OID = 169380) : 
--
CREATE TABLE public.attachments (
    id bigint NOT NULL,
    file_name varchar(255) NOT NULL,
    size bigint NOT NULL,
    title varchar(255) NOT NULL,
    file_type varchar(255) NOT NULL,
    date timestamp without time zone NOT NULL,
    description_id bigint
) WITHOUT OIDS;
--
-- Structure for table events_attachments (OID = 169386) : 
--
CREATE TABLE public.events_attachments (
    event_id bigint NOT NULL,
    attachment_id bigint NOT NULL,
    index integer NOT NULL
) WITHOUT OIDS;
--
-- Structure for table language (OID = 169389) : 
--
CREATE TABLE public.language (
    id bigint NOT NULL,
    name varchar(255),
    required boolean,
    locale_language varchar,
    is_default boolean
) WITHOUT OIDS;
--
-- Structure for table translation (OID = 169395) : 
--
CREATE TABLE public.translation (
    id bigint NOT NULL,
    value varchar,
    language_id bigint,
    translations_id bigint
) WITHOUT OIDS;
--
-- Structure for table translations (OID = 169401) : 
--
CREATE TABLE public.translations (
    id bigint NOT NULL
) WITHOUT OIDS;
--
-- Definition for sequence pending_events_sequence (OID = 169407) : 
--
CREATE SEQUENCE public.pending_events_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table event (OID = 174673) : 
--
CREATE TABLE public.event (
    id bigint NOT NULL,
    attendee_number integer,
    create_date timestamp without time zone,
    duration integer,
    important boolean,
    keyword varchar(255),
    logo bytea,
    max_attendee integer,
    min_attendee integer,
    modified_date timestamp without time zone,
    qualifications_max_level varchar(255),
    qualifications_min_level varchar(255),
    status bigint,
    assistant_id bigint NOT NULL,
    category_id bigint NOT NULL,
    descriptionlong_id bigint,
    descriptionshort_id bigint,
    title_id bigint
) WITHOUT OIDS;
--
-- Data for table public.category (OID = 169286) (LIMIT 0,4)
--
INSERT INTO category (id, parent_id, name_id)
VALUES (1, NULL, 1);

INSERT INTO category (id, parent_id, name_id)
VALUES (2, 1, 536);

INSERT INTO category (id, parent_id, name_id)
VALUES (3, 1, 540);

INSERT INTO category (id, parent_id, name_id)
VALUES (4, 2, 544);

--
-- Data for table public.event_attendee (OID = 169299) (LIMIT 0,3)
--
INSERT INTO event_attendee (event_id, user_id, index)
VALUES (23, 19, 0);

INSERT INTO event_attendee (event_id, user_id, index)
VALUES (11, 19, 0);

INSERT INTO event_attendee (event_id, user_id, index)
VALUES (12, 19, 0);

--
-- Data for table public.event_trainers (OID = 169302) (LIMIT 0,4)
--
INSERT INTO event_trainers (event_id, user_id, index)
VALUES (23, 12, 0);

INSERT INTO event_trainers (event_id, user_id, index)
VALUES (23, 14, 1);

INSERT INTO event_trainers (event_id, user_id, index)
VALUES (11, 12, 0);

INSERT INTO event_trainers (event_id, user_id, index)
VALUES (12, 12, 0);

--
-- Data for table public.roles (OID = 169309) (LIMIT 0,4)
--
INSERT INTO roles (id, name, manage_category, manage_event, manage_invite)
VALUES (1, 'ATTENDEE', false, false, false);

INSERT INTO roles (id, name, manage_category, manage_event, manage_invite)
VALUES (2, 'TRAINER', false, true, true);

INSERT INTO roles (id, name, manage_category, manage_event, manage_invite)
VALUES (3, 'ADMIN', true, true, true);

INSERT INTO roles (id, name, manage_category, manage_event, manage_invite)
VALUES (4, 'ASSISTANT', true, true, true);

--
-- Data for table public.users (OID = 169318) (LIMIT 0,14)
--
INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (5, 'Roman', 'Chukh', 'd1', 'Roman_Chukh@epam.com', '2012-06-26 15:45:03.909', 1);

INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (11, 'Bohdan', 'Laba', 'd1', 'Bohdan_Laba@epam.com', '2012-06-22 10:35:01.097', 1);

INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (13, 'Nazar', 'Barabash', 'd3', 'Nazar_Barabash@epam.com', '2012-05-19 00:00:00', 2);

INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (8, 'Orest ', 'Gavur', 'd3', 'Orest_Gavur@epam.com', '2012-06-26 15:45:04.696', 2);

INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (9, 'Roman', 'Lysenko', 'd4', 'Roman_Lysenko@epam.com', '2012-06-26 15:45:03.149', 2);

INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (16, 'Volodymyr', 'Stashchenko', 'd1', 'Volodymyr_Stashchenko@epam.com', '2012-06-22 10:34:57.874', 1);

INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (15, 'Volodymyr', 'Verhun', 'd3', 'Volodymyr_Verhun@epam.com', '2012-06-22 10:34:56.116', 2);

INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (20, 'Yuriy', 'Luchkiv', 'd1', 'yurii_luchkiv@epam.com', '2012-05-19 00:00:00', 1);

INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (14, 'Volodymyr', 'Fedorchuk', 'd3', 'Volodymyr_Fedorchuk@epam.com', '2012-07-16 16:27:41.32', 2);

INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (7, 'Iaroslav', 'Vasyliuk', 'd1', 'Iaroslav_Vasyliuk@epam.com', '2012-07-16 16:27:43.537', 1);

INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (10, 'Vitaliy', 'Strykel', 'd1', 'Vitaliy_Strykel@epam.com', '2012-07-14 12:25:52.025', 4);

INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (12, 'Bogdan', 'Cherchyk', 'd1', 'Bogdan_Cherchyk@epam.com', '2012-07-23 14:15:59.733', 2);

INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (19, 'Danylo', 'Smirnov', 'D5', 'Danylo_Smirnov@epam.com', '2012-07-23 14:16:00.644', 1);

INSERT INTO users (id, first_name, last_name, level, login, last_update_time, role_id)
VALUES (6, 'Viacheslav', 'Sendel', 'd1', 'Viacheslav_Sendel@epam.com', '2012-07-14 08:50:28.095', 4);

--
-- Data for table public.mail_template (OID = 169322) (LIMIT 0,8)
--
INSERT INTO mail_template (id, description, code, subject, body, variables)
VALUES (1, 'Approve new training notification', 'APPROVE_NEW_TRAINING', 'New trainings for approval', 'Dear Admin!
There are new trainings to be approved: 
%BEGIN_EVENT% 
%TR_TITLE%
%TR_DESCRIPTION%

In order to approve it please click at: %TR_APPROVE_LINK%
%END_EVENT%

In order to approve all of these events:
%TR_APPROVE_ALL_LINK%', '%TR_TITLE% - Training title
%TR_DESCRIPTION% - Training description
%TR_DETAILS_LINK% - Training preview link
%TR_APPROVE_LINK% - Training approve link
%TR_APPROVE_ALL_LINK% - Approve all trainings link');

INSERT INTO mail_template (id, description, code, subject, body, variables)
VALUES (4, 'Meeting info', 'MEETING_INFO', 'Meeting information', 'Hello! 

There is a new meeting waiting for acceptance: 

%TR_TITLE% 

%TR_DESCRIPTION%

You can preview it at: %TR_DETAILS_LINK%', '%TR_TITLE% - Training title
%TR_DESCRIPTION% - Training description
%TR_DETAILS_LINK% - Training preview link');

INSERT INTO mail_template (id, description, code, subject, body, variables)
VALUES (5, 'Trainer accept letter', 'TRAINER_ACCEPT_TEMPLATE', 'Trainer letter', 'Hello! 

You are considered to be a trainer in event: 
%TR_TITLE% 

%TR_DESCRIPTION%

You can preview it at: %TR_DETAILS_LINK%', '%TR_TITLE% - Training title
%TR_DESCRIPTION% - Training description
%TR_DETAILS_LINK% - Training preview link');

INSERT INTO mail_template (id, description, code, subject, body, variables)
VALUES (2, 'Assign new training', 'ASSIGN_NEW_TRAINING', 'New training for assign: %TR_TITLE%', 'Hello! 

There is a new training is waiting for assign: %TR_TITLE% %TR_DESCRIPTION%

You can preview it at: %TR_DETAILS_LINK%

In order to assign it please click at: %TR_ASSIGN_LINK%', '%TR_TITLE% - Training title
%TR_DESCRIPTION% - Training description
%TR_DETAILS_LINK% - Training preview link
%TR_ASSIGN_LINK% - Training assign link');

INSERT INTO mail_template (id, description, code, subject, body, variables)
VALUES (3, 'Meeting appointment', 'ACCEPT_NEW_MEETING', 'New meeting request: %TR_TITLE%', 'Hello! 
There is a new meeting waiting for acceptance: 
%TR_TITLE%

 %TR_DESCRIPTION%

You can preview it at: %TR_DETAILS_LINK%


In order to accept it please click at: %TR_ACCEPT_LINK%


In order to decline it click at: %TR_DECLINE_LINK%', '%TR_TITLE% - Training title
%TR_DESCRIPTION% - Training description
%TR_DETAILS_LINK% - Training preview link
%TR_ACCEPT_LINK% - Training accept link
%TR_DECLINE_LINK% - Training decline link');

INSERT INTO mail_template (id, description, code, subject, body, variables)
VALUES (6, 'Assistant accept letter', 'ASSISTANT_ACCEPT_TEMPLATE', 'Assistant letter', 'Hello! 
You are considered to be an assistant in event: 
Title: %TR_TITLE%
Description: %TR_DESCRIPTION%
You can preview it at: %TR_DETAILS_LINK%', '%TR_TITLE% - Training title
%TR_DESCRIPTION% - Training description
%TR_DETAILS_LINK% - Training preview link');

INSERT INTO mail_template (id, description, code, subject, body, variables)
VALUES (7, 'Assistant about aproove letter', 'ASSISTANT_ABOUT_APPROVE_TEMPLATE', 'Assistant letter', 'Hello, assistant! 
Your event was aproved by admin:  
Title: %TR_TITLE%
Description: %TR_DESCRIPTION%
You can preview it at: %TR_DETAILS_LINK%', '%TR_TITLE% - Training title
%TR_DESCRIPTION% - Training description
%TR_DETAILS_LINK% - Training preview link');

INSERT INTO mail_template (id, description, code, subject, body, variables)
VALUES (8, 'Trainer about aproove letter', 'TRAINER_ABOUT_APPROVE_TEMPLATE', 'Trainer letter', 'Hello, trainer! 
Your event was aproved by admin:  
Title: %TR_TITLE%
Description: %TR_DESCRIPTION%
You can preview it at: %TR_DETAILS_LINK%', '%TR_TITLE% - Training title
%TR_DESCRIPTION% - Training description
%TR_DETAILS_LINK% - Training preview link');

--
-- Data for table public.room (OID = 169338) (LIMIT 0,11)
--
INSERT INTO room (id, capacity, email, name, last_update_time)
VALUES (11, 8, 'RFM_LvivOS45White@epam.com', 'White', '2012-07-23 14:15:38.546');

INSERT INTO room (id, capacity, email, name, last_update_time)
VALUES (1, 20, 'rfmloss45r@epam.com', 'Red', '2012-07-23 14:15:40.69');

INSERT INTO room (id, capacity, email, name, last_update_time)
VALUES (3, 15, 'rfmloss45g@epam.com', 'Green', '2012-07-23 14:15:42.094');

INSERT INTO room (id, capacity, email, name, last_update_time)
VALUES (2, 15, 'rfmloss45@epam.com', 'Blue', '2012-07-23 14:15:43.987');

INSERT INTO room (id, capacity, email, name, last_update_time)
VALUES (4, 10, 'RFM_LVI_OS45_Silver@epam.com', 'Silver', '2012-07-23 14:15:47.026');

INSERT INTO room (id, capacity, email, name, last_update_time)
VALUES (5, 10, 'RLOS45G@epam.com', 'Golden', '2012-07-23 14:15:52.003');

INSERT INTO room (id, capacity, email, name, last_update_time)
VALUES (6, 8, 'RFM_LvivOS45Black@epam.com', 'Black', '2012-07-23 14:15:53.914');

INSERT INTO room (id, capacity, email, name, last_update_time)
VALUES (7, 8, 'RFM_LVI_OS45_Bronze@epam.com', 'Bronze', '2012-07-23 14:15:54.859');

INSERT INTO room (id, capacity, email, name, last_update_time)
VALUES (9, 25, 'RFT_LvivOS45TC@epam.com', 'Training Center', '2012-07-23 14:15:55.465');

INSERT INTO room (id, capacity, email, name, last_update_time)
VALUES (10, 15, 'RFM_LvivOS45Violet@epam.com', 'Violet', '2012-07-23 14:15:56.284');

INSERT INTO room (id, capacity, email, name, last_update_time)
VALUES (12, 10, 'rfmloss45y@epam.com', 'Yellow', '2012-07-23 14:15:58.345');

--
-- Data for table public.setting (OID = 169350) (LIMIT 0,24)
--
INSERT INTO setting (id, description, label, value)
VALUES (2, 'SMTP Domain', 'smtp.domain', '"owabud.epam.com"');

INSERT INTO setting (id, description, label, value)
VALUES (3, 'SMTP Login', 'smtp.login', '"Auto_EPM-TRL_mailer@epam.com"');

INSERT INTO setting (id, description, label, value)
VALUES (5, 'Attachment limit(in Mb)', 'attachment.file.maxsize', '"50"');

INSERT INTO setting (id, description, label, value)
VALUES (7, 'Attachment shared folder', 'attachment.shared.folder', '"d:/attachments"');

INSERT INTO setting (id, description, label, value)
VALUES (8, 'Attachment root url', 'attachment.root.url', '"http://10.25.9.33/Development/EventsWall/"');

INSERT INTO setting (id, description, label, value)
VALUES (11, 'Search fields', 'search.fields', '["EVENT_TITLE","EVENT_SHORT_DESC"]');

INSERT INTO setting (id, description, label, value)
VALUES (12, 'Maximum time delay for notification in hours', 'max.time.delay.for.notification', '1');

INSERT INTO setting (id, description, label, value)
VALUES (14, 'Temporary folder', 'temporary.folder', '"d:/temp"');

INSERT INTO setting (id, description, label, value)
VALUES (18, 'Exchange server url', 'exchange.server.url', '"https://owabud.epam.com/ews/exchange.asmx"');

INSERT INTO setting (id, description, label, value)
VALUES (19, 'Outlook info update period', 'outlook.info.update.period', '60');

INSERT INTO setting (id, description, label, value)
VALUES (21, 'Application time zone', 'application.time.zone', '3');

INSERT INTO setting (id, description, label, value)
VALUES (22, 'Mail time zone', 'mail.time.zone', '"Europe/Kiev"');

INSERT INTO setting (id, description, label, value)
VALUES (6, 'Attachment file types', 'attachment.file.types', '["doc","docx","ppt","pptx","jpg"]');

INSERT INTO setting (id, description, label, value)
VALUES (1, 'Administration Email', 'admin.email', '"Vitaliy_Strykel@epam.com"');

INSERT INTO setting (id, description, label, value)
VALUES (4, 'SMTP Password', 'smtp.password', '"Aetm20120523"');

INSERT INTO setting (id, description, label, value)
VALUES (10, 'Main app url', 'main.app.url', '"http://10.25.9.14:8080/eventswall/"');

INSERT INTO setting (id, description, label, value)
VALUES (17, 'Training end time', 'end.training.time', '64800000');

INSERT INTO setting (id, description, label, value)
VALUES (234, NULL, 'tree.expand.level', '1');

INSERT INTO setting (id, description, label, value)
VALUES (16, 'Training start time', 'start.training.time', '-10800000');

INSERT INTO setting (id, description, label, value)
VALUES (20, 'Frequency update outlook info in minutes', 'frequency.update.Outlook', '3');

INSERT INTO setting (id, description, label, value)
VALUES (15, 'Mail cron expression', 'mail.cron.expression', '"0 34 16 1/1 * ? *"');

INSERT INTO setting (id, description, label, value)
VALUES (680, NULL, 'clear.temp.dir.cron.expression', '"0 0 22 1/1 * ? *"');

INSERT INTO setting (id, description, label, value)
VALUES (13, 'Min events for notification', 'min.events.for.notification', '1');

INSERT INTO setting (id, description, label, value)
VALUES (9, 'Static resources url', 'static.resources.url', '"http://10.25.9.33/Development/EventsWall/"');

--
-- Data for table public.events_status_log (OID = 169361) (LIMIT 0,20)
--
INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (21, '2012-07-11 17:14:48.426', 23, 1);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (1, '2012-07-12 17:44:00.955', 23, 4);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (2, '2012-07-20 15:00:38.876', 11, 1);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (3, '2012-07-20 15:01:39.44', 11, 4);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (4, '2012-07-24 10:18:02.909', 12, 1);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (5, '2012-07-24 16:31:00.14', 12, 2);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (6, '2012-07-24 16:35:52.656', 12, 3);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (7, '2012-07-24 16:36:09.576', 12, 4);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (8, '2012-07-24 16:52:10.948', 12, 2);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (9, '2012-07-24 16:52:32.751', 12, 3);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (10, '2012-07-24 16:52:43.146', 12, 4);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (11, '2012-07-24 16:58:00.783', 12, 2);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (12, '2012-07-24 16:58:08.952', 12, 3);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (13, '2012-07-24 16:58:19.083', 12, 4);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (14, '2012-07-24 17:05:11.903', 12, 2);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (15, '2012-07-24 17:05:23.42', 12, 3);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (16, '2012-07-24 17:05:29.668', 12, 4);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (17, '2012-07-24 17:20:23.354', 12, 2);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (18, '2012-07-24 17:20:41.23', 12, 3);

INSERT INTO events_status_log (id, date, event_id, status_id)
VALUES (19, '2012-07-24 17:20:47.497', 12, 4);

--
-- Data for table public.language (OID = 169389) (LIMIT 0,3)
--
INSERT INTO language (id, name, required, locale_language, is_default)
VALUES (1, 'English', true, 'EN', true);

INSERT INTO language (id, name, required, locale_language, is_default)
VALUES (2, 'Ukrainian', false, 'UA', false);

INSERT INTO language (id, name, required, locale_language, is_default)
VALUES (3, 'Russian', false, 'RU', false);

--
-- Data for table public.translation (OID = 169395) (LIMIT 0,498)
--
INSERT INTO translation (id, value, language_id, translations_id)
VALUES (1, 'Categories', 1, 1);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (2, 'Категорії', 2, 1);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (3, 'Категории', 3, 1);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (223, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 222);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (224, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 222);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (225, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 222);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (227, 'Перша iнтернаціоналізована подія', 2, 226);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (228, 'Первое интернационализированное собітие', 3, 226);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (229, 'First multilingual eventFirst multilingual event', 1, 226);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (231, 'Перша iнтернаціоналізована подія', 2, 230);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (232, 'Первое интернационализированное собітие', 3, 230);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (233, 'First multilingual event', 1, 230);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (5, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 4);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (6, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 4);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (9, 'Перша iнтернаціоналізована подія', 2, 8);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (10, 'Первое интернационализированное собітие', 3, 8);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (166, 'Перша iнтернаціоналізована подія', 2, 164);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (167, 'First multilingual eventFirst multilingual event', 1, 164);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (169, 'Первое интернационализированное собітие', 3, 168);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (170, 'Перша iнтернаціоналізована подія', 2, 168);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (171, 'First multilingual event', 1, 168);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (209, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 208);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (210, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 208);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (219, 'Первое интернационализированное собітие', 3, 216);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (7, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 4);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (11, 'First multilingual eventFirst multilingual event', 1, 8);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (13, 'Перша iнтернаціоналізована подія', 2, 12);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (14, 'Первое интернационализированное собітие', 3, 12);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (15, 'First multilingual event', 1, 12);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (17, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 16);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (18, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 16);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (19, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 16);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (21, 'Перша iнтернаціоналізована подія', 2, 20);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (22, 'Первое интернационализированное собітие', 3, 20);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (23, 'First multilingual eventFirst multilingual event', 1, 20);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (25, 'Перша iнтернаціоналізована подія', 2, 24);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (26, 'Первое интернационализированное собітие', 3, 24);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (27, 'First multilingual event', 1, 24);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (29, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 28);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (173, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 172);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (174, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 172);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (175, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 172);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (177, 'Перша iнтернаціоналізована подія', 2, 176);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (178, 'Первое интернационализированное собітие', 3, 176);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (179, 'First multilingual eventFirst multilingual event', 1, 176);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (181, 'Перша iнтернаціоналізована подія', 2, 180);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (182, 'Первое интернационализированное собітие', 3, 180);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (183, 'First multilingual event', 1, 180);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (261, 'First multilingual eventFirst multilingual event', 1, 260);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (262, 'Перша iнтернаціоналізована подія', 2, 260);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (30, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 28);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (31, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 28);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (33, 'Перша iнтернаціоналізована подія', 2, 32);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (34, 'Первое интернационализированное собітие', 3, 32);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (35, 'First multilingual eventFirst multilingual event', 1, 32);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (37, 'Перша iнтернаціоналізована подія', 2, 36);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (38, 'Первое интернационализированное собітие', 3, 36);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (39, 'First multilingual event', 1, 36);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (41, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 40);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (43, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 40);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (45, 'Первое интернационализированное собітие', 3, 44);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (46, 'Перша iнтернаціоналізована подія', 2, 44);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (47, 'First multilingual eventFirst multilingual event', 1, 44);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (49, 'Первое интернационализированное собітие', 3, 48);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (50, 'Перша iнтернаціоналізована подія', 2, 48);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (51, 'First multilingual event', 1, 48);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (89, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 88);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (125, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 124);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (202, 'Перша iнтернаціоналізована подія', 2, 200);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (203, 'First multilingual eventFirst multilingual event', 1, 200);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (205, 'Первое интернационализированное собітие', 3, 204);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (206, 'Перша iнтернаціоналізована подія', 2, 204);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (207, 'First multilingual event', 1, 204);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (263, 'Первое интернационализированное собітие', 3, 260);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (266, 'Перша iнтернаціоналізована подія', 2, 264);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (267, 'Первое интернационализированное собітие', 3, 264);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (42, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 40);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (53, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 52);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (54, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 52);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (55, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 52);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (57, 'Первое интернационализированное собітие', 3, 56);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (58, 'Перша iнтернаціоналізована подія', 2, 56);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (59, 'First multilingual eventFirst multilingual event', 1, 56);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (61, 'Первое интернационализированное собітие', 3, 60);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (62, 'Перша iнтернаціоналізована подія', 2, 60);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (63, 'First multilingual event', 1, 60);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (65, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 64);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (113, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 112);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (114, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 112);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (115, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 112);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (117, 'Первое интернационализированное собітие', 3, 116);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (118, 'Перша iнтернаціоналізована подія', 2, 116);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (119, 'First multilingual eventFirst multilingual event', 1, 116);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (121, 'Первое интернационализированное собітие', 3, 120);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (122, 'Перша iнтернаціоналізована подія', 2, 120);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (123, 'First multilingual event', 1, 120);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (277, 'First multilingual event', 1, 276);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (278, 'Перша iнтернаціоналізована подія', 2, 276);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (66, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 64);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (67, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 64);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (69, 'Первое интернационализированное собітие', 3, 68);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (70, 'Перша iнтернаціоналізована подія', 2, 68);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (71, 'First multilingual eventFirst multilingual event', 1, 68);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (73, 'Первое интернационализированное собітие', 3, 72);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (74, 'Перша iнтернаціоналізована подія', 2, 72);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (75, 'First multilingual event', 1, 72);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (77, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 76);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (78, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 76);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (79, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 76);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (81, 'First multilingual eventFirst multilingual event', 1, 80);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (82, 'Первое интернационализированное собітие', 3, 80);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (83, 'Перша iнтернаціоналізована подія', 2, 80);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (85, 'First multilingual event', 1, 84);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (86, 'Первое интернационализированное собітие', 3, 84);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (87, 'Перша iнтернаціоналізована подія', 2, 84);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (269, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 268);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (270, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 268);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (271, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 268);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (273, 'First multilingual eventFirst multilingual event', 1, 272);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (274, 'Перша iнтернаціоналізована подія', 2, 272);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (275, 'Первое интернационализированное собітие', 3, 272);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (279, 'Первое интернационализированное собітие', 3, 276);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (375, 'First multilingual event', 1, 372);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (90, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 88);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (91, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 88);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (93, 'First multilingual eventFirst multilingual event', 1, 92);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (94, 'Перша iнтернаціоналізована подія', 2, 92);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (95, 'Первое интернационализированное собітие', 3, 92);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (97, 'First multilingual event', 1, 96);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (98, 'Перша iнтернаціоналізована подія', 2, 96);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (99, 'Первое интернационализированное собітие', 3, 96);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (101, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 100);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (102, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 100);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (103, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 100);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (105, 'First multilingual eventFirst multilingual event', 1, 104);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (106, 'Перша iнтернаціоналізована подія', 2, 104);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (107, 'Первое интернационализированное собітие', 3, 104);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (109, 'First multilingual event', 1, 108);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (110, 'Перша iнтернаціоналізована подія', 2, 108);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (111, 'Первое интернационализированное собітие', 3, 108);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (126, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 124);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (127, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 124);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (129, 'Первое интернационализированное собітие', 3, 128);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (130, 'First multilingual eventFirst multilingual event', 1, 128);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (131, 'Перша iнтернаціоналізована подія', 2, 128);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (133, 'Первое интернационализированное собітие', 3, 132);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (134, 'First multilingual event', 1, 132);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (135, 'Перша iнтернаціоналізована подія', 2, 132);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (137, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 136);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (138, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 136);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (139, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 136);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (141, 'Первое интернационализированное собітие', 3, 140);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (142, 'First multilingual eventFirst multilingual event', 1, 140);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (143, 'Перша iнтернаціоналізована подія', 2, 140);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (145, 'Первое интернационализированное собітие', 3, 144);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (146, 'First multilingual event', 1, 144);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (147, 'Перша iнтернаціоналізована подія', 2, 144);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (281, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 280);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (282, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 280);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (283, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 280);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (285, 'Первое интернационализированное собітие', 3, 284);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (286, 'Перша iнтернаціоналізована подія', 2, 284);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (287, 'First multilingual eventFirst multilingual event', 1, 284);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (289, 'Первое интернационализированное собітие', 3, 288);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (290, 'Перша iнтернаціоналізована подія', 2, 288);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (149, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 148);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (150, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 148);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (151, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 148);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (153, 'First multilingual eventFirst multilingual event', 1, 152);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (154, 'Первое интернационализированное собітие', 3, 152);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (155, 'Перша iнтернаціоналізована подія', 2, 152);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (157, 'First multilingual event', 1, 156);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (158, 'Первое интернационализированное собітие', 3, 156);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (159, 'Перша iнтернаціоналізована подія', 2, 156);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (291, 'First multilingual event', 1, 288);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (161, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 160);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (162, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 160);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (163, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 160);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (165, 'Первое интернационализированное собітие', 3, 164);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (185, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 184);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (186, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 184);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (187, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 184);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (189, 'Первое интернационализированное собітие', 3, 188);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (190, 'First multilingual eventFirst multilingual event', 1, 188);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (191, 'Перша iнтернаціоналізована подія', 2, 188);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (193, 'Первое интернационализированное собітие', 3, 192);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (194, 'First multilingual event', 1, 192);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (195, 'Перша iнтернаціоналізована подія', 2, 192);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (197, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 196);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (198, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 196);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (199, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 196);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (201, 'Первое интернационализированное собітие', 3, 200);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (293, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 292);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (294, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 292);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (295, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 292);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (297, 'Перша iнтернаціоналізована подія', 2, 296);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (298, 'Первое интернационализированное собітие', 3, 296);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (218, 'First multilingual event', 1, 216);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (211, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 208);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (213, 'Перша iнтернаціоналізована подія', 2, 212);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (214, 'First multilingual eventFirst multilingual event', 1, 212);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (215, 'Первое интернационализированное собітие', 3, 212);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (217, 'Перша iнтернаціоналізована подія', 2, 216);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (299, 'First multilingual eventFirst multilingual event', 1, 296);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (301, 'Перша iнтернаціоналізована подія', 2, 300);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (302, 'Первое интернационализированное собітие', 3, 300);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (303, 'First multilingual event', 1, 300);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (305, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 304);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (306, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 304);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (307, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 304);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (309, 'Первое интернационализированное собітие', 3, 308);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (310, 'First multilingual eventFirst multilingual event', 1, 308);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (311, 'Перша iнтернаціоналізована подія', 2, 308);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (313, 'Первое интернационализированное собітие', 3, 312);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (314, 'First multilingual event', 1, 312);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (315, 'Перша iнтернаціоналізована подія', 2, 312);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (317, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 316);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (321, 'Первое интернационализированное собітие', 3, 320);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (383, 'Первое интернационализированное собітие', 3, 380);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (385, 'Перша iнтернаціоналізована подія', 2, 384);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (386, 'First multilingual event', 1, 384);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (387, 'Первое интернационализированное собітие', 3, 384);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (389, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 388);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (390, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 388);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (391, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 388);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (245, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 244);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (246, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 244);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (247, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 244);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (249, 'First multilingual eventFirst multilingual event', 1, 248);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (250, 'Перша iнтернаціоналізована подія', 2, 248);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (251, 'Первое интернационализированное собітие', 3, 248);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (253, 'First multilingual event', 1, 252);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (254, 'Перша iнтернаціоналізована подія', 2, 252);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (255, 'Первое интернационализированное собітие', 3, 252);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (257, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 256);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (258, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 256);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (259, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 256);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (265, 'First multilingual event', 1, 264);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (318, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 316);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (319, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 316);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (322, 'First multilingual eventFirst multilingual event', 1, 320);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (323, 'Перша iнтернаціоналізована подія', 2, 320);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (325, 'Первое интернационализированное собітие', 3, 324);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (326, 'First multilingual event', 1, 324);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (327, 'Перша iнтернаціоналізована подія', 2, 324);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (329, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 328);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (330, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 328);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (331, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 328);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (333, 'Первое интернационализированное собітие', 3, 332);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (334, 'First multilingual eventFirst multilingual event', 1, 332);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (335, 'Перша iнтернаціоналізована подія', 2, 332);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (337, 'Первое интернационализированное собітие', 3, 336);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (338, 'First multilingual event', 1, 336);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (339, 'Перша iнтернаціоналізована подія', 2, 336);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (345, 'Перша iнтернаціоналізована подія', 2, 344);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (346, 'First multilingual eventFirst multilingual event', 1, 344);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (361, 'Первое интернационализированное собітие', 3, 360);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (362, 'Перша iнтернаціоналізована подія', 2, 360);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (363, 'First multilingual event', 1, 360);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (341, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 340);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (342, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 340);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (343, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 340);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (347, 'Первое интернационализированное собітие', 3, 344);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (349, 'Перша iнтернаціоналізована подія', 2, 348);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (350, 'First multilingual event', 1, 348);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (351, 'Первое интернационализированное собітие', 3, 348);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (353, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 352);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (354, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 352);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (355, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 352);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (357, 'Первое интернационализированное собітие', 3, 356);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (358, 'Перша iнтернаціоналізована подія', 2, 356);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (359, 'First multilingual eventFirst multilingual event', 1, 356);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (365, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 364);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (366, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 364);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (367, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 364);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (369, 'Первое интернационализированное собітие', 3, 368);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (370, 'Перша iнтернаціоналізована подія', 2, 368);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (371, 'First multilingual eventFirst multilingual event', 1, 368);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (373, 'Первое интернационализированное собітие', 3, 372);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (374, 'Перша iнтернаціоналізована подія', 2, 372);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (377, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 376);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (378, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 376);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (379, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 376);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (381, 'Перша iнтернаціоналізована подія', 2, 380);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (382, 'First multilingual eventFirst multilingual event', 1, 380);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (398, 'First multilingual event', 1, 396);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (393, 'Перша iнтернаціоналізована подія', 2, 392);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (394, 'First multilingual eventFirst multilingual event', 1, 392);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (395, 'Первое интернационализированное собітие', 3, 392);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (397, 'Перша iнтернаціоналізована подія', 2, 396);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (399, 'Первое интернационализированное собітие', 3, 396);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (401, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 400);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (402, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 400);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (403, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 400);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (405, 'Первое интернационализированное собітие', 3, 404);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (406, 'First multilingual eventFirst multilingual event', 1, 404);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (407, 'Перша iнтернаціоналізована подія', 2, 404);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (409, 'Первое интернационализированное собітие', 3, 408);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (410, 'First multilingual event', 1, 408);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (411, 'Перша iнтернаціоналізована подія', 2, 408);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (413, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 412);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (414, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 412);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (573, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 572);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (574, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 572);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (575, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 572);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (577, 'Перша iнтернаціоналізована подія', 2, 576);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (578, 'First multilingual eventFirst multilingual event', 1, 576);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (579, 'Первое интернационализированное собітие', 3, 576);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (581, 'Перша iнтернаціоналізована подія', 2, 580);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (583, 'Первое интернационализированное собітие', 3, 580);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (415, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 412);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (417, 'First multilingual eventFirst multilingual event', 1, 416);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (418, 'Перша iнтернаціоналізована подія', 2, 416);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (419, 'Первое интернационализированное собітие', 3, 416);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (421, 'First multilingual event', 1, 420);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (422, 'Перша iнтернаціоналізована подія', 2, 420);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (423, 'Первое интернационализированное собітие', 3, 420);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (425, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 424);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (426, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 424);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (427, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 424);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (429, 'Перша iнтернаціоналізована подія', 2, 428);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (430, 'First multilingual eventFirst multilingual event', 1, 428);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (431, 'Первое интернационализированное собітие', 3, 428);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (433, 'Перша iнтернаціоналізована подія', 2, 432);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (434, 'First multilingual event', 1, 432);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (435, 'Первое интернационализированное собітие', 3, 432);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (437, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 436);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (647, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font>', 2, 644);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (649, 'Первое интернационализированное собітие', 3, 648);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (650, 'First multilingual eventFirst multilingual event', 1, 648);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (651, 'Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія', 2, 648);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (653, 'Первое интернационализированное собітие', 3, 652);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (654, 'First multilingual event', 1, 652);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (655, 'Перша iнтернаціоналізована подія', 2, 652);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (438, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 436);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (439, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 436);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (441, 'Первое интернационализированное собітие', 3, 440);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (442, 'Перша iнтернаціоналізована подія', 2, 440);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (443, 'First multilingual eventFirst multilingual event', 1, 440);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (445, 'Первое интернационализированное собітие', 3, 444);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (446, 'Перша iнтернаціоналізована подія', 2, 444);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (447, 'First multilingual event', 1, 444);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (450, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 448);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (451, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 448);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (453, 'Перша iнтернаціоналізована подія', 2, 452);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (454, 'Первое интернационализированное собітие', 3, 452);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (455, 'First multilingual eventFirst multilingual event', 1, 452);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (457, 'Перша iнтернаціоналізована подія', 2, 456);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (458, 'Первое интернационализированное собітие', 3, 456);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (459, 'First multilingual event', 1, 456);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (497, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 496);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (498, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 496);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (501, 'Первое интернационализированное собітие', 3, 500);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (502, 'Перша iнтернаціоналізована подія', 2, 500);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (503, 'First multilingual eventFirst multilingual event', 1, 500);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (505, 'Первое интернационализированное собітие', 3, 504);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (506, 'Перша iнтернаціоналізована подія', 2, 504);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (507, 'First multilingual event', 1, 504);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (657, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2</font>', 2, 656);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (449, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 448);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (461, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 460);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (462, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 460);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (463, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 460);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (465, 'First multilingual eventFirst multilingual event', 1, 464);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (466, 'Первое интернационализированное собітие', 3, 464);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (467, 'Перша iнтернаціоналізована подія', 2, 464);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (469, 'First multilingual event', 1, 468);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (470, 'Первое интернационализированное собітие', 3, 468);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (471, 'Перша iнтернаціоналізована подія', 2, 468);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (473, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 472);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (474, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 472);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (526, 'First multilingual eventFirst multilingual event', 1, 524);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (527, 'Первое интернационализированное собітие', 3, 524);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (529, 'Перша iнтернаціоналізована подія', 2, 528);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (530, 'First multilingual event', 1, 528);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (531, 'Первое интернационализированное собітие', 3, 528);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (475, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 472);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (477, 'Первое интернационализированное собітие', 3, 476);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (478, 'First multilingual eventFirst multilingual event', 1, 476);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (479, 'Перша iнтернаціоналізована подія', 2, 476);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (481, 'Первое интернационализированное собітие', 3, 480);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (482, 'First multilingual event', 1, 480);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (483, 'Перша iнтернаціоналізована подія', 2, 480);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (485, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 484);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (486, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 484);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (487, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 484);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (489, 'Первое интернационализированное собітие', 3, 488);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (490, 'First multilingual eventFirst multilingual event', 1, 488);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (491, 'Перша iнтернаціоналізована подія', 2, 488);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (493, 'Первое интернационализированное собітие', 3, 492);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (494, 'First multilingual event', 1, 492);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (495, 'Перша iнтернаціоналізована подія', 2, 492);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (499, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 496);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (537, 'Java', 1, 536);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (538, 'Джава', 2, 536);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (539, 'Джава', 3, 536);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (541, 'PHP', 1, 540);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (542, 'ПХП', 2, 540);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (543, 'ПХП', 3, 540);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (545, 'Java EE ', 1, 544);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (546, 'Джава ЕЕ', 2, 544);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (547, 'Джава ЕЕ', 3, 544);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (550, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 548);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (509, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 508);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (510, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 508);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (511, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 508);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (513, 'First multilingual eventFirst multilingual event', 1, 512);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (514, 'Первое интернационализированное собітие', 3, 512);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (515, 'Перша iнтернаціоналізована подія', 2, 512);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (517, 'First multilingual event', 1, 516);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (518, 'Первое интернационализированное собітие', 3, 516);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (519, 'Перша iнтернаціоналізована подія', 2, 516);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (521, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 520);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (522, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 520);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (523, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 520);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (525, 'Перша iнтернаціоналізована подія', 2, 524);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (549, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 548);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (551, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 548);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (553, 'Перша iнтернаціоналізована подія', 2, 552);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (554, 'First multilingual eventFirst multilingual event', 1, 552);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (555, 'Первое интернационализированное собітие', 3, 552);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (557, 'Перша iнтернаціоналізована подія', 2, 556);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (558, 'First multilingual event', 1, 556);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (559, 'Первое интернационализированное собітие', 3, 556);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (561, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div><div><font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font></div>', 2, 560);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (562, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font></div><div><font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual event</font></div>', 1, 560);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (563, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div><div><font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітие</font></div>', 3, 560);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (565, 'Перша iнтернаціоналізована подія', 2, 564);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (566, 'First multilingual eventFirst multilingual event', 1, 564);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (567, 'Первое интернационализированное собітие', 3, 564);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (569, 'Перша iнтернаціоналізована подія', 2, 568);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (570, 'First multilingual event', 1, 568);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (571, 'Первое интернационализированное собітие', 3, 568);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (582, 'First multilingual event', 1, 580);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (633, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітие</font>', 3, 632);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (658, '<font face="Arial, Verdana" size="2">First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2</font>', 1, 656);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (670, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2</font>', 2, 668);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (634, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font>', 1, 632);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (635, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подіяПерша iнтернаціоналізована подія</font>', 2, 632);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (637, 'Первое интернационализированное собітие', 3, 636);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (638, 'First multilingual eventFirst multilingual event', 1, 636);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (639, 'Перша iнтернаціоналізована подіяПерша iнтернаціоналізована подія', 2, 636);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (641, 'Первое интернационализированное собітие', 3, 640);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (642, 'First multilingual event', 1, 640);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (643, 'Перша iнтернаціоналізована подія', 2, 640);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (645, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітиеПервое интернационализированное собітие</font>', 3, 644);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (646, '<font face="Arial, Verdana" size="2">First multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual eventFirst multilingual event</font>', 1, 644);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (662, 'First multilingual event2First multilingual event2', 1, 660);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (659, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2</font>', 3, 656);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (661, 'Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2', 2, 660);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (663, 'Первое интернационализированное собітие 2Первое интернационализированное собітие 2', 3, 660);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (665, 'Перша iнтернаціоналізована подія 2', 2, 664);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (666, 'First multilingual event2', 1, 664);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (667, 'Первое интернационализированное собітие 2', 3, 664);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (669, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2</font>', 3, 668);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (675, 'First multilingual event2First multilingual event2', 1, 672);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (671, '<font face="Arial, Verdana" size="2">First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2</font>', 1, 668);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (673, 'Первое интернационализированное собітие 2Первое интернационализированное собітие 2', 3, 672);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (674, 'Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2', 2, 672);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (677, 'Первое интернационализированное собітие 2', 3, 676);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (678, 'Перша iнтернаціоналізована подія 2', 2, 676);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (679, 'First multilingual event2', 1, 676);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (682, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2</font>', 2, 681);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (683, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2</font>', 3, 681);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (686, 'Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2', 2, 685);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (684, '<font face="Arial, Verdana" size="2">First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2</font>', 1, 681);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (687, 'Первое интернационализированное собітие 2Первое интернационализированное собітие 2', 3, 685);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (688, 'First multilingual event2First multilingual event2', 1, 685);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (690, 'Перша iнтернаціоналізована подія 2', 2, 689);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (691, 'Первое интернационализированное собітие 2', 3, 689);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (692, 'First multilingual event2', 1, 689);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (694, '<font face="Arial, Verdana" size="2">First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2</font>', 1, 693);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (695, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2</font>', 2, 693);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (698, 'First multilingual event2First multilingual event2', 1, 697);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (699, 'Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2', 2, 697);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (700, 'Первое интернационализированное собітие 2Первое интернационализированное собітие 2', 3, 697);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (702, 'First multilingual event2', 1, 701);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (703, 'Перша iнтернаціоналізована подія 2', 2, 701);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (704, 'Первое интернационализированное собітие 2', 3, 701);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (708, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2</font>', 2, 705);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (711, 'Первое интернационализированное собітие 2Первое интернационализированное собітие 2', 3, 709);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (712, 'Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2', 2, 709);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (715, 'Первое интернационализированное собітие 2', 3, 713);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (716, 'Перша iнтернаціоналізована подія 2', 2, 713);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (718, '<font face="Arial, Verdana" size="2">First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2</font>', 1, 717);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (696, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2</font>', 3, 693);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (706, '<font face="Arial, Verdana" size="2">First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2First multilingual event2</font>', 1, 705);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (707, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2</font>', 3, 705);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (710, 'First multilingual event2First multilingual event2', 1, 709);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (714, 'First multilingual event2', 1, 713);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (719, '<font face="Arial, Verdana" size="2">Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2</font>', 2, 717);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (720, '<font face="Arial, Verdana" size="2">Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2Первое интернационализированное собітие 2</font>', 3, 717);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (722, 'First multilingual event2First multilingual event2', 1, 721);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (723, 'Перша iнтернаціоналізована подія 2Перша iнтернаціоналізована подія 2', 2, 721);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (724, 'Первое интернационализированное собітие 2Первое интернационализированное собітие 2', 3, 721);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (726, 'First multilingual event2', 1, 725);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (727, 'Перша iнтернаціоналізована подія 2', 2, 725);

INSERT INTO translation (id, value, language_id, translations_id)
VALUES (728, 'Первое интернационализированное собітие 2', 3, 725);

--
-- Data for table public.translations (OID = 169401) (LIMIT 0,166)
--
INSERT INTO translations (id)
VALUES (1);

INSERT INTO translations (id)
VALUES (222);

INSERT INTO translations (id)
VALUES (226);

INSERT INTO translations (id)
VALUES (230);

INSERT INTO translations (id)
VALUES (4);

INSERT INTO translations (id)
VALUES (8);

INSERT INTO translations (id)
VALUES (12);

INSERT INTO translations (id)
VALUES (16);

INSERT INTO translations (id)
VALUES (20);

INSERT INTO translations (id)
VALUES (24);

INSERT INTO translations (id)
VALUES (28);

INSERT INTO translations (id)
VALUES (32);

INSERT INTO translations (id)
VALUES (36);

INSERT INTO translations (id)
VALUES (40);

INSERT INTO translations (id)
VALUES (44);

INSERT INTO translations (id)
VALUES (48);

INSERT INTO translations (id)
VALUES (52);

INSERT INTO translations (id)
VALUES (56);

INSERT INTO translations (id)
VALUES (60);

INSERT INTO translations (id)
VALUES (64);

INSERT INTO translations (id)
VALUES (68);

INSERT INTO translations (id)
VALUES (72);

INSERT INTO translations (id)
VALUES (76);

INSERT INTO translations (id)
VALUES (80);

INSERT INTO translations (id)
VALUES (84);

INSERT INTO translations (id)
VALUES (88);

INSERT INTO translations (id)
VALUES (92);

INSERT INTO translations (id)
VALUES (96);

INSERT INTO translations (id)
VALUES (100);

INSERT INTO translations (id)
VALUES (104);

INSERT INTO translations (id)
VALUES (108);

INSERT INTO translations (id)
VALUES (112);

INSERT INTO translations (id)
VALUES (116);

INSERT INTO translations (id)
VALUES (120);

INSERT INTO translations (id)
VALUES (124);

INSERT INTO translations (id)
VALUES (128);

INSERT INTO translations (id)
VALUES (132);

INSERT INTO translations (id)
VALUES (136);

INSERT INTO translations (id)
VALUES (140);

INSERT INTO translations (id)
VALUES (144);

INSERT INTO translations (id)
VALUES (148);

INSERT INTO translations (id)
VALUES (152);

INSERT INTO translations (id)
VALUES (156);

INSERT INTO translations (id)
VALUES (160);

INSERT INTO translations (id)
VALUES (164);

INSERT INTO translations (id)
VALUES (168);

INSERT INTO translations (id)
VALUES (172);

INSERT INTO translations (id)
VALUES (176);

INSERT INTO translations (id)
VALUES (180);

INSERT INTO translations (id)
VALUES (184);

INSERT INTO translations (id)
VALUES (188);

INSERT INTO translations (id)
VALUES (192);

INSERT INTO translations (id)
VALUES (196);

INSERT INTO translations (id)
VALUES (200);

INSERT INTO translations (id)
VALUES (204);

INSERT INTO translations (id)
VALUES (208);

INSERT INTO translations (id)
VALUES (212);

INSERT INTO translations (id)
VALUES (216);

INSERT INTO translations (id)
VALUES (244);

INSERT INTO translations (id)
VALUES (248);

INSERT INTO translations (id)
VALUES (252);

INSERT INTO translations (id)
VALUES (256);

INSERT INTO translations (id)
VALUES (260);

INSERT INTO translations (id)
VALUES (264);

INSERT INTO translations (id)
VALUES (268);

INSERT INTO translations (id)
VALUES (272);

INSERT INTO translations (id)
VALUES (276);

INSERT INTO translations (id)
VALUES (280);

INSERT INTO translations (id)
VALUES (284);

INSERT INTO translations (id)
VALUES (288);

INSERT INTO translations (id)
VALUES (292);

INSERT INTO translations (id)
VALUES (296);

INSERT INTO translations (id)
VALUES (300);

INSERT INTO translations (id)
VALUES (304);

INSERT INTO translations (id)
VALUES (308);

INSERT INTO translations (id)
VALUES (312);

INSERT INTO translations (id)
VALUES (316);

INSERT INTO translations (id)
VALUES (320);

INSERT INTO translations (id)
VALUES (324);

INSERT INTO translations (id)
VALUES (328);

INSERT INTO translations (id)
VALUES (332);

INSERT INTO translations (id)
VALUES (336);

INSERT INTO translations (id)
VALUES (340);

INSERT INTO translations (id)
VALUES (344);

INSERT INTO translations (id)
VALUES (348);

INSERT INTO translations (id)
VALUES (352);

INSERT INTO translations (id)
VALUES (356);

INSERT INTO translations (id)
VALUES (360);

INSERT INTO translations (id)
VALUES (364);

INSERT INTO translations (id)
VALUES (368);

INSERT INTO translations (id)
VALUES (372);

INSERT INTO translations (id)
VALUES (376);

INSERT INTO translations (id)
VALUES (380);

INSERT INTO translations (id)
VALUES (384);

INSERT INTO translations (id)
VALUES (388);

INSERT INTO translations (id)
VALUES (392);

INSERT INTO translations (id)
VALUES (396);

INSERT INTO translations (id)
VALUES (400);

INSERT INTO translations (id)
VALUES (404);

INSERT INTO translations (id)
VALUES (408);

INSERT INTO translations (id)
VALUES (412);

INSERT INTO translations (id)
VALUES (416);

INSERT INTO translations (id)
VALUES (420);

INSERT INTO translations (id)
VALUES (424);

INSERT INTO translations (id)
VALUES (428);

INSERT INTO translations (id)
VALUES (432);

INSERT INTO translations (id)
VALUES (436);

INSERT INTO translations (id)
VALUES (440);

INSERT INTO translations (id)
VALUES (444);

INSERT INTO translations (id)
VALUES (448);

INSERT INTO translations (id)
VALUES (452);

INSERT INTO translations (id)
VALUES (456);

INSERT INTO translations (id)
VALUES (460);

INSERT INTO translations (id)
VALUES (464);

INSERT INTO translations (id)
VALUES (468);

INSERT INTO translations (id)
VALUES (472);

INSERT INTO translations (id)
VALUES (476);

INSERT INTO translations (id)
VALUES (480);

INSERT INTO translations (id)
VALUES (484);

INSERT INTO translations (id)
VALUES (488);

INSERT INTO translations (id)
VALUES (492);

INSERT INTO translations (id)
VALUES (496);

INSERT INTO translations (id)
VALUES (500);

INSERT INTO translations (id)
VALUES (504);

INSERT INTO translations (id)
VALUES (508);

INSERT INTO translations (id)
VALUES (512);

INSERT INTO translations (id)
VALUES (516);

INSERT INTO translations (id)
VALUES (520);

INSERT INTO translations (id)
VALUES (524);

INSERT INTO translations (id)
VALUES (528);

INSERT INTO translations (id)
VALUES (536);

INSERT INTO translations (id)
VALUES (540);

INSERT INTO translations (id)
VALUES (544);

INSERT INTO translations (id)
VALUES (548);

INSERT INTO translations (id)
VALUES (552);

INSERT INTO translations (id)
VALUES (556);

INSERT INTO translations (id)
VALUES (560);

INSERT INTO translations (id)
VALUES (564);

INSERT INTO translations (id)
VALUES (568);

INSERT INTO translations (id)
VALUES (572);

INSERT INTO translations (id)
VALUES (576);

INSERT INTO translations (id)
VALUES (580);

INSERT INTO translations (id)
VALUES (632);

INSERT INTO translations (id)
VALUES (636);

INSERT INTO translations (id)
VALUES (640);

INSERT INTO translations (id)
VALUES (644);

INSERT INTO translations (id)
VALUES (648);

INSERT INTO translations (id)
VALUES (652);

INSERT INTO translations (id)
VALUES (656);

INSERT INTO translations (id)
VALUES (660);

INSERT INTO translations (id)
VALUES (664);

INSERT INTO translations (id)
VALUES (668);

INSERT INTO translations (id)
VALUES (672);

INSERT INTO translations (id)
VALUES (676);

INSERT INTO translations (id)
VALUES (681);

INSERT INTO translations (id)
VALUES (685);

INSERT INTO translations (id)
VALUES (689);

INSERT INTO translations (id)
VALUES (693);

INSERT INTO translations (id)
VALUES (697);

INSERT INTO translations (id)
VALUES (701);

INSERT INTO translations (id)
VALUES (705);

INSERT INTO translations (id)
VALUES (709);

INSERT INTO translations (id)
VALUES (713);

INSERT INTO translations (id)
VALUES (717);

INSERT INTO translations (id)
VALUES (721);

INSERT INTO translations (id)
VALUES (725);

--
-- Data for table public.event (OID = 174673) (LIMIT 0,2)
--
INSERT INTO event (id, attendee_number, create_date, duration, important, keyword, logo, max_attendee, min_attendee, modified_date, qualifications_max_level, qualifications_min_level, status, assistant_id, category_id, descriptionlong_id, descriptionshort_id, title_id)
VALUES (11, 0, '2012-07-20 14:59:07.515', 90, false, NULL, NULL, 25, 1, '2012-07-20 15:01:35.817', 'd2', 'd1', 4, 10, 3, 644, 648, 652);

INSERT INTO event (id, attendee_number, create_date, duration, important, keyword, logo, max_attendee, min_attendee, modified_date, qualifications_max_level, qualifications_min_level, status, assistant_id, category_id, descriptionlong_id, descriptionshort_id, title_id)
VALUES (12, 0, '2012-07-24 10:16:10.943', 90, false, NULL, NULL, 25, 1, '2012-07-24 17:20:23.277', 'd2', 'd1', 4, 10, 4, 717, 721, 725);

--
-- Definition for index category_pkey (OID = 169409) : 
--
ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey
    PRIMARY KEY (id);
--
-- Definition for index roles_name_key (OID = 169413) : 
--
ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_name_key
    UNIQUE (name);
--
-- Definition for index roles_pkey (OID = 169415) : 
--
ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey
    PRIMARY KEY (id);
--
-- Definition for index users_login_key (OID = 169417) : 
--
ALTER TABLE ONLY users
    ADD CONSTRAINT users_login_key
    UNIQUE (login);
--
-- Definition for index users_pkey (OID = 169419) : 
--
ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey
    PRIMARY KEY (id);
--
-- Definition for index fk198fca837f8b84a3 (OID = 169421) : 
--
ALTER TABLE ONLY event_trainers
    ADD CONSTRAINT fk198fca837f8b84a3
    FOREIGN KEY (user_id) REFERENCES users(id);
--
-- Definition for index fkedd99cdf7f8b84a3 (OID = 169436) : 
--
ALTER TABLE ONLY event_attendee
    ADD CONSTRAINT fkedd99cdf7f8b84a3
    FOREIGN KEY (user_id) REFERENCES users(id);
--
-- Definition for index invite_pkey (OID = 169446) : 
--
ALTER TABLE ONLY invite
    ADD CONSTRAINT invite_pkey
    PRIMARY KEY (id);
--
-- Definition for index invite_user_pkey (OID = 169448) : 
--
ALTER TABLE ONLY invite_user
    ADD CONSTRAINT invite_user_pkey
    PRIMARY KEY (id);
--
-- Definition for index room_pkey (OID = 169450) : 
--
ALTER TABLE ONLY room
    ADD CONSTRAINT room_pkey
    PRIMARY KEY (id);
--
-- Definition for index room_name_key (OID = 169452) : 
--
ALTER TABLE ONLY room
    ADD CONSTRAINT room_name_key
    UNIQUE (name);
--
-- Definition for index fk81052309da8eaaa3 (OID = 169454) : 
--
ALTER TABLE ONLY invite
    ADD CONSTRAINT fk81052309da8eaaa3
    FOREIGN KEY (room_id) REFERENCES room(id);
--
-- Definition for index fk2876f741da60c0c3 (OID = 169464) : 
--
ALTER TABLE ONLY invite_user
    ADD CONSTRAINT fk2876f741da60c0c3
    FOREIGN KEY (role_id) REFERENCES roles(id);
--
-- Definition for index fk2876f7417f8b84a3 (OID = 169469) : 
--
ALTER TABLE ONLY invite_user
    ADD CONSTRAINT fk2876f7417f8b84a3
    FOREIGN KEY (user_id) REFERENCES users(id);
--
-- Definition for index fk2876f741307d45a3 (OID = 169474) : 
--
ALTER TABLE ONLY invite_user
    ADD CONSTRAINT fk2876f741307d45a3
    FOREIGN KEY (invite_id) REFERENCES invite(id);
--
-- Definition for index setting_pkey (OID = 169479) : 
--
ALTER TABLE ONLY setting
    ADD CONSTRAINT setting_pkey
    PRIMARY KEY (id);
--
-- Definition for index invite_uuid_key (OID = 169481) : 
--
ALTER TABLE ONLY invite
    ADD CONSTRAINT invite_uuid_key
    UNIQUE (uuid);
--
-- Definition for index calendar_pkey (OID = 169483) : 
--
ALTER TABLE ONLY calendar
    ADD CONSTRAINT calendar_pkey
    PRIMARY KEY (id);
--
-- Definition for index fk2404eb3e7f8b84a3 (OID = 169485) : 
--
ALTER TABLE ONLY calendar
    ADD CONSTRAINT fk2404eb3e7f8b84a3
    FOREIGN KEY (user_id) REFERENCES users(id);
--
-- Definition for index fk2404eb3eda8eaaa3 (OID = 169490) : 
--
ALTER TABLE ONLY calendar
    ADD CONSTRAINT fk2404eb3eda8eaaa3
    FOREIGN KEY (room_id) REFERENCES room(id);
--
-- Definition for index events_status_log_pkey (OID = 169495) : 
--
ALTER TABLE ONLY events_status_log
    ADD CONSTRAINT events_status_log_pkey
    PRIMARY KEY (id);
--
-- Definition for index fk4d495e8da60c0c3 (OID = 171915) : 
--
ALTER TABLE ONLY users
    ADD CONSTRAINT fk4d495e8da60c0c3
    FOREIGN KEY (role_id) REFERENCES roles(id);
--
-- Definition for index event_pkey (OID = 174679) : 
--
ALTER TABLE ONLY event
    ADD CONSTRAINT event_pkey
    PRIMARY KEY (id);
--
-- Definition for index fk3f47a7a98f08743 (OID = 174681) : 
--
ALTER TABLE ONLY event
    ADD CONSTRAINT fk3f47a7a98f08743
    FOREIGN KEY (category_id) REFERENCES category(id);
--
-- Definition for index fk3f47a7a30b040b0 (OID = 174686) : 
--
ALTER TABLE ONLY event
    ADD CONSTRAINT fk3f47a7a30b040b0
    FOREIGN KEY (assistant_id) REFERENCES users(id);
--
-- Definition for index fke202b56a9175e1d1 (OID = 174691) : 
--
ALTER TABLE ONLY events_attachments
    ADD CONSTRAINT fke202b56a9175e1d1
    FOREIGN KEY (event_id) REFERENCES event(id);
--
-- Definition for index fk810523099175e1d1 (OID = 174706) : 
--
ALTER TABLE ONLY invite
    ADD CONSTRAINT fk810523099175e1d1
    FOREIGN KEY (event_id) REFERENCES event(id);
--
-- Definition for index fk84c8f8e19175e1d1 (OID = 174711) : 
--
ALTER TABLE ONLY pending_events
    ADD CONSTRAINT fk84c8f8e19175e1d1
    FOREIGN KEY (event_id) REFERENCES event(id);
--
-- Definition for index fk31a8acfeb8ae8c17 (OID = 174926) : 
--
ALTER TABLE ONLY category
    ADD CONSTRAINT fk31a8acfeb8ae8c17
    FOREIGN KEY (parent_id) REFERENCES category(id);
--
-- Data for sequence public.category_sequence (OID = 169284)
--
SELECT pg_catalog.setval('category_sequence', 4, true);
--
-- Data for sequence public.event_sequence (OID = 169290)
--
SELECT pg_catalog.setval('event_sequence', 12, true);
--
-- Data for sequence public.hibernate_sequence (OID = 169305)
--
SELECT pg_catalog.setval('hibernate_sequence', 728, true);
--
-- Data for sequence public.role_sequence (OID = 169307)
--
SELECT pg_catalog.setval('role_sequence', 1, false);
--
-- Data for sequence public.user_sequence (OID = 169316)
--
SELECT pg_catalog.setval('user_sequence', 2, true);
--
-- Data for sequence public.attachment_sequence (OID = 169328)
--
SELECT pg_catalog.setval('attachment_sequence', 1, false);
--
-- Data for sequence public.mail_template_sequence (OID = 169330)
--
SELECT pg_catalog.setval('mail_template_sequence', 1, false);
--
-- Data for sequence public.invite_sequence (OID = 169344)
--
SELECT pg_catalog.setval('invite_sequence', 43, true);
--
-- Data for sequence public.invite_user_sequence (OID = 169346)
--
SELECT pg_catalog.setval('invite_user_sequence', 149, true);
--
-- Data for sequence public.room_sequence (OID = 169348)
--
SELECT pg_catalog.setval('room_sequence', 1, false);
--
-- Data for sequence public.calendar_sequence (OID = 169359)
--
SELECT pg_catalog.setval('calendar_sequence', 110990, true);
--
-- Data for sequence public.events_status_log_sequense (OID = 169370)
--
SELECT pg_catalog.setval('events_status_log_sequense', 19, true);
--
-- Data for sequence public.language_sequence (OID = 169372)
--
SELECT pg_catalog.setval('language_sequence', 1, false);
--
-- Data for sequence public.translation_sequence (OID = 169374)
--
SELECT pg_catalog.setval('translation_sequence', 1, false);
--
-- Data for sequence public.translations_sequence (OID = 169376)
--
SELECT pg_catalog.setval('translations_sequence', 1, false);
--
-- Data for sequence public.translations_seq (OID = 169378)
--
SELECT pg_catalog.setval('translations_seq', 1, false);
--
-- Data for sequence public.pending_events_sequence (OID = 169407)
--
SELECT pg_catalog.setval('pending_events_sequence', 5, true);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
