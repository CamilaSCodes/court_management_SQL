-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.assigned
(
    case_party_id integer NOT NULL,
    case_id integer,
    party_id integer,
    CONSTRAINT assigned_pkey PRIMARY KEY (case_party_id)
);

CREATE TABLE IF NOT EXISTS public.case_types
(
    case_type_id integer NOT NULL,
    case_type_code integer,
    case_type character(100) COLLATE pg_catalog."default",
    CONSTRAINT case_types_pkey PRIMARY KEY (case_type_id)
);

CREATE TABLE IF NOT EXISTS public.court
(
    court_id integer NOT NULL,
    court_name character(200) COLLATE pg_catalog."default",
    CONSTRAINT court_pkey PRIMARY KEY (court_id)
);

CREATE TABLE IF NOT EXISTS public.court_case
(
    case_id integer NOT NULL,
    case_code integer,
    date_of_charge date,
    court_id integer,
    case_type_id integer,
    location_id integer,
    CONSTRAINT court_case_pkey PRIMARY KEY (case_id)
);

CREATE TABLE IF NOT EXISTS public.email
(
    party_email_id integer NOT NULL,
    party_email character(200) COLLATE pg_catalog."default",
    CONSTRAINT email_pkey PRIMARY KEY (party_email_id)
);

CREATE TABLE IF NOT EXISTS public.issues
(
    case_notice_id integer NOT NULL,
    notice_id integer,
    case_id integer,
    CONSTRAINT issues_pkey PRIMARY KEY (case_notice_id)
);

CREATE TABLE IF NOT EXISTS public.location
(
    location_id integer NOT NULL,
    location_code integer,
    location_name character(200) COLLATE pg_catalog."default",
    CONSTRAINT location_pkey PRIMARY KEY (location_id)
);

CREATE TABLE IF NOT EXISTS public.notice
(
    notice_id integer NOT NULL,
    receipt_date date,
    issue_date date,
    CONSTRAINT notice_pkey PRIMARY KEY (notice_id)
);

CREATE TABLE IF NOT EXISTS public.owns
(
    party_email_relationship_id integer NOT NULL,
    party_id integer,
    party_email_id integer,
    CONSTRAINT owns_pkey PRIMARY KEY (party_email_relationship_id)
);

CREATE TABLE IF NOT EXISTS public.party
(
    party_id integer NOT NULL,
    party_cpf integer,
    party_name character(200) COLLATE pg_catalog."default",
    party_phone_number_1 integer,
    party_phone_number_2 integer,
    place_id integer,
    CONSTRAINT party_pkey PRIMARY KEY (party_id)
);

CREATE TABLE IF NOT EXISTS public.party_type
(
    party_type_id integer NOT NULL,
    party_type character(100) COLLATE pg_catalog."default",
    CONSTRAINT party_type_pkey PRIMARY KEY (party_type_id)
);

CREATE TABLE IF NOT EXISTS public.place
(
    place_id integer NOT NULL,
    party_street_name character(200) COLLATE pg_catalog."default",
    party_street_number integer,
    party_city character(100) COLLATE pg_catalog."default",
    fu character(10) COLLATE pg_catalog."default",
    CONSTRAINT place_pkey PRIMARY KEY (place_id)
);

CREATE TABLE IF NOT EXISTS public.possesses
(
    party_type_relationship_id integer NOT NULL,
    party_type_id integer,
    party_id integer,
    CONSTRAINT possesses_pkey PRIMARY KEY (party_type_relationship_id)
);

CREATE TABLE IF NOT EXISTS public.process
(
    process_id integer NOT NULL,
    process_time time without time zone,
    process_date date,
    court_id_sends integer,
    court_id_receives integer,
    case_id integer,
    CONSTRAINT process_pkey PRIMARY KEY (process_id)
);

CREATE TABLE IF NOT EXISTS public.receives
(
    party_notice_id integer NOT NULL,
    notice_id integer,
    party_id integer,
    CONSTRAINT receives_pkey PRIMARY KEY (party_notice_id)
);

ALTER TABLE IF EXISTS public.assigned
    ADD CONSTRAINT fk_assigned_2 FOREIGN KEY (case_id)
    REFERENCES public.court_case (case_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE RESTRICT;


ALTER TABLE IF EXISTS public.assigned
    ADD CONSTRAINT fk_assigned_3 FOREIGN KEY (party_id)
    REFERENCES public.party (party_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE RESTRICT;


ALTER TABLE IF EXISTS public.court_case
    ADD CONSTRAINT fk_court_case_2 FOREIGN KEY (court_id)
    REFERENCES public.court (court_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.court_case
    ADD CONSTRAINT fk_court_case_3 FOREIGN KEY (case_type_id)
    REFERENCES public.case_types (case_type_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.court_case
    ADD CONSTRAINT fk_court_case_4 FOREIGN KEY (location_id)
    REFERENCES public.location (location_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE RESTRICT;


ALTER TABLE IF EXISTS public.issues
    ADD CONSTRAINT fk_issues_2 FOREIGN KEY (notice_id)
    REFERENCES public.notice (notice_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL;


ALTER TABLE IF EXISTS public.issues
    ADD CONSTRAINT fk_issues_3 FOREIGN KEY (case_id)
    REFERENCES public.court_case (case_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL;


ALTER TABLE IF EXISTS public.owns
    ADD CONSTRAINT fk_owns_2 FOREIGN KEY (party_id)
    REFERENCES public.party (party_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE RESTRICT;


ALTER TABLE IF EXISTS public.owns
    ADD CONSTRAINT fk_owns_3 FOREIGN KEY (party_email_id)
    REFERENCES public.email (party_email_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE RESTRICT;


ALTER TABLE IF EXISTS public.party
    ADD CONSTRAINT fk_party_2 FOREIGN KEY (place_id)
    REFERENCES public.place (place_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE RESTRICT;


ALTER TABLE IF EXISTS public.possesses
    ADD CONSTRAINT fk_possesses_2 FOREIGN KEY (party_type_id)
    REFERENCES public.party_type (party_type_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE RESTRICT;


ALTER TABLE IF EXISTS public.possesses
    ADD CONSTRAINT fk_possesses_3 FOREIGN KEY (party_id)
    REFERENCES public.party (party_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE RESTRICT;


ALTER TABLE IF EXISTS public.process
    ADD CONSTRAINT fk_process_2 FOREIGN KEY (court_id_sends)
    REFERENCES public.court (court_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.process
    ADD CONSTRAINT fk_process_3 FOREIGN KEY (court_id_receives)
    REFERENCES public.court (court_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.process
    ADD CONSTRAINT fk_process_4 FOREIGN KEY (case_id)
    REFERENCES public.court_case (case_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE RESTRICT;


ALTER TABLE IF EXISTS public.receives
    ADD CONSTRAINT fk_receives_2 FOREIGN KEY (notice_id)
    REFERENCES public.notice (notice_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL;


ALTER TABLE IF EXISTS public.receives
    ADD CONSTRAINT fk_receives_3 FOREIGN KEY (party_id)
    REFERENCES public.party (party_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL;

END;