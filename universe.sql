--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    size_km integer,
    galaxy_id integer,
    has_water boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_kly numeric(8,3),
    has_comet boolean,
    comet_id integer,
    size_kly integer
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
    name character varying(20) NOT NULL,
    descrption text,
    dist_planet_km numeric(11,3),
    has_water boolean,
    planet_id integer NOT NULL,
    size integer
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
    description text,
    distance_kmk_sun numeric(9,0),
    has_life boolean,
    star_id integer NOT NULL,
    size_km integer
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
    name character varying(20) NOT NULL,
    description text,
    distance_ly numeric(8,1),
    has_planet boolean,
    galaxy_id integer,
    radius_mkm integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'cometa halley', 'Pasa por la tierra cada 75 años', 20, 1, true);
INSERT INTO public.comet VALUES (2, 'tempel', 'Es interestelar', 10, 1, true);
INSERT INTO public.comet VALUES (3, 'Borisov', 'Esinterestelar', 2, 1, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'via lactea', 'Alberga el sistema solar', 1.000, true, 3, 90);
INSERT INTO public.galaxy VALUES (2, 'SagDeg', 'Galaxia Irregular Enana de sagitario', 3460.000, true, 3, 3);
INSERT INTO public.galaxy VALUES (3, 'Gran nube de Magallanes', 'En nombre al explorador Fernando de Magallanes', 165.000, true, 3, 25);
INSERT INTO public.galaxy VALUES (4, 'Enana Sagitario', 'varias estrellas y planetas', 78.000, false, 0, 10);
INSERT INTO public.galaxy VALUES (5, 'Ursa Major', 'Galaxia pequeña', 100.000, false, 0, 1);
INSERT INTO public.galaxy VALUES (6, 'Enana coma Berenices', 'Galaxia pequeña', 144.000, false, 0, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Propia de la tierra', 384400.000, true, 3, 3476);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Propia de Marte', 23460.000, false, 4, 8);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Propia de Marte', 9270.000, false, 4, 560);
INSERT INTO public.moon VALUES (4, 'Adrastea', 'Propia de Jupiter', 128980.000, false, 5, 416);
INSERT INTO public.moon VALUES (5, 'Aitne', 'Propia de Jupiter', 23547000.000, false, 5, 3);
INSERT INTO public.moon VALUES (6, 'Amalthea', 'Propia de Jupiter', 181300.000, false, 5, 35108);
INSERT INTO public.moon VALUES (7, 'Ananke', 'Propia de Jupiter', 21200000.000, false, 5, 20);
INSERT INTO public.moon VALUES (8, 'Aoede', 'Propia de Jupiter', 23807655.000, false, 5, 4);
INSERT INTO public.moon VALUES (9, 'Arche', 'Propia de Jupiter', 23064000.000, false, 5, 3);
INSERT INTO public.moon VALUES (10, 'Autonoe', 'Propia de Jupiter', 24122000.000, false, 5, 4);
INSERT INTO public.moon VALUES (11, 'Callisto', 'Propia de Jupiter', 1883000.000, true, 5, 4800);
INSERT INTO public.moon VALUES (12, 'Carme', 'Propia de Jupiter', 22600000.000, false, 5, 30);
INSERT INTO public.moon VALUES (13, 'Callirrhoe', 'Propia de Jupiter', 24200000.000, false, 5, 10);
INSERT INTO public.moon VALUES (14, 'Carpo', 'Propia de Jupiter', 17100000.000, false, 5, 3);
INSERT INTO public.moon VALUES (15, 'Chaldene', 'Propia de Jupiter', 23179000.000, false, 5, 4);
INSERT INTO public.moon VALUES (16, 'Ganimedes', 'Propia de Jupiter', 1070000.000, true, 5, 5276);
INSERT INTO public.moon VALUES (17, 'Europa', 'Propia de Jupiter', 670900.000, true, 5, 3126);
INSERT INTO public.moon VALUES (18, 'Titan', 'Propia de Saturno', 1221850.000, true, 6, 5150);
INSERT INTO public.moon VALUES (19, 'Encelado', 'Propia de Saturno', 238020.000, true, 6, 498);
INSERT INTO public.moon VALUES (20, 'Charon', 'Propia de Ceres', 19571.000, false, 9, 1207);
INSERT INTO public.moon VALUES (21, 'Namaka', 'Propia de Haumea', 39000.000, false, 10, 170);
INSERT INTO public.moon VALUES (22, 'Dysnomia', 'Propia de Eris', 30000.000, false, 11, 300);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercurio', 'Se encuentra dentro de la orbita del sistema solar', 57910, false, 1, 4880);
INSERT INTO public.planet VALUES (2, 'venus', 'Se encuentra dentro de la orbita del sistema solar', 108200, false, 1, 12000);
INSERT INTO public.planet VALUES (3, 'tierra', 'Se encuentra dentro de la orbita del sistema solar', 149600, true, 1, 2756);
INSERT INTO public.planet VALUES (4, 'Marte', 'Se encuentra dentro de la orbita del sistema solar', 227940, false, 1, 6794);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Se encuentra dentro de la orbita del sistema solar', 778833, false, 1, 142984);
INSERT INTO public.planet VALUES (6, 'Saturno', 'Se encuentra dentro de la orbita del sistema solar', 1429400, false, 1, 120536);
INSERT INTO public.planet VALUES (7, 'Urano', 'Se encuentra dentro de la orbita del sistema solar', 2870990, false, 1, 51118);
INSERT INTO public.planet VALUES (8, 'Neptuno', 'Se encuentra dentro de la orbita del sistema solar', 4540300, false, 1, 49492);
INSERT INTO public.planet VALUES (9, 'Pluton', 'Planeta Enano  ', 5913520, false, 1, 2377);
INSERT INTO public.planet VALUES (10, 'Ceres', 'Planeta enano ubicado entre Marte y Jupiter', 414000, false, 1, 940);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Planeta ubicado en el borde del sistema solar', 6045000, true, 1, 1960);
INSERT INTO public.planet VALUES (12, 'Makemake', 'Planeta ubicado en el borde del sistema solar', 6800000, false, 1, 1431);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sol', 'Estrella de tipo G', 1.0, true, 1, 696);
INSERT INTO public.star VALUES (2, 'UY Scuti', 'Supergigante roja', 9500.0, true, 1, 1183323);
INSERT INTO public.star VALUES (3, 'R136a1', 'Mas masiva conocida Wolf-Rayet', 165000.0, true, 3, 20880);
INSERT INTO public.star VALUES (4, 'Sirio B', 'Supergigante Azul', 8611.0, true, 1, 954615);
INSERT INTO public.star VALUES (5, 'Canopus', 'Ubicada en la constelación Carina', 309.0, true, 1, 45240);
INSERT INTO public.star VALUES (6, 'Rikel Kentaurus', 'Tambien conocida como alfa centaurus', 4.3, false, 1, 2365);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

