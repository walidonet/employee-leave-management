--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: _employee; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._employee (
                                  employee_id smallint,
                                  created_at character varying(19) DEFAULT NULL::character varying,
                                  email character varying(1) DEFAULT NULL::character varying,
                                  first_name character varying(5) DEFAULT NULL::character varying,
                                  last_name character varying(5) DEFAULT NULL::character varying,
                                  middle_name character varying(1) DEFAULT NULL::character varying,
                                  password character varying(60) DEFAULT NULL::character varying,
                                  phone_number integer,
                                  role character varying(10) DEFAULT NULL::character varying,
                                  status character varying(6) DEFAULT NULL::character varying,
                                  username character varying(5) DEFAULT NULL::character varying,
                                  group_id character varying(1) DEFAULT NULL::character varying,
                                  supervisor character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._employee OWNER TO rebasedata;

--
-- Name: _employee_group; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._employee_group (
                                        group_id character varying(1) DEFAULT NULL::character varying,
                                        group_name character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._employee_group OWNER TO rebasedata;

--
-- Name: _event; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._event (
                               event_id character varying(1) DEFAULT NULL::character varying,
                               created_at character varying(1) DEFAULT NULL::character varying,
                               end_date character varying(1) DEFAULT NULL::character varying,
                               event_type character varying(1) DEFAULT NULL::character varying,
                               start_date character varying(1) DEFAULT NULL::character varying,
                               title character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._event OWNER TO rebasedata;

--
-- Name: _leave_request; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._leave_request (
                                       leave_id character varying(1) DEFAULT NULL::character varying,
                                       created_at character varying(1) DEFAULT NULL::character varying,
                                       denied_reason character varying(1) DEFAULT NULL::character varying,
                                       from_date character varying(1) DEFAULT NULL::character varying,
                                       leave_reason character varying(1) DEFAULT NULL::character varying,
                                       status character varying(1) DEFAULT NULL::character varying,
                                       to_date character varying(1) DEFAULT NULL::character varying,
                                       employee_id character varying(1) DEFAULT NULL::character varying,
                                       leave_type character varying(1) DEFAULT NULL::character varying,
                                       reviewed_by character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._leave_request OWNER TO rebasedata;

--
-- Name: _leave_type; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._leave_type (
                                    leave_type_id character varying(1) DEFAULT NULL::character varying,
                                    status character varying(1) DEFAULT NULL::character varying,
                                    type_name character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._leave_type OWNER TO rebasedata;

--
-- Name: _oauth_access_token; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._oauth_access_token (
                                            token_id character varying(1) DEFAULT NULL::character varying,
                                            token character varying(1) DEFAULT NULL::character varying,
                                            authentication_id character varying(1) DEFAULT NULL::character varying,
                                            user_name character varying(1) DEFAULT NULL::character varying,
                                            client_id character varying(1) DEFAULT NULL::character varying,
                                            authentication character varying(1) DEFAULT NULL::character varying,
                                            refresh_token character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._oauth_access_token OWNER TO rebasedata;

--
-- Name: _oauth_refresh_token; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._oauth_refresh_token (
                                             token_id character varying(1) DEFAULT NULL::character varying,
                                             token character varying(1) DEFAULT NULL::character varying,
                                             authentication character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._oauth_refresh_token OWNER TO rebasedata;

--
-- Data for Name: _employee; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._employee (employee_id, created_at, email, first_name, last_name, middle_name, password, phone_number, role, status, username, group_id, supervisor) FROM stdin;
1	2020-12-16 20:01:33		admin	admin		$2a$10$9YBWBYJhjSYCeOpEzIG/H.WbPqlNa688Fs7klp7P07vOUX27ubwlu	0	ROLE_ADMIN	ACTIVE	admin
\.


--
-- Data for Name: _employee_group; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._employee_group (group_id, group_name) FROM stdin;
\.


--
-- Data for Name: _event; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._event (event_id, created_at, end_date, event_type, start_date, title) FROM stdin;
\.


--
-- Data for Name: _leave_request; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._leave_request (leave_id, created_at, denied_reason, from_date, leave_reason, status, to_date, employee_id, leave_type, reviewed_by) FROM stdin;
\.


--
-- Data for Name: _leave_type; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._leave_type (leave_type_id, status, type_name) FROM stdin;
\.


--
-- Data for Name: _oauth_access_token; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._oauth_access_token (token_id, token, authentication_id, user_name, client_id, authentication, refresh_token) FROM stdin;
\.


--
-- Data for Name: _oauth_refresh_token; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._oauth_refresh_token (token_id, token, authentication) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

