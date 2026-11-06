--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km numeric,
    is_spherical boolean,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean,
    description text
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
    radius_in_km integer NOT NULL,
    orbital_period_in_days numeric,
    has_atmosphere boolean,
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    distance_from_earth numeric,
    has_life boolean,
    age_in_millions_of_years integer,
    description text
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
    spectral_type character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    mass_in_solar_masses numeric,
    is_spherical boolean,
    description text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 5, 939.4, true, 'The largest object in the asteroid belt');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 5, 525.4, false, 'One of the largest asteroids');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 5, 512, false, 'A large asteroid in the asteroid belt');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000, false, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 2730000, false, 'A galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 13000, 23000000, false, 'A grand-design spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 13000, 29350000, false, 'A bright galaxy with a prominent core');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 13000, 21000000, false, 'A face-on spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, 27.3, false, 'Earth natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, 0.32, false, 'Inner moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 1.26, false, 'Outer moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, 1.77, false, 'Volcanically active moon of Jupiter');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560, 3.55, false, 'Icy moon of Jupiter');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, 7.15, false, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, 16.69, false, 'Outer Galilean moon');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 84, 0.5, false, 'Small inner moon of Jupiter');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 2575, 15.95, true, 'Moon of Saturn with a thick atmosphere');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 252, 1.37, false, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 764, 4.52, false, 'Moon of Saturn');
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 734, 79.3, false, 'Two-toned moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Dione', 6, 561, 2.74, false, 'Moon of Saturn');
INSERT INTO public.moon VALUES (14, 'Tethys', 6, 531, 1.89, false, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (15, 'Mimas', 6, 198, 0.94, false, 'Small moon of Saturn');
INSERT INTO public.moon VALUES (16, 'Titania', 7, 789, 8.7, false, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 761, 13.46, false, 'Moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Triton', 8, 1353, 5.88, false, 'Largest moon of Neptune');
INSERT INTO public.moon VALUES (19, 'Nereid', 8, 170, 360.1, false, 'Irregular moon of Neptune');
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 210, 1.12, false, 'Inner moon of Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 91600000, false, 4500, 'The smallest planet');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 41400000, false, 4500, 'The hottest planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 0, true, 4540, 'Our home planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 78300000, false, 4500, 'The red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 628700000, false, 4500, 'The largest planet');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 1275000000, false, 4500, 'The ringed planet');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 2724000000, false, 4500, 'An ice giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 4351000000, false, 4500, 'The farthest major planet');
INSERT INTO public.planet VALUES (9, 'Proxima b', 3, 'Terrestrial', 4.2, false, 5000, 'An exoplanet candidate');
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 4, 'Super-Earth', 600, false, 4000, 'An exoplanet');
INSERT INTO public.planet VALUES (11, 'Rigel b', 5, 'Gas Giant', 860, false, 1000, 'A hypothetical example planet');
INSERT INTO public.planet VALUES (12, 'Vega b', 4, 'Gas Giant', 25, false, 455, 'A hypothetical example planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 4600, 1.0, true, 'The star at the center of our solar system');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 242, 2.0, true, 'The brightest star in the night sky');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'M5.5Ve', 4850, 0.12, true, 'The closest known star to the Sun');
INSERT INTO public.star VALUES (4, 'Vega', 1, 'A0V', 455, 2.1, true, 'A bright star in the Lyra constellation');
INSERT INTO public.star VALUES (5, 'Rigel', 1, 'B8Ia', 8000, 21.0, true, 'A blue supergiant star');
INSERT INTO public.star VALUES (6, 'Betelgeuse', 1, 'M1-M2Ia', 10000, 16.5, true, 'A red supergiant star');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


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
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

