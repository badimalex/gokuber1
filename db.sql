--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Homebrew)
-- Dumped by pg_dump version 15.4 (Homebrew)

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
-- Name: test; Type: TABLE; Schema: public; Owner: dmitriybadichan
--

CREATE TABLE public.test (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.test OWNER TO dmitriybadichan;

--
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitriybadichan
--

CREATE SEQUENCE public.test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_id_seq OWNER TO dmitriybadichan;

--
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitriybadichan
--

ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;


--
-- Name: test id; Type: DEFAULT; Schema: public; Owner: dmitriybadichan
--

ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: dmitriybadichan
--

COPY public.test (id, name) FROM stdin;
1	dima
\.


--
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitriybadichan
--

SELECT pg_catalog.setval('public.test_id_seq', 1, true);


--
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: dmitriybadichan
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

