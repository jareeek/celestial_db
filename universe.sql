--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: aliases; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.aliases (
    aliases_id integer NOT NULL,
    name character varying(60) NOT NULL,
    alias character varying(30)
);


ALTER TABLE public.aliases OWNER TO freecodecamp;

--
-- Name: aliases_aliases_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.aliases_aliases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aliases_aliases_id_seq OWNER TO freecodecamp;

--
-- Name: aliases_aliases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.aliases_aliases_id_seq OWNED BY public.aliases.aliases_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    constellation character varying(50),
    distance numeric(5,2) NOT NULL,
    size numeric(5,2) NOT NULL,
    trivia text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    size numeric(5,2),
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer DEFAULT 5,
    is_populated boolean DEFAULT false NOT NULL,
    number_of_moons integer,
    named_after character varying(30)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer,
    is_supernova boolean NOT NULL,
    temperature integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: aliases aliases_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.aliases ALTER COLUMN aliases_id SET DEFAULT nextval('public.aliases_aliases_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: aliases; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.aliases VALUES (1, 'Andromeda Galaxy', 'Messier 31');
INSERT INTO public.aliases VALUES (2, 'Backward galaxy', 'NGC 4622');
INSERT INTO public.aliases VALUES (3, 'Eye of Sauron', 'NGC 4151');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 8.10, 27.35, 'You are here.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda', 765.00, 46.56, 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.');
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'Virgo', 31.10, 32.32, NULL);
INSERT INTO public.galaxy VALUES (4, 'Eye of Sauron', 'Canes Venatici', 15.80, 6.40, 'Is that a J. R. R. Tolkien reference?');
INSERT INTO public.galaxy VALUES (5, 'Backward galaxy', 'Centaurus', 200.00, 1.70, NULL);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 'Sculptor', 150.00, 44.23, 'underwent a head-on “bullseye” style collision with a smaller companion approximately 200-300 million years prior to how we see the system today.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', 1, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (2, 'Moon 2', 2, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (3, 'Moon 3', 3, 852.45, 'Lorem ipsum');
INSERT INTO public.moon VALUES (4, 'Moon 4', 4, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (5, 'Moon 5', 5, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (6, 'Moon 6', 6, 634.23, NULL);
INSERT INTO public.moon VALUES (7, 'Moon 7', 7, 34.56, 'Lorem ipsum');
INSERT INTO public.moon VALUES (8, 'Moon 8', 8, 8.95, 'Lorem ipsum');
INSERT INTO public.moon VALUES (9, 'Moon 9', 9, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (10, 'Moon 10', 10, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (11, 'Moon 11', 11, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (12, 'Moon 12', 12, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (13, 'Moon 13', 1, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (14, 'Moon 14', 2, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (15, 'Moon 15', 3, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (16, 'Moon 16', 4, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (17, 'Moon 17', 5, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (18, 'Moon 18', 6, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (19, 'Moon 19', 7, 634.23, 'Lorem ipsum');
INSERT INTO public.moon VALUES (20, 'Moon 20', 8, 634.23, 'Lorem ipsum');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 5, false, 0, 'Hermes');
INSERT INTO public.planet VALUES (2, 'Venus', 5, false, 0, 'Aphrodite');
INSERT INTO public.planet VALUES (3, 'Earth', 5, true, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 5, false, 2, 'Ares');
INSERT INTO public.planet VALUES (5, 'Jupiter', 5, false, 95, 'Zeus');
INSERT INTO public.planet VALUES (6, 'Saturn', 5, false, 146, 'Cronus');
INSERT INTO public.planet VALUES (7, 'Uranus', 5, false, 27, 'himself');
INSERT INTO public.planet VALUES (8, 'Neptune', 5, false, 14, 'Poseidon');
INSERT INTO public.planet VALUES (9, 'Ceres', 5, false, 0, 'Demeter');
INSERT INTO public.planet VALUES (10, 'Orcus', 5, false, 1, 'Hades');
INSERT INTO public.planet VALUES (11, 'Pluto', 5, false, 5, 'Hades');
INSERT INTO public.planet VALUES (12, 'Haumea', 5, false, 2, 'herself');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 1, false, 3600);
INSERT INTO public.star VALUES (2, 'Antares', 1, false, 3660);
INSERT INTO public.star VALUES (3, 'Alpheratz', 2, false, 13800);
INSERT INTO public.star VALUES (4, 'Kepler''s Supernova', 1, true, 18000);
INSERT INTO public.star VALUES (5, 'The Sun', 1, false, 5772);
INSERT INTO public.star VALUES (6, 'Hamal', 1, false, 4480);


--
-- Name: aliases_aliases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.aliases_aliases_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: aliases aliases_alias_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.aliases
    ADD CONSTRAINT aliases_alias_key UNIQUE (alias);


--
-- Name: aliases aliases_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.aliases
    ADD CONSTRAINT aliases_name_key UNIQUE (name);


--
-- Name: aliases aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.aliases
    ADD CONSTRAINT aliases_pkey PRIMARY KEY (aliases_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: aliases fk_name; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.aliases
    ADD CONSTRAINT fk_name FOREIGN KEY (name) REFERENCES public.galaxy(name);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

