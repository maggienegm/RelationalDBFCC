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
    category character varying(50),
    mass numeric,
    num_of_stars integer
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
    category character varying(50),
    radius numeric,
    mass numeric,
    planet_id integer
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
    category character varying(50),
    radius numeric,
    mass numeric,
    star_id integer,
    has_atmosphere boolean DEFAULT false,
    has_rings boolean DEFAULT false
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
-- Name: space_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying(100) NOT NULL,
    organization character varying(100) NOT NULL,
    launch_date date,
    destination character varying(100),
    description text,
    number_of_astronauts integer
);


ALTER TABLE public.space_mission OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_mission_space_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_space_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_mission_space_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    category character varying(50) NOT NULL,
    color character varying(50),
    mass numeric,
    luminosity numeric,
    galaxy_id integer
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
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_space_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 1000000, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1100000, 250);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 200000, 100);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 1500000, 500);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 800000, 300);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring', 600000, 150);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Natural satellite', 1737.5, 73000000000000000000000, 3);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Natural satellite', 6.2, 20000000000000000, 4);
INSERT INTO public.moon VALUES (3, 'Ganymede', 'Natural satellite', 2631.2, 25000000000000000000000, 5);
INSERT INTO public.moon VALUES (4, 'Titan', 'Natural satellite', 2575, 134500000000000000000000, 6);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Natural satellite', 2410.3, 18900000000000000000000, 5);
INSERT INTO public.moon VALUES (6, 'Europa', 'Natural satellite', 1560.8, 8931900000000000000000, 5);
INSERT INTO public.moon VALUES (7, 'Io', 'Natural satellite', 1821.6, 15000000000000000000000, 5);
INSERT INTO public.moon VALUES (8, 'Triton', 'Natural satellite', 1353.4, 2140000000000000000000, 9);
INSERT INTO public.moon VALUES (9, 'Charon', 'Natural satellite', 606, 1586000000000000000000, 10);
INSERT INTO public.moon VALUES (10, 'Phobos', 'Natural satellite', 11.2667, 15000000000000000, 4);
INSERT INTO public.moon VALUES (11, 'Luna', 'Natural satellite', 1737.5, 73000000000000000000000, 3);
INSERT INTO public.moon VALUES (12, 'Hydra', 'Natural satellite', 650, 4200000000000000, 10);
INSERT INTO public.moon VALUES (13, 'Nereid', 'Natural satellite', 170, 32000000000000000, 9);
INSERT INTO public.moon VALUES (14, 'Oberon', 'Natural satellite', 761.4, 3010000000000000000000, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Natural satellite', 235.8, 65900000000000000000, 7);
INSERT INTO public.moon VALUES (16, 'Enceladus', 'Natural satellite', 252.1, 108000000000000000000, 6);
INSERT INTO public.moon VALUES (17, 'Rhea', 'Natural satellite', 763.8, 2310000000000000000000, 6);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Natural satellite', 578.9, 1350000000000000000000, 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', 'Natural satellite', 584.7, 1270000000000000000000, 7);
INSERT INTO public.moon VALUES (20, 'Dione', 'Natural satellite', 561.4, 1100000000000000000000, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 2439.7, 330000000000000000000000, 1, true, false);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 6051.8, 4870000000000000000000000, 1, true, false);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 6371, 5970000000000000000000000, 1, true, false);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 3389.5, 642000000000000000000000, 1, true, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas giant', 69911, 1898190000000000000000000000, 1, true, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant', 58232, 568340000000000000000000000, 1, true, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant', 25362, 86813000000000000000000000, 1, true, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant', 24622, 102413000000000000000000000, 1, true, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', 1188.3, 14600000000000000000000, 1, true, false);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 'Exoplanet', NULL, NULL, 2, true, false);
INSERT INTO public.planet VALUES (11, 'HD 189733b', 'Exoplanet', NULL, NULL, 3, true, false);
INSERT INTO public.planet VALUES (12, 'Gliese 581c', 'Exoplanet', NULL, NULL, 4, true, false);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_mission VALUES (1, 'Apollo 11', 'NASA', '1969-07-16', 'Moon', 'First manned mission to land on the Moon', 3);
INSERT INTO public.space_mission VALUES (2, 'Voyager 1', 'NASA', '1977-09-05', 'Interstellar space', 'First spacecraft to enter interstellar space', NULL);
INSERT INTO public.space_mission VALUES (3, 'Mars Rover Curiosity', 'NASA', '2011-11-26', 'Mars', 'Robotic rover exploring the surface of Mars', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 'Yellow', 1989000000000000000000000000000, 382800000000000000000000000, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'G-type', 'Yellow', 2188000000000000000000000000000, 527000000000000000000000000, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 'K-type', 'Orange', 1339000000000000000000000000000, 507000000000000000000000000, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'A-type', 'Blue-white', 2063000000000000000000000000000, 2540000000000000000000000000, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'M-type', 'Red', 123000000000000000000000000000, 170000000000000000000000, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'M-type', 'Red', 11600000000000000000000000000000, 10000000000000000000000000000000, 1);


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
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_mission_space_mission_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: space_mission space_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


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
-- PostgreSQL database dump complete
--

