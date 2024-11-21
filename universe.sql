--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance_from_earth numeric NOT NULL,
    description text,
    is_visible boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric NOT NULL,
    has_water boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    mass numeric NOT NULL,
    number_of_moons integer NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer NOT NULL,
    is_main_sequence boolean NOT NULL
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
-- Name: universe_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_event (
    universe_event_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    date_occurred date NOT NULL,
    description text
);


ALTER TABLE public.universe_event OWNER TO freecodecamp;

--
-- Name: universe_event_universe_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_event_universe_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_event_universe_event_id_seq OWNER TO freecodecamp;

--
-- Name: universe_event_universe_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_event_universe_event_id_seq OWNED BY public.universe_event.universe_event_id;


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
-- Name: universe_event universe_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_event ALTER COLUMN universe_event_id SET DEFAULT nextval('public.universe_event_universe_event_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 'Our home galaxy.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 'Neighboring spiral galaxy.', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, 'Part of the local group.', true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 29000000, 'Known for its bright core.', false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 23000000, 'Interacting spiral galaxy.', true);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 500000000, 'Ring-shaped galaxy.', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474.8, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.4, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.4, false);
INSERT INTO public.moon VALUES (4, 'Europa', 1, 3121.6, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 1, 5262.4, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 1, 4821.6, true);
INSERT INTO public.moon VALUES (7, 'Titan', 3, 5151.8, true);
INSERT INTO public.moon VALUES (8, 'Io', 4, 3642.6, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 504.2, true);
INSERT INTO public.moon VALUES (10, 'Triton', 5, 2706.8, true);
INSERT INTO public.moon VALUES (11, 'Charon', 5, 1212.4, false);
INSERT INTO public.moon VALUES (12, 'Dione', 5, 1122.8, false);
INSERT INTO public.moon VALUES (13, 'Mimas', 5, 396.2, false);
INSERT INTO public.moon VALUES (14, 'Hyperion', 5, 270.6, false);
INSERT INTO public.moon VALUES (15, 'Himalia', 6, 170.0, false);
INSERT INTO public.moon VALUES (16, 'Carme', 6, 46.6, false);
INSERT INTO public.moon VALUES (17, 'Ananke', 6, 28.0, false);
INSERT INTO public.moon VALUES (18, 'Amalthea', 6, 250.2, true);
INSERT INTO public.moon VALUES (19, 'Elara', 6, 80.6, false);
INSERT INTO public.moon VALUES (20, 'Galatea', 6, 176.8, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 5.972, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.641, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 4.867, 0);
INSERT INTO public.planet VALUES (4, 'Proxima b', 2, 1.27, 0);
INSERT INTO public.planet VALUES (5, 'Sirius b Planet', 3, 1.5, 0);
INSERT INTO public.planet VALUES (6, 'Betelgeuse c', 4, 3.0, 5);
INSERT INTO public.planet VALUES (7, 'Rigel b', 6, 10.0, 7);
INSERT INTO public.planet VALUES (8, 'Vega d', 5, 6.0, 8);
INSERT INTO public.planet VALUES (9, 'Mars Two', 3, 1.6, 0);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 2, 2.4, 0);
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 3, 5.6, 0);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 4, 0.69, 0);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', 5, 0.62, 0);
INSERT INTO public.planet VALUES (14, 'Jupiter', 1, 317.8, 79);
INSERT INTO public.planet VALUES (15, 'Saturn', 1, 95.2, 83);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 3042, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 9940, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3500, false);
INSERT INTO public.star VALUES (5, 'Vega', 2, 9602, true);
INSERT INTO public.star VALUES (6, 'Rigel', 3, 12100, false);


--
-- Data for Name: universe_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_event VALUES (1, 'Big Bang', 1, '0001-01-01', 'The origin of the universe.');
INSERT INTO public.universe_event VALUES (2, 'Milky Way Collision', 1, '4500-01-01', 'Collision with Andromeda Galaxy.');
INSERT INTO public.universe_event VALUES (3, 'Supernova Explosion', 2, '2025-07-01', 'Explosion of a massive star.');
INSERT INTO public.universe_event VALUES (4, 'Black Hole Discovery', 3, '1994-03-01', 'Discovery of a supermassive black hole.');
INSERT INTO public.universe_event VALUES (5, 'Cartwheel Collision', 4, '500000-01-01', 'Galactic collision forming the Cartwheel Galaxy.');


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: universe_event_universe_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_event_universe_event_id_seq', 5, true);


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
-- Name: universe_event universe_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_event
    ADD CONSTRAINT universe_event_name_key UNIQUE (name);


--
-- Name: universe_event universe_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_event
    ADD CONSTRAINT universe_event_pkey PRIMARY KEY (universe_event_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: universe_event universe_event_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_event
    ADD CONSTRAINT universe_event_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

