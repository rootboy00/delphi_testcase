--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: certificates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificates (
    id integer NOT NULL,
    people_id integer,
    certificate_id integer,
    date_issue date DEFAULT now()
);


ALTER TABLE public.certificates OWNER TO postgres;

--
-- Name: Certificates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.certificates ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Certificates_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: certificate_db; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificate_db (
    id integer NOT NULL,
    name character varying(100),
    code character varying(20)
);


ALTER TABLE public.certificate_db OWNER TO postgres;

--
-- Name: certificates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.certificate_db ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.certificates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: peoples; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peoples (
    id integer NOT NULL,
    first_name character varying(32),
    surname character varying(32),
    patronymic character varying(32),
    birthday date,
    register_date date DEFAULT now()
);


ALTER TABLE public.peoples OWNER TO postgres;

--
-- Name: peoples_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.peoples ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.peoples_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: certificates Certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT "Certificates_pkey" PRIMARY KEY (id);


--
-- Name: certificate_db certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificate_db
    ADD CONSTRAINT certificates_pkey PRIMARY KEY (id);


--
-- Name: peoples peoples_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peoples
    ADD CONSTRAINT peoples_pkey PRIMARY KEY (id);


--
-- Name: certificates certificates; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates FOREIGN KEY (certificate_id) REFERENCES public.certificate_db(id);


--
-- Name: certificates peoples; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT peoples FOREIGN KEY (people_id) REFERENCES public.peoples(id);


--
-- PostgreSQL database dump complete
--

