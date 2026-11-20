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
    name character varying(20) NOT NULL,
    descr text
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
    name character varying(20) NOT NULL,
    descr text,
    is_spherical boolean,
    galaxy_types character varying(20)
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
    name character varying(20),
    planet_id integer NOT NULL,
    descr text,
    moon_number integer
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
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    descr text,
    mass numeric(5,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_platen_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_platen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_platen_id_seq OWNER TO freecodecamp;

--
-- Name: planet_platen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_platen_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    descr text,
    galaxy_id integer,
    has_life boolean,
    distance_from_earth integer,
    age_in_millions_of_years integer
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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_platen_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Dwarf planet and largest object in the asteroid belt');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Brightest asteroid visible from Earth');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Third largest asteroid in the solar system');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Spiral galaxy nearest to Milky Way', false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Third-largest member of the Local Group', false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unbarred spiral galaxy in the constellation Virgo', false, NULL);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy containing our Solar System', false, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Classic spiral galaxy in Canes Venatici', false, NULL);
INSERT INTO public.galaxy VALUES (7, 'Sombrero', 'Unbarred spiral galaxy with bright nucleus', false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 27, 'Earths only natural satellite', NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 28, 'Larger and inner moon of Mars', NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 28, 'Smaller and outer moon of Mars', NULL);
INSERT INTO public.moon VALUES (4, 'Io', 29, 'Volcanically active moon of Jupiter', NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 29, 'Icy moon with subsurface ocean', NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 29, 'Largest moon in the solar system', NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 29, 'Heavily cratered moon of Jupiter', NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 30, 'Largest moon of Saturn with dense atmosphere', NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 30, 'Icy moon with water geysers', NULL);
INSERT INTO public.moon VALUES (10, 'Mimas', 30, 'Saturnian moon with giant impact crater', NULL);
INSERT INTO public.moon VALUES (11, 'Rhea', 30, 'Second-largest moon of Saturn', NULL);
INSERT INTO public.moon VALUES (12, 'Titania', 31, 'Largest moon of Uranus', NULL);
INSERT INTO public.moon VALUES (13, 'Oberon', 31, 'Outermost major moon of Uranus', NULL);
INSERT INTO public.moon VALUES (14, 'Umbriel', 31, 'Darkest major moon of Uranus', NULL);
INSERT INTO public.moon VALUES (15, 'Ariel', 31, 'Brightest moon of Uranus', NULL);
INSERT INTO public.moon VALUES (16, 'Triton', 32, 'Largest moon of Neptune with retrograde orbit', NULL);
INSERT INTO public.moon VALUES (17, 'Proteus', 32, 'Heavily cratered moon of Neptune', NULL);
INSERT INTO public.moon VALUES (18, 'Nereid', 32, 'Moon of Neptune with eccentric orbit', NULL);
INSERT INTO public.moon VALUES (19, 'Larissa', 32, 'Inner moon of Neptune', NULL);
INSERT INTO public.moon VALUES (20, 'Despina', 32, 'Inner satellite of Neptune', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 'Mercury', 7, 'Smallest planet in the system', 0.06);
INSERT INTO public.planet VALUES (26, 'Venus', 7, 'Hot rocky planet', 0.82);
INSERT INTO public.planet VALUES (27, 'Earth', 7, 'Our home planet', 1.00);
INSERT INTO public.planet VALUES (28, 'Mars', 7, 'The red planet', 0.11);
INSERT INTO public.planet VALUES (29, 'Jupiter', 7, 'Largest gas giant', 317.80);
INSERT INTO public.planet VALUES (30, 'Saturn', 7, 'Planet with ring system', 95.20);
INSERT INTO public.planet VALUES (31, 'Uranus', 7, 'Ice giant', 14.50);
INSERT INTO public.planet VALUES (32, 'Neptune', 7, 'Farthest ice giant', 17.10);
INSERT INTO public.planet VALUES (33, 'Proxima b', 8, 'Exoplanet in habitable zone', 1.27);
INSERT INTO public.planet VALUES (34, 'Kepler-22b', 9, 'Super-Earth exoplanet', 2.40);
INSERT INTO public.planet VALUES (35, 'Gliese 581g', 10, 'Potential habitable world', 3.10);
INSERT INTO public.planet VALUES (36, 'HD 209458 b', 11, 'Hot Jupiter exoplanet', 0.69);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sun', 'Yellow dwarf star', 1, true, 0, 4600);
INSERT INTO public.star VALUES (8, 'Proxima', 'Red dwarf star', 1, false, 4, 4850);
INSERT INTO public.star VALUES (9, 'Betelgeuse', 'Red supergiant', 1, false, 642, 10);
INSERT INTO public.star VALUES (10, 'Sirius', 'Brightest star', 1, false, 9, 240);
INSERT INTO public.star VALUES (11, 'Polaris', 'North star', 1, false, 433, 70);
INSERT INTO public.star VALUES (12, 'Vega', 'Blue-white star', 1, false, 25, 455);
INSERT INTO public.star VALUES (13, 'Sun', 'Yellow dwarf star', 1, true, 0, 4600);
INSERT INTO public.star VALUES (14, 'Proxima', 'Red dwarf star', 1, false, 4, 4850);
INSERT INTO public.star VALUES (15, 'Betelgeuse', 'Red supergiant', 1, false, 642, 10);
INSERT INTO public.star VALUES (16, 'Sirius', 'Brightest star', 1, false, 9, 240);
INSERT INTO public.star VALUES (17, 'Polaris', 'North star', 1, false, 433, 70);
INSERT INTO public.star VALUES (18, 'Vega', 'Blue-white star', 1, false, 25, 455);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_platen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_platen_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: asteroid asteroid_asteroid_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_asteroid_id_key UNIQUE (asteroid_id);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

